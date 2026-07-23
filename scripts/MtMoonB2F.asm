MtMoonB2F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, MtMoonB2F_TrainerHeaders
	ld de, MtMoonB2F_ScriptPointers
	ld bc, wMtMoonB2FCurScript
	call ExecuteCurMapScriptInTable
	CheckEvent EVENT_BEAT_MT_MOON_EXIT_SUPER_NERD
	ret z
	ld hl, MtMoonB2FFossilAreaCoords
	call ArePlayerCoordsInArray
	jr nc, .enableBattles
	ld hl, wStatusFlags4
	set BIT_NO_BATTLES, [hl]
	ret
.enableBattles
	ld hl, wStatusFlags4
	res BIT_NO_BATTLES, [hl]
	ret

MtMoonB2FFossilAreaCoords:
	dbmapcoord 11,  5
	dbmapcoord 12,  5
	dbmapcoord 13,  5
	dbmapcoord 14,  5
	dbmapcoord 11,  6
	dbmapcoord 12,  6
	dbmapcoord 13,  6
	dbmapcoord 14,  6
	dbmapcoord 11,  7
	dbmapcoord 12,  7
	dbmapcoord 13,  7
	dbmapcoord 14,  7
	dbmapcoord 11,  8
	dbmapcoord 12,  8
	dbmapcoord 13,  8
	dbmapcoord 14,  8
	db -1 ; end

MtMoonB2FResetScripts:
	xor a ; SCRIPT_MTMOONB2F_DEFAULT
	ld [wJoyIgnore], a
	ld [wMtMoonB2FCurScript], a
	ret

MtMoonB2F_ScriptPointers:
	def_script_pointers
	dw_const MtMoonB2FDefaultScript,                   SCRIPT_MTMOONB2F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle,    SCRIPT_MTMOONB2F_START_BATTLE
	dw_const EndTrainerBattle,                         SCRIPT_MTMOONB2F_END_BATTLE
	dw_const MtMoonB2FDefeatedSuperNerdScript,         SCRIPT_MTMOONB2F_DEFEATED_SUPER_NERD
	dw_const MtMoonB2FMoveSuperNerdScript,             SCRIPT_MTMOONB2F_MOVE_SUPER_NERD
	dw_const MtMoonB2FSuperNerdTakesOtherFossilScript, SCRIPT_MTMOONB2F_SUPER_NERD_TAKES_OTHER_FOSSIL

MtMoonB2FDefaultScript:
	CheckEvent EVENT_BEAT_MT_MOON_EXIT_SUPER_NERD
	jr nz, MtMoonB2FCheckGotAFossil
	ld a, [wYCoord]
	cp 8
	jr nz, MtMoonB2FCheckGotAFossil
	ld a, [wXCoord]
	cp 13
	jr nz, MtMoonB2FCheckGotAFossil
	xor a
	ldh [hJoyHeld], a
	ld a, TEXT_MTMOONB2F_SUPER_NERD
	ldh [hTextID], a
	jp DisplayTextID

MtMoonB2FCheckGotAFossil:
	CheckEitherEventSet EVENT_GOT_DOME_FOSSIL, EVENT_GOT_HELIX_FOSSIL
	jp z, CheckFightingMapTrainers
	ret

MtMoonB2FDefeatedSuperNerdScript:
	ld a, [wIsInBattle]
	cp $ff
	jr z, MtMoonB2FResetScripts
	call UpdateSprites
	call Delay3
	SetEvent EVENT_BEAT_MT_MOON_EXIT_SUPER_NERD
	xor a
	ld [wJoyIgnore], a
	ld a, SCRIPT_MTMOONB2F_DEFAULT
	ld [wMtMoonB2FCurScript], a
	ret

MtMoonB2FMoveSuperNerdScript:
	ld a, MTMOONB2F_SUPER_NERD
	ldh [hSpriteIndex], a
	call SetSpriteMovementBytesToFF
	ld hl, MtMoonB2FPlayerNearDomeFossilCoords
	call ArePlayerCoordsInArray
	jr c, .playerNearDomeFossil
	ld hl, MtMoonB2FPlayerNearHelixFossilCoords
	call ArePlayerCoordsInArray
	jp nc, CheckFightingMapTrainers
	ld de, MtMoonB2FSuperNerdMoveUpMovementData
	jr .continue
.playerNearDomeFossil
	ld de, MtMoonB2FSuperNerdMoveRightMovementData
.continue
	ld a, MTMOONB2F_SUPER_NERD
	ldh [hSpriteIndex], a
	call MoveSprite
	ld a, SCRIPT_MTMOONB2F_SUPER_NERD_TAKES_OTHER_FOSSIL
	ld [wMtMoonB2FCurScript], a
	ret

MtMoonB2FPlayerNearDomeFossilCoords:
	dbmapcoord 12,  7
	dbmapcoord 11,  6
	dbmapcoord 12,  5
	db -1 ; end

MtMoonB2FPlayerNearHelixFossilCoords:
	dbmapcoord 13,  7
	dbmapcoord 14,  6
	dbmapcoord 14,  5
	db -1 ; end

MtMoonB2FSuperNerdMoveRightMovementData:
	db NPC_MOVEMENT_RIGHT
MtMoonB2FSuperNerdMoveUpMovementData:
	db NPC_MOVEMENT_UP
	db -1 ; end

MtMoonB2FSuperNerdTakesOtherFossilScript: ; marcelnote - optimized
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	ld a, PAD_CTRL_PAD
	ld [wJoyIgnore], a
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld a, TEXT_MTMOONB2F_SUPER_NERD_THEN_THIS_IS_MINE
	ldh [hTextID], a
	call DisplayTextID
	CheckEvent EVENT_GOT_DOME_FOSSIL
	ld a, TOGGLE_MT_MOON_B2F_FOSSIL_1
	jr z, .continue
	ld a, TOGGLE_MT_MOON_B2F_FOSSIL_2
.continue
	ld [wToggleableObjectIndex], a
	predef HideObject
	xor a
	ld [wJoyIgnore], a
	ld a, SCRIPT_MTMOONB2F_DEFAULT
	ld [wMtMoonB2FCurScript], a
	ret

MtMoonB2F_TextPointers:
	def_text_pointers
	dw_const MtMoonB2FSuperNerdText,               TEXT_MTMOONB2F_SUPER_NERD
	dw_const MtMoonB2FRocket1Text,                 TEXT_MTMOONB2F_ROCKET1
	dw_const MtMoonB2FRocket2Text,                 TEXT_MTMOONB2F_ROCKET2
	dw_const MtMoonB2FRocket3Text,                 TEXT_MTMOONB2F_ROCKET3
	dw_const MtMoonB2FRocket4Text,                 TEXT_MTMOONB2F_ROCKET4
	dw_const MtMoonB2FDomeFossilText,              TEXT_MTMOONB2F_DOME_FOSSIL
	dw_const MtMoonB2FHelixFossilText,             TEXT_MTMOONB2F_HELIX_FOSSIL
	dw_const PickUpItemText,                       TEXT_MTMOONB2F_HP_UP
	dw_const PickUpItemText,                       TEXT_MTMOONB2F_TM_MEGA_PUNCH
	dw_const MtMoonB2FSuperNerdThenThisIsMineText, TEXT_MTMOONB2F_SUPER_NERD_THEN_THIS_IS_MINE
	dw_const MtMoonB2FMtMoonSquareSignText,        TEXT_MTMOONB2F_MT_MOON_SQUARE_SIGN ; marcelnote - added Mt Moon Square

MtMoonB2F_TrainerHeaders:
	def_trainers 2
MtMoonB2FTrainerHeader0:
	trainer EVENT_BEAT_MT_MOON_B2F_TRAINER_0, 4, MtMoonB2FRocket1BattleText, MtMoonB2FRocket1EndBattleText, MtMoonB2FRocket1AfterBattleText
MtMoonB2FTrainerHeader1:
	trainer EVENT_BEAT_MT_MOON_B2F_TRAINER_1, 4, MtMoonB2FRocket2BattleText, MtMoonB2FRocket2EndBattleText, MtMoonB2FRocket2AfterBattleText
MtMoonB2FTrainerHeader2:
	trainer EVENT_BEAT_MT_MOON_B2F_TRAINER_2, 4, MtMoonB2FRocket3BattleText, MtMoonB2FRocket3EndBattleText, MtMoonB2FRocket3AfterBattleText
MtMoonB2FTrainerHeader3:
	trainer EVENT_BEAT_MT_MOON_B2F_TRAINER_3, 4, MtMoonB2FRocket4BattleText, MtMoonB2FRocket4EndBattleText, MtMoonB2FRocket4AfterBattleText
	db -1 ; end

MtMoonB2FSuperNerdText: ; marcelnote - optimized
	text_asm
	CheckEvent EVENT_BEAT_MT_MOON_EXIT_SUPER_NERD
	jr z, .beatSuperNerd
	CheckEitherEventSet EVENT_GOT_DOME_FOSSIL, EVENT_GOT_HELIX_FOSSIL, 1
	ld hl, MtMoonB2FSuperNerdTheresAPokemonLabText
	ret nz
	ld hl, MtMoonB2fSuperNerdEachTakeOneText
	ret
.beatSuperNerd
	ld hl, MtMoonB2FSuperNerdTheyreBothMineText
	call PrintText
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, MtMoonB2FSuperNerdOkIllShareText
	ld de, MtMoonB2FSuperNerdOkIllShareText
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, SCRIPT_MTMOONB2F_DEFEATED_SUPER_NERD
	ld [wMtMoonB2FCurScript], a
	rst TextScriptEnd

MtMoonB2FRocket1Text:
	text_asm
	ld hl, MtMoonB2FTrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd

MtMoonB2FRocket2Text:
	text_asm
	ld hl, MtMoonB2FTrainerHeader1
	call TalkToTrainer
	rst TextScriptEnd

MtMoonB2FRocket3Text:
	text_asm
	ld hl, MtMoonB2FTrainerHeader2
	call TalkToTrainer
	rst TextScriptEnd

MtMoonB2FRocket4Text:
	text_asm
	ld hl, MtMoonB2FTrainerHeader3
	call TalkToTrainer
	rst TextScriptEnd

MtMoonB2FDomeFossilText:
	text_asm
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, .YouWantText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .done
	lb bc, DOME_FOSSIL, 1
	call GiveItem
	jr nc, MtMoonB2FYouHaveNoRoomText
	call MtMoonB2FReceivedFossilText
	ld a, TOGGLE_MT_MOON_B2F_FOSSIL_1
	ld [wToggleableObjectIndex], a
	predef HideObject
	SetEvent EVENT_GOT_DOME_FOSSIL
	ld a, SCRIPT_MTMOONB2F_MOVE_SUPER_NERD
	ld [wMtMoonB2FCurScript], a
.done
	rst TextScriptEnd

.YouWantText:
	text_far _MtMoonB2FDomeFossilYouWantText
	text_end

MtMoonB2FHelixFossilText:
	text_asm
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, .YouWantText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .done
	lb bc, HELIX_FOSSIL, 1
	call GiveItem
	jr nc, MtMoonB2FYouHaveNoRoomText
	call MtMoonB2FReceivedFossilText
	ld a, TOGGLE_MT_MOON_B2F_FOSSIL_2
	ld [wToggleableObjectIndex], a
	predef HideObject
	SetEvent EVENT_GOT_HELIX_FOSSIL
	ld a, SCRIPT_MTMOONB2F_MOVE_SUPER_NERD
	ld [wMtMoonB2FCurScript], a
.done
	rst TextScriptEnd

.YouWantText:
	text_far _MtMoonB2FHelixFossilYouWantText
	text_end

MtMoonB2FReceivedFossilText:
	ld hl, .Text
	jp PrintText

.Text:
	text_far _MtMoonB2FReceivedFossilText
	sound_get_key_item
	text_waitbutton
	text_end

MtMoonB2FYouHaveNoRoomText:
	ld hl, .Text
	call PrintText
	rst TextScriptEnd

.Text:
	text_far _MtMoonB2FYouHaveNoRoomText
	text_waitbutton
	text_end

MtMoonB2FSuperNerdTheyreBothMineText:
	text_far _MtMoonB2FSuperNerdTheyreBothMineText
	text_end

MtMoonB2FSuperNerdOkIllShareText:
	text_far _MtMoonB2FSuperNerdOkIllShareText
	text_end

MtMoonB2fSuperNerdEachTakeOneText:
	text_far _MtMoonB2fSuperNerdEachTakeOneText
	text_end

MtMoonB2FSuperNerdTheresAPokemonLabText:
	text_far _MtMoonB2FSuperNerdTheresAPokemonLabText
	text_end

MtMoonB2FSuperNerdThenThisIsMineText:
	text_far _MtMoonB2FSuperNerdThenThisIsMineText
	sound_get_key_item
	text_end

MtMoonB2FRocket1BattleText:
	text_far _MtMoonB2FRocket1BattleText
	text_end

MtMoonB2FRocket1EndBattleText:
	text_far _MtMoonB2FRocket1EndBattleText
	text_end

MtMoonB2FRocket1AfterBattleText:
	text_far _MtMoonB2FRocket1AfterBattleText
	text_end

MtMoonB2FRocket2BattleText:
	text_far _MtMoonB2FRocket2BattleText
	text_end

MtMoonB2FRocket2EndBattleText:
	text_far _MtMoonB2FRocket2EndBattleText
	text_end

MtMoonB2FRocket2AfterBattleText:
	text_far _MtMoonB2FRocket2AfterBattleText
	text_end

MtMoonB2FRocket3BattleText:
	text_far _MtMoonB2FRocket3BattleText
	text_end

MtMoonB2FRocket3EndBattleText:
	text_far _MtMoonB2FRocket3EndBattleText
	text_end

MtMoonB2FRocket3AfterBattleText:
	text_far _MtMoonB2FRocket3AfterBattleText
	text_end

MtMoonB2FRocket4BattleText:
	text_far _MtMoonB2FRocket4BattleText
	text_end

MtMoonB2FRocket4EndBattleText:
	text_far _MtMoonB2FRocket4EndBattleText
	text_end

MtMoonB2FRocket4AfterBattleText:
	text_far _MtMoonB2FRocket4AfterBattleText
	text_end

MtMoonB2FMtMoonSquareSignText: ; marcelnote - added Mt Moon Square
	text_far _MtMoonB2FMtMoonSquareSignText
	text_end
