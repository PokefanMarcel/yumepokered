AnimCut: ; marcelnote - modified cut/boulder dust animation
; This animation always owns OAM entries 36-39, so move those entries directly
; instead of going through the generic battle-animation OAM adjustment helpers.
	ld a, [wCutTile]
	cp $52
	jr z, .grass
	ld b, $8
	ld de, OBJ_SIZE
.cutTreeLoop
	; Move the upper row right and the lower row left.
	ld hl, wShadowOAMSprite36XCoord
	inc [hl]
	add hl, de
	inc [hl]
	ld hl, wShadowOAMSprite38XCoord
	dec [hl]
	add hl, de
	dec [hl]
	ldh a, [rOBP1]
	xor $64
	ldh [rOBP1], a
	call DelayFrame
	dec b
	jr nz, .cutTreeLoop
	ret
.grass
	ld b, 2 ; two spread/drop cycles
.cutGrassLoop
	push bc
	ld b, 2 ; spread, swap, spread back
.cutGrassPhaseLoop
	ld c, 8
.cutGrassSpreadLoop
	; Spread the four leaf sprites outward horizontally.
	ld hl, wShadowOAMSprite36XCoord
	inc [hl]
	ld hl, wShadowOAMSprite37XCoord
	inc [hl]
	inc [hl]
	ld hl, wShadowOAMSprite38XCoord
	dec [hl]
	dec [hl]
	ld hl, wShadowOAMSprite39XCoord
	dec [hl]
	ldh a, [rOBP1]
	xor $64
	ldh [rOBP1], a
	call DelayFrame
	dec c
	jr nz, .cutGrassSpreadLoop
	; Swap left/right pairs so the same four sprites fold back inward next phase.
	push bc
	ld hl, wShadowOAMSprite36
	ld de, wBuffer
	ld bc, 2 * OBJ_SIZE
	call CopyData
	ld hl, wShadowOAMSprite38
	ld de, wShadowOAMSprite36
	ld bc, 2 * OBJ_SIZE
	call CopyData
	ld hl, wBuffer
	ld de, wShadowOAMSprite38
	ld bc, 2 * OBJ_SIZE
	call CopyData
	pop bc
	dec b
	jr nz, .cutGrassPhaseLoop
	ld de, OBJ_SIZE
	ld hl, wShadowOAMSprite36YCoord
	ld c, 4
.moveGrassDownLoop
	; Drop the puff before the second spread cycle.
	inc [hl]
	inc [hl]
	add hl, de
	dec c
	jr nz, .moveGrassDownLoop
	pop bc
	dec b
	jr nz, .cutGrassLoop
	ret
