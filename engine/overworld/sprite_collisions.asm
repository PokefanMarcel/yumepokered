_UpdateSprites:: ; marcelnote - optimized
	push de
	ld h, HIGH(wSpriteStateData2)
	xor a
.spriteLoop
	ld c, a
	ldh [hCurrentSpriteOffset], a
	add SPRITESTATEDATA2_IMAGEBASEOFFSET
	ld l, a
	ld a, [hl]
	and a
	jr z, .skipSprite   ; tests SPRITESTATEDATA2_IMAGEBASEOFFSET
	push hl
	push bc
	call .updateCurrentSprite
	pop bc
	pop hl
.skipSprite
	ld a, c
	add $10             ; move to next sprite
	jr nz, .spriteLoop  ; back at beginning?
	pop de
	ret

.updateCurrentSprite
	dec a
	jr nz, UpdateNonPlayerSprite
	jp UpdatePlayerSprite


UpdateNonPlayerSprite:
	swap a
	ldh [hTilePlayerStandingOn], a  ; $10 * sprite#
	ld a, [wNPCMovementScriptSpriteOffset] ; some sprite offset?
	ld b, a
	ldh a, [hCurrentSpriteOffset]
	cp b
	jr nz, .unequal
	jp DoScriptedNPCMovement
.unequal
	jp UpdateNPCSprite

; This detects if the current sprite (whose offset is at hCurrentSpriteOffset)
; is going to collide with another sprite by looping over the other sprites.
; The current sprite's offset will be labelled with i (e.g. i#SPRITESTATEDATA1_PICTUREID).
; The loop sprite's offset will labelled with j (e.g. j#SPRITESTATEDATA1_PICTUREID).
;
; Note that the Y coordinate of the sprite (in [k#SPRITESTATEDATA1_YPIXELS])
; is one of the following 9 values when the sprite is aligned with the grid:
; $fc, $0c, $1c, $2c, ..., $7c.
; The reason that 4 is added below to the coordinate is to make it align with a
; multiple of $10 to make comparisons easier.
DetectCollisionBetweenSprites:
	nop

	ld h, HIGH(wSpriteStateData1)
	ldh a, [hCurrentSpriteOffset]
	add LOW(wSpriteStateData1)
	ld l, a

	ld a, [hl] ; a = [i#SPRITESTATEDATA1_PICTUREID] (0 if slot is unused)
	and a ; is this sprite slot slot used?
	ret z ; return if not used

	ld a, l
	add 3
	ld l, a

	ld a, [hli] ; a = [i#SPRITESTATEDATA1_YSTEPVECTOR] (-1, 0, or 1)
	call SetSpriteCollisionValues

	ld a, [hli] ; a = [i#SPRITESTATEDATA1_YPIXELS]
	add 4 ; align with multiple of $10

; The effect of the following 3 lines is to
; add 7 to a if moving south or
; subtract 7 from a if moving north.
	add b
	and $f0
	or c

	ldh [hCollidingSpriteTempYValue], a ; y adjusted for direction of movement

	ld a, [hli] ; a = [i#SPRITESTATEDATA1_XSTEPVECTOR] (-1, 0, or 1)
	call SetSpriteCollisionValues
	ld a, [hl] ; a = [i#SPRITESTATEDATA1_XPIXELS]

; The effect of the following 3 lines is to
; add 7 to a if moving east or
; subtract 7 from a if moving west.
	add b
	and $f0
	or c

	ldh [hCollidingSpriteTempXValue], a ; x adjusted for direction of movement

	ld a, l
	add 7
	ld l, a

	xor a
	ld [hld], a ; zero [i#SPRITESTATEDATA1_0D] XXX what's this for?
	ld [hld], a ; zero [i#SPRITESTATEDATA1_COLLISIONDATA]

	ldh a, [hCollidingSpriteTempXValue]
	ld [hld], a ; [i#SPRITESTATEDATA1_XADJUSTED]
	ldh a, [hCollidingSpriteTempYValue]
	ld [hl], a ; [i#SPRITESTATEDATA1_YADJUSTED]

	xor a ; zero the loop counter

.loop
	ldh [hCollidingSpriteOffset], a
	swap a
	ld e, a
	ldh a, [hCurrentSpriteOffset]
	cp e ; does the loop sprite match the current sprite?
	jp z, .next ; go to the next sprite if they match

	ld d, h
	ld a, [de] ; a = [j#SPRITESTATEDATA1_PICTUREID] (0 if slot is unused)
	and a ; is this sprite slot slot used?
	jp z, .next ; go the next sprite if not used

	inc e
	inc e
	ld a, [de] ; a = [j#SPRITESTATEDATA1_IMAGEINDEX] ($ff means the sprite is offscreen)
	inc a
	jp z, .next ; go the next sprite if offscreen

	ldh a, [hCurrentSpriteOffset]
	add 10
	ld l, a

	inc e
	ld a, [de] ; a = [j#SPRITESTATEDATA1_YSTEPVECTOR]
	call SetSpriteCollisionValues

	inc e
	ld a, [de] ; a = [j#SPRITESTATEDATA1_YPIXELS]
	add 4 ; align with multiple of $10

; The effect of the following 3 lines is to
; add 7 to a if moving south or
; subtract 7 from a if moving north.
	add b
	and $f0
	or c

	sub [hl] ; subtract [i#SPRITESTATEDATA1_YADJUSTED] from [j#SPRITESTATEDATA1_YADJUSTED]

; calculate the absolute value of the difference to get the distance
	jr nc, .noCarry1
	cpl
	inc a
.noCarry1
	ldh [hCollidingSpriteTempYValue], a ; store the distance between the two sprites' adjusted Y values

; Use the carry flag set by the above subtraction to determine which sprite's
; Y coordinate is larger. This information is used later to set
; [i#SPRITESTATEDATA1_COLLISIONDATA].
; The following 5 lines set the lowest 2 bits of c, which are later shifted left by 2.
; If sprite i's Y is larger, set lowest 2 bits of c to 10.
; If sprite j's Y is larger or both are equal, set lowest 2 bits of c to 01.
	push af
	rl c
	pop af
	ccf
	rl c

; If sprite i's delta Y is 0, then b = 7, else b = 9.
	ld b, 7
	ld a, [hl] ; a = [i#SPRITESTATEDATA1_YADJUSTED]
	and $f
	jr z, .next1
	ld b, 9

.next1
	ldh a, [hCollidingSpriteTempYValue] ; a = distance between adjusted Y coordinates
	sub b
	ldh [hCollidingSpriteAdjustedDistance], a
	ld a, b
	ldh [hCollidingSpriteTempYValue], a ; store 7 or 9 depending on sprite i's delta Y
	jr c, .checkXDistance

; If sprite j's delta Y is 0, then b = 7, else b = 9.
	ld b, 7
	dec e
	ld a, [de] ; a = [j#SPRITESTATEDATA1_YSTEPVECTOR]
	inc e
	and a
	jr z, .next2
	ld b, 9

.next2
	ldh a, [hCollidingSpriteAdjustedDistance]
	sub b ; adjust distance using sprite j's direction
	jr z, .checkXDistance
	jr nc, .next ; go to next sprite if distance is still positive after both adjustments

.checkXDistance
	inc e
	inc l
	ld a, [de] ; a = [j#SPRITESTATEDATA1_XSTEPVECTOR]

	push bc

	call SetSpriteCollisionValues
	inc e
	ld a, [de] ; a = [j#SPRITESTATEDATA1_XPIXELS]

; The effect of the following 3 lines is to
; add 7 to a if moving east or
; subtract 7 from a if moving west.
	add b
	and $f0
	or c

	pop bc

	sub [hl] ; subtract [i#SPRITESTATEDATA1_XADJUSTED] from [j#SPRITESTATEDATA1_XADJUSTED]

; calculate the absolute value of the difference to get the distance
	jr nc, .noCarry2
	cpl
	inc a
.noCarry2
	ldh [hCollidingSpriteTempXValue], a ; store the distance between the two sprites' adjusted X values

; Use the carry flag set by the above subtraction to determine which sprite's
; X coordinate is larger. This information is used later to set
; [i#SPRITESTATEDATA1_COLLISIONDATA].
; The following 5 lines set the lowest 2 bits of c.
; If sprite i's X is larger, set lowest 2 bits of c to 10.
; If sprite j's X is larger or both are equal, set lowest 2 bits of c to 01.
	push af
	rl c
	pop af
	ccf
	rl c

; If sprite i's delta X is 0, then b = 7, else b = 9.
	ld b, 7
	ld a, [hl] ; a = [i#SPRITESTATEDATA1_XADJUSTED]
	and $f
	jr z, .next3
	ld b, 9

.next3
	ldh a, [hCollidingSpriteTempXValue] ; a = distance between adjusted X coordinates
	sub b
	ldh [hCollidingSpriteAdjustedDistance], a
	ld a, b
	ldh [hCollidingSpriteTempXValue], a ; store 7 or 9 depending on sprite i's delta X
	jr c, .collision

; If sprite j's delta X is 0, then b = 7, else b = 9.
	ld b, 7
	dec e
	ld a, [de] ; a = [j#SPRITESTATEDATA1_XSTEPVECTOR]
	inc e
	and a
	jr z, .next4
	ld b, 9

.next4
	ldh a, [hCollidingSpriteAdjustedDistance]
	sub b ; adjust distance using sprite j's direction
	jr z, .collision
	jr nc, .next ; go to next sprite if distance is still positive after both adjustments

.collision
	ldh a, [hCollidingSpriteTempXValue] ; a = 7 or 9 depending on sprite i's delta X
	ld b, a
	ldh a, [hCollidingSpriteTempYValue] ; a = 7 or 9 depending on sprite i's delta Y
	inc l

; If delta X isn't 0 and delta Y is 0, then b = %0011, else b = %1100.
; (note that normally if delta X isn't 0, then delta Y must be 0 and vice versa)
	cp b
	jr c, .next5
	ld b, %1100
	jr .next6
.next5
	ld b, %0011

.next6
	ld a, c ; c has 2 bits set (one of bits 0-1 is set for the X axis and one of bits 2-3 for the Y axis)
	and b ; we select either the bit in bits 0-1 or bits 2-3 based on the calculation immediately above
	or [hl] ; or with existing collision direction bits in [i#SPRITESTATEDATA1_COLLISIONDATA]
	ld [hl], a ; store new value
	ld a, c ; useless code because a is overwritten before being used again

; set bit in [i#SPRITESTATEDATA1_0E] or [i#SPRITESTATEDATA1_0F]
; to indicate which sprite the collision occurred with
	inc l
	inc l
	ldh a, [hCollidingSpriteOffset]
	ld de, SpriteCollisionBitTable
	add a
	add e
	ld e, a
	jr nc, .noCarry3
	inc d
.noCarry3
	ld a, [de]
	or [hl]
	ld [hli], a
	inc de
	ld a, [de]
	or [hl]
	ld [hl], a

.next
	ldh a, [hCollidingSpriteOffset]
	inc a
	cp $10
	jp nz, .loop
	ret

; takes a = delta X or delta Y
; returns:
; b = delta X/Y
; c = 0 if delta X/Y is 0
; c = 7 if delta X/Y is 1
; c = 9 if delta X/Y is -1
SetSpriteCollisionValues:
	ld b, a  ; b = a
	and a    ; a = 0 ?
	ld c, a  ; c = 0 if a = 0
	ret z
	dec a    ; a = 1 ?
	ld c, 7  ; c = 7 if a = 1
	ret z
	ld c, 9  ; c = 9 if a = -1
	ret

SpriteCollisionBitTable:
FOR n, $10
	bigdw 1 << n
ENDR
