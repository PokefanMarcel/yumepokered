; INPUT:
; a = oam block index (each block is 4 oam entries)
; b = Y coordinate of upper left corner of sprite
; c = X coordinate of upper left corner of sprite
; de = base address of 4 tile number and attribute pairs
WriteOAMBlock:: ; marcelnote - small optim
	ld h, HIGH(wShadowOAM)
	swap a ; multiply by 16
	ld l, a
	call .writeOneEntry ; upper left
	ld a, c
	add 8
	ld c, a
	call .writeOneEntry ; upper right
	ld a, c
	sub 8
	ld c, a
	ld a, b
	add 8
	ld b, a
	call .writeOneEntry ; lower left
	ld a, c
	add 8
	ld c, a
	                    ; lower right
.writeOneEntry
	ld a, b ; Y coordinate
	ld [hli], a
	ld a, c ; X coordinate
	ld [hli], a
	ld a, [de] ; tile number
	inc de
	ld [hli], a
	ld a, [de] ; attribute
	inc de
	ld [hli], a
	ret
