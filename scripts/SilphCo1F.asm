SilphCo1F_Script:
	jp EnableAutoTextBoxDrawing ; marcelnote - removed script to show Receptionist

SilphCo1F_TextPointers:
	def_text_pointers
	dw_const SilphCo1FLinkReceptionistText, TEXT_SILPHCO1F_LINK_RECEPTIONIST

SilphCo1FLinkReceptionistText:
	text_far _SilphCo1FLinkReceptionistText
	text_end
