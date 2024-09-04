; marcelnote - new location
CeladonGrove_Script:
	call EnableAutoTextBoxDrawing
	ld hl, CeladonGroveTrainerHeaders
	ld de, CeladonGrove_ScriptPointers
	ld a, [wCeladonGroveCurScript]
	call ExecuteCurMapScriptInTable
	ld [wCeladonGroveCurScript], a
	ret

CeladonGrove_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_CELADONGROVE_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_CELADONGROVE_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_CELADONGROVE_END_BATTLE

CeladonGrove_TextPointers:
	def_text_pointers
	;dw_const ViridianForestYoungster1Text,      TEXT_VIRIDIANFOREST_YOUNGSTER1
	;dw_const PickUpItemText,                    TEXT_VIRIDIANFOREST_ANTIDOTE
	;dw_const ViridianForestYoungster5Text,      TEXT_VIRIDIANFOREST_YOUNGSTER5
	;dw_const ViridianForestTrainerTips1Text,    TEXT_VIRIDIANFOREST_TRAINER_TIPS1

CeladonGroveTrainerHeaders:
	def_trainers 2
;ViridianForestTrainerHeader0:
;	trainer EVENT_BEAT_VIRIDIAN_FOREST_TRAINER_0, 4, ViridianForestYoungster2BattleText, ViridianForestYoungster2EndBattleText, ViridianForestYoungster2AfterBattleText
	db -1 ; end

;ViridianForestYoungster1Text:
;	text_far _ViridianForestYoungster1Text
;	text_end

;ViridianForestYoungster2Text:
;	text_asm
;	ld hl, ViridianForestTrainerHeader0
;	call TalkToTrainer
;	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

;ViridianForestYoungster2BattleText:
;	text_far _ViridianForestYoungster2BattleText
;	text_end

;ViridianForestYoungster2EndBattleText:
;	text_far _ViridianForestYoungster2EndBattleText
;	text_end

;ViridianForestYoungster2AfterBattleText:
;	text_far _ViridianForestYoungster2AfterBattleText
;	text_end
