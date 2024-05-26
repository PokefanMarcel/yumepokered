; marcelnote - new location
; the script is adapted from VictoryRoad2F
; it reuses a wram address and events for boulders
CinnabarVolcano2F_Script:
	ld hl, wCurrentMapScriptFlags
	bit 6, [hl]
	res 6, [hl]
	call nz, CinnabarVolcano2FResetBoulderEventScript
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	call nz, CinnabarVolcano2FCheckBoulderEventScript
	call EnableAutoTextBoxDrawing
	ld hl, CinnabarVolcano2FTrainerHeaders
	ld de, CinnabarVolcano2F_ScriptPointers
	ld a, [wVictoryRoad2FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wVictoryRoad2FCurScript], a  ; marcelnote - this reuses an address for VictoryRoad2F
	ret

CinnabarVolcano2FResetBoulderEventScript:
	ResetEvent EVENT_VICTORY_ROAD_1_BOULDER_ON_SWITCH
; fallthrough
CinnabarVolcano2FCheckBoulderEventScript:
	CheckEvent EVENT_VICTORY_ROAD_2_BOULDER_ON_SWITCH1
	jr z, .not_on_switch
	push af
	ld a, $26
	lb bc, 1, 11
	call CinnabarVolcano2FReplaceTileBlockScript
	pop af
.not_on_switch
	bit 7, a
	ret z
	ld a, $4D
	lb bc, 9, 9
CinnabarVolcano2FReplaceTileBlockScript:
	ld [wNewTileBlockID], a
	predef ReplaceTileBlock
	ret

CinnabarVolcano2F_ScriptPointers:
	def_script_pointers
	dw_const CinnabarVolcano2FDefaultScript,        SCRIPT_CINNABARVOLCANO2F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_CINNABARVOLCANO2F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_CINNABARVOLCANO2F_END_BATTLE

CinnabarVolcano2FDefaultScript:
	ld hl, .SwitchCoords
	call CheckBoulderCoords
	jp nc, CheckFightingMapTrainers
	EventFlagAddress hl, EVENT_VICTORY_ROAD_2_BOULDER_ON_SWITCH1
	ld a, [wCoordIndex]
	cp $2
	jr z, .second_switch
	CheckEventReuseHL EVENT_VICTORY_ROAD_2_BOULDER_ON_SWITCH1
	SetEventReuseHL EVENT_VICTORY_ROAD_2_BOULDER_ON_SWITCH1
	ret nz
	jr .set_script_flag
.second_switch
	CheckEventAfterBranchReuseHL EVENT_VICTORY_ROAD_2_BOULDER_ON_SWITCH2, EVENT_VICTORY_ROAD_2_BOULDER_ON_SWITCH1
	SetEventReuseHL EVENT_VICTORY_ROAD_2_BOULDER_ON_SWITCH2
	ret nz
.set_script_flag
	ld hl, wCurrentMapScriptFlags
	set 5, [hl]
	ret

.SwitchCoords:
	dbmapcoord 19, 21
	dbmapcoord  9,  2
	db -1 ; end

CinnabarVolcano2F_TextPointers:
	def_text_pointers
	dw_const CinnabarVolcano2FMoltresText,  TEXT_CINNABARVOLCANO2F_MOLTRES
	dw_const BoulderText,                   TEXT_CINNABARVOLCANO2F_BOULDER1
	dw_const BoulderText,                   TEXT_CINNABARVOLCANO2F_BOULDER2
	dw_const CinnabarVolcano2FSignText,     TEXT_CINNABARVOLCANO2F_SIGN

CinnabarVolcano2FTrainerHeaders:
	def_trainers
Moltres2TrainerHeader:
	trainer EVENT_BEAT_MOLTRES, 0, CinnabarVolcano2FMoltresBattleText, CinnabarVolcano2FMoltresBattleText, CinnabarVolcano2FMoltresBattleText
	db -1 ; end

CinnabarVolcano2FMoltresText:
	text_asm
	ld hl, Moltres2TrainerHeader
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

CinnabarVolcano2FMoltresBattleText:
	text_far _CinnabarVolcano2FMoltresBattleText
	text_asm
	ld a, MOLTRES
	call PlayCry
	call WaitForSoundToFinish
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

CinnabarVolcano2FSignText:
	text_far _CinnabarVolcano2FSignText
	text_end
