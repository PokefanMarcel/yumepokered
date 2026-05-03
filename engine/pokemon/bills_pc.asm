DisplayPCMainMenu::
	xor a
	ldh [hAutoBGTransferEnabled], a
	call SaveScreenTilesToBuffer2
	ld a, [wNumHoFTeams]
	and a                        ; beat the league already?
	hlcoord 0, 0
	lb bc, 10, 14
	jr nz, .gotMenuSize          ; if yes, show Hall of Fame
	CheckEvent EVENT_GOT_POKEDEX ; got Pokedex?
	ld b, 8
	jr nz, .gotMenuSize          ; if yes, show Oak's PC
	ld b, 6
.gotMenuSize
	call TextBoxBorder
	call UpdateSprites

	CheckEvent EVENT_MET_BILL
	hlcoord 2, 2
	ld de, BillsPCText
	jr nz, .metBill
	ld de, SomeonesPCText
.metBill
	call PlaceString

IF DEF(_FRA) ; French: PC DE <PLAYER>
	hlcoord 2, 4
	ld de, PlayersPCText
	call PlaceString
	ld l, c
	ld h, b
	ld de, wPlayerName
	call PlaceString
ELSE         ; English: <PLAYER>'s PC
	hlcoord 2, 4
	ld de, wPlayerName
	call PlaceString
	ld l, c
	ld h, b
	ld de, PlayersPCText
	call PlaceString
ENDC

	ld a, 2
	ld [wMaxMenuItem], a
	hlcoord 2, 6
	CheckEvent EVENT_GOT_POKEDEX
	jr z, .printLogOff
	ld de, OaksPCText
	call PlaceString
	ld hl, wMaxMenuItem
	inc [hl] ; max item = 3
	hlcoord 2, 8
	ld a, [wNumHoFTeams]
	and a
	jr z, .printLogOff
	ld de, PKMNLeaguePCText
	call PlaceString
	ld hl, wMaxMenuItem
	inc [hl] ; max item = 4
	hlcoord 2, 10
.printLogOff
	ld de, LogOffPCText
	call PlaceString

	ld a, PAD_A | PAD_B
	ld [wMenuWatchedKeys], a
	ld a, 2
	ld [wTopMenuItemY], a
	dec a ; a = 1
	ld [wTopMenuItemX], a
	xor a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	inc a ; a = 1
	ldh [hAutoBGTransferEnabled], a
	ret


DEF BILLS_PC_BOX_COLUMNS     EQU 5
DEF BILLS_PC_BOX_ROWS        EQU 4
DEF BILLS_PC_CHANGE_BOX_TILE EQU $30

BillsPC:: ; marcelnote - revamped Bill's PC
	; Enter from the generic PC menu or a direct Bill's PC object.
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	ld a, [wUpdateSpritesEnabled]
	push af ; save a = [wUpdateSpritesEnabled]
	xor a
	ld [wUpdateSpritesEnabled], a
	ld a, [wListScrollOffset]
	push af ; save a = [wListScrollOffset]
	ld a, [wMiscFlags]
	bit BIT_USING_GENERIC_PC, a
	jr nz, .loadBillsPCScreen
	; Direct access needs the switch-on text and sound.
	ld a, SFX_TURN_ON_PC
	call PlaySound
	ld hl, SwitchOnText
	call PrintText
.loadBillsPCScreen
	call GBPalWhiteOutWithDelay3

	; Pokeball indicators for DisplayChangeBoxMenu.
	ld de, PokeballTileGraphics
	ld hl, vChars2 tile $60
	lb bc, BANK(PokeballTileGraphics), 2
	call CopyVideoData
	call LoadHpBarAndStatusTilePatterns

	; Initialize BILL's PC grid.
	; wCurrentMenuItem maps party slots -> 0..5 and box slots -> 6..25.
	xor a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ld [wPartyAndBillsPCSavedMenuItem], a
	call NormalizeBillsPCBoxSpecies ; update box data to new format
	call RedrawBillsPCBoxScreen
	call WaitBillsPCButtonsReleased

.inputLoop
	call JoypadLowSensitivity
	ldh a, [hJoy5]
	and a
	jr z, .inputLoop
	ld b, a
	bit B_PAD_B, b
	jp nz, ExitBillsPC
	bit B_PAD_START, b
	jr nz, .changeBox
	bit B_PAD_A, b
	jr nz, .chooseMon
	bit B_PAD_LEFT, b
	jr nz, .left
	bit B_PAD_RIGHT, b
	jr nz, .right
	bit B_PAD_UP, b
	jr nz, .up
	bit B_PAD_DOWN, b
	jr z, .inputLoop
	call MoveBillsPCCursorDown
	jr .inputLoop

.up
	call MoveBillsPCCursorUp
	jr .inputLoop

.left
	call MoveBillsPCCursorLeft
	jr .inputLoop

.right
	call MoveBillsPCCursorRight
	jr .inputLoop

.changeBox
	ld a, SFX_PRESS_AB
	call PlaySound
	ld a, [wCurrentMenuItem] ; save wCurrentMenuItem from the grid
	push af
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	callfar ChangeBox
	call NormalizeBillsPCBoxSpecies ; update box data to new format
	pop af
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ld [wPartyAndBillsPCSavedMenuItem], a
	call RedrawBillsPCBoxScreen
	call WaitBillsPCButtonsReleased
	jr .inputLoop

.chooseMon
	; Empty box slots do not open a submenu.
	ld a, [wCurrentMenuItem]
	cp PARTY_LENGTH
	jp c, .partyActionMenu
	sub PARTY_LENGTH
	call BillsPCBoxSlotHasMon
	jp z, .emptyBoxSlot

	; Box submenu: WITHDRAW / STATS / RELEASE / CANCEL.
	ld a, [wCurrentMenuItem]              ; wCurrentMenuItem is used by HandleMenuInput
	ld [wPartyAndBillsPCSavedMenuItem], a ; so save it here
	call DrawBillsPCSelectedCursor
	hlcoord 9, 9
	lb bc, 7, 9
	call TextBoxBorder
	hlcoord 11, 10
	ld de, WithdrawPCText
	call PlaceString
	hlcoord 11, 12
	ld de, StatsPCText
	call PlaceString
	hlcoord 11, 14
	ld de, ReleasePCText
	call PlaceString
	hlcoord 11, 16
	ld de, CancelPCText
	call PlaceString
	ld hl, wTopMenuItemY
	ld a, 10
	ld [hli], a ; wTopMenuItemY
	ld a, 10
	ld [hli], a ; wTopMenuItemX
	xor a
	ld [hli], a ; wCurrentMenuItem
	inc hl
	ld a, 3
	ld [hli], a ; wMaxMenuItem
	ld a, PAD_A | PAD_B
	ld [hli], a ; wMenuWatchedKeys
	xor a
	ld [hl], a ; wLastMenuItem
	call HandleMenuInput ; a = pressed buttons
	ld b, a
	ld a, [wCurrentMenuItem]
	ld c, a
	ld a, [wPartyAndBillsPCSavedMenuItem]
	ld [wCurrentMenuItem], a ; restore grid current item
	ld [wLastMenuItem], a
	bit B_PAD_B, b
	jp nz, .redrawAfterChoice
	ld a, c
	and a
	jr nz, .boxStatsOption
	call WithdrawBillsPCSelectedBoxMon
	jp .redrawAfterChoice

.boxStatsOption
	dec a
	jr nz, .boxReleaseOption
	ld a, [wPartyAndBillsPCSavedMenuItem]
	sub PARTY_LENGTH
	call BillsPCBoxSlotHasMon
	jp z, .redrawAfterChoice
	ld [wCurPartySpecies], a
	ld a, c
	ld [wWhichPokemon], a
	ld a, BOX_DATA
	ld [wMonDataLocation], a
	predef StatusScreen
	ld a, [wPartyAndBillsPCSavedMenuItem]
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	jp .redrawAfterChoice

.boxReleaseOption
	dec a
	jp nz, .redrawAfterChoice
	call ReleaseBillsPCSelectedBoxMon
	jp .redrawAfterChoice

.emptyBoxSlot
	call WaitBillsPCButtonsReleased
	xor a
	ldh [hFrameCounter], a
	jp .inputLoop

.partyActionMenu
	; Party submenu: DEPOSIT / STATS / CANCEL.
	ld a, [wCurrentMenuItem]
	ld [wPartyAndBillsPCSavedMenuItem], a
	call DrawBillsPCSelectedCursor
	hlcoord 9, 11
	lb bc, 5, 9
	call TextBoxBorder
	hlcoord 11, 12
	ld de, DepositPCText
	call PlaceString
	hlcoord 11, 14
	ld de, StatsPCText
	call PlaceString
	hlcoord 11, 16
	ld de, CancelPCText
	call PlaceString
	ld hl, wTopMenuItemY
	ld a, 12
	ld [hli], a ; wTopMenuItemY
	ld a, 10
	ld [hli], a ; wTopMenuItemX
	xor a
	ld [hli], a ; wCurrentMenuItem
	inc hl
	ld a, 2
	ld [hli], a ; wMaxMenuItem
	ld a, PAD_A | PAD_B
	ld [hli], a ; wMenuWatchedKeys
	xor a
	ld [hl], a ; wLastMenuItem
	call HandleMenuInput
	ld b, a
	ld a, [wCurrentMenuItem]
	ld c, a
	ld a, [wPartyAndBillsPCSavedMenuItem]
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	bit B_PAD_B, b
	jr nz, .redrawAfterChoice
	ld a, c
	and a
	jr nz, .partyStatsOption
	call DepositBillsPCSelectedPartyMon
	jr .redrawAfterChoice

.partyStatsOption
	dec a
	jr nz, .redrawAfterChoice
	ld a, [wPartyAndBillsPCSavedMenuItem]
	ld [wWhichPokemon], a
	ld c, a
	ld b, 0
	ld hl, wPartySpecies
	add hl, bc
	ld a, [hl]
	ld [wCurPartySpecies], a
	xor a ; PLAYER_PARTY_DATA
	ld [wMonDataLocation], a
	predef StatusScreen
	ld a, [wPartyAndBillsPCSavedMenuItem]
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a

.redrawAfterChoice
	call RedrawBillsPCBoxScreen
	call WaitBillsPCButtonsReleased
	jp .inputLoop

ExitBillsPC:
	call GBPalWhiteOutWithDelay3
	ld a, [wMiscFlags]
	bit BIT_USING_GENERIC_PC, a
	jr nz, .next
	; Direct object access has no generic PC menu to return to,
	; so it restores the map screen itself after the shared cleanup below.
	call LoadTextBoxTilePatterns
	ld a, SFX_TURN_OFF_PC
	call PlaySound
	call WaitForSoundToFinish
.next
	ld hl, wMiscFlags
	res BIT_NO_MENU_BUTTON_SOUND, [hl]
	call ReloadTilesetTilePatterns
	call RunDefaultPaletteCommand

	xor a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ld [wPartyAndBillsPCSavedMenuItem], a
	ld [wWhichPokemon], a
	ld [wPlayerMonNumber], a
	ld [wMonDataLocation], a

	pop af ; restore a = [wListScrollOffset]
	ld [wListScrollOffset], a
	pop af ; restore a = [wUpdateSpritesEnabled]
	ld [wUpdateSpritesEnabled], a
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]

	; Generic-PC caller reloads and fades in the main PC menu.
	ld a, [wMiscFlags]
	bit BIT_USING_GENERIC_PC, a
	ret nz

	; Direct Bill's PC access returns straight to the overworld.
	call LoadScreenTilesFromBuffer2
	call UpdateSprites
	call Delay3
	jp GBPalNormal

RedrawBillsPCBoxScreen:
	call RedrawBillsPCBoxScreenCommon
	call DrawBillsPCCursor
	jr FinishRedrawingBillsPCBoxScreen

RedrawBillsPCBoxScreenForSelectedMessage:
	call PrepareBillsPCSelectedRedraw
	jr FinishRedrawingBillsPCBoxScreen

; Used between the two halves of the deposit/withdraw flash; uses a partial
; transfer + 2-frame delay instead of the idle Delay3.
RedrawBillsPCBoxScreenForSelectedMessageShort:
	call PrepareBillsPCSelectedRedraw
	call ApplyBillsPCBoxPalette
	xor a ; TRANSFERTOP
	ldh [hAutoBGTransferPortion], a
	ld c, 2
	jp DelayFrames

PrepareBillsPCSelectedRedraw:
	call RedrawBillsPCBoxScreenCommon
	call DrawBillsPCCursorOnly
	call DrawBillsPCSelectedCursor
	jp ClearBillsPCInfoText

RedrawBillsPCBoxScreenCommon:
	xor a
	ldh [hAutoBGTransferEnabled], a
	call LoadBillsPCBoxIconTilePatterns
	ld de, BillsPCChangeBoxGraphics
	ld hl, vChars2 tile BILLS_PC_CHANGE_BOX_TILE
	lb bc, BANK(BillsPCChangeBoxGraphics), (BillsPCChangeBoxGraphicsEnd - BillsPCChangeBoxGraphics) / (TILE_SIZE / 2)
	call CopyVideoDataDouble
	call ClearScreen
	call ClearSprites

	; boxed-mon 5x4 grid
	hlcoord 3, 0
	lb bc, 8, 15
	call TextBoxBorder

	; normal text box
	hlcoord 0, 12
	lb bc, 4, 18
	call TextBoxBorder

	; draw "START ▶ CHANGE BOX" gfx
IF DEF(_FRA)
	hlcoord 10, 0
ELSE
	hlcoord 11, 0
ENDC
	ld a, BILLS_PC_CHANGE_BOX_TILE
	ld b, (BillsPCChangeBoxGraphicsEnd - BillsPCChangeBoxGraphics) / (TILE_SIZE / 2)
.changeBoxGfxLoop
	ld [hli], a
	inc a
	dec b
	jr nz, .changeBoxGfxLoop

	call DrawBillsPCPartyMons
	call DrawBillsPCBoxMons

	ld a, 1
	ldh [hAutoBGTransferEnabled], a
	ret

FinishRedrawingBillsPCBoxScreen:
	call ApplyBillsPCBoxPalette
	jp Delay3

ApplyBillsPCBoxPalette:
	ld b, SET_PAL_BILLS_PC
	call RunPaletteCommand
	jp GBPalNormal

WaitBillsPCButtonsReleased:
	call Joypad
	ldh a, [hJoyHeld]
	and PAD_A | PAD_B | PAD_START
	jr nz, WaitBillsPCButtonsReleased
	xor a
	ldh [hJoy5], a
	ldh [hJoyPressed], a
	ret

; Movement keeps one linear menu index:
;   party slots 0..5, box slots 6..25.
MoveBillsPCCursorUp:
	ld a, [wCurrentMenuItem]
	cp PARTY_LENGTH
	jr nc, .notParty
	and a
	ret z
	dec a
	ld [wCurrentMenuItem], a
	jp DrawBillsPCCursor
.notParty
	sub PARTY_LENGTH
	cp BILLS_PC_BOX_COLUMNS
	ret c
	sub BILLS_PC_BOX_COLUMNS
	add PARTY_LENGTH
	ld [wCurrentMenuItem], a
	jp DrawBillsPCCursor

MoveBillsPCCursorDown:
	ld a, [wCurrentMenuItem]
	cp PARTY_LENGTH
	jr nc, .notParty
	inc a
	ld b, a
	ld a, [wPartyCount]
	cp b
	ret z
	ret c
	ld a, b
	ld [wCurrentMenuItem], a
	jp DrawBillsPCCursor
.notParty
	sub PARTY_LENGTH
	cp MONS_PER_BOX - BILLS_PC_BOX_COLUMNS
	ret nc
	add PARTY_LENGTH + BILLS_PC_BOX_COLUMNS
	ld [wCurrentMenuItem], a
	jp DrawBillsPCCursor

MoveBillsPCCursorLeft:
	ld a, [wCurrentMenuItem]
	cp PARTY_LENGTH
	ret c
	sub PARTY_LENGTH
	call GetBillsPCBoxRowAndColumn
	and a
	jr z, .firstColumn
	ld a, [wCurrentMenuItem]
	dec a
	ld [wCurrentMenuItem], a
	jp DrawBillsPCCursor
.firstColumn
	; Wrap to the party slot in the same row, clamping to the last filled slot.
	ld a, [wPartyCount]
	dec a
	cp b
	jr nc, .gotPartyRow
	ld b, a
.gotPartyRow
	ld a, b
	ld [wCurrentMenuItem], a
	jp DrawBillsPCCursor

MoveBillsPCCursorRight:
	ld a, [wCurrentMenuItem]
	cp PARTY_LENGTH
	jr c, .party
	sub PARTY_LENGTH
	call GetBillsPCBoxRowAndColumn
	cp BILLS_PC_BOX_COLUMNS - 1
	ret z
	ld a, [wCurrentMenuItem]
	inc a
	ld [wCurrentMenuItem], a
	jp DrawBillsPCCursor
.party
	cp BILLS_PC_BOX_ROWS
	ret nc
	ld c, a
	ld b, 0
	ld hl, BillsPCBoxRowStartMenuItems
	add hl, bc
	ld a, [hl]
	ld [wCurrentMenuItem], a
	jp DrawBillsPCCursor

BillsPCBoxRowStartMenuItems:
	db PARTY_LENGTH
	db PARTY_LENGTH + BILLS_PC_BOX_COLUMNS
	db PARTY_LENGTH + BILLS_PC_BOX_COLUMNS * 2
	db PARTY_LENGTH + BILLS_PC_BOX_COLUMNS * 3

; Input: a = box slot 0..19. Output: b = row, a = column.
GetBillsPCBoxRowAndColumn:
	ld b, 0
.loop
	cp BILLS_PC_BOX_COLUMNS
	ret c
	sub BILLS_PC_BOX_COLUMNS
	inc b
	jr .loop

; Redraw the grid cursor, then refresh the fixed textbox/hover text.
DrawBillsPCCursor:
	call DrawBillsPCCursorOnly
	jp DrawBillsPCInfoText

; hl is the BG tile under the old/new cursor; wLastMenuItem is updated to match.
DrawBillsPCCursorOnly:
	ld a, [wLastMenuItem]
	call GetBillsPCCursorCoord
	ld [hl], ' '
	ld a, [wCurrentMenuItem]
	call GetBillsPCCursorCoord
	ld [hl], '▶'

	ld a, [wCurrentMenuItem]
	ld [wLastMenuItem], a
	ld [wPartyAndBillsPCSavedMenuItem], a
	ret

; Show the grid selection as the white/unfilled arrow while its action menu is open.
DrawBillsPCSelectedCursor:
	ld a, [wPartyAndBillsPCSavedMenuItem]
	call GetBillsPCCursorCoord
	ld [hl], '▷'
	ret

DrawBillsPCInfoText:
	call ClearBillsPCInfoText
	hlcoord 1, 14
	ld de, BillsPCWhatToDoText
	call PlaceString
	ld a, [wCurrentMenuItem]
	cp PARTY_LENGTH
	jr c, .partyMon
	sub PARTY_LENGTH
	call BillsPCBoxSlotHasMon
	ret z
	ld a, c
	ld [wWhichPokemon], a
	ld hl, wBoxMonNicks
	call DrawBillsPCHoveredMonName
	ld hl, wBoxMons
	ld bc, BOXMON_STRUCT_LENGTH
	ld a, [wWhichPokemon]
	call AddNTimes
	ld bc, MON_BOX_LEVEL
	add hl, bc
	ld a, [hl]
	jr .drawLevel
.partyMon
	ld c, a
	ld b, 0
	ld hl, wPartySpecies
	add hl, bc
	ld a, [hl]
	cp $ff
	ret z
	ld a, c
	ld [wWhichPokemon], a
	ld hl, wPartyMonNicks
	call DrawBillsPCHoveredMonName
	ld hl, wPartyMons
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wWhichPokemon]
	call AddNTimes
	ld bc, MON_LEVEL
	add hl, bc
	ld a, [hl]

.drawLevel
	ld [wLoadedMonLevel], a
	hlcoord 15, 10
	jp PrintLevel

DrawBillsPCHoveredMonName:
	ld a, [wWhichPokemon]
	call SkipFixedLengthTextEntries
	ld d, h
	ld e, l
	hlcoord 5, 10
	jp PlaceString

ClearBillsPCInfoText:
	hlcoord 1, 13
	lb bc, 4, 18
	call ClearScreenArea
	hlcoord 4, 10
	lb bc, 2, 15
	jp ClearScreenArea

DepositBillsPCSelectedPartyMon:
	ld a, [wPartyCount]
	dec a
	ld hl, CantDepositLastMonText
	jp z, PrintBillsPCSelectedMessageNoName

	call FindFirstFreeBillsPCBoxSlot
	ld hl, BoxFullText
	jp c, PrintBillsPCSelectedMessageNoName

	; Save the selected party index and copy its display name before RemovePokemon
	; compacts the party.
	ld a, [wPartyAndBillsPCSavedMenuItem]
	ld [wWhichPokemon], a
	ld hl, wPartyMonNicks
	call CopyBillsPCMonNameToStringBuffer

	; Copy species into the box species list.
	; wWhichPokemon = party slot, wPlayerMonNumber = destination box slot.
	ld a, [wWhichPokemon]
	ld c, a
	ld b, 0
	ld hl, wPartySpecies
	add hl, bc
	ld a, [hl]
	ld [wCurPartySpecies], a
	ld e, a
	ld a, [wPlayerMonNumber]
	ld c, a ; b = 0 still
	ld hl, wBoxSpecies
	add hl, bc
	ld [hl], e

	; Copy the boxed portion of the party struct.
	; This includes current HP, status, moves, PP, EXP, stat EXP, and DVs.
	ld hl, wBoxMons
	ld bc, BOXMON_STRUCT_LENGTH
	ld a, [wPlayerMonNumber]
	call AddNTimes
	ld d, h
	ld e, l ; de = wBoxMon<i>
	ld hl, wPartyMons
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wWhichPokemon]
	call AddNTimes
	push hl ; save hl = wPartyMon<j>
	ld bc, BOXMON_STRUCT_LENGTH
	call CopyData

	; Party structs keep level after the boxed struct, so copy MON_LEVEL into
	; the box-only MON_BOX_LEVEL byte after the main struct copy.
	; XXX box-only? but that data was just copied, is it not used when mon is in party?
	pop hl ; restore hl = wPartyMon<j>
	ld bc, MON_LEVEL
	add hl, bc ; hl = wPartyMon<j>Level
	ld e, [hl]
	ld hl, wBoxMons
	ld bc, BOXMON_STRUCT_LENGTH
	ld a, [wPlayerMonNumber]
	call AddNTimes
	ld bc, MON_BOX_LEVEL
	add hl, bc ; hl = wBoxMon<i>BoxLevel
	ld [hl], e

	; Copy OT name.
	ld hl, wBoxMonOT
	ld a, [wPlayerMonNumber]
	call SkipFixedLengthTextEntries ; sets bc = NAME_LENGTH
	ld d, h
	ld e, l ; de = wBoxMon<i>OT
	ld hl, wPartyMonOT
	ld a, [wWhichPokemon]
	call AddNTimes ; hl = wPartyMon<j>OT
	call CopyData

	; Copy nickname.
	ld hl, wBoxMonNicks
	ld a, [wPlayerMonNumber]
	call SkipFixedLengthTextEntries ; sets bc = NAME_LENGTH
	ld d, h
	ld e, l ; de = wBoxMon<i>Nick
	ld hl, wPartyMonNicks
	ld a, [wWhichPokemon]
	call AddNTimes ; hl = wPartyMon<j>Nick
	call CopyData

	; Update box count.
	ld hl, wBoxCount
	inc [hl]
	call RemovePokemon

	; If the removed mon was the last visible party slot, move the cursor up.
	ld a, [wCurrentMenuItem]
	cp PARTY_LENGTH
	jr nc, .partyCursorValid
	ld b, a
	ld a, [wPartyCount]
	dec a
	cp b
	jr nc, .partyCursorValid
	ld [wCurrentMenuItem], a
.partyCursorValid

	; Build the "BOX @": wBoxNumString.
	ld hl, wBoxNumString
	ld a, [wCurrentBoxNum]
	and BOX_NUM_MASK
	cp 9
	jr c, .singleDigitBoxNum
	sub 10
	ld [hl], '1'
	inc hl
.singleDigitBoxNum
	add '1'
	ld [hli], a
	ld [hl], '@'

	; Animate deposit: hide the destination box species for one redraw, play the
	; vanilla transfer SFX, then restore it for the final text-ready screen.
	ld a, [wPlayerMonNumber]
	ld c, a
	ld b, 0
	ld hl, wBoxSpecies
	add hl, bc ; hl = species pointer
	ld a, [hl]
	push hl
	push af
	xor a
	ld [hl], a
	ld a, SFX_WITHDRAW_DEPOSIT
	call PlaySound
	call RedrawBillsPCBoxScreenForSelectedMessageShort
	pop af
	pop hl
	ld [hl], a
	call RedrawBillsPCBoxScreenForSelectedMessage

	ld hl, MonWasStoredText
	jp PrintBillsPCMessageAfterRedraw

WithdrawBillsPCSelectedBoxMon:
	ld a, [wPartyCount]
	cp PARTY_LENGTH
	ld hl, CantTakeMonText
	jp nc, PrintBillsPCSelectedMessageNoName

	; wWhichPokemon/wPlayerMonNumber are both the selected sparse box slot.
	ld a, [wPartyAndBillsPCSavedMenuItem]
	sub PARTY_LENGTH
	ld [wWhichPokemon], a
	ld [wPlayerMonNumber], a
	call BillsPCBoxSlotHasMon
	ld hl, NoMonText
	jp z, PrintBillsPCSelectedMessageNoName
	ld [wCurPartySpecies], a
	ld hl, wBoxMonNicks
	call CopyBillsPCMonNameToStringBuffer

	; Append wBoxMons[wWhichPokemon] to the party.
	; wPartyCount was already checked above, so this always succeeds.
	ld hl, wPartyCount
	inc [hl]
	ld a, [hl]
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [wCurPartySpecies]
	ld [hli], a   ; wPartySpecies + count
	ld [hl], $ff  ; new sentinel

	; Copy the boxed portion of the struct.
	ld hl, wPartyMons
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wPartyCount]
	dec a
	call AddNTimes
	push hl
	ld d, h
	ld e, l
	ld hl, wBoxMons
	ld bc, BOXMON_STRUCT_LENGTH
	ld a, [wWhichPokemon]
	call AddNTimes
	ld bc, BOXMON_STRUCT_LENGTH
	call CopyData

	; Copy OT name.
	ld hl, wPartyMonOT
	ld a, [wPartyCount]
	dec a
	call SkipFixedLengthTextEntries
	ld d, h
	ld e, l
	ld hl, wBoxMonOT
	ld a, [wWhichPokemon]
	call SkipFixedLengthTextEntries
	ld bc, NAME_LENGTH
	call CopyData

	; Copy nickname.
	ld hl, wPartyMonNicks
	ld a, [wPartyCount]
	dec a
	call SkipFixedLengthTextEntries
	ld d, h
	ld e, l
	ld hl, wBoxMonNicks
	ld a, [wWhichPokemon]
	call SkipFixedLengthTextEntries
	ld bc, NAME_LENGTH
	call CopyData

	; Compute the party mon's level and stats from its experience.
	; LoadMonData reads the box entry; CalcStats writes back into the new
	; party slot (whose pointer was stashed before the struct copy).
	ld a, BOX_DATA
	ld [wMonDataLocation], a
	call LoadMonData
	callfar CalcLevelFromExperience
	ld a, d
	ld [wCurEnemyLevel], a
	pop hl ; hl = wPartyMons[wPartyCount-1]
	ld bc, BOXMON_STRUCT_LENGTH
	add hl, bc ; hl = .Level
	ld [hli], a
	ld d, h
	ld e, l
	ld bc, (MON_HP_EXP - 1) - MON_STATS
	add hl, bc ; hl = .HPExp - 1
	ld b, 1    ; consider stat exp
	call CalcStats

	; Free the box slot.
	ld a, [wPlayerMonNumber]
	call ClearBillsPCBoxSlot
	ld hl, wBoxCount
	dec [hl]

	; Animate withdraw: a mon was just appended to the party, so hide that
	; newest party species for one redraw before restoring the list terminator.
	ld a, [wPartyCount]
	dec a
	ld c, a
	ld b, 0
	ld hl, wPartySpecies
	add hl, bc
	ld a, [hl]
	push hl
	push af
	ld a, $ff
	ld [hl], a
	ld a, SFX_WITHDRAW_DEPOSIT
	call PlaySound
	call RedrawBillsPCBoxScreenForSelectedMessageShort
	pop af
	pop hl
	ld [hli], a
	ld a, $ff
	ld [hl], a
	call RedrawBillsPCBoxScreenForSelectedMessage

	ld hl, MonIsTakenOutText
	jp PrintBillsPCMessageAfterRedraw

ReleaseBillsPCSelectedBoxMon:
	; Release only acts on boxed mons. Keep the selected slot in
	; wPlayerMonNumber so the sparse box entry can be cleared after YES.
	ld a, [wPartyAndBillsPCSavedMenuItem]
	sub PARTY_LENGTH
	ld [wWhichPokemon], a
	ld [wPlayerMonNumber], a
	call BillsPCBoxSlotHasMon
	ld hl, NoMonText
	jp z, PrintBillsPCSelectedMessageNoName
	ld [wCurPartySpecies], a
	ld hl, wBoxMonNicks
	call CopyBillsPCMonNameToStringBuffer
	ld hl, OnceReleasedText
	call PrintBillsPCSelectedMessage
	call YesNoChoice

	; YesNoChoice uses wCurrentMenuItem; restore the grid cursor before returning.
	ld a, [wCurrentMenuItem]
	and a
	ld a, [wPartyAndBillsPCSavedMenuItem]
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ret nz
	ld a, [wPlayerMonNumber]
	call BillsPCBoxSlotHasMon
	push af
	ld hl, wBoxMonNicks
	call CopyBillsPCMonNameToStringBuffer
	ld a, [wPlayerMonNumber]
	call ClearBillsPCBoxSlot
	ld hl, wBoxCount
	dec [hl]
	call WaitForSoundToFinish
	pop af
	call PlayCry
	ld hl, MonWasReleasedText
	jp PrintBillsPCSelectedMessage

PrintBillsPCSelectedMessageNoName:
	; For warnings without a mon name. Keep the selected white cursor visible,
	; but do not touch wStringBuffer.
	push hl
	call RedrawBillsPCBoxScreenForSelectedMessage
	pop hl
	jp PrintText

PrintBillsPCSelectedMessage:
	; For yes/no and release messages that need the mon name in wStringBuffer.
	push hl
	call RedrawBillsPCBoxScreenForSelectedMessage
	call RestoreBillsPCMessageString
	pop hl
	jp PrintText

PrintBillsPCMessageAfterRedraw:
	; Deposit/withdraw already redrew the screen during their animation.
	push hl
	call RestoreBillsPCMessageString
	pop hl
	jp PrintText

RestoreBillsPCMessageString:
	ld de, wNameBuffer
	jp CopyToStringBuffer

; Find the first 0 slot in wBoxSpecies.
; Output: nc + c = slot index, wPlayerMonNumber = slot. cf if box is full.
; Also called via callfar from item_effects.asm (SendNewMonToBox).
FindFirstFreeBillsPCBoxSlot:
	ld hl, wBoxSpecies
	ld b, MONS_PER_BOX
.loop
	ld a, [hli]
	and a
	jr z, .found
	dec b
	jr nz, .loop
	scf
	ret
.found
	ld a, MONS_PER_BOX
	sub b ; clears carry since b <= MONS_PER_BOX
	ld [wPlayerMonNumber], a
	ret

; Input: a = box slot. Output: c = slot, a = species, z if empty/$ff.
BillsPCBoxSlotHasMon:
	ld c, a
	ld b, 0
	ld hl, wBoxSpecies
	add hl, bc
	ld a, [hl]
	and a
	ret

CopyBillsPCMonNameToStringBuffer:
	; Input: hl = nickname list base, wWhichPokemon = fixed-length entry index.
	; GetPartyMonName copies to wNameBuffer; mirror it to wNameBuffer so redraws do
	; not destroy the name before PrintText expands wStringBuffer.
	ld a, [wWhichPokemon]
	call GetPartyMonName
	ld de, wNameBuffer
	jp CopyToStringBuffer

; Clear one sparse box slot. The species list entry drives the grid display, but
; zero the struct species too so later reads never see stale data for that slot.
ClearBillsPCBoxSlot:
	ld c, a
	ld b, 0
	ld hl, wBoxSpecies
	add hl, bc ; hl = species pointer
	ld [hl], b ; b = 0
	ld hl, wBoxMons
	ld bc, BOXMON_STRUCT_LENGTH
	ld a, [wPlayerMonNumber]
	call AddNTimes
	xor a
	ld [hl], a
	ret

; Convert old box species format into new: holes are 0,
; and the terminator always stays at wBoxSpecies + MONS_PER_BOX.
NormalizeBillsPCBoxSpecies:
	ld hl, wBoxSpecies
	ld b, MONS_PER_BOX
.loop
	ld a, [hli]
	cp $ff
	jr z, .clearRest
	dec b
	jr nz, .loop
	ld [hl], $ff
	ret
.clearRest
	dec hl
	xor a
.clearLoop
	ld [hli], a
	dec b
	jr nz, .clearLoop
	ld [hl], $ff
	ret

; Draw the party strip from the party species list.
DrawBillsPCPartyMons:
	ld hl, wPartySpecies
	ld b, 0
.loop
	ld a, [hli]
	cp $ff ; end of party mons?
	ret z
	ld [wCurPartySpecies], a
	push hl ; save hl = party species pointer
	push bc ; save b = counter
	callfar SetCurPartySpeciesSpriteID
	pop bc  ; restore b = counter
	ld a, b
	ld hl, BillsPCPartyIconCoords
	call GetBillsPCIconCoord ; preserves b
	ld a, [wOAMBaseTile]
	call PlaceBillsPCBoxIcon ; preserves b
	pop hl ; restore hl = party species pointer
	inc b
	jr .loop

; Draw non-empty sparse box slots into the 5x4 grid. Empty holes remain blank.
DrawBillsPCBoxMons:
	ld hl, wBoxSpecies
	ld b, 0
.loop
	ld a, [hli]
	and a
	jr z, .next
	cp $ff ; end of list?
	ret z
	ld [wCurPartySpecies], a
	push hl ; save hl = box species pointer
	push bc ; save b = counter
	callfar SetCurPartySpeciesSpriteID
	pop bc  ; restore b = counter
	ld a, b
	ld hl, BillsPCBoxIconCoords
	call GetBillsPCIconCoord ; preserves b
	ld a, [wOAMBaseTile]
	call PlaceBillsPCBoxIcon ; preserves b
	pop hl ; restore hl = box species pointer
.next
	inc b
	jr .loop

GetBillsPCCursorCoord:
	cp PARTY_LENGTH
	jr c, .party
	sub PARTY_LENGTH
	ld hl, BillsPCBoxCursorCoords
	jr GetBillsPCIconCoord
.party
	ld hl, BillsPCPartyCursorCoords
	; fallthrough

; Input: a = index into the table pointed to by hl. Output: hl = BG coord.
GetBillsPCIconCoord:
	add a
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

; Place a 2x2 mon icon into BG tiles. Input: a = first tile, hl = top-left coord.
PlaceBillsPCBoxIcon:
	ld [hli], a
	inc a
	ld [hl], a
	ld de, SCREEN_WIDTH - 1
	add hl, de
	inc a
	ld [hli], a
	inc a
	ld [hl], a
	ret

; Party icons have their cursor tile directly to the left of each 2x2 icon.
BillsPCPartyIconCoords:
	dwcoord 1,  0
	dwcoord 1,  2
	dwcoord 1,  4
	dwcoord 1,  6
	dwcoord 1,  8
	dwcoord 1, 10

BillsPCPartyCursorCoords:
	dwcoord 0,  1
	dwcoord 0,  3
	dwcoord 0,  5
	dwcoord 0,  7
	dwcoord 0,  9
	dwcoord 0, 11

; Box cursor positions point to the lower-left side of each 2x2 icon.
BillsPCBoxCursorCoords:
	dwcoord  4,  2
	dwcoord  7,  2
	dwcoord 10,  2
	dwcoord 13,  2
	dwcoord 16,  2
	dwcoord  4,  4
	dwcoord  7,  4
	dwcoord 10,  4
	dwcoord 13,  4
	dwcoord 16,  4
	dwcoord  4,  6
	dwcoord  7,  6
	dwcoord 10,  6
	dwcoord 13,  6
	dwcoord 16,  6
	dwcoord  4,  8
	dwcoord  7,  8
	dwcoord 10,  8
	dwcoord 13,  8
	dwcoord 16,  8

BillsPCBoxIconCoords:
	dwcoord  5,  1
	dwcoord  8,  1
	dwcoord 11,  1
	dwcoord 14,  1
	dwcoord 17,  1
	dwcoord  5,  3
	dwcoord  8,  3
	dwcoord 11,  3
	dwcoord 14,  3
	dwcoord 17,  3
	dwcoord  5,  5
	dwcoord  8,  5
	dwcoord 11,  5
	dwcoord 14,  5
	dwcoord 17,  5
	dwcoord  5,  7
	dwcoord  8,  7
	dwcoord 11,  7
	dwcoord 14,  7
	dwcoord 17,  7

MACRO load_bills_pc_box_icon
	ld de, \1 tile \2
	ld hl, vChars2 tile (\3 << 2)
	lb bc, BANK(\1), 4
	call CopyVideoData
ENDM

; Some icon poses only exist in the opposite facing direction. Load their second
; frame and mirror each tile so they match the party menu's still icon style.
MACRO load_bills_pc_box_symmetric_icon
	ld de, \1 tile \2
	ld hl, vChars2 tile (\3 << 2)
	lb bc, BANK(\1), 1
	call CopyVideoData
	ld de, \1 tile \2
	ld hl, vChars2 tile ((\3 << 2) + 1)
	ld a, BANK(\1)
	call CopyFlippedBillsPCBoxIconTile
	ld de, \1 tile (\2 + 1)
	ld hl, vChars2 tile ((\3 << 2) + 2)
	lb bc, BANK(\1), 1
	call CopyVideoData
	ld de, \1 tile (\2 + 1)
	ld hl, vChars2 tile ((\3 << 2) + 3)
	ld a, BANK(\1)
	call CopyFlippedBillsPCBoxIconTile
ENDM

; Load all possible 2x2 icon types into vChars2. The grid uses BG tiles rather
; than OAM sprites so party + 20 boxed mons can fit on one screen.
LoadBillsPCBoxIconTilePatterns:
	load_bills_pc_box_icon MonsterSprite, 0, ICON_MON
	load_bills_pc_box_icon PokeBallSprite, 0, ICON_BALL
	load_bills_pc_box_icon FossilSprite, 0, ICON_HELIX
	load_bills_pc_box_icon FairySprite, 0, ICON_FAIRY
	load_bills_pc_box_icon BirdSprite, 0, ICON_BIRD
	load_bills_pc_box_icon SeelSprite, 0, ICON_WATER
	load_bills_pc_box_symmetric_icon BugIconFrame2, 0, ICON_BUG
	load_bills_pc_box_symmetric_icon PlantIconFrame2, 0, ICON_GRASS
	load_bills_pc_box_symmetric_icon SnakeIconFrame2, 0, ICON_SNAKE
	load_bills_pc_box_symmetric_icon QuadrupedIconFrame2, 0, ICON_QUADRUPED
	load_bills_pc_box_icon PikachuSprite, 0, ICON_PIKACHU
	ret

; Copy one icon tile through wTextBoxBuffer while reversing bit order in each row.
; Input: a = source bank, de = source tile, hl = destination VRAM tile.
CopyFlippedBillsPCBoxIconTile:
	push hl

	; FarCopyData2 needs hl = source and de = destination buffer.
	ld h, d
	ld l, e
	ld de, wTextBoxBuffer
	ld bc, TILE_SIZE
	call FarCopyData2

	; Reverse the pixel order in every row byte. b is the remaining byte count;
	; c indexes the nibble lookup table, and d/e hold the partially reversed byte.
	ld hl, wTextBoxBuffer
	ld b, TILE_SIZE
.loop
	ld a, [hl]
	push hl
	push bc
	ld e, a
	and $f
	ld c, a
	ld b, 0
	ld hl, BillsPCBoxReversedNibbles
	add hl, bc
	ld a, [hl]
	swap a
	ld d, a
	ld a, e
	swap a
	and $f
	ld c, a
	ld hl, BillsPCBoxReversedNibbles
	add hl, bc
	ld a, [hl]
	or d
	pop bc
	pop hl
	ld [hli], a
	dec b
	jr nz, .loop

	; Copy the flipped tile from the scratch buffer to the destination VRAM tile.
	pop hl
	ld de, wTextBoxBuffer
	ldh a, [hLoadedROMBank]
	ld b, a
	ld c, 1
	jp CopyVideoData

BillsPCBoxReversedNibbles:
	db $0, $8, $4, $c, $2, $a, $6, $e
	db $1, $9, $5, $d, $3, $b, $7, $f

SwitchOnText:
	text_far _SwitchOnText
	text_end

MonWasStoredText:
	text_far _MonWasStoredText
	text_end

CantDepositLastMonText:
	text_far _CantDepositLastMonText
	text_end

BoxFullText:
	text_far _BoxFullText
	text_end

MonIsTakenOutText:
	text_far _MonIsTakenOutText
	text_end

NoMonText:
	text_far _NoMonText
	text_end

CantTakeMonText:
	text_far _CantTakeMonText
	text_end

OnceReleasedText:
	text_far _OnceReleasedText
	text_end

MonWasReleasedText:
	text_far _MonWasReleasedText
	text_end

CableClubLeftGameboy::
	ldh a, [hSerialConnectionStatus]
	cp USING_EXTERNAL_CLOCK
	ret z
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_RIGHT
	ret nz
	ld a, [wCurMap]
	cp TRADE_CENTER
	ld a, LINK_STATE_START_TRADE
	jr z, .next
	inc a ; LINK_STATE_START_BATTLE
.next
	ld [wLinkState], a
	call EnableAutoTextBoxDrawing
	tx_pre_jump JustAMomentText

CableClubRightGameboy::
	ldh a, [hSerialConnectionStatus]
	cp USING_INTERNAL_CLOCK
	ret z
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_LEFT
	ret nz
	ld a, [wCurMap]
	cp TRADE_CENTER
	ld a, LINK_STATE_START_TRADE
	jr z, .next
	inc a ; LINK_STATE_START_BATTLE
.next
	ld [wLinkState], a
	call EnableAutoTextBoxDrawing
	tx_pre_jump JustAMomentText

JustAMomentText::
	text_far _JustAMomentText
	text_end

OpenBillsPCText::
	script_bills_pc


IF DEF(_FRA)
	INCLUDE "translation/fra/data/text/bills_pc.fra.asm"
ELSE
	INCLUDE "data/text/bills_pc.asm"
ENDC
