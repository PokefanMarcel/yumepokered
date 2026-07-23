AgathasRoom_Script:
	call AgathaHideExitBlock
	call EnableAutoTextBoxDrawing
	ld hl, AgathasRoom_TrainerHeaders
	ld de, AgathasRoom_ScriptPointers
	ld bc, wAgathasRoomCurScript
	jp ExecuteCurMapScriptInTable

AgathaHideExitBlock: ; marcelnote - optimized and modified for Agatha rematch
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	ret z
	res BIT_CUR_MAP_LOADED_1, [hl]
	CheckEitherEventSet EVENT_BEAT_AGATHAS_ROOM_TRAINER_0, EVENT_BEAT_AGATHAS_ROOM_TRAINER_1
	ret z
	ld a, $e  ; open
	ld [wNewTileBlockID], a
	lb bc, 0, 2
	predef_jump ReplaceTileBlock

AgathasRoom_ScriptPointers:
	def_script_pointers
	dw_const AgathasRoomDefaultScript,              SCRIPT_AGATHASROOM_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_AGATHASROOM_AGATHA_START_BATTLE
	dw_const AgathasRoomAgathaEndBattleScript,      SCRIPT_AGATHASROOM_AGATHA_END_BATTLE
	dw_const AgathasRoomPlayerMovingScript,         SCRIPT_AGATHASROOM_PLAYER_MOVING
	dw_const DoRet,                                 SCRIPT_AGATHASROOM_NOOP ; PureRGB - DoRet

AgathaScriptWalkIntoRoom:
; Walk six steps upward.
	ld hl, wSimulatedJoypadStatesEnd
	ld a, PAD_UP
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld a, $6
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, SCRIPT_AGATHASROOM_PLAYER_MOVING
	ld [wAgathasRoomCurScript], a
	ret

AgathasRoomDefaultScript:
	ld hl, AgathaEntranceCoords
	call ArePlayerCoordsInArray
	jp nc, CheckFightingMapTrainers
	xor a
	ldh [hJoyPressed], a
	ldh [hJoyHeld], a
	ld [wSimulatedJoypadStatesEnd], a
	ld [wSimulatedJoypadStatesIndex], a
	ld a, [wCoordIndex]
	cp $3  ; Is player standing one tile above the exit?
	jr c, .stopPlayerFromLeaving
	CheckAndSetEvent EVENT_AUTOWALKED_INTO_AGATHAS_ROOM
	jr z, AgathaScriptWalkIntoRoom
.stopPlayerFromLeaving
	ld a, TEXT_AGATHASROOM_AGATHA_DONT_RUN_AWAY
	ldh [hTextID], a
	call DisplayTextID
	ld a, PAD_UP
	ld [wSimulatedJoypadStatesEnd], a
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, SCRIPT_AGATHASROOM_PLAYER_MOVING
	ld [wAgathasRoomCurScript], a
	ret

AgathaEntranceCoords:
	dbmapcoord  4, 10
	dbmapcoord  5, 10
	dbmapcoord  4, 11
	dbmapcoord  5, 11
	db -1 ; end

AgathasRoomPlayerMovingScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	ld [wJoyIgnore], a
	ld [wAgathasRoomCurScript], a ; SCRIPT_AGATHASROOM_DEFAULT
	jp Delay3

AgathasRoomAgathaEndBattleScript:
	call EndTrainerBattle ; resets script to default
	ld a, [wIsInBattle]
	inc a ; lost battle?
	ret z
	ld a, TEXT_AGATHASROOM_AGATHA
	ldh [hTextID], a
	jp DisplayTextID

AgathasRoom_TextPointers:
	def_text_pointers
	dw_const AgathasRoomAgathaText,            TEXT_AGATHASROOM_AGATHA
	dw_const AgathasRoomAgathaDontRunAwayText, TEXT_AGATHASROOM_AGATHA_DONT_RUN_AWAY

AgathasRoom_TrainerHeaders:
	def_trainers
AgathasRoomTrainerHeader0: ; marcelnote - added map name to text labels
	trainer EVENT_BEAT_AGATHAS_ROOM_TRAINER_0, 0, AgathasRoomAgathaBeforeBattleText, AgathasRoomAgathaEndBattleText, AgathasRoomAgathaAfterBattleText
AgathasRoomTrainerHeader1: ; marcelnote - Agatha rematch
	trainer EVENT_BEAT_AGATHAS_ROOM_TRAINER_1, 0, AgathasRoomAgathaRematchBeforeBattleText, AgathasRoomAgathaRematchEndBattleText, AgathasRoomAgathaRematchAfterBattleText
	db -1 ; end

AgathasRoomAgathaText: ; marcelnote - modified for Agatha rematch
	text_asm
	CheckEvent EVENT_BECAME_CHAMPION
	ld hl, AgathasRoomTrainerHeader0
	jr z, .gotTrainer
	ld hl, AgathasRoomTrainerHeader1
	ld a, 2
	ld [wMapSpriteExtraData + (AGATHASROOM_AGATHA - 1) * 2 + 1], a ; overwrite trainer id
.gotTrainer
	call TalkToTrainer
	rst TextScriptEnd

AgathasRoomAgathaBeforeBattleText: ; marcelnote - added map name to text label
	text_far _AgathasRoomAgathaBeforeBattleText
	text_end

AgathasRoomAgathaEndBattleText: ; marcelnote - added map name to text label
	text_far _AgathasRoomAgathaEndBattleText
	text_end

AgathasRoomAgathaAfterBattleText: ; marcelnote - added map name to text label
	text_far _AgathasRoomAgathaAfterBattleText
	text_end

AgathasRoomAgathaDontRunAwayText:
	text_far _AgathasRoomAgathaDontRunAwayText
	text_end

AgathasRoomAgathaRematchBeforeBattleText:
	text_far _AgathasRoomAgathaRematchBeforeBattleText
	text_end

AgathasRoomAgathaRematchEndBattleText:
	text_far _AgathasRoomAgathaRematchEndBattleText
	text_end

AgathasRoomAgathaRematchAfterBattleText:
	text_far _AgathasRoomAgathaRematchAfterBattleText
	text_end
