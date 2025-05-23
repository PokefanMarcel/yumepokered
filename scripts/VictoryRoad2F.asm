VictoryRoad2F_Script:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_2, [hl]
	res BIT_CUR_MAP_LOADED_2, [hl]
	call nz, VictoryRoad2FResetBoulderEventScript
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	res BIT_CUR_MAP_LOADED_1, [hl]
	call nz, VictoryRoad2FCheckBoulderEventScript
	call EnableAutoTextBoxDrawing
	ld hl, VictoryRoad2TrainerHeaders
	ld de, VictoryRoad2F_ScriptPointers
	ld a, [wVictoryRoad2FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wVictoryRoad2FCurScript], a
	ret

VictoryRoad2FResetBoulderEventScript:
	ResetEvent EVENT_VICTORY_ROAD_1_BOULDER_ON_SWITCH
; fallthrough
VictoryRoad2FCheckBoulderEventScript:
	CheckEvent EVENT_VICTORY_ROAD_2_BOULDER_ON_SWITCH1
	jr z, .not_on_switch
	push af
	ld a, $15
	lb bc, 4, 3
	call VictoryRoad2FReplaceTileBlockScript
	pop af
.not_on_switch
	CheckEventReuseA EVENT_VICTORY_ROAD_2_BOULDER_ON_SWITCH2
	ret z
	ld a, $1d
	lb bc, 7, 11
VictoryRoad2FReplaceTileBlockScript:
	ld [wNewTileBlockID], a
	predef ReplaceTileBlock
	ret

VictoryRoad2F_ScriptPointers:
	def_script_pointers
	dw_const VictoryRoad2FDefaultScript,            SCRIPT_VICTORYROAD2F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_VICTORYROAD2F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_VICTORYROAD2F_END_BATTLE

VictoryRoad2FDefaultScript:
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
	set BIT_CUR_MAP_LOADED_1, [hl]
	ret

.SwitchCoords:
	dbmapcoord  1, 16
	dbmapcoord  9, 16
	db -1 ; end

VictoryRoad2F_TextPointers:
	def_text_pointers
	dw_const VictoryRoad2FBlackbeltText,    TEXT_VICTORYROAD2F_BLACKBELT
	dw_const VictoryRoad2FSuperNerd1Text,   TEXT_VICTORYROAD2F_SUPER_NERD1
	dw_const VictoryRoad2FCooltrainerMText, TEXT_VICTORYROAD2F_COOLTRAINER_M
	dw_const VictoryRoad2FSuperNerd2Text,   TEXT_VICTORYROAD2F_SUPER_NERD2
	dw_const VictoryRoad2FSuperNerd3Text,   TEXT_VICTORYROAD2F_SUPER_NERD3
	;dw_const VictoryRoad2FMoltresText,      TEXT_VICTORYROAD2F_MOLTRES ; marcelnote - removed Moltres from Victory Road
	dw_const VictoryRoad2FGrampsText,       TEXT_VICTORYROAD2F_GRAMPS ; marcelnote - added
	dw_const PickUpItemText,                TEXT_VICTORYROAD2F_TM_SUBMISSION
	dw_const PickUpItemText,                TEXT_VICTORYROAD2F_FULL_HEAL
	dw_const PickUpItemText,                TEXT_VICTORYROAD2F_TM_MEGA_KICK
	dw_const PickUpItemText,                TEXT_VICTORYROAD2F_GUARD_SPEC
	dw_const BoulderText,                   TEXT_VICTORYROAD2F_BOULDER1
	dw_const BoulderText,                   TEXT_VICTORYROAD2F_BOULDER2
	dw_const BoulderText,                   TEXT_VICTORYROAD2F_BOULDER3

VictoryRoad2TrainerHeaders:
	def_trainers
VictoryRoad2TrainerHeader0:
	trainer EVENT_BEAT_VICTORY_ROAD_2_TRAINER_0, 4, VictoryRoad2FBlackbeltBattleText, VictoryRoad2FBlackbeltEndBattleText, VictoryRoad2FBlackbeltAfterBattleText
VictoryRoad2TrainerHeader1:
	trainer EVENT_BEAT_VICTORY_ROAD_2_TRAINER_1, 3, VictoryRoad2FSuperNerd1BattleText, VictoryRoad2FSuperNerd1EndBattleText, VictoryRoad2FSuperNerd1AfterBattleText
VictoryRoad2TrainerHeader2:
	trainer EVENT_BEAT_VICTORY_ROAD_2_TRAINER_2, 3, VictoryRoad2FCooltrainerMBattleText, VictoryRoad2FCooltrainerMEndBattleText, VictoryRoad2FCooltrainerMAfterBattleText
VictoryRoad2TrainerHeader3:
	trainer EVENT_BEAT_VICTORY_ROAD_2_TRAINER_3, 1, VictoryRoad2FSuperNerd2BattleText, VictoryRoad2FSuperNerd2EndBattleText, VictoryRoad2FSuperNerd2AfterBattleText
VictoryRoad2TrainerHeader4:
	trainer EVENT_BEAT_VICTORY_ROAD_2_TRAINER_4, 3, VictoryRoad2FSuperNerd3BattleText, VictoryRoad2FSuperNerd3EndBattleText, VictoryRoad2FSuperNerd3AfterBattleText
;MoltresTrainerHeader:   ; marcelnote - removed Moltres from Victory Road
;	trainer EVENT_BEAT_MOLTRES, 0, VictoryRoad2FMoltresBattleText, VictoryRoad2FMoltresBattleText, VictoryRoad2FMoltresBattleText
	db -1 ; end

VictoryRoad2FBlackbeltText:
	text_asm
	ld hl, VictoryRoad2TrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

VictoryRoad2FSuperNerd1Text:
	text_asm
	ld hl, VictoryRoad2TrainerHeader1
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

VictoryRoad2FCooltrainerMText:
	text_asm
	ld hl, VictoryRoad2TrainerHeader2
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

VictoryRoad2FSuperNerd2Text:
	text_asm
	ld hl, VictoryRoad2TrainerHeader3
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

VictoryRoad2FSuperNerd3Text:
	text_asm
	ld hl, VictoryRoad2TrainerHeader4
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

; marcelnote - removed Moltres from Victory Road
;VictoryRoad2FMoltresText:
;	text_asm
;	ld hl, MoltresTrainerHeader
;	call TalkToTrainer
;	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

;VictoryRoad2FMoltresBattleText:
;	text_far _VictoryRoad2FMoltresBattleText
;	text_asm
;	ld a, MOLTRES
;	call PlayCry
;	call WaitForSoundToFinish
;	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

VictoryRoad2FBlackbeltBattleText:
	text_far _VictoryRoad2FBlackbeltBattleText
	text_end

VictoryRoad2FBlackbeltEndBattleText:
	text_far _VictoryRoad2FBlackbeltEndBattleText
	text_end

VictoryRoad2FBlackbeltAfterBattleText:
	text_far _VictoryRoad2FBlackbeltAfterBattleText
	text_end

VictoryRoad2FSuperNerd1BattleText:
	text_far _VictoryRoad2FSuperNerd1BattleText
	text_end

VictoryRoad2FSuperNerd1EndBattleText:
	text_far _VictoryRoad2FSuperNerd1EndBattleText
	text_end

VictoryRoad2FSuperNerd1AfterBattleText:
	text_far _VictoryRoad2FSuperNerd1AfterBattleText
	text_end

VictoryRoad2FCooltrainerMBattleText:
	text_far _VictoryRoad2FCooltrainerMBattleText
	text_end

VictoryRoad2FCooltrainerMEndBattleText:
	text_far _VictoryRoad2FCooltrainerMEndBattleText
	text_end

VictoryRoad2FCooltrainerMAfterBattleText:
	text_far _VictoryRoad2FCooltrainerMAfterBattleText
	text_end

VictoryRoad2FSuperNerd2BattleText:
	text_far _VictoryRoad2FSuperNerd2BattleText
	text_end

VictoryRoad2FSuperNerd2EndBattleText:
	text_far _VictoryRoad2FSuperNerd2EndBattleText
	text_end

VictoryRoad2FSuperNerd2AfterBattleText:
	text_far _VictoryRoad2FSuperNerd2AfterBattleText
	text_end

VictoryRoad2FSuperNerd3BattleText:
	text_far _VictoryRoad2FSuperNerd3BattleText
	text_end

VictoryRoad2FSuperNerd3EndBattleText:
	text_far _VictoryRoad2FSuperNerd3EndBattleText
	text_end

VictoryRoad2FSuperNerd3AfterBattleText:
	text_far _VictoryRoad2FSuperNerd3AfterBattleText
	text_end

VictoryRoad2FGrampsText: ; marcelnote - new, adapted from Silph Co Lapras guy
	text_asm
	CheckEvent EVENT_VICTORY_ROAD_2F_GOT_HITMON
	ld hl, .GreatFirebirdText
	jr nz, .print_text
	ld hl, .IntroText
	call PrintText
	CheckEitherEventSet EVENT_GOT_HITMONLEE, EVENT_GOT_HITMONCHAN
	ld hl, .HaveYouTestedText
	jr nz, .give_hitmon
.print_text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd
.give_hitmon
	CheckEvent EVENT_GOT_HITMONCHAN
	ld c, 40
	ld b, HITMONLEE
	ld hl, .GiveHitmonleeText
	jr nz, .got_text_and_mon
	ld b, HITMONCHAN
	ld hl, .GiveHitmonchanText
.got_text_and_mon
	push bc ; save Mon and level info
	call PrintText
	pop bc
	call GivePokemon
	jr nc, .done
	;ld a, [wSimulatedJoypadStatesEnd]
	;and a
	;call z, WaitForTextScrollButtonPress
	;call EnableAutoTextBoxDrawing
	SetEvent EVENT_VICTORY_ROAD_2F_GOT_HITMON
.done
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.IntroText:
	text_far _VictoryRoad2FGrampsIntroText
	text_end

.HaveYouTestedText:
	text_far _VictoryRoad2FGrampsHaveYouTestedText
	text_end

.GiveHitmonchanText:
	text_far _VictoryRoad2FGrampsGiveHimonchanText
	text_end

.GiveHitmonleeText:
	text_far _VictoryRoad2FGrampsGiveHimonleeText
	text_end

.GreatFirebirdText:
	text_far _VictoryRoad2FGrampsGreatFirebirdText
	text_end
