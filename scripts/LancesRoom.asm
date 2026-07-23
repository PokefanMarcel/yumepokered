LancesRoom_Script:
	call LanceShowOrHideEntranceBlocks
	call EnableAutoTextBoxDrawing
	ld hl, LancesRoomTrainerHeaders
	ld de, LancesRoom_ScriptPointers
	ld bc, wLancesRoomCurScript
	jp ExecuteCurMapScriptInTable

LanceShowOrHideEntranceBlocks: ; marcelnote - optimized
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	ret z
	res BIT_CUR_MAP_LOADED_1, [hl]
	CheckEvent EVENT_LANCES_ROOM_LOCK_DOOR
	ld a, $31 ; open entrance
	jr z, .setEntranceBlocks
	ld a, $72 ; close entrance
.setEntranceBlocks
; Replaces the tile blocks so the player can't leave.
	ld [wNewTileBlockID], a
	lb bc, 6, 2
	call .setBlock
	ld a, [wNewTileBlockID]
	inc a ; blocks must be next to each other
	ld [wNewTileBlockID], a
	lb bc, 6, 3
.setBlock
	predef_jump ReplaceTileBlock

ResetLanceScript:
	xor a ; SCRIPT_LANCESROOM_DEFAULT
	ld [wLancesRoomCurScript], a
	ret

LancesRoom_ScriptPointers:
	def_script_pointers
	dw_const LancesRoomDefaultScript,               SCRIPT_LANCESROOM_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_LANCESROOM_LANCE_START_BATTLE
	dw_const LancesRoomLanceEndBattleScript,        SCRIPT_LANCESROOM_LANCE_END_BATTLE
	dw_const LancesRoomPlayerIsMovingScript,        SCRIPT_LANCESROOM_PLAYER_IS_MOVING
	dw_const DoRet,                                 SCRIPT_LANCESROOM_NOOP ; PureRGB - DoRet

LancesRoomDefaultScript:
	CheckEitherEventSet EVENT_BEAT_LANCES_ROOM_TRAINER_0, EVENT_BEAT_LANCES_ROOM_TRAINER_1
	ret nz
	ld hl, LanceTriggerMovementCoords
	call ArePlayerCoordsInArray
	jp nc, CheckFightingMapTrainers
	xor a
	ldh [hJoyHeld], a
	ld a, [wCoordIndex]
	cp $3  ; Is player standing next to Lance's sprite?
	jr nc, .notStandingNextToLance
	ld a, TEXT_LANCESROOM_LANCE
	ldh [hTextID], a
	jp DisplayTextID
.notStandingNextToLance
	cp $5  ; Is player standing on the entrance staircase?
	jr z, WalkToLance
	CheckAndSetEvent EVENT_LANCES_ROOM_LOCK_DOOR
	ret nz
	ld hl, wCurrentMapScriptFlags
	set BIT_CUR_MAP_LOADED_1, [hl]
	ld a, SFX_GO_INSIDE
	call PlaySound
	jr LanceShowOrHideEntranceBlocks

LanceTriggerMovementCoords:
	dbmapcoord  5,  1
	dbmapcoord  6,  2
	dbmapcoord  5, 11
	dbmapcoord  6, 11
	dbmapcoord 24, 16
	db -1 ; end

LancesRoomLanceEndBattleScript:
	call EndTrainerBattle
	ld a, [wIsInBattle]
	cp $ff
	jr z, ResetLanceScript
	ld a, TEXT_LANCESROOM_LANCE
	ldh [hTextID], a
	jp DisplayTextID

WalkToLance:
; Moves the player down the hallway to Lance's room.
	ld a, PAD_BUTTONS | PAD_CTRL_PAD
	ld [wJoyIgnore], a
	ld hl, wSimulatedJoypadStatesEnd
	ld de, WalkToLance_RLEList
	call DecodeRLEList
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, SCRIPT_LANCESROOM_PLAYER_IS_MOVING
	ld [wLancesRoomCurScript], a
	ret

WalkToLance_RLEList:
	db 12, PAD_UP
	db 12, PAD_LEFT
	db  7, PAD_DOWN
	db  6, PAD_LEFT
	db -1 ; end

LancesRoomPlayerIsMovingScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	xor a ; SCRIPT_LANCESROOM_DEFAULT
	ld [wJoyIgnore], a
	ld [wLancesRoomCurScript], a
	ret

LancesRoom_TextPointers:
	def_text_pointers
	dw_const LancesRoomLanceText,        TEXT_LANCESROOM_LANCE

LancesRoomTrainerHeaders:
	def_trainers
LancesRoomTrainerHeader0:
	trainer EVENT_BEAT_LANCES_ROOM_TRAINER_0, 0, LancesRoomLanceBeforeBattleText, LancesRoomLanceEndBattleText, LancesRoomLanceAfterBattleText
LancesRoomTrainerHeader1: ; marcelnote - Lance rematch
	trainer EVENT_BEAT_LANCES_ROOM_TRAINER_1, 0, LancesRoomLanceRematchBeforeBattleText, LancesRoomLanceRematchEndBattleText, LancesRoomLanceRematchAfterBattleText
	db -1 ; end

LancesRoomLanceText: ; marcelnote - modified for Lance rematch
	text_asm
	CheckEvent EVENT_BECAME_CHAMPION
	ld hl, LancesRoomTrainerHeader0
	jr z, .gotTrainer
	ld hl, LancesRoomTrainerHeader1
	ld a, 2
	ld [wMapSpriteExtraData + (LANCESROOM_LANCE - 1) * 2 + 1], a ; overwrite trainer id
.gotTrainer
	call TalkToTrainer
	rst TextScriptEnd

LancesRoomLanceBeforeBattleText:
	text_far _LancesRoomLanceBeforeBattleText
	text_end

LancesRoomLanceEndBattleText:
	text_far _LancesRoomLanceEndBattleText
	text_end

LancesRoomLanceAfterBattleText:
	text_far _LancesRoomLanceAfterBattleText
	text_end

LancesRoomLanceRematchBeforeBattleText:
	text_far _LancesRoomLanceRematchBeforeBattleText
	text_end

LancesRoomLanceRematchEndBattleText:
	text_far _LancesRoomLanceRematchEndBattleText
	text_end

LancesRoomLanceRematchAfterBattleText:
	text_far _LancesRoomLanceRematchAfterBattleText
	text_end
