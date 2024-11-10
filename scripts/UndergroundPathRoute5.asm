UndergroundPathRoute5_Script:
	ld a, ROUTE_5
	ld [wLastMap], a
	ret

UndergroundPathRoute5_TextPointers:
	def_text_pointers
	dw_const UndergroundPathRoute5LittleGirlText, TEXT_UNDERGROUNDPATHROUTE5_LITTLE_GIRL

UndergroundPathRoute5LittleGirlText: ; marcelnote - optimized
	text_asm
	ld a, TRADE_FOR_SPOT
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd
