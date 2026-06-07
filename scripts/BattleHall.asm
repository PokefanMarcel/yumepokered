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
	ld a, PAD_BUTTONS | PAD_CTRL_PAD
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
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, SCRIPT_BATTLEHALL_END_MOVEMENT
	ld [wBattleHallCurScript], a
	ld [wCurMapScript], a
	ret

.SpriteOnRightMovement:
	db 2, PAD_RIGHT
	db -1 ; end

.SpriteOnLeftMovement:
	db 1, PAD_DOWN
	db 4, PAD_RIGHT
	db 1, PAD_UP
	db -1 ; end

.SpriteOnTopMovement:
	db 1, PAD_DOWN
	db 3, PAD_RIGHT
	db -1 ; end

.SpriteOnBottomMovement:
	db 1, PAD_UP
	db 3, PAD_RIGHT
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
	predef HealParty
	SetEvent EVENT_BATTLED_BATTLE_HALL_TRAINER
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
	CheckEvent EVENT_BATTLED_BATTLE_HALL_TRAINER
	ld hl, .WhatABattleText
	jr nz, .printText
	ld a, [wPartyCount]
	cp 3
	ld hl, .TeamReadyText
	jr z, .printText
	ld hl, .NeedThreeMonText
.printText
	call PrintText
	rst TextScriptEnd

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
	CheckEvent EVENT_BATTLED_BATTLE_HALL_TRAINER
	jr z, .beforeBeat
	ld hl, .PostBattleText
	call PrintText
	rst TextScriptEnd
.beforeBeat
	ld hl, .PreBattleText
	call PrintText
	ld a, [wPartyCount]
	cp 3
	jr nz, .textScriptEnd
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

.textScriptEnd
	rst TextScriptEnd

.PreBattleText:
	text_far _BattleHallTrainerPreBattleText
	text_end

.TrainerDefeatedText:
	text_far _BattleHallTrainerDefeatedText
	text_end

.PostBattleText:
	text_far _BattleHallTrainerPostBattleText
	text_end
