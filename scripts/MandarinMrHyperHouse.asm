; marcelnote - new location
MandarinMrHyperHouse_Script:
	jp EnableAutoTextBoxDrawing

MandarinMrHyperHouse_TextPointers:
	def_text_pointers
	dw_const MandarinMrHyperHouseMrHyperText,      TEXT_MANDARINMRHYPERHOUSE_MR_HYPER

MandarinMrHyperHouseMrHyperText: ; marcelnote - Mr. Hyper trades one Bottle Cap for one maximized DV
	text_asm
	call SaveScreenTilesToBuffer2 ; used in RestoreScreenTilesAndReloadTilePatterns
	CheckAndSetEvent EVENT_MET_MR_HYPER
	jr nz, .skipIntro
	ld hl, .IntroText
	call PrintText
.skipIntro
	ld hl, .OfferText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jp nz, .bye
.checkCaps
	ld b, BOTTLE_CAP
	call IsItemInBag
	ld hl, .NoCapsText
	jp z, .printAndEnd
	xor a
	ld [wPartyMenuTypeOrMessageID], a
	ld [wMenuItemToSwap], a
	dec a
	ld [wUpdateSpritesEnabled], a
	call DisplayPartyMenu
	jr .checkMon
.rejectMon
	call PrintText
.backToParty
	; Keep the redraw hidden until the party menu and its prompt are ready.
	xor a
	ldh [hAutoBGTransferEnabled], a
	call GoBackToPartyMenu
.checkMon
	jp c, .restoreAndExit
	ld hl, wPartyMon1Level
	ld a, [wWhichPokemon]
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld e, [hl] ; e = Mon's level
	ld bc, MON_DVS - MON_LEVEL
	add hl, bc
	ld a, [hli]
	and [hl]
	inc a ; zero only when all four DVs are 15
	ld hl, .AlreadyPerfectText
	jr z, .rejectMon
	ld a, e
	cp 50 ; minimum level for Hyper Training
	ld hl, .TooYoungText
	jr c, .rejectMon

; Save the party screen once, including when retrying an already-maxed stat.
	call SaveScreenTilesToBuffer1

; Copy the existing stat labels into the move-menu scratch buffer.
	ld hl, StatsText
	ld de, wMovesString
	ld bc, StatsTextEnd - StatsText
	ASSERT StatsTextEnd - StatsText <= NUM_MOVES * MOVE_NAME_LENGTH
	ld a, BANK(StatsText)
	call FarCopyData

; Draw the stat selection menu over the party screen.
.chooseStat
	ld hl, .WhichStatText
	call PrintText
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl]
	hlcoord 8, 7
	lb bc, 4, 10
	call TextBoxBorder

; Draw the four names on consecutive rows.
	ldh a, [hUILayoutFlags]
	or (1 << BIT_SINGLE_SPACED_LINES) | (1 << BIT_SINGLE_SPACED_MENU)
	ldh [hUILayoutFlags], a
	hlcoord 10, 8
	ld de, wMovesString
	call PlaceString

; Read the chosen stat, or return to the party menu on B.
	ld hl, wTopMenuItemY
	ld a, 8
	ld [hli], a ; wTopMenuItemY
	inc a
	ld [hli], a ; wTopMenuItemX
	xor a
	ld [hli], a ; wCurrentMenuItem
	inc hl
	ld a, 3
	ld [hli], a ; wMaxMenuItem
	ld a, PAD_A | PAD_B
	ld [hli], a ; wMenuWatchedKeys
	ld [hl], 0 ; wLastMenuItem
	call HandleMenuInput
	push af
	ldh a, [hUILayoutFlags]
	and ~((1 << BIT_SINGLE_SPACED_LINES) | (1 << BIT_SINGLE_SPACED_MENU))
	ldh [hUILayoutFlags], a
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	call LoadScreenTilesFromBuffer1
	pop af
	bit B_PAD_B, a
	jp nz, .backToParty

; Locate the selected stat's DV byte and nibble mask.
	ld hl, wPartyMon1DVs
	ld a, [wWhichPokemon]
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [wCurrentMenuItem]
	srl a ; high nibble if a = 0 or 2 (no carry)
	ld b, $f0
	jr nc, .gotMask
	ld b, $0f
.gotMask
	jr z, .gotByte ; first byte if a = 0 or 1
	inc hl
.gotByte

; Train the selected stat unless its DV is already maximized.
	ld a, [hl]
	or b
	cp [hl] ; unchanged means the selected DV is already 15
	jr z, .statAlreadyMaxed
	ld [hl], a

	ld a, [wWhichPokemon] ; RemoveItemByID uses wWhichPokemon as the bag slot index
	push af
	ld a, BOTTLE_CAP
	ldh [hItemToRemoveID], a
	callfar RemoveItemByID
	pop af
	ld [wWhichPokemon], a

; Go back to the overworld, announce training, then play the Mon's cry while faded out.
	call .restoreOverworld
	ld hl, .TrainingText
	call PrintText
	call GBFadeOutToWhite
	call LoadCurrentMapView ; clear the dialogue box while the screen is white
	ld hl, wPartySpecies ; wCurPartySpecies aliases wCurItem, overwritten when removing the cap
	ld a, [wWhichPokemon]
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hl]
	call PlayCry ; waits for the cry to finish
	ld c, 20
	call DelayFrames
	call GBFadeInFromWhite
	call GetPartyMonName2
	ld hl, .TrainedText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jp z, .checkCaps
	jr .bye
.statAlreadyMaxed
	ld hl, .StatAlreadyMaxedText
	call PrintText
	jp .chooseStat
.restoreAndExit
	call .restoreOverworld
.bye
	ld hl, .ByeText
.printAndEnd
	call PrintText
	rst TextScriptEnd

.restoreOverworld
	call GBPalWhiteOutWithDelay3
	call RestoreScreenTilesAndReloadTilePatterns
	jp LoadGBPal

.IntroText
	text_far _MrHyperIntroText
	text_end

.OfferText
	text_far _MrHyperOfferText
	text_end

.NoCapsText
	text_far _MrHyperNoCapsText
	text_end

.TooYoungText
	text_far _MrHyperTooYoungText
	text_end

.AlreadyPerfectText
	text_far _MrHyperAlreadyPerfectText
	text_end

.StatAlreadyMaxedText
	text_far _MrHyperStatAlreadyMaxedText
	text_end

.WhichStatText
	text_far _MrHyperWhichStatText
	text_end

.TrainingText
	text_far _MrHyperTrainingText
	text_end

.TrainedText
	text_far _MrHyperTrainedText
	text_end

.ByeText
	text_far _MrHyperByeText
	text_end
