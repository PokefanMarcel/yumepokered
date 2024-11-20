; marcelnote - new location
OrangeRoute1_Script:
	jp EnableAutoTextBoxDrawing

OrangeRoute1_TextPointers:
	def_text_pointers
	dw_const OrangeRoute1SignLabText, TEXT_ORANGEROUTE1_SIGN_LAB

OrangeRoute1SignLabText:
	text_far _OrangeRoute1SignLabText
	text_end
