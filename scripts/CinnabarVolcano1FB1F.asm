; marcelnote - new location
CinnabarVolcano1FB1F_Script:
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl] ; this is set upon entering the map
	res 5, [hl]
	call nz, CinnabarVolcano1FB1FCheckBoulderEventScript
	call EnableAutoTextBoxDrawing
	; new
	ld hl, CinnabarVolcano1FB1FTrainerHeaders
    ld de, CinnabarVolcano1FB1F_ScriptPointers
    ld a, [wCinnabarVolcano1FB1FCurScript]
    call ExecuteCurMapScriptInTable
    ld [wCinnabarVolcano1FB1FCurScript], a
    ;
	ld a, CINNABAR_VOLCANO_1FB1F
	ld [wDungeonWarpDestinationMap], a
	ld hl, CinnabarVolcano1FHolesCoords
	jp IsPlayerOnDungeonWarp

CinnabarVolcano1FHolesCoords:
	dbmapcoord 20, 13
	db -1 ; end

CinnabarVolcano1FB1FCheckBoulderEventScript:
	CheckEvent EVENT_CINNABAR_VOLCANO_1F_BOULDER_ON_SWITCH
	ret z
	ld a, $1D
	lb bc, 16, 11
	ld [wNewTileBlockID], a
	predef ReplaceTileBlock
	ret

CinnabarVolcano1FB1F_ScriptPointers:
	def_script_pointers
	dw_const CinnabarVolcano1FB1FDefaultScript,     SCRIPT_CINNABARVOLCANO1FB1F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_CINNABARVOLCANO1FB1F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_CINNABARVOLCANO1FB1F_END_BATTLE

CinnabarVolcano1FB1FDefaultScript:
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

CinnabarVolcano1FB1F_TextPointers:
	def_text_pointers
	dw_const CinnabarVolcanoB1FScientistText,    TEXT_CINNABARVOLCANOB1F_SCIENTIST
	dw_const CinnabarVolcanoB1FHikerText,        TEXT_CINNABARVOLCANOB1F_HIKER
	dw_const CinnabarVolcanoB1FCooltrainerFText, TEXT_CINNABARVOLCANOB1F_COOLTRAINER_F
	dw_const CinnabarVolcano1FCooltrainerMText,  TEXT_CINNABARVOLCANO1F_COOLTRAINER_M
	dw_const CinnabarVolcano1FBurglarText,       TEXT_CINNABARVOLCANO1F_BURGLAR
	dw_const CinnabarVolcano1FGentlemanText,     TEXT_CINNABARVOLCANO1F_GENTLEMAN
	dw_const CinnabarVolcano1FBeautyText,        TEXT_CINNABARVOLCANO1F_BEAUTY
	dw_const PickUpItemText,                     TEXT_CINNABARVOLCANOB1F_IRON
	dw_const PickUpItemText,                     TEXT_CINNABARVOLCANOB1F_ICE_HEAL
	dw_const PickUpItemText,                     TEXT_CINNABARVOLCANO1F_FULL_RESTORE
	dw_const BoulderText,                        TEXT_CINNABARVOLCANO1F_BOULDER
	dw_const CinnabarVolcanoB1FLavaSignText,     TEXT_CINNABARVOLCANOB1F_LAVA_SIGN
	dw_const CinnabarVolcano1FBurnHealSignText,  TEXT_CINNABARVOLCANO1F_BURNHEAL_SIGN

CinnabarVolcano1FB1FTrainerHeaders:
	def_trainers
CinnabarVolcanoB1FTrainerHeader0:
	trainer EVENT_BEAT_CINNABAR_VOLCANO_B1F_TRAINER_0, 2, CinnabarVolcanoB1FScientistBattleText, CinnabarVolcanoB1FScientistEndBattleText, CinnabarVolcanoB1FScientistAfterBattleText
CinnabarVolcanoB1FTrainerHeader1:
	trainer EVENT_BEAT_CINNABAR_VOLCANO_B1F_TRAINER_1, 2, CinnabarVolcanoB1FHikerBattleText, CinnabarVolcanoB1FHikerEndBattleText, CinnabarVolcanoB1FHikerAfterBattleText
CinnabarVolcanoB1FTrainerHeader2:
	trainer EVENT_BEAT_CINNABAR_VOLCANO_B1F_TRAINER_2, 3, CinnabarVolcanoB1FCooltrainerFBattleText, CinnabarVolcanoB1FCooltrainerFEndBattleText, CinnabarVolcanoB1FCooltrainerFAfterBattleText
CinnabarVolcano1FTrainerHeader0:
	trainer EVENT_BEAT_CINNABAR_VOLCANO_1F_TRAINER_0, 4, CinnabarVolcano1FCooltrainerMBattleText, CinnabarVolcano1FCooltrainerMEndBattleText, CinnabarVolcano1FCooltrainerMAfterBattleText
CinnabarVolcano1FTrainerHeader1:
	trainer EVENT_BEAT_CINNABAR_VOLCANO_1F_TRAINER_1, 4, CinnabarVolcano1FBurglarBattleText, CinnabarVolcano1FBurglarEndBattleText, CinnabarVolcano1FBurglarAfterBattleText
CinnabarVolcano1FTrainerHeader2:
	trainer EVENT_BEAT_CINNABAR_VOLCANO_1F_TRAINER_2, 3, CinnabarVolcano1FGentlemanBattleText, CinnabarVolcano1FGentlemanEndBattleText, CinnabarVolcano1FGentlemanAfterBattleText
CinnabarVolcano1FTrainerHeader3:
	trainer EVENT_BEAT_CINNABAR_VOLCANO_1F_TRAINER_3, 3, CinnabarVolcano1FBeautyBattleText, CinnabarVolcano1FBeautyEndBattleText, CinnabarVolcano1FBeautyAfterBattleText
	db -1 ; end

CinnabarVolcanoB1FScientistText:
	text_asm
	ld hl, CinnabarVolcanoB1FTrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

CinnabarVolcanoB1FHikerText:
	text_asm
	ld hl, CinnabarVolcanoB1FTrainerHeader1
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

CinnabarVolcanoB1FCooltrainerFText:
	text_asm
	ld hl, CinnabarVolcanoB1FTrainerHeader2
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

CinnabarVolcano1FCooltrainerMText:
	text_asm
	ld hl, CinnabarVolcano1FTrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

CinnabarVolcano1FBurglarText:
	text_asm
	ld hl, CinnabarVolcano1FTrainerHeader1
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

CinnabarVolcano1FGentlemanText:
	text_asm
	ld hl, CinnabarVolcano1FTrainerHeader2
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

CinnabarVolcano1FBeautyText:
	text_asm
	ld hl, CinnabarVolcano1FTrainerHeader3
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

CinnabarVolcanoB1FScientistBattleText:
	text_far _CinnabarVolcanoB1FScientistBattleText
	text_end

CinnabarVolcanoB1FScientistEndBattleText:
	text_far _CinnabarVolcanoB1FScientistEndBattleText
	text_end

CinnabarVolcanoB1FScientistAfterBattleText:
	text_far _CinnabarVolcanoB1FScientistAfterBattleText
	text_end

CinnabarVolcanoB1FHikerBattleText:
	text_far _CinnabarVolcanoB1FHikerBattleText
	text_end

CinnabarVolcanoB1FHikerEndBattleText:
	text_far _CinnabarVolcanoB1FHikerEndBattleText
	text_end

CinnabarVolcanoB1FHikerAfterBattleText:
	text_far _CinnabarVolcanoB1FHikerAfterBattleText
	text_end

CinnabarVolcanoB1FCooltrainerFBattleText:
	text_far _CinnabarVolcanoB1FCooltrainerFBattleText
	text_end

CinnabarVolcanoB1FCooltrainerFEndBattleText:
	text_far _CinnabarVolcanoB1FCooltrainerFEndBattleText
	text_end

CinnabarVolcanoB1FCooltrainerFAfterBattleText:
	text_far _CinnabarVolcanoB1FCooltrainerFAfterBattleText
	text_end

CinnabarVolcano1FCooltrainerMBattleText:
	text_far _CinnabarVolcano1FCooltrainerMBattleText
	text_end

CinnabarVolcano1FCooltrainerMEndBattleText:
	text_far _CinnabarVolcano1FCooltrainerMEndBattleText
	text_end

CinnabarVolcano1FCooltrainerMAfterBattleText:
	text_far _CinnabarVolcano1FCooltrainerMAfterBattleText
	text_end

CinnabarVolcano1FBurglarBattleText:
	text_far _CinnabarVolcano1FBurglarBattleText
	text_end

CinnabarVolcano1FBurglarEndBattleText:
	text_far _CinnabarVolcano1FBurglarEndBattleText
	text_end

CinnabarVolcano1FBurglarAfterBattleText:
	text_far _CinnabarVolcano1FBurglarAfterBattleText
	text_end

CinnabarVolcano1FGentlemanBattleText:
	text_far _CinnabarVolcano1FGentlemanBattleText
	text_end

CinnabarVolcano1FGentlemanEndBattleText:
	text_far _CinnabarVolcano1FGentlemanEndBattleText
	text_end

CinnabarVolcano1FGentlemanAfterBattleText:
	text_far _CinnabarVolcano1FGentlemanAfterBattleText
	text_end

CinnabarVolcano1FBeautyBattleText:
	text_far _CinnabarVolcano1FBeautyBattleText
	text_end

CinnabarVolcano1FBeautyEndBattleText:
	text_far _CinnabarVolcano1FBeautyEndBattleText
	text_end

CinnabarVolcano1FBeautyAfterBattleText:
	text_far _CinnabarVolcano1FBeautyAfterBattleText
	text_end

CinnabarVolcanoB1FLavaSignText:
	text_far _CinnabarVolcanoB1FLavaSignText
	text_end

CinnabarVolcano1FBurnHealSignText:
	text_far _CinnabarVolcano1FBurnHealSignText
	text_end
