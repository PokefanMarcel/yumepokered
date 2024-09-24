AgathasRoom_Script:
	call AgathaShowOrHideExitBlock
	call EnableAutoTextBoxDrawing
	ld hl, AgathasRoomTrainerHeaders
	ld de, AgathasRoom_ScriptPointers
	ld a, [wAgathasRoomCurScript]
	call ExecuteCurMapScriptInTable
	ld [wAgathasRoomCurScript], a
	ret

AgathaShowOrHideExitBlock:
; Blocks or clears the exit to the next room.
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	res BIT_CUR_MAP_LOADED_1, [hl]
	ret z
	;CheckEvent EVENT_BEAT_AGATHAS_ROOM_TRAINER_0 ; marcelnote - Agatha rematch
	CheckEitherEventSet EVENT_BEAT_AGATHAS_ROOM_TRAINER_0, EVENT_BEAT_AGATHAS_ROOM_TRAINER_1
	jr z, .blockExitToNextRoom
	ld a, $e
	jp .setExitBlock
.blockExitToNextRoom
	ld a, $3b
.setExitBlock
	ld [wNewTileBlockID], a
	lb bc, 0, 2
	predef_jump ReplaceTileBlock

ResetAgathaScript:
	xor a ; SCRIPT_AGATHASROOM_DEFAULT
	ld [wAgathasRoomCurScript], a
	ret

AgathasRoom_ScriptPointers:
	def_script_pointers
	dw_const AgathasRoomDefaultScript,              SCRIPT_AGATHASROOM_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_AGATHASROOM_AGATHA_START_BATTLE
	dw_const AgathasRoomAgathaEndBattleScript,      SCRIPT_AGATHASROOM_AGATHA_END_BATTLE
	dw_const AgathasRoomPlayerIsMovingScript,       SCRIPT_AGATHASROOM_PLAYER_IS_MOVING
	dw_const DoRet,                                 SCRIPT_AGATHASROOM_NOOP ; PureRGB - DoRet

AgathaScriptWalkIntoRoom:
; Walk six steps upward.
	ld hl, wSimulatedJoypadStatesEnd
	ld a, D_UP
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld a, $6
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, SCRIPT_AGATHASROOM_PLAYER_IS_MOVING
	ld [wAgathasRoomCurScript], a
	ld [wCurMapScript], a
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
	ld a, D_UP
	ld [wSimulatedJoypadStatesEnd], a
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, SCRIPT_AGATHASROOM_PLAYER_IS_MOVING
	ld [wAgathasRoomCurScript], a
	ld [wCurMapScript], a
	ret

AgathaEntranceCoords:
	dbmapcoord  4, 10
	dbmapcoord  5, 10
	dbmapcoord  4, 11
	dbmapcoord  5, 11
	db -1 ; end

AgathasRoomPlayerIsMovingScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	xor a
	ld [wJoyIgnore], a
	ld [wAgathasRoomCurScript], a
	ld [wCurMapScript], a
	ret

AgathasRoomAgathaEndBattleScript:
	call EndTrainerBattle
	ld a, [wIsInBattle]
	cp $ff
	jp z, ResetAgathaScript
	;;;;;; marcelnote - added for Agatha rematch
	CheckEvent EVENT_BECAME_CHAMPION
	ld a, TEXT_AGATHASROOM_AGATHA_REMATCH
	jr nz, .rematch
	ld a, TEXT_AGATHASROOM_AGATHA
.rematch
	;;;;;;
	ldh [hTextID], a
	call DisplayTextID
	ld a, SCRIPT_CHAMPIONSROOM_PLAYER_ENTERS
	ld [wChampionsRoomCurScript], a
	ret

AgathasRoom_TextPointers:
	def_text_pointers
	dw_const AgathasRoomAgathaText,            TEXT_AGATHASROOM_AGATHA
	dw_const AgathasRoomAgathaRematchText,     TEXT_AGATHASROOM_AGATHA_REMATCH ; marcelnote - Agatha rematch
	dw_const AgathasRoomAgathaDontRunAwayText, TEXT_AGATHASROOM_AGATHA_DONT_RUN_AWAY

AgathasRoomTrainerHeaders:
	def_trainers
AgathasRoomTrainerHeader0: ; marcelnote - added map name to text labels
	trainer EVENT_BEAT_AGATHAS_ROOM_TRAINER_0, 0, AgathasRoomAgathaBeforeBattleText, AgathasRoomAgathaEndBattleText, AgathasRoomAgathaAfterBattleText
AgathasRoomTrainerHeader1: ; marcelnote - Agatha rematch
	trainer EVENT_BEAT_AGATHAS_ROOM_TRAINER_1, 0, AgathasRoomAgathaRematchBeforeBattleText, AgathasRoomAgathaRematchEndBattleText, AgathasRoomAgathaRematchAfterBattleText
	db -1 ; end

AgathasRoomAgathaText:
	text_asm
	ld hl, AgathasRoomTrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

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

; marcelnote - Agatha rematch texts
AgathasRoomAgathaRematchText:
	text_asm
	ld hl, AgathasRoomTrainerHeader1
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

AgathasRoomAgathaRematchBeforeBattleText:
	text_far _AgathasRoomAgathaRematchBeforeBattleText
	text_end

AgathasRoomAgathaRematchEndBattleText:
	text_far _AgathasRoomAgathaRematchEndBattleText
	text_end

AgathasRoomAgathaRematchAfterBattleText:
	text_far _AgathasRoomAgathaRematchAfterBattleText
	text_end
