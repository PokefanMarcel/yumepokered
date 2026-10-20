; marcelnote - merged Pewter houses
PewterHouses_Script:
	jp EnableAutoTextBoxDrawing

PewterHouses_TextPointers:
	def_text_pointers
	; Nidoran house
	dw_const PewterNidoranHouseNidoranText,       TEXT_PEWTERNIDORANHOUSE_NIDORAN
	dw_const PewterNidoranHouseLittleBoyText,     TEXT_PEWTERNIDORANHOUSE_LITTLE_BOY
	dw_const PewterNidoranHouseMiddleAgedManText, TEXT_PEWTERNIDORANHOUSE_MIDDLE_AGED_MAN
	; Speech house
	dw_const PewterSpeechHouseGamblerText,   TEXT_PEWTERSPEECHHOUSE_GAMBLER
	dw_const PewterSpeechHouseYoungsterText, TEXT_PEWTERSPEECHHOUSE_YOUNGSTER


PewterNidoranHouseNidoranText:
	text_far _PewterNidoranHouseNidoranText
	text_asm
	ld a, NIDORAN_M
	call PlayCry
	call WaitForSoundToFinish
	rst TextScriptEnd

PewterNidoranHouseLittleBoyText:
	text_far _PewterNidoranHouseLittleBoyText
	text_end

PewterNidoranHouseMiddleAgedManText:
	text_far _PewterNidoranHouseMiddleAgedManText
	text_end


PewterSpeechHouseGamblerText:
	text_far _PewterSpeechHouseGamblerText
	text_end

PewterSpeechHouseYoungsterText:
	text_far _PewterSpeechHouseYoungsterText
	text_end
