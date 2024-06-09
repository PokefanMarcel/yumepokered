; marcelnote - merged Route11Gate floors
Route22Gate3F_Script:
	jp EnableAutoTextBoxDrawing

Route22Gate3F_TextPointers:
	def_text_pointers
	dw_const Route22Gate3FReceptionistText, TEXT_ROUTE22GATE3F_RECEPTIONIST

Route22Gate3FReceptionistText:
	text_far _Route22Gate3FReceptionistText
	text_end
