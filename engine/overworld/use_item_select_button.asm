; marcelnote - adapted from PureRGB and shinpokered
UseSelectButtonItem::
	ld a, [wSelectButtonItem] ; options are BICYCLE, TOWN_MAP, *_ROD, ITEMFINDER, POKE_FLUTE
;	ld a, TOWN_MAP
	and a
	ret z ; if NO_ITEM associated, do nothing
	ld b, a
	call IsItemInBag
	ret z ; if associated item is not in bag, do nothing

	; initialize a text box without drawing anything special
	ld a, 1
	ld [wAutoTextBoxDrawingControl], a
	callfar DisplayTextIDInit

	ld a, [wSelectButtonItem]
;	ld a, TOWN_MAP
	ld [wCurItem], a	      ; load item to be used
	ld [wNamedObjectIndex], a ; load item so its name can be grabbed
	call GetItemName	      ; get the item name into de register
	call CopyToStringBuffer
	call UseItem

	; load $FF into hTextID to make DisplayTextID close the text box
	ld a, $FF
	ldh [hTextID], a
	jp DisplayTextID

CheckIfSelectItem:: ; sets z flag if item in [wCurItem] cannot be associated with Select button
	ld hl, SelectItemsList
	ld a, [wCurItem]
	ld de, 1 ; size of array entries
	jp IsInArray ; return carry if found

SelectItemsList:
	db BICYCLE
	db TOWN_MAP
	db OLD_ROD
	db GOOD_ROD
	db SUPER_ROD
	db ITEMFINDER
	db POKE_FLUTE
	db -1