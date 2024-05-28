; marcelnote - new location
CinnabarVolcano1F_Script:
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl] ; this is set upon entering the map
	res 5, [hl]
	call nz, CinnabarVolcano1FCheckBoulderEventScript
	call EnableAutoTextBoxDrawing
	; new
	ld hl, CinnabarVolcano1FTrainerHeaders
    ld de, CinnabarVolcano1F_ScriptPointers
    ld a, [wCinnabarVolcano1FCurScript]
    call ExecuteCurMapScriptInTable
    ld [wCinnabarVolcano1FCurScript], a
    ;
	ld a, CINNABAR_VOLCANO_1F
	ld [wDungeonWarpDestinationMap], a
	ld hl, CinnabarVolcano1FHolesCoords
	jp IsPlayerOnDungeonWarp

CinnabarVolcano1FHolesCoords:
	dbmapcoord 20, 13
	db -1 ; end

CinnabarVolcano1FCheckBoulderEventScript:
	CheckEvent EVENT_CINNABAR_VOLCANO_1F_BOULDER_ON_SWITCH
	ret z
	ld a, $1D
	lb bc, 16, 11
	ld [wNewTileBlockID], a
	predef ReplaceTileBlock
	ret

CinnabarVolcano1F_ScriptPointers:
	def_script_pointers
	dw_const CinnabarVolcano1FDefaultScript,        SCRIPT_CINNABARVOLCANO1F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_CINNABARVOLCANO1F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_CINNABARVOLCANO1F_END_BATTLE

CinnabarVolcano1FDefaultScript:
	ld hl, .SwitchCoords
	call CheckBoulderCoords
	jp nc, CheckFightingMapTrainers   ; if boulder not on switch coordinates
	EventFlagAddress hl, EVENT_CINNABAR_VOLCANO_1F_BOULDER_ON_SWITCH
	CheckEventReuseHL EVENT_CINNABAR_VOLCANO_1F_BOULDER_ON_SWITCH
	SetEventReuseHL EVENT_CINNABAR_VOLCANO_1F_BOULDER_ON_SWITCH
	ret nz  ; event already set, no need to set flag
	ld hl, wCurrentMapScriptFlags
	set 5, [hl]
	ret

.SwitchCoords:
	dbmapcoord  9, 14
	db -1 ; end

CinnabarVolcano1F_TextPointers:
	def_text_pointers
	dw_const BoulderText,                   TEXT_CINNABARVOLCANO1F_BOULDER
	dw_const CinnabarVolcano1FLavaSignText, TEXT_CINNABARVOLCANO1F_LAVA_SIGN

CinnabarVolcano1FTrainerHeaders:
	def_trainers
;Moltres2TrainerHeader:
;	trainer EVENT_BEAT_MOLTRES, 0, CinnabarVolcano2FMoltresBattleText, CinnabarVolcano2FMoltresBattleText, CinnabarVolcano2FMoltresBattleText
	db -1 ; end

CinnabarVolcano1FLavaSignText:
	text_far _CinnabarVolcano1FLavaSignText
	text_end
