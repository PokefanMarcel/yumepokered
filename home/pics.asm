; marcelnote - refactored to remove sprite compression
; Assumes the monster's attributes have been loaded with GetMonHeader.
; Copies the Mon front sprite from ROM to de in VRAM (typically vFrontPic but not always).
LoadMonFrontPic::
	push de
	ld hl, wMonHFrontPicDim
	ld a, [hli] ; hl = wMonHPics
	ld d, a     ; d = sprite dim in tiles
	ld a, [hli]
	ld h, [hl]
	ld l, a     ; hl = address of Mon pics, e.g. BulbasaurPics
	ld bc, BulbasaurPicFront - BulbasaurPics
	add hl, bc  ; skip back pics
	ld a, [wOptions]
	and SPRITE_STYLE_MASK
	jr z, .gotPicAddress
	rra
	rra
	ld c, a ; c = 1 (Yellow) or 2 (Green)
	; multiply d by 16 to get sprite dim in bytes
	swap d
	ld a, d
	and $f0
	ld e, a
	xor d
	ld d, a ; de = sprite dim in bytes
	add hl, de
	dec c
	jr z, .gotPicAddress
	add hl, de ; for Green sprites
.gotPicAddress
	ld d, h
	ld e, l ; de = pic address
	ld a, [wMonHPicBank]
	ld b, a
	ld a, [wSpriteFlipped]
	and a
	jr nz, .flipped
	ld a, [wMonHFrontPicDim]
	cp 7 * 7
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

	ld a, [wMonHFrontPicDim]
	cp 5 * 5
	jr z, .smallPic
; medium pic, dim = 6 * 6
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

	ld a, [wMonHFrontPicDim]
	cp 7 * 7
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

	ld a, [wMonHFrontPicDim]
	cp 5 * 5
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

	; reverse byte in a, for instance: %01010011 -> %11001010 ; from Polished Crystal
	and a
	jr z, .skip
	; rearrange alternating bits
	ld c, a     ; abcdefgh
	rlca
	rlca        ; cdefghab
	xor c
	and $aa     ; 10101010
	xor c       ; cbedgfah
	; rearrange bit pairs, then rotate into reversed order
	ld c, a     ; cbedgfah
	swap c      ; c = gfahcbed
	xor c
	and $33     ; 00110011
	xor c       ; gfedcbah
	rrca        ; hgfedcba
.skip

	ld [hli], a
	dec b
	jr nz, .loopTile
	ld bc, -2 tiles
	add hl, bc
	pop bc
	dec c
	jr nz, CopyFlippedRow
	ret


CenterHiResSprite::
	ldh a, [hLoadedROMBank]
	push af
	ld a, b
	ldh [hLoadedROMBank], a
	ld [rROMB], a

	xor a
	ld hl, sSpriteBuffer0
	ld bc, 2 * SPRITEBUFFERSIZE
	call FillMemory ; clear sprite buffers 0 and 1, preserves a

	ld hl, sSpriteBuffer0 + (7 + 1) tiles ; skip one row and one column
	ld b, 6 ; copy 6 rows of tiles
.loop
	push bc
	ld bc, 6 tiles ; copy 6 tiles
	call CopyDataDEtoHL ; Copy bc bytes from de to hl.
	ld bc, 1 tiles
	add hl, bc ; skip 1 tile
	pop bc
	dec b
	jr nz, .loop

	pop af
	ldh [hLoadedROMBank], a
	ld [rROMB], a
	ret
