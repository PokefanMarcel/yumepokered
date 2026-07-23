; marcelnote - script was extensively modified to reduce map loading time
;              for map redraws when removing gates
CinnabarGym_Script:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_2, [hl]
	res BIT_CUR_MAP_LOADED_2, [hl]
	call nz, .LoadNames
	call CinnabarGymSetMapAndTiles
	call EnableAutoTextBoxDrawing
	ld hl, CinnabarGym_ScriptPointers
	ld a, [wCinnabarGymCurScript]
	jp CallFunctionInTable

.LoadNames:
	ld hl, .CityName
	ld de, .LeaderName
	jp LoadGymLeaderAndCityName

IF DEF(_FRA)
.CityName:
	db "CRAMOIS'ILE@"
.LeaderName:
	db "AUGUSTE@"
ELIF DEF(_ESP)
.CityName:
	db "ISLA CANELA@"
.LeaderName:
	db "BLAINE@"
ELSE
.CityName:
	db "CINNABAR ISLAND@"
.LeaderName:
	db "BLAINE@"
ENDC

CinnabarGymSetMapAndTiles:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	ret z
	res BIT_CUR_MAP_LOADED_1, [hl]
	jp UpdateCinnabarGymGateTileBlocks

CinnabarGymSetDefaultScript:
	xor a
	ld [wJoyIgnore], a
CinnabarGymSetScript:
	ld [wCinnabarGymCurScript], a
	ld [wOpponentAfterWrongAnswer], a
	ret

CinnabarGymSetTrainerHeader:
	ldh a, [hTextID]
	ld [wTrainerHeaderFlagBit], a
	ret

CinnabarGym_ScriptPointers:
	def_script_pointers
	dw_const CinnabarGymDefaultScript,                 SCRIPT_CINNABARGYM_DEFAULT
	dw_const CinnabarGymGetOpponentTextScript,         SCRIPT_CINNABARGYM_GET_OPPONENT_TEXT
	dw_const CinnabarGymOpenGateScript,                SCRIPT_CINNABARGYM_OPEN_GATE
	dw_const CinnabarGymFinishOpenGateScript,          SCRIPT_CINNABARGYM_FINISH_OPEN_GATE
	dw_const CinnabarGymBlainePostBattleScript,        SCRIPT_CINNABARGYM_BLAINE_POST_BATTLE
	dw_const CinnabarGymBlaineRematchPostBattleScript, SCRIPT_CINNABARGYM_BLAINE_REMATCH_POST_BATTLE ; marcelnote - Blaine rematch

CinnabarGymDefaultScript:
	ld a, [wOpponentAfterWrongAnswer]
	and a
	ret z
	ldh [hSpriteIndex], a
	cp CINNABARGYM_SUPER_NERD3
	ld a, PLAYER_DIR_RIGHT
	ld de, MovementNpcToLeft
	jr nz, .moveSprite
	ld a, PLAYER_DIR_DOWN
	ld de, MovementNpcToLeftAndUp
.moveSprite
	ld [wPlayerMovingDirection], a
	call MoveSprite
	ld a, SCRIPT_CINNABARGYM_GET_OPPONENT_TEXT
	ld [wCinnabarGymCurScript], a
	ret

MovementNpcToLeftAndUp:
	db NPC_MOVEMENT_LEFT
	db NPC_MOVEMENT_UP
	db -1 ; end

MovementNpcToLeft:
	db NPC_MOVEMENT_LEFT
	db -1 ; end

CinnabarGymGetOpponentTextScript:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld a, [wOpponentAfterWrongAnswer]
	ld [wTrainerHeaderFlagBit], a
	ldh [hTextID], a
	jp DisplayTextID

CinnabarGymCurrentTrainerFlagAction:
	ld a, [wTrainerHeaderFlagBit]
	AdjustEventBit EVENT_BEAT_CINNABAR_GYM_TRAINER_0, 2
	ld c, a
	; fallthrough

CinnabarGymTrainerFlagAction:
	EventFlagAddress hl, EVENT_BEAT_CINNABAR_GYM_TRAINER_0
	predef_jump FlagActionPredef

CinnabarGymCurrentGateFlagAction:
	ldh a, [hGymGateIndex]
	AdjustEventBit EVENT_CINNABAR_GYM_GATE0_UNLOCKED, 0
	ld c, a
	; fallthrough

CinnabarGymGateFlagAction:
	EventFlagAddress hl, EVENT_CINNABAR_GYM_GATE0_UNLOCKED
	predef_jump FlagActionPredef

PrintCinnabarQuiz::
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	call EnableAutoTextBoxDrawing
	tx_pre_jump CinnabarGymQuiz

CinnabarGymQuiz::
	text_asm
	xor a
	ld [wOpponentAfterWrongAnswer], a
	ld a, [wHiddenEventFunctionArgument]
	ld b, a
	and $f
	ldh [hGymGateIndex], a
	ld a, b
	and $f0
	swap a
	ldh [hGymGateAnswer], a
	ld hl, CinnabarGymQuizIntroText
	call PrintText
	ldh a, [hGymGateIndex]
	dec a
	add a
	ld d, 0
	ld e, a
	ld hl, CinnabarQuizQuestions
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintText
	ld a, 1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	call YesNoChoice
	xor a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ldh a, [hGymGateAnswer]
	ld c, a
	ld a, [wCurrentMenuItem]
	cp c
	jr nz, .wrongAnswer
	ld hl, CinnabarGymQuizCorrectText
	call PrintText
	ld a, SCRIPT_CINNABARGYM_FINISH_OPEN_GATE
	ld [wCinnabarGymCurScript], a
	rst TextScriptEnd
.wrongAnswer
	call WaitForSoundToFinish
	ld a, SFX_DENIED
	call PlaySound
	call WaitForSoundToFinish
	ld hl, CinnabarGymQuizIncorrectText
	call PrintText
	ldh a, [hGymGateIndex]
	inc a ; marcelnote - adjusted from add $2 to accommodate new quiz question
	AdjustEventBit EVENT_BEAT_CINNABAR_GYM_TRAINER_0, 2
	ld c, a
	ld b, FLAG_TEST
	call CinnabarGymTrainerFlagAction
	ld a, c
	and a
	jr nz, .done
	ldh a, [hGymGateIndex]
	inc a ; marcelnote - adjusted from add $2 to accommodate new quiz question
	ld [wOpponentAfterWrongAnswer], a
.done
	rst TextScriptEnd

CinnabarGymQuizIntroText:
	text_far _CinnabarGymQuizIntroText
	text_end

CinnabarQuizQuestions:
	dw CinnabarQuizQuestionsText1
	dw CinnabarQuizQuestionsText2 ; marcelnote - new quiz question
	dw CinnabarQuizQuestionsText3 ; marcelnote - questions 2-6 reindexed as 3-7
	dw CinnabarQuizQuestionsText4
	dw CinnabarQuizQuestionsText5
	dw CinnabarQuizQuestionsText6
	dw CinnabarQuizQuestionsText7

CinnabarQuizQuestionsText1:
	text_far _CinnabarQuizQuestionsText1
	text_end

CinnabarQuizQuestionsText2: ; marcelnote - new quiz question
	text_far _CinnabarQuizQuestionsText2
	text_end

CinnabarQuizQuestionsText3: ; marcelnote - reindexed from 2
	text_far _CinnabarQuizQuestionsText3
	text_end

CinnabarQuizQuestionsText4: ; marcelnote - reindexed from 3
	text_far _CinnabarQuizQuestionsText4
	text_end

CinnabarQuizQuestionsText5: ; marcelnote - reindexed from 4
	text_far _CinnabarQuizQuestionsText5
	text_end

CinnabarQuizQuestionsText6: ; marcelnote - reindexed from 5
	text_far _CinnabarQuizQuestionsText6
	text_end

CinnabarQuizQuestionsText7: ; marcelnote - reindexed from 6
	text_far _CinnabarQuizQuestionsText7
	text_end

CinnabarGymQuizCorrectText:
	sound_get_item_1
	text_far _CinnabarGymQuizCorrectText
	text_end

CinnabarGymQuizIncorrectText:
	text_far _CinnabarGymQuizIncorrectText
	text_end

UpdateCinnabarGymGateTileBlocks:
; Update the overworld map with open floor blocks or locked gate blocks
; depending on event flags.
	ld a, 7 ; marcelnote - 7 gates, adjusted up from 6 for new quiz question
	ldh [hGymGateIndex], a
.loop
	call UpdateCinnabarGymGateTileBlock
	ld hl, hGymGateIndex
	dec [hl]
	jr nz, .loop
	ret

UpdateCinnabarGymGateTileBlock:
; Update the overworld map with the open floor block or locked gate block
; for the gate whose 1-based index is in hGymGateIndex.
	ldh a, [hGymGateIndex]
	dec a
	add a
	add a
	ld d, 0
	ld e, a
	ld hl, CinnabarGymGateCoords
	add hl, de
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld [wNewTileBlockID], a
	push bc
	ld b, FLAG_TEST
	call CinnabarGymCurrentGateFlagAction
	ld a, c
	and a
	jr z, .gotBlock
	ld a, $e
	ld [wNewTileBlockID], a
.gotBlock
	pop bc
	predef_jump ReplaceTileBlock

MACRO gym_gate_coord
	db \1, \2, \3, 0
ENDM

DEF HORIZONTAL_GATE_BLOCK EQU $54
DEF VERTICAL_GATE_BLOCK   EQU $30 ; marcelnote - use block with gate on the left instead

CinnabarGymGateCoords:
	; x coord, y coord, block id
	gym_gate_coord 9, 3, HORIZONTAL_GATE_BLOCK
	gym_gate_coord 7, 1, VERTICAL_GATE_BLOCK ; marcelnote - new quiz question
	gym_gate_coord 6, 3, HORIZONTAL_GATE_BLOCK
	gym_gate_coord 6, 6, HORIZONTAL_GATE_BLOCK
	gym_gate_coord 4, 8, VERTICAL_GATE_BLOCK ; marcelnote - adjusted to use the same gate block
	gym_gate_coord 2, 6, HORIZONTAL_GATE_BLOCK
	gym_gate_coord 2, 3, HORIZONTAL_GATE_BLOCK

CinnabarGymOpenGateScript:
	ld a, [wIsInBattle]
	inc a ; lost battle?
	jp z, CinnabarGymSetScript ; SCRIPT_CINNABARGYM_DEFAULT
	ld a, [wTrainerHeaderFlagBit]
	dec a ; marcelnote - adjusted from sub $2 for new quiz question
	ldh [hGymGateIndex], a
	ld b, FLAG_SET
	call CinnabarGymCurrentTrainerFlagAction
	ld b, FLAG_TEST
	call CinnabarGymCurrentGateFlagAction
	ld a, c
	and a
	jr nz, .done
	ld hl, wCurrentMapScriptFlags
	bit BIT_REDRAW_MAP_VIEW_PENDING, [hl]
	jr z, .skipRedrawMapView
	res BIT_REDRAW_MAP_VIEW_PENDING, [hl]
	callfar RedrawMapView
.skipRedrawMapView
	ld c, 30
	call DelayFrames ; pause with locked gate visible before it opens
	call WaitForSoundToFinish
	ld a, SFX_GO_INSIDE
	call PlaySound
	call WaitForSoundToFinish
	ld b, FLAG_SET
	call CinnabarGymCurrentGateFlagAction
	call UpdateCinnabarGymGateTileBlock
.done
	jp CinnabarGymSetDefaultScript

CinnabarGymFinishOpenGateScript:
	ld b, FLAG_TEST
	call CinnabarGymCurrentGateFlagAction
	ld a, c
	and a
	jr nz, .done
	call WaitForSoundToFinish
	ld a, SFX_GO_INSIDE
	call PlaySound
	call WaitForSoundToFinish
	ld b, FLAG_SET
	call CinnabarGymCurrentGateFlagAction
	ld hl, wCurrentMapScriptFlags
	set BIT_CUR_MAP_LOADED_1, [hl]
.done
	jp CinnabarGymSetDefaultScript

CinnabarGymBlainePostBattleScript:
	ld a, [wIsInBattle]
	inc a ; lost battle?
	jp z, CinnabarGymSetScript ; SCRIPT_CINNABARGYM_DEFAULT
	ld a, PAD_CTRL_PAD
	ld [wJoyIgnore], a
	; fallthrough

CinnabarGymReceiveTM38: ; marcelnote - optimized
	ld a, TEXT_CINNABARGYM_BLAINE_VOLCANO_BADGE_INFO
	ldh [hTextID], a
	call DisplayTextID
	SetEvent EVENT_BEAT_BLAINE
	lb bc, TM_FIRE_BLAST, 1
	call GiveItem
	ld a, TEXT_CINNABARGYM_BLAINE_TM38_NO_ROOM
	jr nc, .displayTMText
	SetEvent EVENT_GOT_TM38
	ld a, TEXT_CINNABARGYM_BLAINE_RECEIVED_TM38
.displayTMText
	ldh [hTextID], a
	call DisplayTextID
	ld hl, wObtainedBadges
	set BIT_VOLCANOBADGE, [hl]
	SetEventRange EVENT_BEAT_CINNABAR_GYM_TRAINER_0, EVENT_BEAT_CINNABAR_GYM_TRAINER_6
	ld hl, wCurrentMapScriptFlags
	set BIT_CUR_MAP_LOADED_1, [hl]
	jp CinnabarGymSetDefaultScript

CinnabarGymBlaineRematchPostBattleScript: ; marcelnote - Blaine rematch
	ld a, [wIsInBattle]
	inc a ; lost battle?
	jp z, CinnabarGymSetScript ; SCRIPT_CINNABARGYM_DEFAULT
	ld a, PAD_CTRL_PAD
	ld [wJoyIgnore], a
	ld a, TEXT_CINNABARGYM_AFTER_REMATCH
	ldh [hTextID], a
	call DisplayTextID
	SetEvent EVENT_BEAT_BLAINE_REMATCH
	jp CinnabarGymSetDefaultScript

CinnabarGym_TextPointers:
	def_text_pointers
	dw_const CinnabarGymBlaineText,                 TEXT_CINNABARGYM_BLAINE
	dw_const CinnabarGymSuperNerd1Text,             TEXT_CINNABARGYM_SUPER_NERD1
	dw_const CinnabarGymSuperNerd2Text,             TEXT_CINNABARGYM_SUPER_NERD2
	dw_const CinnabarGymSuperNerd3Text,             TEXT_CINNABARGYM_SUPER_NERD3
	dw_const CinnabarGymSuperNerd4Text,             TEXT_CINNABARGYM_SUPER_NERD4
	dw_const CinnabarGymSuperNerd5Text,             TEXT_CINNABARGYM_SUPER_NERD5
	dw_const CinnabarGymSuperNerd6Text,             TEXT_CINNABARGYM_SUPER_NERD6
	dw_const CinnabarGymSuperNerd7Text,             TEXT_CINNABARGYM_SUPER_NERD7
	dw_const CinnabarGymBlaineRematchText,          TEXT_CINNABARGYM_BLAINE_REMATCH ; marcelnote - Blaine rematch
	dw_const CinnabarGymGymGuideText,               TEXT_CINNABARGYM_GYM_GUIDE
	dw_const CinnabarGymBlaineVolcanoBadgeInfoText, TEXT_CINNABARGYM_BLAINE_VOLCANO_BADGE_INFO
	dw_const CinnabarGymBlaineReceivedTM38Text,     TEXT_CINNABARGYM_BLAINE_RECEIVED_TM38
	dw_const CinnabarGymBlaineTM38NoRoomText,       TEXT_CINNABARGYM_BLAINE_TM38_NO_ROOM
	dw_const CinnabarGymAfterRematchText,           TEXT_CINNABARGYM_AFTER_REMATCH ; marcelnote - Blaine rematch

CinnabarGymStartBattleScript:
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld a, [wSpriteIndex]
	cp CINNABARGYM_BLAINE
	ld a, SCRIPT_CINNABARGYM_BLAINE_POST_BATTLE
	jr z, .gotScript
	ld a, SCRIPT_CINNABARGYM_OPEN_GATE
.gotScript
	ld [wCinnabarGymCurScript], a
	rst TextScriptEnd

CinnabarGymBlaineText:
	text_asm
	CheckEvent EVENT_BEAT_BLAINE
	jr z, .beforeBeat
	CheckEventReuseA EVENT_GOT_TM38
	ld hl, .PostBattleAdviceText
	ret nz
	call CinnabarGymReceiveTM38
	call DisableWaitingAfterTextDisplay
	rst TextScriptEnd
.beforeBeat
	ld hl, .PreBattleText
	call PrintText
	ld hl, .ReceivedVolcanoBadgeText
	ld de, .ReceivedVolcanoBadgeText
	call SaveEndBattleTextPointers
	ld a, $7
	ld [wGymLeaderNo], a
	jr CinnabarGymStartBattleScript

.PreBattleText:
	text_far _CinnabarGymBlainePreBattleText
	text_end

.ReceivedVolcanoBadgeText:
	text_far _CinnabarGymBlaineReceivedVolcanoBadgeText
	; marcelnote - had sound_get_key_item but played only the SFX_BALL_POOF 2nd channel due to the battle audio bank
	text_end

.PostBattleAdviceText:
	text_far _CinnabarGymBlainePostBattleAdviceText
	text_end

CinnabarGymBlaineVolcanoBadgeInfoText:
	text_far _CinnabarGymBlaineVolcanoBadgeInfoText
	text_end

CinnabarGymBlaineReceivedTM38Text:
	text_far _CinnabarGymBlaineReceivedTM38Text
	sound_get_item_1
	text_far _CinnabarGymBlaineTM38ExplanationText
	text_end

CinnabarGymBlaineTM38NoRoomText:
	text_far _CinnabarGymBlaineTM38NoRoomText
	text_end

MACRO cinnabar_gym_trainer_text
	text_asm
	call CinnabarGymSetTrainerHeader
	CheckEvent \1
	jr nz, .defeated
	ld hl, .BattleText
	call PrintText
	ld hl, .EndBattleText
	ld de, .EndBattleText
	call SaveEndBattleTextPointers
	jp CinnabarGymStartBattleScript
.defeated
	ld hl, .AfterBattleText
	bccoord 1, 14 ; restore text destination
	ret

.BattleText:
	text_far \2
	text_end

.EndBattleText:
	text_far \3
	text_end

.AfterBattleText:
	text_far \4
	text_end
ENDM

CinnabarGymSuperNerd1Text:
	cinnabar_gym_trainer_text EVENT_BEAT_CINNABAR_GYM_TRAINER_0, _CinnabarGymSuperNerd1BattleText, _CinnabarGymSuperNerd1EndBattleText, _CinnabarGymSuperNerd1AfterBattleText

CinnabarGymSuperNerd2Text:
	cinnabar_gym_trainer_text EVENT_BEAT_CINNABAR_GYM_TRAINER_1, _CinnabarGymSuperNerd2BattleText, _CinnabarGymSuperNerd2EndBattleText, _CinnabarGymSuperNerd2AfterBattleText

CinnabarGymSuperNerd3Text:
	cinnabar_gym_trainer_text EVENT_BEAT_CINNABAR_GYM_TRAINER_2, _CinnabarGymSuperNerd3BattleText, _CinnabarGymSuperNerd3EndBattleText, _CinnabarGymSuperNerd3AfterBattleText

CinnabarGymSuperNerd4Text:
	cinnabar_gym_trainer_text EVENT_BEAT_CINNABAR_GYM_TRAINER_3, _CinnabarGymSuperNerd4BattleText, _CinnabarGymSuperNerd4EndBattleText, _CinnabarGymSuperNerd4AfterBattleText

CinnabarGymSuperNerd5Text:
	cinnabar_gym_trainer_text EVENT_BEAT_CINNABAR_GYM_TRAINER_4, _CinnabarGymSuperNerd5BattleText, _CinnabarGymSuperNerd5EndBattleText, _CinnabarGymSuperNerd5AfterBattleText

CinnabarGymSuperNerd6Text:
	cinnabar_gym_trainer_text EVENT_BEAT_CINNABAR_GYM_TRAINER_5, _CinnabarGymSuperNerd6BattleText, _CinnabarGymSuperNerd6EndBattleText, _CinnabarGymSuperNerd6AfterBattleText

CinnabarGymSuperNerd7Text:
	cinnabar_gym_trainer_text EVENT_BEAT_CINNABAR_GYM_TRAINER_6, _CinnabarGymSuperNerd7BattleText, _CinnabarGymSuperNerd7EndBattleText, _CinnabarGymSuperNerd7AfterBattleText

CinnabarGymGymGuideText: ; marcelnote - optimized
	text_asm
	CheckEvent EVENT_BEAT_BLAINE
	ld hl, .BeatBlaineText
	ret nz
	ld hl, .ChampInMakingText
	ret

.ChampInMakingText:
	text_far _CinnabarGymGymGuideChampInMakingText
	text_end

.BeatBlaineText:
	text_far _CinnabarGymGymGuideBeatBlaineText
	text_end


CinnabarGymBlaineRematchText: ; marcelnote - Blaine rematch
	text_asm
	CheckEvent EVENT_BEAT_BLAINE_REMATCH
	ld hl, CinnabarGymAfterRematchText
	ret nz
	ld hl, .PreBattleText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .refused
	ld hl, .AcceptBattleText
	call PrintText
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, .BlaineDefeatedText
	ld de, .BlaineDefeatedText
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, $7
	ld [wGymLeaderNo], a
	ld a, SCRIPT_CINNABARGYM_BLAINE_REMATCH_POST_BATTLE
	ld [wCinnabarGymCurScript], a
	rst TextScriptEnd
.refused
	ld hl, .RefusedBattleText
	call PrintText
	rst TextScriptEnd

.PreBattleText:
	text_far _CinnabarGymBlaineRematchPreBattleText
	text_end

.AcceptBattleText:
	text_far _CinnabarGymBlaineRematchAcceptBattleText
	text_end

.RefusedBattleText:
	text_far _CinnabarGymBlaineRematchRefusedBattleText
	text_end

.BlaineDefeatedText:
	text_far _CinnabarGymBlaineRematchDefeatedText
	text_end

CinnabarGymAfterRematchText: ; marcelnote - Blaine rematch
	text_far _CinnabarGymAfterRematchText
	text_end
