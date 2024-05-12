; marcelnote - new location
CinnabarVolcano1F_Script:
	jp EnableAutoTextBoxDrawing

CinnabarVolcano1F_TextPointers:
	def_text_pointers
	dw_const CinnabarVolcano1FLavaSignText,         TEXT_CINNABARVOLCANO1F_LAVA_SIGN

CinnabarVolcano1FLavaSignText:
	text_far _CinnabarVolcano1FLavaSignText
	text_end
