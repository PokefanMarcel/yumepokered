IndigoPlateauStatues::
	text_asm
	ld hl, IndigoPlateauStatuesText1
	call PrintText
	ld a, [wXCoord]
	bit 0, a ; even or odd?
	ld hl, IndigoPlateauStatuesText2
	jr nz, .ok
	ld hl, IndigoPlateauStatuesText3
.ok
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

IndigoPlateauStatuesText1:
	text_far _IndigoPlateauStatuesText1
	text_end

IndigoPlateauStatuesText2:
	text_far _IndigoPlateauStatuesText2
	text_end

IndigoPlateauStatuesText3:
	text_far _IndigoPlateauStatuesText3
	text_end
