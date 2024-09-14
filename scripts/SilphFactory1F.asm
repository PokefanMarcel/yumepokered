; marcelnote - new location
SilphFactory1F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, SilphFactory1FTrainerHeaders
	ld de, SilphFactory1F_ScriptPointers
	ld a, [wSilphFactory1FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSilphFactory1FCurScript], a
	ret

SilphFactory1F_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_SILPHFACTORY1F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_SILPHFACTORY1F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_SILPHFACTORY1F_END_BATTLE

SilphFactory1F_TextPointers:
	def_text_pointers
	dw_const SilphFactory1FRocket1Text, TEXT_SILPHFACTORY1F_ROCKET1
	dw_const SilphFactory1FRocket2Text, TEXT_SILPHFACTORY1F_ROCKET2
	dw_const SilphFactory1FRocket3Text, TEXT_SILPHFACTORY1F_ROCKET3
	dw_const SilphFactory1FRocket4Text, TEXT_SILPHFACTORY1F_ROCKET4
	dw_const SilphFactory1FRocket5Text, TEXT_SILPHFACTORY1F_ROCKET5
	dw_const SilphFactory1FRocket6Text, TEXT_SILPHFACTORY1F_ROCKET6
	;dw_const PickUpItemText,              TEXT_ROCKETHIDEOUTB1F_ESCAPE_ROPE

SilphFactory1FTrainerHeaders:
	def_trainers
SilphFactory1FTrainerHeader0:
	trainer EVENT_BEAT_SILPH_FACTORY_1F_TRAINER_0, 2, SilphFactory1FRocket1BattleText, SilphFactory1FRocket1EndBattleText, SilphFactory1FRocket1AfterBattleText
SilphFactory1FTrainerHeader1:
	trainer EVENT_BEAT_SILPH_FACTORY_1F_TRAINER_1, 3, SilphFactory1FRocket2BattleText, SilphFactory1FRocket2EndBattleText, SilphFactory1FRocket2AfterBattleText
SilphFactory1FTrainerHeader2:
	trainer EVENT_BEAT_SILPH_FACTORY_1F_TRAINER_2, 2, SilphFactory1FRocket3BattleText, SilphFactory1FRocket3EndBattleText, SilphFactory1FRocket3AfterBattleText
SilphFactory1FTrainerHeader3:
	trainer EVENT_BEAT_SILPH_FACTORY_1F_TRAINER_3, 3, SilphFactory1FRocket4BattleText, SilphFactory1FRocket4EndBattleText, SilphFactory1FRocket4AfterBattleText
SilphFactory1FTrainerHeader4:
	trainer EVENT_BEAT_SILPH_FACTORY_1F_TRAINER_4, 0, SilphFactory1FRocket5BattleText, SilphFactory1FRocket5EndBattleText, SilphFactory1FRocket5AfterBattleText
SilphFactory1FTrainerHeader5:
	trainer EVENT_BEAT_SILPH_FACTORY_1F_TRAINER_5, 0, SilphFactory1FRocket6BattleText, SilphFactory1FRocket6EndBattleText, SilphFactory1FRocket6AfterBattleText
	db -1 ; end

SilphFactory1FRocket1Text:
	text_asm
	ld hl, SilphFactory1FTrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

SilphFactory1FRocket1BattleText:
	text_far _SilphFactory1FRocket1BattleText
	text_end

SilphFactory1FRocket1EndBattleText:
	text_far _SilphFactory1FRocket1EndBattleText
	text_end

SilphFactory1FRocket1AfterBattleText:
	text_far _SilphFactory1FRocket1AfterBattleText
	text_end

SilphFactory1FRocket2Text:
	text_asm
	ld hl, SilphFactory1FTrainerHeader1
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

SilphFactory1FRocket2BattleText:
	text_far _SilphFactory1FRocket2BattleText
	text_end

SilphFactory1FRocket2EndBattleText:
	text_far _SilphFactory1FRocket2EndBattleText
	text_end

SilphFactory1FRocket2AfterBattleText:
	text_far _SilphFactory1FRocket2AfterBattleText
	text_end

SilphFactory1FRocket3Text:
	text_asm
	ld hl, SilphFactory1FTrainerHeader2
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

SilphFactory1FRocket3BattleText:
	text_far _SilphFactory1FRocket3BattleText
	text_end

SilphFactory1FRocket3EndBattleText:
	text_far _SilphFactory1FRocket3EndBattleText
	text_end

SilphFactory1FRocket3AfterBattleText:
	text_far _SilphFactory1FRocket3AfterBattleText
	text_end

SilphFactory1FRocket4Text:
	text_asm
	ld hl, SilphFactory1FTrainerHeader3
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

SilphFactory1FRocket4BattleText:
	text_far _SilphFactory1FRocket4BattleText
	text_end

SilphFactory1FRocket4EndBattleText:
	text_far _SilphFactory1FRocket4EndBattleText
	text_end

SilphFactory1FRocket4AfterBattleText:
	text_far _SilphFactory1FRocket4AfterBattleText
	text_end

SilphFactory1FRocket5Text:
	text_asm
	ld hl, SilphFactory1FTrainerHeader4
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

SilphFactory1FRocket5BattleText:
	text_far _SilphFactory1FRocket5BattleText
	text_end

SilphFactory1FRocket5EndBattleText:
	text_far _SilphFactory1FRocket5EndBattleText
	text_end

SilphFactory1FRocket5AfterBattleText:
	text_far _SilphFactory1FRocket5AfterBattleText
	text_end

SilphFactory1FRocket6Text:
	text_asm
	ld hl, SilphFactory1FTrainerHeader5
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

SilphFactory1FRocket6BattleText:
	text_far _SilphFactory1FRocket6BattleText
	text_end

SilphFactory1FRocket6EndBattleText:
	text_far _SilphFactory1FRocket6EndBattleText
	text_end

SilphFactory1FRocket6AfterBattleText:
	text_far _SilphFactory1FRocket6AfterBattleText
	text_end