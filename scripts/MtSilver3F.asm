; marcelnote - new location
MtSilver3F_Script:
	call EnableAutoTextBoxDrawing
	;ld a, 1
	;ld [wMuteAudioAndPauseMusic], a
	ld hl, MtSilver3FTrainerHeaders
	ld de, MtSilver3F_ScriptPointers
	ld a, [wMtSilver3FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wMtSilver3FCurScript], a
	ret

MtSilver3F_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_MTSILVER3F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_MTSILVER3F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_MTSILVER3F_END_BATTLE

MtSilver3F_TextPointers:
	def_text_pointers
	dw_const MtSilver3FYellowText,      TEXT_MTSILVER3F_YELLOW
	;dw_const PickUpItemText,            TEXT_MTMOON1F_TM_WATER_GUN
	;dw_const MtMoon1FBewareZubatSign,   TEXT_MTMOON1F_BEWARE_ZUBAT_SIGN

MtSilver3FTrainerHeaders:
	def_trainers
MtSilver3FTrainerHeader0:
	trainer EVENT_BEAT_YELLOW, 0, MtSilver3FYellowBattleText, MtSilver3FYellowEndBattleText, MtSilver3FYellowAfterBattleText
	db -1 ; end

MtSilver3FYellowText:
	text_asm
	ld hl, MtSilver3FTrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

MtSilver3FYellowBattleText:
	text_far _MtSilver3FYellowBattleText
	text_end

MtSilver3FYellowEndBattleText:
	text_far _MtSilver3FYellowEndBattleText
	text_end

MtSilver3FYellowAfterBattleText:
	text_far _MtSilver3FYellowAfterBattleText
	text_end


