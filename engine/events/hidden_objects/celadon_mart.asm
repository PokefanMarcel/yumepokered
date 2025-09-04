; marcelnote - new
PrintCeladonMart3FRPGText:
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	call EnableAutoTextBoxDrawing
	tx_pre_jump CeladonMart3FRPGText

CeladonMart3FRPGText::
	text_far _CeladonMart3FRPGText
	text_end

PrintCeladonMart3FSportsGameText:
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	call EnableAutoTextBoxDrawing
	tx_pre_jump CeladonMart3FSportsGameText

CeladonMart3FSportsGameText::
	text_far _CeladonMart3FSportsGameText
	text_end

PrintCeladonMart3FPuzzleGameText:
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	call EnableAutoTextBoxDrawing
	tx_pre_jump CeladonMart3FPuzzleGameText

CeladonMart3FPuzzleGameText::
	text_far _CeladonMart3FPuzzleGameText
	text_end

PrintCeladonMart3FFightingGameText:
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	call EnableAutoTextBoxDrawing
	tx_pre_jump CeladonMart3FFightingGameText

CeladonMart3FFightingGameText::
	text_far _CeladonMart3FFightingGameText
	text_end
