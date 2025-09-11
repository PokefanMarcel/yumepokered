; marcelnote - refactored and moved to home to remove compression
; Turns 2bpp 32×32px picture (4x4 tiles) at DE
; into 2bpp 64x56px (8×7 tiles) picture at sSpriteBuffer0.
; The rightmost 4px are ignored in the last column,
; but not the bottom-most 4px in the last row for simplicity (could be optimized).
ScaleSpriteByTwo::
	ldh a, [hLoadedROMBank]
	push af
	ld a, b
	ldh [hLoadedROMBank], a
	ld [rROMB], a

	ld hl, sSpriteBuffer0
	ld b, 4 ; copy 4 rows of tiles from the original 2bpp (32px)

.copyRows
	push bc ; save b = number of rows left
	ld b, 3 ; scale 3 consecutive tiles (plus half of 1)

.copyTileRow
	push de ; save address for right nibble pass
	ld c, 4 ; duplicate 4 rows of pixels

.copyNorthWestQuadrant
	call .duplicateLeft4Pixels
	dec c
	jr nz, .copyNorthWestQuadrant

	pop de  ; restore address for right nibble pass
	ld c, 4 ; duplicate 4 rows of pixels

.copyNorthEastQuadrant
	call .duplicateRight4Pixels
	dec c
	jr nz, .copyNorthEastQuadrant

	; now DE points to the 5th row of the original picture tile
	; but in the final picture, this will be on the second row of tiles
	; so HL needs to skip 5 tiles
	ld a, b
	ld bc, 5 tiles
	add hl, bc ; skip 5 tiles
	ld b, a

	push de ; save address for right nibble pass
	ld c, 4 ; duplicate 4 rows of pixels

.copySouthWestQuadrant
	call .duplicateLeft4Pixels
	dec c
	jr nz, .copySouthWestQuadrant

	pop de  ; restore address for right nibble pass
	ld c, 4 ; duplicate 4 rows of pixels

.copySouthEastQuadrant
	call .duplicateRight4Pixels
	dec c
	jr nz, .copySouthEastQuadrant

	ld a, b
	ld bc, -7 tiles
	add hl, bc ; go back 7 tiles
	ld b, a

	dec b
	jr nz, .copyTileRow

; now we've scaled 3 tiles, we need to scale left half of one
	ld c, 4 ; duplicate 4 rows of pixels

.copyLastNorthWestQuadrant
	call .duplicateLeft4Pixels
	dec c
	jr nz, .copyLastNorthWestQuadrant

	ld bc, 6 tiles
	add hl, bc ; skip 6 tiles

	ld c, 4 ; duplicate 4 rows of pixels

.copyLastSouthWestQuadrant
	call .duplicateLeft4Pixels
	dec c
	jr nz, .copyLastSouthWestQuadrant

	pop bc
	dec b
	jr nz, .copyRows

	pop af
	ldh [hLoadedROMBank], a
	ld [rROMB], a
	ret


.duplicateLeft4Pixels
	; Least significant byte, left nibble
	ld a, [de]
	swap a
	and $0F
	call .duplicateBitsInNibble
	ld [hli], a ; duplicate horizontally
	inc hl
	ld [hld], a ; duplicate vertically
	; Most significant byte, left nibble
	inc de
	ld a, [de]
	swap a
	and $0F
	call .duplicateBitsInNibble
	ld [hli], a ; duplicate horizontally
	inc hl
	ld [hli], a ; duplicate vertically
	inc de
	ret

.duplicateRight4Pixels
	; Least significant byte, right nibble
	ld a, [de]
	and $0F
	call .duplicateBitsInNibble
	ld [hli], a ; duplicate horizontally
	inc hl
	ld [hld], a ; duplicate vertically
	; Most significant byte, right nibble
	inc de
	ld a, [de]
	and $0F
	call .duplicateBitsInNibble
	ld [hli], a ; duplicate horizontally
	inc hl
	ld [hli], a ; duplicate vertically
	inc de
	ret

.duplicateBitsInNibble
	push hl
	ld hl, DuplicateBitsTable
	add l
	ld l, a
	jr nc, .noCarry
	inc h
.noCarry
	ld a, [hl]
	pop hl
	ret


; repeats each input bit twice, e.g. DuplicateBitsTable[%0101] = %00110011
DuplicateBitsTable:
FOR n, 16
	db (n & 1) * 3 + (n & 2) * 6 + (n & 4) * 12 + (n & 8) * 24
ENDR
