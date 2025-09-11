_ScrollTrainerPicAfterBattle:
; Load the enemy trainer's pic and scrolls it into
; the screen from the right.
	xor a
	ld [wEnemyMonSpecies2], a
	ld b, SET_PAL_BATTLE
	call RunPaletteCommand
	callfar _LoadTrainerPic
	hlcoord 19, 0
	ld c, 1
.scrollLoop
	ld d, $0
	push bc
	push hl
.drawTrainerPicLoop
	ld a, d
	call DrawTrainerPicColumn
	inc hl ; move hl to next column
	inc d
	dec c
	jr nz, .drawTrainerPicLoop
	ld c, 4
	call DelayFrames
	pop hl
	dec hl ; we'll do one more column on the next pass
	pop bc
	inc c
	ld a, c
	cp 7
	jr nz, .scrollLoop
	ret

; write one 7-tile column of the trainer pic to the tilemap
DrawTrainerPicColumn:
	push hl
	push bc
	ld e, 7
	ld bc, SCREEN_WIDTH
.loop
	ld [hl], a
	add 7      ; move a to tile below
	add hl, bc ; move hl to tile below
	dec e
	jr nz, .loop
	pop bc
	pop hl
	ret
