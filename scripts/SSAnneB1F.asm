; marcelnote - merged SS Anne B1F and B1FRooms
SSAnneB1F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, SSAnneB1FTrainerHeaders
	ld de, SSAnneB1F_ScriptPointers
	ld a, [wSSAnneB1FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSSAnneB1FCurScript], a
	ret

SSAnneB1F_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_SSANNEB1FROOMS_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_SSANNEB1FROOMS_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_SSANNEB1FROOMS_END_BATTLE

SSAnneB1F_TextPointers:
	def_text_pointers
	dw_const SSAnneB1FRoomsSailor1Text,   TEXT_SSANNEB1FROOMS_SAILOR1
	dw_const SSAnneB1FRoomsSailor2Text,   TEXT_SSANNEB1FROOMS_SAILOR2
	dw_const SSAnneB1FRoomsSailor3Text,   TEXT_SSANNEB1FROOMS_SAILOR3
	dw_const SSAnneB1FRoomsSailor4Text,   TEXT_SSANNEB1FROOMS_SAILOR4
	dw_const SSAnneB1FRoomsSailor5Text,   TEXT_SSANNEB1FROOMS_SAILOR5
	dw_const SSAnneB1FRoomsFisherText,    TEXT_SSANNEB1FROOMS_FISHER
	dw_const SSAnneB1FRoomsSuperNerdText, TEXT_SSANNEB1FROOMS_SUPER_NERD
	dw_const SSAnneB1FRoomsMachokeText,   TEXT_SSANNEB1FROOMS_MACHOKE
	dw_const PickUpItemText,              TEXT_SSANNEB1FROOMS_ETHER
	dw_const PickUpItemText,              TEXT_SSANNEB1FROOMS_TM_REST
	dw_const PickUpItemText,              TEXT_SSANNEB1FROOMS_MAX_POTION

SSAnneB1FTrainerHeaders:
	def_trainers
SSAnneB1FTrainerHeader0:
	trainer EVENT_BEAT_SS_ANNE_B1F_TRAINER_0, 2, SSAnneB1FRoomsSailor1BattleText, SSAnneB1FRoomsSailor1EndBattleText, SSAnneB1FRoomsSailor1AfterBattleText
SSAnneB1FTrainerHeader1:
	trainer EVENT_BEAT_SS_ANNE_B1F_TRAINER_1, 3, SSAnneB1FRoomsSailor2BattleText, SSAnneB1FRoomsSailor2EndBattleText, SSAnneB1FRoomsSailor2AfterBattleText
SSAnneB1FTrainerHeader2:
	trainer EVENT_BEAT_SS_ANNE_B1F_TRAINER_2, 2, SSAnneB1FRoomsSailor3BattleText, SSAnneB1FRoomsSailor3EndBattleText, SSAnneB1FRoomsSailor3AfterBattleText
SSAnneB1FTrainerHeader3:
	trainer EVENT_BEAT_SS_ANNE_B1F_TRAINER_3, 2, SSAnneB1FRoomsSailor4BattleText, SSAnneB1FRoomsSailor4EndBattleText, SSAnneB1FRoomsSailor4AfterBattleText
SSAnneB1FTrainerHeader4:
	trainer EVENT_BEAT_SS_ANNE_B1F_TRAINER_4, 2, SSAnneB1FRoomsSailor5BattleText, SSAnneB1FRoomsSailor5EndBattleText, SSAnneB1FRoomsSailor5AfterBattleText
SSAnneB1FTrainerHeader5:
	trainer EVENT_BEAT_SS_ANNE_B1F_TRAINER_5, 3, SSAnneB1FRoomsFisherBattleText, SSAnneB1FRoomsFisherEndBattleText, SSAnneB1FRoomsFisherAfterBattleText
	db -1 ; end

SSAnneB1FRoomsSailor1Text:
	text_asm
	ld hl, SSAnneB1FTrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

SSAnneB1FRoomsSailor2Text:
	text_asm
	ld hl, SSAnneB1FTrainerHeader1
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

SSAnneB1FRoomsSailor3Text:
	text_asm
	ld hl, SSAnneB1FTrainerHeader2
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

SSAnneB1FRoomsSailor4Text:
	text_asm
	ld hl, SSAnneB1FTrainerHeader3
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

SSAnneB1FRoomsSailor5Text:
	text_asm
	ld hl, SSAnneB1FTrainerHeader4
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

SSAnneB1FRoomsFisherText:
	text_asm
	ld hl, SSAnneB1FTrainerHeader5
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

SSAnneB1FRoomsMachokeText:
	text_far _SSAnneB1FRoomsMachokeText
	text_asm
	ld a, MACHOKE
	call PlayCry
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

SSAnneB1FRoomsSailor1BattleText:
	text_far _SSAnneB1FRoomsSailor1BattleText
	text_end

SSAnneB1FRoomsSailor1EndBattleText:
	text_far _SSAnneB1FRoomsSailor1EndBattleText
	text_end

SSAnneB1FRoomsSailor1AfterBattleText:
	text_far _SSAnneB1FRoomsSailor1AfterBattleText
	text_end

SSAnneB1FRoomsSailor2BattleText:
	text_far _SSAnneB1FRoomsSailor2BattleText
	text_end

SSAnneB1FRoomsSailor2EndBattleText:
	text_far _SSAnneB1FRoomsSailor2EndBattleText
	text_end

SSAnneB1FRoomsSailor2AfterBattleText:
	text_far _SSAnneB1FRoomsSailor2AfterBattleText
	text_end

SSAnneB1FRoomsSailor3BattleText:
	text_far _SSAnneB1FRoomsSailor3BattleText
	text_end

SSAnneB1FRoomsSailor3EndBattleText:
	text_far _SSAnneB1FRoomsSailor3EndBattleText
	text_end

SSAnneB1FRoomsSailor3AfterBattleText:
	text_far _SSAnneB1FRoomsSailor3AfterBattleText
	text_end

SSAnneB1FRoomsSailor4BattleText:
	text_far _SSAnneB1FRoomsSailor4BattleText
	text_end

SSAnneB1FRoomsSailor4EndBattleText:
	text_far _SSAnneB1FRoomsSailor4EndBattleText
	text_end

SSAnneB1FRoomsSailor4AfterBattleText:
	text_far _SSAnneB1FRoomsSailor4AfterBattleText
	text_end

SSAnneB1FRoomsSailor5BattleText:
	text_far _SSAnneB1FRoomsSailor5BattleText
	text_end

SSAnneB1FRoomsSailor5EndBattleText:
	text_far _SSAnneB1FRoomsSailor5EndBattleText
	text_end

SSAnneB1FRoomsSailor5AfterBattleText:
	text_far _SSAnneB1FRoomsSailor5AfterBattleText
	text_end

SSAnneB1FRoomsFisherBattleText:
	text_far _SSAnneB1FRoomsFisherBattleText
	text_end

SSAnneB1FRoomsFisherEndBattleText:
	text_far _SSAnneB1FRoomsFisherEndBattleText
	text_end

SSAnneB1FRoomsFisherAfterBattleText:
	text_far _SSAnneB1FRoomsFisherAfterBattleText
	text_end

SSAnneB1FRoomsSuperNerdText:
	text_far _SSAnneB1FRoomsSuperNerdText
	text_end
