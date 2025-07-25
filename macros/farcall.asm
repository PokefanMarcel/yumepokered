MACRO callfar
	ld hl, \1
	ld b, BANK(\1)
	rst _Bankswitch
ENDM

MACRO jpfar
	ld hl, \1
	ld b, BANK(\1)
	rst _Bankswitch ; PureRGB: Bankswitch as rst
	ret
ENDM

MACRO homecall
	ldh a, [hLoadedROMBank]
	push af
	ld a, BANK(\1)
	ldh [hLoadedROMBank], a
	ld [rROMB], a
	call \1
	pop af
	ldh [hLoadedROMBank], a
	ld [rROMB], a
ENDM

MACRO homecall_sf ; homecall but save flags by popping into bc instead of af
	ldh a, [hLoadedROMBank]
	push af
	ld a, BANK(\1)
	ldh [hLoadedROMBank], a
	ld [rROMB], a
	call \1
	pop bc
	ld a, b
	ldh [hLoadedROMBank], a
	ld [rROMB], a
ENDM
