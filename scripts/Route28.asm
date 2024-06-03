; marcelnote - new location
Route28_Script:
	jp EnableAutoTextBoxDrawing

Route28_TextPointers:
	def_text_pointers
	dw_const Route28SignText, TEXT_ROUTE28_SIGN

Route28SignText:
	text_far _Route28SignText
	text_end
