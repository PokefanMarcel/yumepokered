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
	dw_const OrangeFerryOutsideSailor1Text, TEXT_ORANGEFERRYOUTSIDE_SAILOR1

OrangeFerryOutsideTrainerHeaders:
	def_trainers
OrangeFerryOutsideTrainerHeader0:
	trainer EVENT_BEAT_ORANGE_FERRY_OUTSIDE_TRAINER_0, 3, OrangeFerryOutsideSailor1BattleText, OrangeFerryOutsideSailor1EndBattleText, OrangeFerryOutsideSailor1AfterBattleText
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
