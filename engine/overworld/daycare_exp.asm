IncrementDayCareMonExp:
	ld a, [wDayCareInUse]
	and a
	ret z
	ld hl, wDayCareMonExp + 2
	inc [hl]
	ret nz
	dec hl
	inc [hl]
	ret nz
	dec hl
	inc [hl]
	ld a, [hl]
	cp $50
	ret c
	ld [hl], $50
	ret

IncrementMtMoonSquareClefairyCounter: ; marcelnote - Mt Moon Square Clefairy spawn
	CheckHideShow TOGGLE_MT_MOON_SQUARE_CLEFAIRY
	ret z ; Clefairy is already spawned.
	ld a, [wStepCounter]
	and $3f ; every 64 steps (without map reload)
	ret nz
	ld a, [wMtMoonSquareClefairyCounter]
	inc a
	ret z
	ld [wMtMoonSquareClefairyCounter], a
	ret
