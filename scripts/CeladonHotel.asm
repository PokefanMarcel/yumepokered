CeladonHotel_Script:
	jp EnableAutoTextBoxDrawing

CeladonHotel_TextPointers:
	def_text_pointers
	dw_const CeladonHotelGrannyText,    TEXT_CELADONHOTEL_GRANNY
	dw_const CeladonHotelBeautyText,    TEXT_CELADONHOTEL_BEAUTY
	dw_const CeladonHotelSuperNerdText, TEXT_CELADONHOTEL_SUPER_NERD
	dw_const CeladonHotelBenchGuyText,  TEXT_CELADONHOTEL_BENCH_GUY ; marcelnote - BenchGuy has a sprite

CeladonHotelGrannyText:
	text_far _CeladonHotelGrannyText
	text_end

CeladonHotelBeautyText:
	text_far _CeladonHotelBeautyText
	text_end

CeladonHotelSuperNerdText:
	text_far _CeladonHotelSuperNerdText
	text_end

CeladonHotelBenchGuyText: ; marcelnote - BenchGuy has a sprite
	text_far _CeladonHotelBenchGuyText
	text_end
