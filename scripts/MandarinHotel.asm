; marcelnote - new location
MandarinHotel_Script:
	call EnableAutoTextBoxDrawing
	ld hl, MandarinHotelTrainerHeaders
	ld de, MandarinHotel_ScriptPointers
	ld a, [wMandarinHotelCurScript]
	call ExecuteCurMapScriptInTable
	ld [wMandarinHotelCurScript], a
	ret

MandarinHotel_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_MANDARINHOTEL_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_MANDARINHOTEL_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_MANDARINHOTEL_END_BATTLE

MandarinHotel_TextPointers:
	def_text_pointers
	; object_events
	dw_const MandarinHotel2FGentlemanText,    TEXT_MANDARINHOTEL2F_GENTLEMAN
	dw_const MandarinHotel3FGamblerText,      TEXT_MANDARINHOTEL3F_GAMBLER
	dw_const MandarinHotel3FFisherText,       TEXT_MANDARINHOTEL3F_FISHER
	dw_const MandarinHotel1FWaiterText,       TEXT_MANDARINHOTEL1F_WAITER
	dw_const MandarinHotel1FWaiter2Text,      TEXT_MANDARINHOTEL1F_WAITER2
	dw_const MandarinHotel1FBeautyText,       TEXT_MANDARINHOTEL1F_BEAUTY
	dw_const MandarinHotel2FSilphWorkerMText, TEXT_MANDARINHOTEL2F_SILPH_WORKER_M
	dw_const MandarinHotel3FLittleGirlText,   TEXT_MANDARINHOTEL3F_LITTLE_GIRL
	dw_const MandarinHotel4FSilphWorkerMText, TEXT_MANDARINHOTEL4F_SILPH_WORKER_M
	dw_const MandarinHotel4FSilphWorkerFText, TEXT_MANDARINHOTEL4F_SILPH_WORKER_F
	dw_const MandarinHotel4FRaichuText,       TEXT_MANDARINHOTEL4F_RAICHU
	dw_const PickUpItemText,                  TEXT_MANDARINHOTEL2F_MAX_ELIXER
	; bg_events
	dw_const MandarinHotel2FRoom11SignText,   TEXT_MANDARINHOTEL2F_ROOM_11
	dw_const MandarinHotel2FRoom12SignText,   TEXT_MANDARINHOTEL2F_ROOM_12
	dw_const MandarinHotel3FRoom21SignText,   TEXT_MANDARINHOTEL3F_ROOM_21
	dw_const MandarinHotel3FRoom22SignText,   TEXT_MANDARINHOTEL3F_ROOM_22
	dw_const MandarinHotel4FSuiteSignText,    TEXT_MANDARINHOTEL4F_SUITE

MandarinHotelTrainerHeaders:
	def_trainers
MandarinHotelTrainerHeader0:
	trainer EVENT_BEAT_MANDARIN_HOTEL_TRAINER_0, 2, MandarinHotel2FGentlemanBattleText, MandarinHotel2FGentlemanEndBattleText, MandarinHotel2FGentlemanAfterBattleText
MandarinHotelTrainerHeader1:
	trainer EVENT_BEAT_MANDARIN_HOTEL_TRAINER_1, 2, MandarinHotel3FGamblerBattleText, MandarinHotel3FGamblerEndBattleText, MandarinHotel3FGamblerAfterBattleText
MandarinHotelTrainerHeader2:
	trainer EVENT_BEAT_MANDARIN_HOTEL_TRAINER_2, 2, MandarinHotel3FFisherBattleText, MandarinHotel3FFisherEndBattleText, MandarinHotel3FFisherAfterBattleText
	db -1 ; end

; 1F

MandarinHotel1FWaiterText:
	text_far _MandarinHotel1FWaiterText
	text_end

MandarinHotel1FWaiter2Text:
	text_far _MandarinHotel1FWaiter2Text
	text_end

MandarinHotel1FBeautyText:
	text_far _MandarinHotel1FBeautyText
	text_end

; 2F

MandarinHotel2FGentlemanText:
	text_asm
	ld hl, MandarinHotelTrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

MandarinHotel2FGentlemanBattleText:
	text_far _MandarinHotel2FGentlemanBattleText
	text_end

MandarinHotel2FGentlemanEndBattleText:
	text_far _MandarinHotel2FGentlemanEndBattleText
	text_end

MandarinHotel2FGentlemanAfterBattleText:
	text_far _MandarinHotel2FGentlemanAfterBattleText
	text_end

MandarinHotel2FSilphWorkerMText:
	text_far _MandarinHotel2FSilphWorkerMText
	text_end

MandarinHotel2FRoom11SignText:
	text_far _MandarinHotel2FRoom11SignText
	text_end

MandarinHotel2FRoom12SignText:
	text_far _MandarinHotel2FRoom12SignText
	text_end

; 3F

MandarinHotel3FGamblerText:
	text_asm
	ld hl, MandarinHotelTrainerHeader1
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

MandarinHotel3FGamblerBattleText:
	text_far _MandarinHotel3FGamblerBattleText
	text_end

MandarinHotel3FGamblerEndBattleText:
	text_far _MandarinHotel3FGamblerEndBattleText
	text_end

MandarinHotel3FGamblerAfterBattleText:
	text_far _MandarinHotel3FGamblerAfterBattleText
	text_end

MandarinHotel3FFisherText:
	text_asm
	ld hl, MandarinHotelTrainerHeader2
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

MandarinHotel3FFisherBattleText:
	text_far _MandarinHotel3FFisherBattleText
	text_end

MandarinHotel3FFisherEndBattleText:
	text_far _MandarinHotel3FFisherEndBattleText
	text_end

MandarinHotel3FFisherAfterBattleText:
	text_far _MandarinHotel3FFisherAfterBattleText
	text_end

MandarinHotel3FLittleGirlText:
	text_far _MandarinHotel3FLittleGirlText
	text_end

MandarinHotel3FRoom21SignText:
	text_far _MandarinHotel3FRoom21SignText
	text_end

MandarinHotel3FRoom22SignText:
	text_far _MandarinHotel3FRoom22SignText
	text_end

; 4F

MandarinHotel4FSilphWorkerMText:
	text_far _MandarinHotel4FSilphWorkerMText
	text_end

MandarinHotel4FSilphWorkerFText:
	text_far _MandarinHotel4FSilphWorkerFText
	text_end

MandarinHotel4FRaichuText:
	text_far _MandarinHotel4FRaichuText
	text_asm
	ld a, RAICHU
	call PlayCry
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

MandarinHotel4FSuiteSignText:
	text_far _MandarinHotel4FSuiteSignText
	text_end
