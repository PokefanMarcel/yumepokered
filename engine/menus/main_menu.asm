MainMenu:
; Check save file
	call InitOptions
	xor a
	ld [wOptionsInitialized], a
	inc a
	ld [wSaveFileStatus], a
	call CheckForPlayerNameInSRAM
	jr nc, .mainMenuLoop

	predef LoadSAV

.mainMenuLoop
	ld c, 20
	call DelayFrames
	xor a ; LINK_STATE_NONE
	ld [wLinkState], a
	ld hl, wPartyAndBillsPCSavedMenuItem
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld [wDefaultMap], a
	ld hl, wStatusFlags4
	res BIT_LINK_CONNECTED, [hl]
	call ClearScreen
	call RunDefaultPaletteCommand
	call LoadTextBoxTilePatterns
	call LoadFontTilePatterns
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl]
	ld a, [wSaveFileStatus]
	cp 1
	jr z, .noSaveFile
; there's a save file
	hlcoord 0, 0
	ld b, 6
	ld c, 13
	call TextBoxBorder
	hlcoord 2, 2
	ld de, ContinueText
	call PlaceString
	jr .next2
.noSaveFile
	hlcoord 0, 0
	ld b, 4
	ld c, 13
	call TextBoxBorder
	hlcoord 2, 2
	ld de, NewGameText
	call PlaceString
.next2
;;;;;;;;;;;;; joenote - print the game version
	coord hl, $00, $11
	ld de, VersionText
	call PlaceString
;;;;;;;;;;;;;
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	call UpdateSprites
	xor a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ld [wMenuJoypadPollCount], a
	inc a
	ld [wTopMenuItemX], a
	inc a
	ld [wTopMenuItemY], a
	ld a, A_BUTTON | B_BUTTON | START
	ld [wMenuWatchedKeys], a
	ld a, [wSaveFileStatus]
	ld [wMaxMenuItem], a
	call HandleMenuInput
	bit BIT_B_BUTTON, a
	jp nz, DisplayTitleScreen ; if so, go back to the title screen
	ld c, 20
	call DelayFrames
	ld a, [wCurrentMenuItem]
	ld b, a
	ld a, [wSaveFileStatus]
	cp 2
	jp z, .skipInc
; If there's no save file, increment the current menu item so that the numbers
; are the same whether or not there's a save file.
	inc b
.skipInc
	ld a, b
	and a
	jr z, .choseContinue
	cp 1
	jp z, StartNewGame
	call DisplayOptionMenu
	ld a, TRUE
	ld [wOptionsInitialized], a
	jp .mainMenuLoop
.choseContinue
	call DisplayContinueGameInfo
	ld hl, wCurrentMapScriptFlags
	set BIT_CUR_MAP_LOADED_1, [hl]
.inputLoop
	xor a
	ldh [hJoyPressed], a
	ldh [hJoyReleased], a
	ldh [hJoyHeld], a
	call Joypad
	ldh a, [hJoyHeld]
	bit BIT_A_BUTTON, a
	jr nz, .pressedA
	bit BIT_B_BUTTON, a
	jp nz, .mainMenuLoop
	jr .inputLoop
.pressedA
	call GBPalWhiteOutWithDelay3
	call ClearScreen
	ld a, PLAYER_DIR_DOWN
	ld [wPlayerDirection], a
	ld c, 10
	call DelayFrames
	ld a, [wNumHoFTeams]
	and a
	jp z, SpecialEnterMap
	ld a, [wCurMap]
	cp HALL_OF_FAME
	jp nz, SpecialEnterMap
	xor a
	ld [wDestinationMap], a
	ld hl, wStatusFlags6
	set BIT_FLY_OR_DUNGEON_WARP, [hl]
	call PrepareForSpecialWarp
	jp SpecialEnterMap

InitOptions:
	ld a, 1 << BIT_FAST_TEXT_DELAY
	ld [wLetterPrintingDelayFlags], a
	ld a, TEXT_DELAY_MEDIUM
	ld [wOptions], a
	ret

LinkMenu:
	xor a
	ld [wLetterPrintingDelayFlags], a
	ld hl, wStatusFlags4
	set BIT_LINK_CONNECTED, [hl]
	ld hl, LinkMenuEmptyText
	call PrintText
	call SaveScreenTilesToBuffer1
	ld hl, WhereWouldYouLikeText
	call PrintText
	hlcoord 5, 5
	ld b, $6
	ld c, $d
	call TextBoxBorder
	call UpdateSprites
	hlcoord 7, 7
	ld de, CableClubOptionsText
	call PlaceString
	xor a
	;ld [wUnusedLinkMenuByte], a
	ld [wCableClubDestinationMap], a
	ld hl, wTopMenuItemY
	ld a, 7
	ld [hli], a
	ASSERT wTopMenuItemY + 1 == wTopMenuItemX
	ld a, 6
	ld [hli], a
	ASSERT wTopMenuItemX + 1 == wCurrentMenuItem
	xor a
	ld [hli], a
	inc hl
	ASSERT wCurrentMenuItem + 2 == wMaxMenuItem
	ld a, 2
	ld [hli], a
	ASSERT wMaxMenuItem + 1 == wMenuWatchedKeys
	ASSERT 2 + 1 == A_BUTTON | B_BUTTON
	inc a
	ld [hli], a
	ASSERT wMenuWatchedKeys + 1 == wLastMenuItem
	xor a
	ld [hl], a
.waitForInputLoop
	call HandleMenuInput
	and A_BUTTON | B_BUTTON
	add a
	add a
	ld b, a
	ld a, [wCurrentMenuItem]
	add b
	add $d0
	ld [wLinkMenuSelectionSendBuffer], a
	ld [wLinkMenuSelectionSendBuffer + 1], a
.exchangeMenuSelectionLoop
	call Serial_ExchangeLinkMenuSelection
	ld a, [wLinkMenuSelectionReceiveBuffer]
	ld b, a
	and $f0
	cp $d0
	jr z, .checkEnemyMenuSelection
	ld a, [wLinkMenuSelectionReceiveBuffer + 1]
	ld b, a
	and $f0
	cp $d0
	jr nz, .exchangeMenuSelectionLoop
.checkEnemyMenuSelection
	ld a, b
	and $c ; did the enemy press A or B?
	jr nz, .enemyPressedAOrB
; the enemy didn't press A or B
	ld a, [wLinkMenuSelectionSendBuffer]
	and $c ; did the player press A or B?
	jr z, .waitForInputLoop ; if neither the player nor the enemy pressed A or B, try again
	jr .doneChoosingMenuSelection ; if the player pressed A or B but the enemy didn't, use the player's selection
.enemyPressedAOrB
	ld a, [wLinkMenuSelectionSendBuffer]
	and $c ; did the player press A or B?
	jr z, .useEnemyMenuSelection ; if the enemy pressed A or B but the player didn't, use the enemy's selection
; the enemy and the player both pressed A or B
; The gameboy that is clocking the connection wins.
	ldh a, [hSerialConnectionStatus]
	cp USING_INTERNAL_CLOCK
	jr z, .doneChoosingMenuSelection
.useEnemyMenuSelection
	ld a, b
	ld [wLinkMenuSelectionSendBuffer], a
	and $3
	ld [wCurrentMenuItem], a
.doneChoosingMenuSelection
	ldh a, [hSerialConnectionStatus]
	cp USING_INTERNAL_CLOCK
	jr nz, .skipStartingTransfer
	call DelayFrame
	call DelayFrame
	ld a, START_TRANSFER_INTERNAL_CLOCK
	ldh [rSC], a
.skipStartingTransfer
	ld b, " "
	ld c, " "
	ld d, "▷"
	ld a, [wLinkMenuSelectionSendBuffer]
	and B_BUTTON << 2 ; was B button pressed?
	jr nz, .updateCursorPosition
; A button was pressed
	ld a, [wCurrentMenuItem]
	cp $2
	jr z, .updateCursorPosition
	ld c, d
	ld d, b
	dec a
	jr z, .updateCursorPosition
	ld b, c
	ld c, d
.updateCursorPosition
	ld a, b
	ldcoord_a 6, 7
	ld a, c
	ldcoord_a 6, 9
	ld a, d
	ldcoord_a 6, 11
	ld c, 40
	call DelayFrames
	call LoadScreenTilesFromBuffer1
	ld a, [wLinkMenuSelectionSendBuffer]
	and B_BUTTON << 2 ; was B button pressed?
	jr nz, .choseCancel ; cancel if B pressed
	ld a, [wCurrentMenuItem]
	cp $2
	jr z, .choseCancel
	xor a ; WALKING
	ld [wWalkBikeSurfState], a ; start walking
	ld a, [wCurrentMenuItem]
	and a
	ld a, COLOSSEUM
	jr nz, .next
	ld a, TRADE_CENTER
.next
	ld [wCableClubDestinationMap], a
	ld hl, PleaseWaitText
	call PrintText
	ld c, 50
	call DelayFrames
	ld hl, wStatusFlags6
	res BIT_DEBUG_MODE, [hl]
	ld a, [wDefaultMap]
	ld [wDestinationMap], a
	call PrepareForSpecialWarp
	ld c, 20
	call DelayFrames
	xor a
	ld [wMenuJoypadPollCount], a
	ld [wSerialExchangeNybbleSendData], a
	inc a ; LINK_STATE_IN_CABLE_CLUB
	ld [wLinkState], a
	ld [wEnteringCableClub], a
	jr SpecialEnterMap
.choseCancel
	xor a
	ld [wMenuJoypadPollCount], a
	vc_hook Wireless_net_stop
	call Delay3
	call CloseLinkConnection
	ld hl, LinkCanceledText
	vc_hook Wireless_net_end
	call PrintText
	ld hl, wStatusFlags4
	res BIT_LINK_CONNECTED, [hl]
	ret

WhereWouldYouLikeText:
	text_far _WhereWouldYouLikeText
	text_end

PleaseWaitText:
	text_far _PleaseWaitText
	text_end

LinkCanceledText:
	text_far _LinkCanceledText
	text_end

StartNewGame:
	ld hl, wStatusFlags6
	; Ensure debug mode is not used when starting a regular new game.
	; Debug mode persists in saved games for both debug and non-debug builds, and is
	; only reset here by the main menu.
	res BIT_DEBUG_MODE, [hl]
	; fallthrough
StartNewGameDebug:
	call OakSpeech
	ld c, 20
	call DelayFrames

; enter map after using a special warp or loading the game from the main menu
SpecialEnterMap::
	xor a
	ldh [hJoyPressed], a
	ldh [hJoyHeld], a
	ldh [hJoy5], a
	ld [wCableClubDestinationMap], a
	ld hl, wStatusFlags6
	set BIT_GAME_TIMER_COUNTING, [hl]
	call ResetPlayerSpriteData
	ld c, 20
	call DelayFrames
	ld a, [wEnteringCableClub]
	and a
	ret nz
	jp EnterMap

ContinueText:
	db "CONTINUE"
	next ""
	; fallthrough

NewGameText:
	db   "NEW GAME"
	next "OPTION@"

CableClubOptionsText:
	db   "TRADE CENTER"
	next "COLOSSEUM"
	next "CANCEL@"

VersionText:
	db "  <PKMN>"
IF DEF(_RED)
	db "YumeRed "
ELIF DEF(_BLUE)
	db "YumeBlue "
ELIF DEF(_GREEN)
	db "YumeGreen "
ENDC
	db "v0.9@"
;db " v"
;INCLUDE "version_number.asm"
;db "@"

DisplayContinueGameInfo:
	xor a
	ldh [hAutoBGTransferEnabled], a
	hlcoord 4, 7
	ld b, 8
	ld c, 14
	call TextBoxBorder
	hlcoord 5, 9
	ld de, SaveScreenInfoText
	call PlaceString
	hlcoord 12, 9
	ld de, wPlayerName
	call PlaceString
	hlcoord 17, 11
	call PrintNumBadges
	hlcoord 16, 13
	call PrintNumOwnedMons
	hlcoord 13, 15
	call PrintPlayTime
	ld a, 1
	ldh [hAutoBGTransferEnabled], a
	ld c, 30
	jp DelayFrames

PrintSaveScreenText:
	xor a
	ldh [hAutoBGTransferEnabled], a
	hlcoord 4, 0
	ld b, $8
	ld c, $e
	call TextBoxBorder
	call LoadTextBoxTilePatterns
	call UpdateSprites
	hlcoord 5, 2
	ld de, SaveScreenInfoText
	call PlaceString
	hlcoord 12, 2
	ld de, wPlayerName
	call PlaceString
	hlcoord 17, 4
	call PrintNumBadges
	hlcoord 16, 6
	call PrintNumOwnedMons
	hlcoord 13, 8
	call PrintPlayTime
	ld a, $1
	ldh [hAutoBGTransferEnabled], a
	ld c, 30
	jp DelayFrames

PrintNumBadges:
	push hl
	ld hl, wObtainedBadges
	ld b, $1
	call CountSetBits
	pop hl
	ld de, wNumSetBits
	lb bc, 1, 2
	jp PrintNumber

PrintNumOwnedMons:
	push hl
	ld hl, wPokedexOwned
	ld b, wPokedexOwnedEnd - wPokedexOwned
	call CountSetBits
	pop hl
	ld de, wNumSetBits
	lb bc, 1, 3
	jp PrintNumber

PrintPlayTime:
	ld de, wPlayTimeHours
	lb bc, 1, 3
	call PrintNumber
	ld [hl], "<COLON>" ; colon with tinier dots than ":"
	inc hl
	ld de, wPlayTimeMinutes
	lb bc, LEADING_ZEROES | 1, 2
	jp PrintNumber

SaveScreenInfoText:
	db   "PLAYER"
	next "BADGES    "
	next "#DEX    "
	next "TIME@"


CheckForPlayerNameInSRAM:
; Check if the player name data in SRAM has a string terminator character
; (indicating that a name may have been saved there) and return whether it does
; in carry.
	ld a, SRAM_ENABLE
	ld [MBC1SRamEnable], a
	ld a, $1
	ld [MBC1SRamBankingMode], a
	ld [MBC1SRamBank], a
	ld b, NAME_LENGTH
	ld hl, sPlayerName
.loop
	ld a, [hli]
	cp "@"
	jr z, .found
	dec b
	jr nz, .loop
; not found
	xor a
	ld [MBC1SRamEnable], a
	ld [MBC1SRamBankingMode], a
	and a
	ret
.found
	xor a
	ld [MBC1SRamEnable], a
	ld [MBC1SRamBankingMode], a
	scf
	ret
