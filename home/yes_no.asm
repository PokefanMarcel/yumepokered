; displays yes/no choice
; yes -> set carry
YesNoChoice::
	call SaveScreenTilesToBuffer1
	xor a ; YES_NO_MENU
	hlcoord 14, 7
	lb bc, 8, 15
	jr DisplayYesNoChoice

;WideYesNoChoice:: ; unreferenced ; marcelnote - removed
;	call SaveScreenTilesToBuffer1
;	ld a, WIDE_YES_NO_MENU
;	hlcoord 12, 7
;	lb bc, 8, 13
;	jr DisplayYesNoChoice

YesNoChoicePokeCenter::
	call SaveScreenTilesToBuffer1
	ld a, HEAL_CANCEL_MENU
	hlcoord 11, 6
	lb bc, 8, 12
	; fallthrough

DisplayYesNoChoice::
	ld [wTwoOptionMenuID], a
	ld a, TWO_OPTION_MENU
	ld [wTextBoxID], a
	call DisplayTextBoxID
	jp LoadScreenTilesFromBuffer1
