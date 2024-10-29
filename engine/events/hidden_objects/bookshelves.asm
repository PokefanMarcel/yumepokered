; prints text for bookshelves in buildings without sign events
PrintBookshelfText::
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	jr nz, .checkFacingDown ; was .noMatch
; facing up
	ld a, [wCurMapTileset]
	ld b, a
	lda_coord 8, 7 ; tile above the player, lower left
	ld c, a
	ld hl, BookshelfTileIDs
.loop
	ld a, [hli]
	cp $ff
	jr z, .noMatch
	cp b
	jr nz, .nextBookshelfEntry1
	ld a, [hli]
	cp c
	jr nz, .nextBookshelfEntry2
	ld a, [hl]
	push af
	call EnableAutoTextBoxDrawing
	pop af
	call PrintPredefTextID
	xor a
	ldh [hInteractedWithBookshelf], a
	ret
.nextBookshelfEntry1
	inc hl
.nextBookshelfEntry2
	inc hl
	jr .loop
.noMatch
	ld a, $ff
	ldh [hInteractedWithBookshelf], a
	farjp PrintCardKeyText

.checkFacingDown ; marcelnote - new for facing down bookshelf tiles
	cp SPRITE_FACING_DOWN
	jr nz, .noMatch
	ld a, [wCurMapTileset]
	ld b, a
	lda_coord 8, 11 ; tile below the player, lower left
	ld c, a
	ld hl, BookshelfTileFacingDownIDs
	jr .loop

INCLUDE "data/tilesets/bookshelf_tile_ids.asm"
