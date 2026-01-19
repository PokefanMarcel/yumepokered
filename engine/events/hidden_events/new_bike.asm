PrintNewBikeText:
	call EnableAutoTextBoxDrawing
	tx_pre_jump NewBicycleText

NewBicycleText::
	text_far _NewBicycleText
	text_end

PrintNewSurfboardText:  ; marcelnote - new for Mandarin Surf Shop
	call EnableAutoTextBoxDrawing
	tx_pre_jump NewSurfboardText

NewSurfboardText:: ; marcelnote - new for Mandarin Surf Shop
	text_far _NewSurfboardText
	text_end
