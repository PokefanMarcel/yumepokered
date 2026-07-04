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

; Check if the item is visible on screen.
; marcelnote - optimized and fixed coordinates X=0 and Y=0 being ignored
	; set carry flag if:  0 <= playerY - itemY + 4 <= 8,
	;               i.e.  playerY - 4 <= itemY <= playerY + 4
	ld a, [wYCoord]
	sub d
	add 4
	cp 9
	jr nc, .loop
	ld d, a ; d = playerY - itemY + 4
	; set carry flag if:  0 <= playerX - itemX + 5 <= 9,
	;               i.e.  playerX - 4 <= itemX <= playerX + 5
	ld a, [wXCoord]
	sub e
	add 5
	cp 10
	jr nc, .loop

; There is a hidden item nearby, so determine new facing direction.
; marcelnote - added player facing hidden items
	sub 5 ; playerX < itemX ?
	ld b, PLAYER_DIR_LEFT
	jr nc, .gotXdirection
	ld b, PLAYER_DIR_RIGHT
	cpl
	inc a
.gotXdirection
	ld e, a ; e = |playerX - itemX|

	ld a, d
	sub 4 ; playerY < itemY ?
	ld c, PLAYER_DIR_UP
	jr nc, .gotYdirection
	ld c, PLAYER_DIR_DOWN
	cpl
	inc a
.gotYdirection
	ld d, a ; d = |playerY - itemY|

; Choose turning direction.
	or e
	jr z, .gotDirection ; if standing on the item (d = e = 0) then don't move
	ld a, d
	cp e    ; |playerY - itemY| < |playerX - itemX| ?
	ld a, c ; if not then turn in Y-axis direction
	jr nc, .gotDirection
	ld a, b ; if yes then turn in X-axis direction
.gotDirection
	ld [wPlayerMovingDirection], a
	scf
	ret
