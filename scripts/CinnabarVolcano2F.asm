; marcelnote - new location
; the script was adapted from VictoryRoad2F
; boulder events are reset in CinnabarIsland map
CinnabarVolcano2F_Script:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_2, [hl] ; this is set upon entering the map
	res BIT_CUR_MAP_LOADED_2, [hl]
	call nz, CinnabarVolcano2FCheckBoulder1EventScript ; check first boulder upon entering
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl] ; this is set upon entering the map
	res BIT_CUR_MAP_LOADED_1, [hl]
	call nz, CinnabarVolcano2FCheckBouldersEventScript
	call EnableAutoTextBoxDrawing
	ld hl, CinnabarVolcano2FTrainerHeaders
	ld de, CinnabarVolcano2F_ScriptPointers
	ld a, [wCinnabarVolcano2FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wCinnabarVolcano2FCurScript], a
	ret

CinnabarVolcano2FCheckBoulder1EventScript:
	CheckEvent EVENT_CINNABAR_VOLCANO_2F_BOULDER1_ON_SWITCH
	ret z         ; boulder 2 event must be set after boulder 1 event
	ld a, $26     ; first tile to replace
	lb bc, 1, 11
	jr CinnabarVolcano2FReplaceTileBlock

CinnabarVolcano2FCheckBouldersEventScript:
	CheckEvent EVENT_CINNABAR_VOLCANO_2F_BOULDER1_ON_SWITCH
	ret z         ; boulder 2 event must be set after boulder 1 event
	CheckEvent EVENT_CINNABAR_VOLCANO_2F_BOULDER2_ON_SWITCH
	ld a, $26     ; by default, load the first tile to replace
	lb bc, 1, 11
	jr z, CinnabarVolcano2FReplaceTileBlock
	ld a, $4D     ; if boulder 2 event is set, load second tile instead
	lb bc, 9, 9
CinnabarVolcano2FReplaceTileBlock:
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
	jp nc, CheckFightingMapTrainers   ; if boulder not on switch coordinates
	EventFlagAddress hl, EVENT_CINNABAR_VOLCANO_2F_BOULDER1_ON_SWITCH
	ld a, [wCoordIndex]
	cp $2
	jr z, .second_switch
	CheckEventReuseHL EVENT_CINNABAR_VOLCANO_2F_BOULDER1_ON_SWITCH
	SetEventReuseHL EVENT_CINNABAR_VOLCANO_2F_BOULDER1_ON_SWITCH
	ret nz  ; event already set, no need to set flag
	jr .set_script_flag
.second_switch
	CheckEventReuseHL EVENT_CINNABAR_VOLCANO_2F_BOULDER2_ON_SWITCH
	SetEventReuseHL EVENT_CINNABAR_VOLCANO_2F_BOULDER2_ON_SWITCH
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
	dw_const PickUpItemText,                TEXT_CINNABARVOLCANO2F_FIRE_STONE
	dw_const PickUpItemText,                TEXT_CINNABARVOLCANO2F_ULTRA_BALL
	dw_const PickUpItemText,                TEXT_CINNABARVOLCANO2F_NUGGET
	dw_const BoulderText,                   TEXT_CINNABARVOLCANO2F_BOULDER1
	dw_const BoulderText,                   TEXT_CINNABARVOLCANO2F_BOULDER2
	dw_const CinnabarVolcano2FSignText,     TEXT_CINNABARVOLCANO2F_SIGN

CinnabarVolcano2FTrainerHeaders:
	def_trainers
MoltresTrainerHeader:
	trainer EVENT_BEAT_MOLTRES, 0, CinnabarVolcano2FMoltresBattleText, CinnabarVolcano2FMoltresBattleText, CinnabarVolcano2FMoltresBattleText
	db -1 ; end

CinnabarVolcano2FMoltresText:
	text_asm
	ld hl, MoltresTrainerHeader
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
