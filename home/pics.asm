; marcelnote - refactored to remove sprite compression
; Assumes the monster's attributes have been loaded with GetMonHeader.
; Copies the Mon front sprite from ROM to de in VRAM (typically vFrontPic but not always).
LoadMonFrontSprite::
	push de
	ld a, [wMonHPicBank]
	ld b, a
	ld hl, wMonHFrontSprite + 1
	ld a, [hld]
	ld d, a
	ld a, [hld]
	ld e, a    ; de = Pic address
	ld a, [wSpriteFlipped]
	and a
	jr nz, .flipped
	ld a, [hl] ; wMonHSpriteDim
	cp $77
	jr nz, .notLargePic
	; large pics ship directly to VRAM
	pop hl ; hl = destination address, e.g. vFrontPic
	ld c, 7 * 7
	jp CopyVideoData

.notLargePic
; small and medium pics are first centered in the SRAM sprite buffer
	xor a
	ld [rRAMB], a
	ld a, RAMG_SRAM_ENABLE
	ld [rRAMG], a

	ldh a, [hLoadedROMBank]
	push af
	ld a, b
	ldh [hLoadedROMBank], a
	ld [rROMB], a

	xor a
	ld hl, sSpriteBuffer0
	ld bc, 2 * SPRITEBUFFERSIZE
	call FillMemory ; clear sprite buffers 0 and 1, preserves a

	ld a, [wMonHSpriteDim]
	cp $55
	jr z, .smallPic
; medium pic, dim = $66
	ld hl, sSpriteBuffer0 + (7 + 1) tiles ; skip one row and one column
	ld b, 6 ; copy 6 rows of tiles
.loopMedium
	push bc
	ld bc, 6 tiles ; copy 6 tiles
	call CopyDataDEtoHL ; Copy bc bytes from de to hl.
	ld bc, 1 tiles
	add hl, bc ; skip 1 tile
	pop bc
	dec b
	jr nz, .loopMedium
	jr .sendSpriteBufferToVRAM

.smallPic
	ld hl, sSpriteBuffer0 + (7 * 2 + 1) tiles ; skip two rows and one column
	ld b, 5 ; copy 5 rows of tiles
.loopSmall
	push bc
	ld bc, 5 tiles ; copy 5 tiles
	call CopyDataDEtoHL ; Copy bc bytes from de to hl.
	ld bc, 2 tiles
	add hl, bc ; skip 2 tiles
	pop bc
	dec b
	jr nz, .loopSmall
	; fallthrough

.sendSpriteBufferToVRAM
	pop af
	ldh [hLoadedROMBank], a
	ld [rROMB], a
	ld b, a

	pop hl ; hl = destination address, e.g. vFrontPic
	ld de, sSpriteBuffer0
	ld c, 7 * 7
	call CopyVideoData

	xor a
	ld [rRAMG], a
	ret

.flipped
	xor a
	ld [rRAMB], a
	ld a, RAMG_SRAM_ENABLE
	ld [rRAMG], a

	ldh a, [hLoadedROMBank]
	push af
	ld a, b
	ldh [hLoadedROMBank], a
	ld [rROMB], a

	ld a, [hl] ; wMonHSpriteDim
	cp $77
	jr nz, .flippedNotLargePic
	; flipped large pic
	ld hl, sSpriteBuffer0 + 6 tiles
	ld b, 7 ; copy 7 rows of tiles
.loopFlippedLarge
	push bc
	ld c, 7 ; copy 7 tiles
	call CopyFlippedRow ; copy c flipped tiles from de to hl (hl goes backwards)
	ld bc, 2 * 7 tiles  ; hl goes to the last tile of the next tile row
	add hl, bc
	pop bc
	dec b
	jr nz, .loopFlippedLarge
	jr .sendSpriteBufferToVRAM

.flippedNotLargePic
	xor a
	ld hl, sSpriteBuffer0
	ld bc, 2 * SPRITEBUFFERSIZE
	call FillMemory ; clear sprite buffers 0 and 1, preserves a

	ld a, [wMonHSpriteDim]
	cp $55
	jr z, .flippedSmallPic

	ld hl, sSpriteBuffer0 + (7 + 5) tiles ; skip one row
	ld b, 6 ; copy 6 rows of tiles
.loopFlippedMedium
	push bc
	ld c, 6 ; copy 6 tiles
	call CopyFlippedRow ; copy c flipped tiles from de to hl (hl goes backwards)
	ld bc, (7 + 6) tiles  ; hl goes to the last tile of the next tile row
	add hl, bc
	pop bc
	dec b
	jr nz, .loopFlippedMedium
	jr .sendSpriteBufferToVRAM

.flippedSmallPic
	ld hl, sSpriteBuffer0 + (2 * 7 + 5) tiles ; skip two rows
	ld b, 5 ; copy 5 rows of tiles
.loopFlippedSmall
	push bc
	ld c, 5 ; copy 5 tiles
	call CopyFlippedRow ; copy c flipped tiles from de to hl (hl goes backwards)
	ld bc, (7 + 5) tiles  ; hl goes to the last tile of the next tile row
	add hl, bc
	pop bc
	dec b
	jr nz, .loopFlippedSmall
	jr .sendSpriteBufferToVRAM


; Copies c flipped tiles from de to hl (hl goes backwards).
CopyFlippedRow:
	push bc
	ld b, $10 ; $10 = 16 bytes in a tile
.loopTile
	ld a, [de]
	inc de
	call ReverseByte ; flips a, preserves hl, bc, de
	ld [hli], a
	dec b
	jr nz, .loopTile
	ld bc, -2 tiles
	add hl, bc
	pop bc
	dec c
	jr nz, CopyFlippedRow
	ret


; Reverses byte in a, for instance: %01010011 -> %11001010
ReverseByte:
	push hl
	push bc
	ld b, a
	and $0F
	jr z, .emptyNybble1 ; no need to reverse empty nybbles
	; reverse nybble a (inlined ReverseNybble)
	ld hl, NybbleReverseTable
	add l
	ld l, a
	jr nc, .noCarry1
	inc h
.noCarry1
	ld a, [hl]
.emptyNybble1
	ld c, a
	swap c ; c holds the first reversed nybble
	ld a, b
	swap a
	and $0F
	jr z, .emptyNybble2 ; no need to reverse empty nybbles
	; reverse nybble a (inlined ReverseNybble)
	ld hl, NybbleReverseTable
	add l
	ld l, a
	jr nc, .noCarry2
	inc h
.noCarry2
	ld a, [hl]
.emptyNybble2
	or c
	pop bc
	pop hl
	ret

; maps each nybble to its reverse
NybbleReverseTable::
	db $0, $8, $4, $c, $2, $a, $6, $e, $1, $9, $5, $d, $3, $b, $7, $f
