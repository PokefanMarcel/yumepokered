HiddenItemNear: ; marcelnote - optimized
	ld hl, HiddenItemCoords
	ld b, 0
.loop
	ld de, 3
	ld a, [wCurMap]
	call IsInRestOfArray
	ret nc ; return if current map has no more hidden items
	push bc
	push hl
	ld hl, wObtainedHiddenItemsFlags
	ld c, b
	ld b, FLAG_TEST
	predef FlagActionPredef
	ld a, c
	pop hl
	pop bc
	inc b
	and a ; has the item already be obtained?
	inc hl
	ld a, [hli]
	ld d, a ; item's Y coord
	ld a, [hli]
	ld e, a ; item's X coord
	jr nz, .loop ; if the item has already been obtained
; check if the item is within 4-5 tiles (depending on the direction of item)
; marcelnote - optimized and fixed coordinates X=0 and Y=0 being ignored
	; set carry flag if:  0 <= playerY - itemY + 4 <= 8,
	;               i.e.  playerY - 4 <= itemY <= playerY + 4
	ld a, [wYCoord]
	sub d
	add 4
	cp 9
	jr nc, .loop
	; set carry flag if:  0 <= playerX - itemX + 5 <= 9,
	;               i.e.  playerX - 4 <= itemX <= playerX + 5
	ld a, [wXCoord]
	sub e
	add 5
	cp 10
	jr nc, .loop
	ret ; carry flag set
