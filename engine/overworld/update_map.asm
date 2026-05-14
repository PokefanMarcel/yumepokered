; replaces a tile block with the one specified in [wNewTileBlockID]
; and redraws the map view if necessary
; b = Y, c = X
ReplaceTileBlock:
	call GetPredefRegisters
	call ReplaceTileBlockInOverworldMap ; marcelnote - smarter block replacing
	ret nc
	ld hl, wCurrentMapScriptFlags
	bit BIT_REPLACE_TILE_BLOCK_BATCHING, [hl]
	jr z, RedrawMapView
	set BIT_REDRAW_MAP_VIEW_PENDING, [hl]
	ret

ReplaceTileBlockInOverworldMap: ; marcelnote - smarter block replacing
; returns carry if the replaced block is in the current map view
	ld hl, wOverworldMap
	lb de, 0, MAP_BORDER
	add hl, de ; skip west border
	ld a, [wCurMapWidth]
	add e
	add e   ; a = width of one wOverworldMap row
	ld e, a ; de = row width
	add hl, de ; skip 3 north border rows
	add hl, de
	add hl, de
	ld a, b ; b = Y
	and a
	jr z, .addX
.addWidthYTimesLoop
	add hl, de ; add row width once for each Y
	dec b
	jr nz, .addWidthYTimesLoop
.addX
	add hl, bc ; hl = address of block at (Y, X)
	ld a, [wNewTileBlockID]
	ld [hl], a ; replace the block in wOverworldMap
	ld a, [wCurrentTileBlockMapViewPointer]
	ld c, a
	ld a, [wCurrentTileBlockMapViewPointer + 1]
	ld b, a ; bc = first block address in current map view
	ld d, SCREEN_BLOCK_HEIGHT ; compare against each visible block row
.checkVisibleRow
	call CompareHLWithBC ; if replaced block < visible row start
	jr c, .notVisible    ; then it is before the whole visible area
	push bc ; save bc = address of first visible block in current row
	ld a, c
	add SCREEN_BLOCK_WIDTH
	ld c, a
	jr nc, .noCarry
	inc b
.noCarry   ; bc = address of first invisible block in current row
	call CompareHLWithBC ; if replaced block < visible row end
	pop bc ; restore bc = address of first visible block in current row
	ret c                ; then it is visible, so return carry
	ld a, c
	add e ; move row start down by one map row
	ld c, a
	jr nc, .noCarry2
	inc b
.noCarry2
	dec d
	jr nz, .checkVisibleRow
.notVisible
	and a ; no visible match, so clear carry
	ret

RedrawMapView::
	ld a, [wIsInBattle]
	inc a
	ret z
	ldh a, [hAutoBGTransferEnabled]
	push af
	ldh a, [hTileAnimations]
	push af
	xor a
	ldh [hAutoBGTransferEnabled], a
	ldh [hTileAnimations], a
	call LoadCurrentMapView
	call RunDefaultPaletteCommand
	ld hl, wMapViewVRAMPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, -2 * TILEMAP_WIDTH
	add hl, de
	ld a, h
	and $3
	or HIGH(vBGMap0)
	ld a, l
	ld [wBuffer], a
	ld a, h
	ld [wBuffer + 1], a ; this copy of the address is not used
	ld a, 2
	ldh [hRedrawMapViewRowOffset], a
	ld c, SCREEN_HEIGHT / 2 ; number of rows of 2x2 tiles (this covers the whole screen)
.redrawRowLoop
	push bc
	push hl
	push hl
	ld hl, wTileMap - 2 * SCREEN_WIDTH
	ld de, SCREEN_WIDTH
	ldh a, [hRedrawMapViewRowOffset]
.calcWRAMAddrLoop
	add hl, de
	dec a
	jr nz, .calcWRAMAddrLoop
	call CopyToRedrawRowOrColumnSrcTiles
	pop hl
	ld de, TILEMAP_WIDTH
	ldh a, [hRedrawMapViewRowOffset]
	ld c, a
.calcVRAMAddrLoop
	add hl, de
	ld a, h
	and $3
	or HIGH(vBGMap0)
	dec c
	jr nz, .calcVRAMAddrLoop
	ldh [hRedrawRowOrColumnDest + 1], a
	ld a, l
	ldh [hRedrawRowOrColumnDest], a
	ld a, REDRAW_ROW
	ldh [hRedrawRowOrColumnMode], a
	call DelayFrame
	ld hl, hRedrawMapViewRowOffset
	inc [hl]
	inc [hl]
	pop hl
	pop bc
	dec c
	jr nz, .redrawRowLoop
	pop af
	ldh [hTileAnimations], a
	pop af
	ldh [hAutoBGTransferEnabled], a
	ret

CompareHLWithBC:
	ld a, h
	sub b
	ret nz
	ld a, l
	sub c
	ret
