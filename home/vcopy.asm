; this function seems to be used only once
; it store the address of a row and column of the VRAM background map in hl
; INPUT: h - row, l - column, b - high byte of background tile map address in VRAM
GetRowColAddressBgMap::
	xor a
	srl h
	rra
	srl h
	rra
	srl h
	rra
	or l
	ld l, a
	ld a, b
	or h
	ld h, a
	ret

; clears a VRAM background map with blank space tiles
; INPUT: h - high byte of background tile map address in VRAM
ClearBgMap::
	ld a, ' '
	; fallthrough

FillBgMap:: ; marcelnote - new, fill with character in a
	ld de, TILEMAP_AREA
	ld l, e
.loop
	ld [hli], a
	dec e
	jr nz, .loop
	dec d
	jr nz, .loop
	ret

; This function redraws a BG row of height 2 or a BG column of width 2.
; One of its main uses is redrawing the row or column that will be exposed upon
; scrolling the BG when the player takes a step. Redrawing only the exposed
; row or column is more efficient than redrawing the entire screen.
; However, this function is also called repeatedly to redraw the whole screen
; when necessary. It is also used in trade animation and elevator code.
RedrawRowOrColumn::
	ldh a, [hRedrawRowOrColumnMode]
	and a
	ret z
	ld b, a
	xor a
	ldh [hRedrawRowOrColumnMode], a
	ld hl, wRedrawRowOrColumnSrcTiles
	ldh a, [hRedrawRowOrColumnDest]
	ld e, a
	ldh a, [hRedrawRowOrColumnDest + 1]
	ld d, a
	dec b
	jr nz, .redrawRow
; redraw column
	ld c, SCREEN_HEIGHT
.loopRow
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ld a, TILEMAP_WIDTH - 1
	add e
	ld e, a
	adc d
	sub e
; the following 3 lines wrap us from bottom to top if necessary
	and HIGH(TILEMAP_AREA - 1)
	or HIGH(vBGMap0)
	ld d, a
	dec c
	jr nz, .loopRow
	ret

.redrawRow
	push de
	call .drawHalf ; draw upper half
	pop de
	ld a, TILEMAP_WIDTH
	add e
	ld e, a
	; fallthrough and draw lower half

.drawHalf
	ld c, SCREEN_WIDTH / 2
.loopColumn
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ld a, e
	inc a
; the following 4 lines wrap us from the right edge to the left edge if necessary
	xor e
	and %00011111
	xor e
	ld e, a
	dec c
	jr nz, .loopColumn
	ret

; This function automatically transfers tile number data from the tile map at
; wTileMap to VRAM during V-blank. Note that it only transfers one third of the
; background per V-blank. It cycles through which third it draws.
; This transfer is turned off when walking around the map, but is turned
; on when talking to sprites, battling, using menus, etc. This is because
; the above function, RedrawRowOrColumn, is used when walking to
; improve efficiency.
AutoBgMapTransfer::
	ldh a, [hAutoBGTransferEnabled]
	and a
	ret z
	ld [hSPTemp], sp
	ld sp, hAutoBGTransferDest
	pop hl ; hl = destination base
	ldh a, [hAutoBGTransferPortion]
	and a ; TRANSFERTOP?
	jr z, .transferTopThird
	dec a ; TRANSFERMIDDLE?
	jr z, .transferMiddleThird
; transfer bottom third
	coord sp, 0, 2 * SCREEN_HEIGHT / 3
	ld de, 12 * TILEMAP_WIDTH
	xor a ; TRANSFERTOP
	jr .addAndDoTransfer
.transferTopThird
	coord sp, 0, 0
	inc a ; TRANSFERMIDDLE
	jr .doTransfer
.transferMiddleThird
	coord sp, 0, SCREEN_HEIGHT / 3
	ld de, 6 * TILEMAP_WIDTH
	ld a, TRANSFERBOTTOM
.addAndDoTransfer
	add hl, de
.doTransfer
	ldh [hAutoBGTransferPortion], a ; store next portion
	ld a, SCREEN_HEIGHT / 3
	; fallthrough

TransferBgRows::
	ld bc, TILEMAP_WIDTH - (SCREEN_WIDTH - 1)
.loop
; unrolled loop and using pop for speed
REPT SCREEN_WIDTH / 2 - 1
	pop de
	ld [hl], e
	inc l
	ld [hl], d
	inc l
ENDR
	pop de
	ld [hl], e
	inc l
	ld [hl], d
	add hl, bc
	dec a
	jr nz, .loop
	ld sp, hSPTemp
	pop hl
	ld sp, hl
	ret

; Copies [hVBlankCopyBGNumRows] rows from hVBlankCopyBGSource to hVBlankCopyBGDest.
; If hVBlankCopyBGSource is XX00, the transfer is disabled.
VBlankCopyBgMap::
	ldh a, [hVBlankCopyBGSource] ; doubles as enabling byte
	and a
	ret z
	ld [hSPTemp], sp ; save stack pointer
	ld sp, hVBlankCopyBGSource
	ASSERT hVBlankCopyBGDest == hVBlankCopyBGSource + 2
	pop hl    ; hl = [hVBlankCopyBGSource]
	pop de    ; de = [hVBlankCopyBGDest]
	ld sp, hl ; sp = [hVBlankCopyBGSource]
	ld h, d
	ld l, e   ; hl = [hVBlankCopyBGDest]
	xor a
	ldh [hVBlankCopyBGSource], a ; disable transfer so it doesn't continue next V-blank
	ldh a, [hVBlankCopyBGNumRows]
	jr TransferBgRows


VBlankCopyDouble::
; Copy [hVBlankCopyDoubleSize] 1bpp tiles
; from hVBlankCopyDoubleSource to hVBlankCopyDoubleDest.

; While we're here, convert to 2bpp.
; The process is straightforward:
; copy each byte twice.

	ldh a, [hVBlankCopyDoubleSize]
	and a
	ret z
	ld [hSPTemp], sp
	ld sp, hVBlankCopyDoubleSource
	ASSERT hVBlankCopyDoubleDest == hVBlankCopyDoubleSource + 2
	pop hl    ; hl = [hVBlankCopyDoubleSource]
	pop de    ; de = [hVBlankCopyDoubleDest]
	ld sp, hl ; sp = [hVBlankCopyDoubleSource]
	ld h, d
	ld l, e   ; hl = [hVBlankCopyDoubleDest]

.loop
REPT TILE_SIZE / 4 - 1
	pop de
	ld [hl], e
	inc l
	ld [hl], e
	inc l
	ld [hl], d
	inc l
	ld [hl], d
	inc l
ENDR
	pop de
	ld [hl], e
	inc l
	ld [hl], e
	inc l
	ld [hl], d
	inc l
	ld [hl], d
	inc hl
	dec a
	jr nz, .loop

	ldh [hVBlankCopyDoubleSize], a ; a = 0
	ld [hVBlankCopyDoubleSource], sp
	ld sp, hl
	ld [hVBlankCopyDoubleDest], sp

	ld sp, hSPTemp
	pop hl
	ld sp, hl
	ret


VBlankCopy::
; Copy [hVBlankCopySize] 2bpp tiles (or 16 * [hVBlankCopySize] tile map entries)
; from hVBlankCopySource to hVBlankCopyDest.

; Source and destination addresses are updated,
; so transfer can continue in subsequent calls.

	ldh a, [hVBlankCopySize]
	and a
	ret z
	ld [hSPTemp], sp
	ld sp, hVBlankCopySource
	ASSERT hVBlankCopyDest == hVBlankCopySource + 2
	pop hl    ; hl = [hVBlankCopySource]
	pop de    ; de = [hVBlankCopyDest]
	ld sp, hl ; sp = [hVBlankCopySource]
	ld h, d
	ld l, e   ; hl = [hVBlankCopyDest]

.loop
REPT TILE_SIZE / 2 - 1
	pop de
	ld [hl], e
	inc l
	ld [hl], d
	inc l
ENDR
	pop de
	ld [hl], e
	inc l
	ld [hl], d
	inc hl
	dec a
	jr nz, .loop

	ldh [hVBlankCopySize], a ; a = 0
	ld [hVBlankCopySource], sp
	ld sp, hl
	ld [hVBlankCopyDest], sp

	ld sp, hSPTemp
	pop hl
	ld sp, hl
	ret


UpdateMovingBgTiles:: ; marcelnote - moved this to its own file, added more animations
; Animate water and flower tiles in the overworld.
	jpfar AnimateTiles
