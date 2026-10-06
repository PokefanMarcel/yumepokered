; displays yes/no choice
; Yes clears carry; No or B sets carry.
YesNoChoice::
	ld a, YES_NO_MENU
	ld [wTextBoxID], a
	hlcoord 14, 7
	jp DisplayTextBoxID

YesNoChoicePokeCenter::
	call SaveScreenTilesToBuffer1
	ld a, HEAL_CANCEL_MENU
	hlcoord 11, 7
	; fallthrough

DisplayYesNoChoice::
	ld [wTextBoxID], a
	call DisplayTextBoxID
	call LoadScreenTilesFromBuffer1
	ld a, [wChoiceMenuFlags]
	bit BIT_CHOICE_BACKUP_TILES, a
	ret nz ; local restoration already updated sprites
	jp UpdateSprites ; wider choices update sprites after the full-screen restore
