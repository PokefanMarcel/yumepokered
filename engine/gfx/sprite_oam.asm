PrepareOAMData:: ; marcelnote - optimized
; Determine OAM data for currently visible
; sprites and write it to wShadowOAM.

	ld a, [wUpdateSpritesEnabled]
	dec a
	jr z, .updateEnabled

	cp -1
	ret nz
	ld [wUpdateSpritesEnabled], a
	jp HideSprites

.updateEnabled
	xor a
	ldh [hOAMBufferOffset], a

.spriteLoop
	ldh [hSpriteOffset2], a
	ld d, HIGH(wSpriteStateData1)
	ld e, a
	ld a, [de] ; [x#SPRITESTATEDATA1_PICTUREID]
	and a
	jp z, .nextSprite

	inc e
	inc e
	ld a, [de] ; [x#SPRITESTATEDATA1_IMAGEINDEX]
	ld b, a ; b = sprite image index

; get sprite X and Y ; also needed for off-screen sprites? if not could move it below
	inc e
	inc e
	ld a, [de] ; [x#SPRITESTATEDATA1_YPIXELS]
	ldh [hSpriteScreenY], a
	inc e
	inc e
	ld a, [de] ; [x#SPRITESTATEDATA1_XPIXELS]
	ldh [hSpriteScreenX], a
	inc e
	inc e
	inc e
	inc e
	ldh a, [hSpriteScreenY]
	add 4
	and $f0
	ld [de], a ; [x#SPRITESTATEDATA1_YADJUSTED]
	inc e
	ldh a, [hSpriteScreenX]
	and $f0
	ld [de], a ; [x#SPRITESTATEDATA1_XADJUSTED]

	ld a, b ; a = sprite image index
	cp $ff ; off-screen (don't draw)
	jr z, .nextSprite

; compute and store sprite offset
	cp $b0
	jr c, .notSecondStillSprite
	ld a, $a * 12 + 4 ; second still sprite has specific offset
	jr .storeOffset
.notSecondStillSprite
	swap a
	and $f
	; a *= 12
	add a
	add a
	ld c, a
	add a
	add c
.storeOffset
	ld [wSavedSpriteOffset], a

; get pointers
	ld a, b ; a = sprite image index
	cp $a0  ; is it a still sprite?
	ld c, 0 ; for still sprite, force facing down frame 0
	ld b, c
	jr nc, .stillSprite
	and $f
	add a
	add a ; animation table is 4 bytes wide
	ld c, a
.stillSprite
; read the entry from the table
	ld hl, SpriteFacingAndAnimationTable
	add hl, bc
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a     ; bc = .StandingDown / .WalkingDown / ...
	ld a, [hli]
	ld h, [hl]
	ld l, a     ; hl = .NormalOAM / .FlippedOAM

; get sprite priority
	inc d
	ld a, e
	add SPRITESTATEDATA2_GRASSPRIORITY - SPRITESTATEDATA1_XADJUSTED
	ld e, a
	ld a, [de] ; [x#SPRITESTATEDATA2_GRASSPRIORITY]
	and $80
	ldh [hSpritePriority], a ; temp store sprite priority

	ldh a, [hOAMBufferOffset]
	ld e, a
	ld d, HIGH(wShadowOAM)

.tileLoop
	ldh a, [hSpriteScreenY]  ; temp for sprite Y position
	add [hl]                 ; add Y offset from table
	ld [de], a               ; write new sprite OAM Y position
	inc hl
	ldh a, [hSpriteScreenX]  ; temp for sprite X position
	add [hl]                 ; add X offset from table
	inc e
	ld [de], a               ; write new sprite OAM X position
	inc e
	ld a, [bc]               ; read pattern number offset (accommodates orientation (offset 0,4 or 8) and animation (offset 0 or $80))
	inc bc
	push bc
	ld b, a
	ld a, [wSavedSpriteOffset]
	add b      ; add the tile offset from the table (based on frame and facing direction)
	pop bc
	ld [de], a ; tile id
	inc hl
	inc e
	ld a, [hl]
	bit BIT_SPRITE_UNDER_GRASS, a
	jr z, .skipPriority
	ldh a, [hSpritePriority]
	or [hl]
.skipPriority
	inc hl
	ld [de], a
	inc e
	bit BIT_END_OF_OAM_DATA, a
	jr z, .tileLoop

	ld a, e
	ldh [hOAMBufferOffset], a

.nextSprite
	ldh a, [hSpriteOffset2]
	add $10
	cp LOW($100)
	jp nz, .spriteLoop

	; Clear unused OAM.
	ldh a, [hOAMBufferOffset]
	ld l, a
	ld h, HIGH(wShadowOAM)
	ld de, OBJ_SIZE
	ld b, SCREEN_HEIGHT_PX + OAM_Y_OFS
	ld a, [wMovementFlags]
	bit BIT_LEDGE_OR_FISHING, a
	ld a, LOW(wShadowOAMEnd)
	jr z, .clear

; Don't clear the last 4 entries because they are used for the shadow in the
; jumping down ledge animation and the rod in the fishing animation.
	ld a, LOW(wShadowOAMSprite36)

.clear
	cp l
	ret z
	ld [hl], b
	add hl, de
	jr .clear
