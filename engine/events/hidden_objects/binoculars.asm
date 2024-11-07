; marcelnote - all binoculars now handled as hidden objects
Route11GateLeftBinoculars:
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	call EnableAutoTextBoxDrawing
	CheckEvent EVENT_BEAT_ROUTE12_SNORLAX
	jr z, .SnorlaxStillHere
	tx_pre Route11GateLeftBinocularsNoSnorlaxText
	ret
.SnorlaxStillHere
	tx_pre Route11GateLeftBinocularsSnorlaxText
	ret

Route11GateLeftBinocularsSnorlaxText::
	text_far _Route11GateLeftBinocularsSnorlaxText
	text_end

Route11GateLeftBinocularsNoSnorlaxText::
	text_far _Route11GateLeftBinocularsNoSnorlaxText
	text_end

Route11GateRightBinoculars:
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	call EnableAutoTextBoxDrawing
	tx_pre Route11GateRightBinocularsText
	ret

Route11GateRightBinocularsText::
	text_far _Route11GateRightBinocularsText
	text_end

Route12GateLeftBinoculars:
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	call EnableAutoTextBoxDrawing
	tx_pre Route12GateLeftBinocularsText
	ret

Route12GateLeftBinocularsText::
	text_far _Route12GateLeftBinocularsText
	text_end

Route12GateRightBinoculars:
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	call EnableAutoTextBoxDrawing
	tx_pre Route12GateRightBinocularsText
	ret

Route12GateRightBinocularsText::
	text_far _Route12GateRightBinocularsText
	text_end

Route15GateLeftBinoculars:
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	call EnableAutoTextBoxDrawing
	tx_pre Route15GateLeftBinocularsText
	ld a, ARTICUNO
	ld [wCurPartySpecies], a
	call PlayCry
	jp DisplayMonFrontSpriteInBox

Route15GateLeftBinocularsText::
	text_far _Route15GateLeftBinocularsText
	text_end

Route15GateRightBinoculars:
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	call EnableAutoTextBoxDrawing
	tx_pre Route15GateRightBinocularsText
	ret

Route15GateRightBinocularsText::
	text_far _Route15GateRightBinocularsText
	text_end

Route16GateLeftBinoculars:
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	call EnableAutoTextBoxDrawing
	tx_pre Route16GateLeftBinocularsText
	ret

Route16GateLeftBinocularsText::
	text_far _Route16GateLeftBinocularsText
	text_end

Route16GateRightBinoculars:
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	call EnableAutoTextBoxDrawing
	tx_pre Route16GateRightBinocularsText
	ret

Route16GateRightBinocularsText::
	text_far _Route16GateRightBinocularsText
	text_end

Route18GateLeftBinoculars:
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	call EnableAutoTextBoxDrawing
	tx_pre Route18GateLeftBinocularsText
	ret

Route18GateLeftBinocularsText::
	text_far _Route18GateLeftBinocularsText
	text_end

Route18GateRightBinoculars:
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	call EnableAutoTextBoxDrawing
	tx_pre Route18GateRightBinocularsText
	ret

Route18GateRightBinocularsText::
	text_far _Route18GateRightBinocularsText
	text_end

Route22GateLeftBinoculars:
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	call EnableAutoTextBoxDrawing
	tx_pre Route22GateLeftBinocularsText
	ret

Route22GateLeftBinocularsText::
	text_far _Route22GateLeftBinocularsText
	text_end

Route22GateRightBinoculars:
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	call EnableAutoTextBoxDrawing
	tx_pre Route22GateRightBinocularsText
	ret

Route22GateRightBinocularsText::
	text_far _Route22GateRightBinocularsText
	text_end
