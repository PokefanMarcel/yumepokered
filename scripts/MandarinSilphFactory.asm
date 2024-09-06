; marcelnote - new location
MandarinSilphFactory_Script:
	call EnableAutoTextBoxDrawing
	ld hl, MandarinSilphFactoryTrainerHeaders
	ld de, MandarinSilphFactory_ScriptPointers
	ld a, [wMandarinSilphFactoryCurScript]
	call ExecuteCurMapScriptInTable
	ld [wMandarinSilphFactoryCurScript], a
	ret

MandarinSilphFactory_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_MANDARINSILPHFACTORY_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_MANDARINSILPHFACTORY_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_MANDARINSILPHFACTORY_END_BATTLE

MandarinSilphFactory_TextPointers:
	def_text_pointers
	;dw_const RocketHideoutB1FRocket1Text, TEXT_ROCKETHIDEOUTB1F_ROCKET1
	;dw_const PickUpItemText,              TEXT_ROCKETHIDEOUTB1F_ESCAPE_ROPE

MandarinSilphFactoryTrainerHeaders:
	def_trainers
;MandarinSilphFactoryTrainerHeader0:
;	trainer EVENT_BEAT_ROCKET_HIDEOUT_1_TRAINER_0, 3, MandarinSilphFactoryRocket1BattleText, MandarinSilphFactoryRocket1EndBattleText, MandarinSilphFactoryRocket1AfterBattleText
	db -1 ; end

;MandarinSilphFactoryRocket1Text:
;	text_asm
;	ld hl, MandarinSilphFactoryTrainerHeader0
;	call TalkToTrainer
;	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

;MandarinSilphFactoryRocket1BattleText:
;	text_far _MandarinSilphFactoryRocket1BattleText
;	text_end

;MandarinSilphFactoryRocket1EndBattleText:
;	text_far _MandarinSilphFactoryRocket1EndBattleText
;	text_end

;MandarinSilphFactoryRocket1AfterBattleText:
;	text_far _MandarinSilphFactoryRocket1AfterBattleText
;	text_end
