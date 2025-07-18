PalletTown_Script: ; marcelnote - now also sets EVENT_PALLET_AFTER_GETTING_POKEDEX
	CheckEvent EVENT_GOT_POKEDEX
	jr z, .skip
	SetEvent EVENT_PALLET_AFTER_GETTING_POKEDEX
	CheckEvent EVENT_GOT_POKEBALLS_FROM_OAK
	jr z, .skip
	SetEvent EVENT_PALLET_AFTER_GETTING_POKEBALLS
.skip
	call EnableAutoTextBoxDrawing
	ld hl, PalletTown_ScriptPointers
	ld a, [wPalletTownCurScript]
	jp CallFunctionInTable

PalletTown_ScriptPointers:
	def_script_pointers
	dw_const PalletTownDefaultScript,              SCRIPT_PALLETTOWN_DEFAULT
	dw_const PalletTownOakHeyWaitScript,           SCRIPT_PALLETTOWN_OAK_HEY_WAIT
	dw_const PalletTownOakWalksToPlayerScript,     SCRIPT_PALLETTOWN_OAK_WALKS_TO_PLAYER
	dw_const PalletTownOakNotSafeComeWithMeScript, SCRIPT_PALLETTOWN_OAK_NOT_SAFE_COME_WITH_ME
	dw_const PalletTownPlayerFollowsOakScript,     SCRIPT_PALLETTOWN_PLAYER_FOLLOWS_OAK
	dw_const PalletTownDaisyScript,                SCRIPT_PALLETTOWN_DAISY
	dw_const DoRet,                                SCRIPT_PALLETTOWN_NOOP ; PureRGB - DoRet

PalletTownDefaultScript:
	;CheckEvent EVENT_OAK_APPEARED_IN_PALLET ; marcelnote - this is not needed since the script
	;ret nz                                  ;              moves on from the default one once triggered
IF DEF(_DEBUG) ; marcelnote - added to skip in debug mode
	call DebugPressedOrHeldB
	ret nz
ENDC
	ld a, [wYCoord]
	cp 1 ; is player near north exit?
	ret nz
	xor a
	ldh [hJoyHeld], a
	ld a, PLAYER_DIR_DOWN
	ld [wPlayerMovingDirection], a
	ld a, SFX_STOP_ALL_MUSIC
	call PlaySound
	ld c, 0 ; BANK(Music_MeetProfOak)
	ld a, MUSIC_MEET_PROF_OAK ; "oak appears" music
	call PlayMusic
	ld a, PAD_SELECT | PAD_START | PAD_CTRL_PAD
	ld [wJoyIgnore], a
	SetEvent EVENT_OAK_APPEARED_IN_PALLET

	ld a, SCRIPT_PALLETTOWN_OAK_HEY_WAIT
	ld [wPalletTownCurScript], a
	ret

PalletTownOakHeyWaitScript:
	xor a
	ld [wOakWalkedToPlayer], a
	ld a, HS_PALLET_TOWN_OAK
	ld [wMissableObjectIndex], a
	predef ShowObject ; marcelnote - ShowObject moved before DisplayTextID to solve bug
	ld a, TEXT_PALLETTOWN_OAK
	ldh [hTextID], a
	call DisplayTextID
	ld a, PAD_BUTTONS | PAD_CTRL_PAD
	ld [wJoyIgnore], a

	ld a, SCRIPT_PALLETTOWN_OAK_WALKS_TO_PLAYER
	ld [wPalletTownCurScript], a
	ret

PalletTownOakWalksToPlayerScript:
	call Delay3
	ld a, PALLETTOWN_OAK
	swap a
	ldh [hNPCSpriteOffset], a
	predef CalcPositionOfPlayerRelativeToNPC
	ld hl, hNPCPlayerYDistance
	dec [hl] ; stop in front of player
	predef FindPathToPlayer ; load Oak's movement into wNPCMovementDirections2
	ld de, wNPCMovementDirections2
	ld a, PALLETTOWN_OAK
	ldh [hSpriteIndex], a
	call MoveSprite
	ld a, PAD_BUTTONS | PAD_CTRL_PAD
	ld [wJoyIgnore], a

	ld a, SCRIPT_PALLETTOWN_OAK_NOT_SAFE_COME_WITH_ME
	ld [wPalletTownCurScript], a
	ret

PalletTownOakNotSafeComeWithMeScript:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	xor a ; ld a, SPRITE_FACING_DOWN
	ld [wSpritePlayerStateData1FacingDirection], a
	ld a, TRUE
	ld [wOakWalkedToPlayer], a
	ld a, PAD_SELECT | PAD_START | PAD_CTRL_PAD
	ld [wJoyIgnore], a
	ld a, TEXT_PALLETTOWN_OAK
	ldh [hTextID], a
	call DisplayTextID
; set up movement script that causes the player to follow Oak to his lab
	ld a, PAD_BUTTONS | PAD_CTRL_PAD
	ld [wJoyIgnore], a
	ld a, PALLETTOWN_OAK
	ld [wSpriteIndex], a
	xor a
	ld [wNPCMovementScriptFunctionNum], a
	ld a, 1
	ld [wNPCMovementScriptPointerTableNum], a
	ldh a, [hLoadedROMBank]
	ld [wNPCMovementScriptBank], a

	ld a, SCRIPT_PALLETTOWN_PLAYER_FOLLOWS_OAK
	ld [wPalletTownCurScript], a
	ret

PalletTownPlayerFollowsOakScript:
	ld a, [wNPCMovementScriptPointerTableNum]
	and a ; is the movement script over?
	ret nz

	ld a, SCRIPT_PALLETTOWN_DAISY
	ld [wPalletTownCurScript], a
	ret

PalletTownDaisyScript: ; marcelnote - this was adjusted to move on to SCRIPT_PALLETTOWN_NOOP
	CheckEvent EVENT_GOT_TOWN_MAP
	ret z
	ld a, HS_DAISY_SITTING
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, HS_DAISY_WALKING
	ld [wMissableObjectIndex], a
	predef_jump ShowObject

	ld a, SCRIPT_PALLETTOWN_NOOP
	ld [wPalletTownCurScript], a
	ret

PalletTown_TextPointers:
	def_text_pointers
	dw_const PalletTownOakText,              TEXT_PALLETTOWN_OAK
	dw_const PalletTownGirl1Text,            TEXT_PALLETTOWN_GIRL1
	dw_const PalletTownFisherText,           TEXT_PALLETTOWN_FISHER
	dw_const PalletTownGirl2Text,            TEXT_PALLETTOWN_GIRL2 ; marcelnote - new
	dw_const PalletTownOaksLabSignText,      TEXT_PALLETTOWN_OAKSLAB_SIGN
	dw_const PalletTownSignText,             TEXT_PALLETTOWN_SIGN
	dw_const PalletTownPlayersHouseSignText, TEXT_PALLETTOWN_PLAYERSHOUSE_SIGN
	dw_const PalletTownRivalsHouseSignText,  TEXT_PALLETTOWN_RIVALSHOUSE_SIGN
	dw_const PalletTownYellowsHouseSignText, TEXT_PALLETTOWN_YELLOWSHOUSE_SIGN ; marcelnote - Yellow's house

PalletTownOakText: ; marcelnote - optimized
	text_asm
	ld a, [wOakWalkedToPlayer]
	and a
	ld hl, .ItsUnsafeText
	jr nz, .print_text
	ld a, 1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, .HeyWaitDontGoOutText
.print_text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.HeyWaitDontGoOutText:
	text_far _PalletTownOakHeyWaitDontGoOutText
	text_asm
	ld c, 10
	call DelayFrames
	xor a
	ld [wEmotionBubbleSpriteIndex], a ; player's sprite
	ld [wWhichEmotionBubble], a ; EXCLAMATION_BUBBLE
	predef EmotionBubble
	ld a, PLAYER_DIR_DOWN
	ld [wPlayerMovingDirection], a
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.ItsUnsafeText:
	text_far _PalletTownOakItsUnsafeText
	text_end

PalletTownGirl1Text:
	text_far _PalletTownGirl1Text
	text_end

PalletTownFisherText:
	text_far _PalletTownFisherText
	text_end

PalletTownGirl2Text: ; marcelnote - new
	text_far _PalletTownGirl2Text
	text_end

PalletTownOaksLabSignText:
	text_far _PalletTownOaksLabSignText
	text_end

PalletTownSignText:
	text_far _PalletTownSignText
	text_end

PalletTownPlayersHouseSignText:
	text_far _PalletTownPlayersHouseSignText
	text_end

PalletTownRivalsHouseSignText:
	text_far _PalletTownRivalsHouseSignText
	text_end

PalletTownYellowsHouseSignText: ; marcelnote - added Yellow's house
	text_asm
	ld hl, .YellowsHouseText
	CheckEvent EVENT_BEAT_MISTY
	jr nz, .textLoaded
	ld hl, .JustMovedInText
.textLoaded
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.YellowsHouseText:
	text_far _PalletTownYellowsHouseSignText
	text_end

.JustMovedInText:
	text_far _PalletTownYellowsHouseSignJustMovedInText
	text_end
