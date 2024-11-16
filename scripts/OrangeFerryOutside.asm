; marcelnote - new location
OrangeFerryOutside_Script:
	call EnableAutoTextBoxDrawing
	ld hl, OrangeFerryOutsideTrainerHeaders
	ld de, OrangeFerryOutside_ScriptPointers
	ld a, [wOrangeFerryOutsideCurScript]
	call ExecuteCurMapScriptInTable
	ld [wOrangeFerryOutsideCurScript], a
	ret

OrangeFerryOutside_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_ORANGEFERRYOUTSIDE_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ORANGEFERRYOUTSIDE_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ORANGEFERRYOUTSIDE_END_BATTLE

OrangeFerryOutside_TextPointers:
	def_text_pointers
	dw_const OrangeFerryOutsideSailor1Text,      TEXT_ORANGEFERRYOUTSIDE_SAILOR1
	dw_const OrangeFerryOutsideCooltrainerMText, TEXT_ORANGEFERRYOUTSIDE_COOLTRAINER_M
	dw_const OrangeFerryOutsideBeautyText,       TEXT_ORANGEFERRYOUTSIDE_BEAUTY
	dw_const OrangeFerryOutsideGrampsText,       TEXT_ORANGEFERRYOUTSIDE_GRAMPS

OrangeFerryOutsideTrainerHeaders:
	def_trainers
OrangeFerryOutsideTrainerHeader0:
	trainer EVENT_BEAT_ORANGE_FERRY_OUTSIDE_TRAINER_0, 3, OrangeFerryOutsideSailor1BattleText, OrangeFerryOutsideSailor1EndBattleText, OrangeFerryOutsideSailor1AfterBattleText
OrangeFerryOutsideTrainerHeader1:
	trainer EVENT_BEAT_ORANGE_FERRY_OUTSIDE_TRAINER_1, 2, OrangeFerryOutsideCooltrainerMBattleText, OrangeFerryOutsideCooltrainerMEndBattleText, OrangeFerryOutsideCooltrainerMAfterBattleText
OrangeFerryOutsideTrainerHeader2:
	trainer EVENT_BEAT_ORANGE_FERRY_OUTSIDE_TRAINER_2, 1, OrangeFerryOutsideBeautyBattleText, OrangeFerryOutsideBeautyEndBattleText, OrangeFerryOutsideBeautyAfterBattleText
	db -1 ; end

OrangeFerryOutsideSailor1Text:
	text_asm
	ld hl, OrangeFerryOutsideTrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

OrangeFerryOutsideSailor1BattleText:
	text_far _OrangeFerryOutsideSailor1BattleText
	text_end

OrangeFerryOutsideSailor1EndBattleText:
	text_far _OrangeFerryOutsideSailor1EndBattleText
	text_end

OrangeFerryOutsideSailor1AfterBattleText:
	text_far _OrangeFerryOutsideSailor1AfterBattleText
	text_end

OrangeFerryOutsideCooltrainerMText:
	text_asm
	ld hl, OrangeFerryOutsideTrainerHeader1
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

OrangeFerryOutsideCooltrainerMBattleText:
	text_far _OrangeFerryOutsideCooltrainerMBattleText
	text_end

OrangeFerryOutsideCooltrainerMEndBattleText:
	text_far _OrangeFerryOutsideCooltrainerMEndBattleText
	text_end

OrangeFerryOutsideCooltrainerMAfterBattleText:
	text_far _OrangeFerryOutsideCooltrainerMAfterBattleText
	text_end

OrangeFerryOutsideBeautyText:
	text_asm
	ld hl, OrangeFerryOutsideTrainerHeader2
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

OrangeFerryOutsideBeautyBattleText:
	text_far _OrangeFerryOutsideBeautyBattleText
	text_end

OrangeFerryOutsideBeautyEndBattleText:
	text_far _OrangeFerryOutsideBeautyEndBattleText
	text_end

OrangeFerryOutsideBeautyAfterBattleText:
	text_far _OrangeFerryOutsideBeautyAfterBattleText
	text_end

OrangeFerryOutsideGrampsText:
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
	text_far _OrangeFerryOutsideGrampsDoYouKnowText
	text_end

.StoryText:
	text_far _OrangeFerryOutsideGrampsStoryText
	text_end

.NotEasilyToldText:
	text_far _OrangeFerryOutsideGrampsNotEasilyToldText
	text_end
