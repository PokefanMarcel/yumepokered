; marcelnote - Pikachu Surfing minigame
LCDC::
	push af
	ldh a, [hRedrawMapViewRowOffset] ; doubles as enabling byte
	and a
	jr z, .noLCDCInterrupt
	push bc
	push hl
	push de
	; [wLYOverrides + [rLY]] --> [$FF00 + [hRedrawMapViewRowOffset]]
	ldh a, [rLY]
	ld e, a
	ld d, $0
	ld hl, wLYOverrides
	add hl, de
	ld a, [hl]
	ld b, a
	ld d, $ff
	ldh a, [hRedrawMapViewRowOffset]
	ld e, a
	ld a, b
	ld [de], a
	pop de
	pop hl
	pop bc
.noLCDCInterrupt
	pop af
	reti
