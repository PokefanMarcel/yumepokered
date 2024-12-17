; marcelnote - new floor
BattleHall_Script:
	call EnableAutoTextBoxDrawing
	ld hl, BattleHall_ScriptPointers
	ld a, [wBattleHallCurScript]
	jp CallFunctionInTable

BattleHall_ScriptPointers:
	def_script_pointers
	dw_const DoRet,                          SCRIPT_BATTLEHALL_DEFAULT ; PureRGB - DoRet
	dw_const BattleHallMovePlayerScript,     SCRIPT_BATTLEHALL_MOVE_PLAYER
	dw_const BattleHallEndMovementScript,    SCRIPT_BATTLEHALL_END_MOVEMENT
	dw_const BattleHallStartBattleScript,    SCRIPT_BATTLEHALL_START_BATTLE
	dw_const BattleHallPostBattleScript,     SCRIPT_BATTLEHALL_POST_BATTLE

BattleHallMovePlayerScript:
	ld a, A_BUTTON | B_BUTTON | SELECT | START | D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoyIgnore], a
	ld hl, wSimulatedJoypadStatesEnd
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_LEFT
	ld de, .SpriteOnRightMovement
	jr z, .decodeList
	cp SPRITE_FACING_RIGHT
	ld de, .SpriteOnLeftMovement
	jr z, .decodeList
	cp SPRITE_FACING_UP
	ld de, .SpriteOnBottomMovement
	jr z, .decodeList
	ld de, .SpriteOnTopMovement
.decodeList
	call DecodeRLEList
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, SCRIPT_BATTLEHALL_END_MOVEMENT
	ld [wBattleHallCurScript], a
	ld [wCurMapScript], a
	ret

.SpriteOnRightMovement:
	db D_RIGHT, 2
	db -1 ; end

.SpriteOnLeftMovement:
	db D_DOWN, 1
	db D_RIGHT, 4
	db D_UP, 1
	db -1 ; end

.SpriteOnTopMovement:
	db D_DOWN, 1
	db D_RIGHT, 3
	db -1 ; end

.SpriteOnBottomMovement:
	db D_UP, 1
	db D_RIGHT, 3
	db -1 ; end

BattleHallEndMovementScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	ld a, SPRITE_FACING_RIGHT
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, PLAYER_DIR_LEFT
	ld [wPlayerMovingDirection], a ; marcelnote - this requires switching script to take effect
	ld a, SCRIPT_BATTLEHALL_START_BATTLE
	ld [wBattleHallCurScript], a
	ld [wCurMapScript], a
	ret

BattleHallStartBattleScript:
	ld c, 30
	call DelayFrames
	call EngageMapTrainer
	call InitBattleEnemyParameters
	xor a
	ldh [hJoyHeld], a
	ld a, SCRIPT_BATTLEHALL_POST_BATTLE
	ld [wBattleHallCurScript], a
	ld [wCurMapScript], a
	ret

BattleHallPostBattleScript:
	ld a, [wIsInBattle]
	cp $ff
	jr z, .lost
	SetEvent EVENT_BEAT_BATTLE_HALL_TRAINER
.lost
	xor a ; SCRIPT_BATTLEHALL_DEFAULT
	ld [wBattleHallCurScript], a
	ld [wCurMapScript], a
	ret

BattleHall_TextPointers:
	def_text_pointers
	dw_const BattleHallTrainerText,      TEXT_BATTLEHALL_RED
	dw_const BattleHallTrainerText,      TEXT_BATTLEHALL_GREEN
	dw_const BattleHallReceptionistText, TEXT_BATTLEHALL_RECEPTIONIST

BattleHallReceptionistText:
	text_asm
	CheckEvent EVENT_BEAT_BATTLE_HALL_TRAINER
	ld hl, .WhatABattleText
	jr nz, .print_text
	ld a, [wPartyCount]
	cp 3
	ld hl, .TeamReadyText
	jr z, .print_text
	ld hl, .NeedThreeMonText
.print_text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.NeedThreeMonText:
	text_far _BattleHallReceptionistNeedThreeMonText
	text_end

.TeamReadyText:
	text_far _BattleHallReceptionistTeamReadyText
	text_end

.WhatABattleText:
	text_far _BattleHallReceptionistWhatABattleText
	text_end

BattleHallTrainerText:
	text_asm
	CheckEvent EVENT_BEAT_BATTLE_HALL_TRAINER
	jr z, .beforeBeat
	ld hl, .PostBattleText
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd
.beforeBeat
	ld hl, .PreBattleText
	call PrintText
	ld a, [wPartyCount]
	cp 3
	jr nz, .text_script_end
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, .TrainerDefeatedText
	ld de, .TrainerDefeatedText
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a

	ld a, SCRIPT_BATTLEHALL_MOVE_PLAYER
	ld [wBattleHallCurScript], a
	ld [wCurMapScript], a

.text_script_end
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.PreBattleText:
	text_far _BattleHallTrainerPreBattleText
	text_end

.TrainerDefeatedText:
	text_far _BattleHallTrainerDefeatedText
	text_end

.PostBattleText:
	text_far _BattleHallTrainerPostBattleText
	text_end
