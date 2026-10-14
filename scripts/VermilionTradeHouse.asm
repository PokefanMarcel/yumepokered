VermilionTradeHouse_Script:
	jp EnableAutoTextBoxDrawing

VermilionTradeHouse_TextPointers:
	def_text_pointers
	dw_const VermilionTradeHouseLittleGirlText, TEXT_VERMILIONTRADEHOUSE_LITTLE_GIRL
	dw_const VermilionTradeHouseGentlemanText,  TEXT_VERMILIONTRADEHOUSE_GENTLEMAN ; marcelnote - new

VermilionTradeHouseLittleGirlText:
	text_asm
	ld a, TRADE_FOR_DUX
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
	rst TextScriptEnd

VermilionTradeHouseGentlemanText: ; marcelnote - new
	text_far _VermilionTradeHouseGentlemanText
	text_end
