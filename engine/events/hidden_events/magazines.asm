PrintMagazinesText:
	call EnableAutoTextBoxDrawing
	tx_pre_jump MagazinesText

MagazinesText::
	text_far _MagazinesText
	text_end
