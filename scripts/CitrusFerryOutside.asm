; marcelnote - new location
CitrusFerryOutside_Script:
	call EnableAutoTextBoxDrawing
	ld hl, CitrusFerryOutsideTrainerHeaders
	ld de, CitrusFerryOutside_ScriptPointers
	ld a, [wCitrusFerryOutsideCurScript]
	call ExecuteCurMapScriptInTable
	ld [wCitrusFerryOutsideCurScript], a
	ret

CitrusFerryOutside_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_CITRUSFERRYOUTSIDE_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_CITRUSFERRYOUTSIDE_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_CITRUSFERRYOUTSIDE_END_BATTLE

CitrusFerryOutside_TextPointers:
	def_text_pointers
	dw_const CitrusFerryOutsideSailor1Text,      TEXT_CITRUSFERRYOUTSIDE_SAILOR1
	dw_const CitrusFerryOutsideCooltrainerMText, TEXT_CITRUSFERRYOUTSIDE_COOLTRAINER_M
	dw_const CitrusFerryOutsideBeautyText,       TEXT_CITRUSFERRYOUTSIDE_BEAUTY
	dw_const CitrusFerryOutsideCooltrainerFText, TEXT_CITRUSFERRYOUTSIDE_COOLTRAINER_F
	dw_const CitrusFerryOutsideGrampsText,       TEXT_CITRUSFERRYOUTSIDE_GRAMPS
	dw_const CitrusFerryOutsideGirlText,         TEXT_CITRUSFERRYOUTSIDE_GIRL

CitrusFerryOutsideTrainerHeaders:
	def_trainers
CitrusFerryOutsideTrainerHeader0:
	trainer EVENT_BEAT_CITRUS_FERRY_OUTSIDE_TRAINER_0, 3, CitrusFerryOutsideSailor1BattleText, CitrusFerryOutsideSailor1EndBattleText, CitrusFerryOutsideSailor1AfterBattleText
CitrusFerryOutsideTrainerHeader1:
	trainer EVENT_BEAT_CITRUS_FERRY_OUTSIDE_TRAINER_1, 2, CitrusFerryOutsideCooltrainerMBattleText, CitrusFerryOutsideCooltrainerMEndBattleText, CitrusFerryOutsideCooltrainerMAfterBattleText
CitrusFerryOutsideTrainerHeader2:
	trainer EVENT_BEAT_CITRUS_FERRY_OUTSIDE_TRAINER_2, 1, CitrusFerryOutsideBeautyBattleText, CitrusFerryOutsideBeautyEndBattleText, CitrusFerryOutsideBeautyAfterBattleText
CitrusFerryOutsideTrainerHeader3:
	trainer EVENT_BEAT_CITRUS_FERRY_OUTSIDE_TRAINER_3, 4, CitrusFerryOutsideCooltrainerFBattleText, CitrusFerryOutsideCooltrainerFEndBattleText, CitrusFerryOutsideCooltrainerFAfterBattleText
	db -1 ; end

CitrusFerryOutsideSailor1Text:
	text_asm
	ld hl, CitrusFerryOutsideTrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

CitrusFerryOutsideSailor1BattleText:
	text_far _CitrusFerryOutsideSailor1BattleText
	text_end

CitrusFerryOutsideSailor1EndBattleText:
	text_far _CitrusFerryOutsideSailor1EndBattleText
	text_end

CitrusFerryOutsideSailor1AfterBattleText:
	text_far _CitrusFerryOutsideSailor1AfterBattleText
	text_end

CitrusFerryOutsideCooltrainerMText:
	text_asm
	ld hl, CitrusFerryOutsideTrainerHeader1
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

CitrusFerryOutsideCooltrainerMBattleText:
	text_far _CitrusFerryOutsideCooltrainerMBattleText
	text_end

CitrusFerryOutsideCooltrainerMEndBattleText:
	text_far _CitrusFerryOutsideCooltrainerMEndBattleText
	text_end

CitrusFerryOutsideCooltrainerMAfterBattleText:
	text_far _CitrusFerryOutsideCooltrainerMAfterBattleText
	text_end

CitrusFerryOutsideBeautyText:
	text_asm
	ld hl, CitrusFerryOutsideTrainerHeader2
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

CitrusFerryOutsideBeautyBattleText:
	text_far _CitrusFerryOutsideBeautyBattleText
	text_end

CitrusFerryOutsideBeautyEndBattleText:
	text_far _CitrusFerryOutsideBeautyEndBattleText
	text_end

CitrusFerryOutsideBeautyAfterBattleText:
	text_far _CitrusFerryOutsideBeautyAfterBattleText
	text_end

CitrusFerryOutsideCooltrainerFText:
	text_asm
	ld hl, CitrusFerryOutsideTrainerHeader3
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

CitrusFerryOutsideCooltrainerFBattleText:
	text_far _CitrusFerryOutsideCooltrainerFBattleText
	text_end

CitrusFerryOutsideCooltrainerFEndBattleText:
	text_far _CitrusFerryOutsideCooltrainerFEndBattleText
	text_end

CitrusFerryOutsideCooltrainerFAfterBattleText:
	text_far _CitrusFerryOutsideCooltrainerFAfterBattleText
	text_end

CitrusFerryOutsideGrampsText:
	text_asm
	ld hl, .DoYouKnowText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ld hl, .NotEasilyToldText
	jr z, .answered_no
	ld hl, .StoryText
.answered_no
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.DoYouKnowText:
	text_far _CitrusFerryOutsideGrampsDoYouKnowText
	text_end

.StoryText:
	text_far _CitrusFerryOutsideGrampsStoryText
	text_end

.NotEasilyToldText:
	text_far _CitrusFerryOutsideGrampsNotEasilyToldText
	text_end

CitrusFerryOutsideGirlText:
	text_far _CitrusFerryOutsideGirlText
	text_end
