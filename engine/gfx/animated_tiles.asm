; marcelnote - new animations
AnimateTiles::
	ldh a, [hTileAnimations]
	and a
	ret z

	ldh a, [hMovingBGTilesCounter1]
	inc a
	ldh [hMovingBGTilesCounter1], a
	cp 20
	ret c
	cp 21
	; jump if h-counter is 21 (will never happen if animating water only)
	jp z, AnimateFlowerOrLanternOrLavaBubbleTile

	ld a, [wMovingBGTilesCounter2] ; increment w-counter when not animating flower, lantern, etc
	inc a
	and 7 ; %00000111 ; a modulo 8, 8 is the period of the animation
	ld [wMovingBGTilesCounter2], a
	call AnimateWaterTile
	call AnimateWaterBollardTile
	call AnimateLavaTile

	ldh a, [hTileAnimations]
	bit BIT_ANIM_FLOWER, a
	ret nz
	bit BIT_ANIM_LANTERN, a
	ret nz
	bit BIT_ANIM_LAVA, a
	ret nz

	xor a
	ldh [hMovingBGTilesCounter1], a ; reset h-counter if not animating flower, lantern, etc
	ret

;AnimateWaterTile: ; marcelnote - original function, scrolled water tile left and right
;	ld hl, vTileset tile $14
;	ld c, $10
;
;	ld a, [wMovingBGTilesCounter2]
;	inc a
;	and 7 ; %00000111 ; a modulo 8
;	ld [wMovingBGTilesCounter2], a
;
;	and 4 ; %00000100 ; a >= 4 ?
;	jp z, ScrollTileRight ; scroll right when counter is 0 1 2 3
;	jp ScrollTileLeft     ; scroll left when counter is 4 5 6 7

; marcelnote - MANY FUNCTIONS COULD BE SIMPLIFIED BY USING LISTS E.G.

;AnimateWaterTileSequence:
;	db 1 ; tile 1
;	db 2 ; tile 2
;	db 3 ; tile 3
;	db 4 ; tile 4
;	db 5 ; tile 5
;	db 4 ; tile 4
;	db 3 ; tile 3
;	db 2 ; tile 2

AnimateWaterTile: ; marcelnote - modified this function to synchronize with water bollards
	ldh a, [hTileAnimations]
	bit BIT_ANIM_WATER, a
	ret z

	ld hl, WaterTilesTable
	ld a, [wCurMapTileset]
	and a ; OVERWORLD?
	jr z, .got_table
	ld hl, WaterAltTilesTable ; other tilesets have different water tiles
.got_table

	ld a, [wMovingBGTilesCounter2]
	cp 5 ; a < 5 ?
	jr c, .noReverse ; need to transform 0 1 2 3 4 5 6 7 into 0 1 2 3 4 3 2 1
	ld b, a
	ld a, 8
	sub b ; a <- 8 - a
.noReverse

	ld de, vTileset tile $14 ; water tile
	jp AnimateFindPointerInTable

AnimateWaterBollardTile:
	ldh a, [hTileAnimations]
	bit BIT_ANIM_WBOLLARD, a
	ret z

	ld hl, WaterBollardTilesTable
	ld a, [wCurMapTileset]
	and a ; OVERWORLD?
	jr z, .got_table
	ld hl, WaterBollardAltTilesTable ; other tilesets have different water tiles
.got_table

	ld a, [wMovingBGTilesCounter2]
	cp 5 ; a < 5 ?
	jr c, .noReverse ; need to transform 0 1 2 3 4 5 6 7 into 0 1 2 3 4 3 2 1
	ld b, a
	ld a, 8
	sub b ; a <- 8 - a
.noReverse
	ld de, vTileset tile $5e ; water bollard tile
	jp AnimateFindPointerInTable

AnimateLavaTile: ; marcelnote - reuse function initially used for water
	ldh a, [hTileAnimations]
	bit BIT_ANIM_LAVA, a
	ret z

	ld hl, vTileset tile $48 ; lava tile
	ld c, $10

	ld a, [wMovingBGTilesCounter2]
	bit 0, a ; don't animate if counter is odd
	ret nz
	and 4 ; %00000100 ; a >= 4 ?
	jp z, ScrollTileRight ; scroll right when counter is 0 1 2 3
	jp ScrollTileLeft     ; scroll left when counter is 4 5 6 7


AnimateFlowerOrLanternOrLavaBubbleTile:
	xor a ; reset the counter to loop back to the start of tile animation timer
	ldh [hMovingBGTilesCounter1], a

	; these animations are currently mutually exclusive
	ldh a, [hTileAnimations]
	bit BIT_ANIM_FLOWER, a
	jp nz, AnimateFlowerTile
	bit BIT_ANIM_LAVA, a
	jp nz, AnimateLavaBubbleTiles
	jp AnimateLanternTiles

AnimateFlowerTile:
	ld a, [wMovingBGTilesCounter2]
	and 3 ; = %00000011 ; a modulo 4
	cp 2
	ld hl, FlowerTile1 ; if counter is 0 or 1
	jr c, .copy
	ld hl, FlowerTile2 ; if counter is 2
	jr z, .copy
	ld hl, FlowerTile3 ; if counter is 3
.copy
	ld de, vTileset tile $03 ; flower tile
	jp AnimateCopyTile

AnimateLavaBubbleTiles:
	; first tile
	ld a, [wMovingBGTilesCounter2]
	cp 2
	ld hl, LavaTile1 ; if counter is 0 1
	jr c, .copy1
	cp 4
	ld hl, LavaTile2 ; if counter is 2 3
	jr c, .copy1
	cp 6
	ld hl, LavaTile3 ; if counter is 4 5
	jr c, .copy1
	ld hl, LavaTile4 ; if counter is 6 7
.copy1
	ld de, vTileset tile $4A ; first lava bubble tile
	call AnimateCopyTile

	; second tile
	ld a, [wMovingBGTilesCounter2]
	cp 1
	ld hl, LavaTile3 ; if counter is 0
	jr c, .copy2
	cp 3
	ld hl, LavaTile4 ; if counter is 1 2
	jr c, .copy2
	cp 5
	ld hl, LavaTile1 ; if counter is 3 4
	jr c, .copy2
	cp 7
	ld hl, LavaTile2 ; if counter is 5 6
	jr c, .copy2
	ld hl, LavaTile3 ; if counter is 7
.copy2
	ld de, vTileset tile $49 ; second lava bubble tile
	jp AnimateCopyTile

AnimateLanternTiles:
	; left tile
	ld a, [wMovingBGTilesCounter2]
	;and 7 ; = %00000111 ; a modulo 8
	cp 5
	ld hl, LanternLeftTile1 ; if counter is 0 1 2 3 4
	jr c, .copyLeftTile
	cp 7
	ld hl, LanternLeftTile2 ; if counter is 5 6
	jr c, .copyLeftTile
	ld hl, LanternLeftTile1 ; if counter is 7
.copyLeftTile
	ld de, vTileset tile $3A ; left lantern tile
	call AnimateCopyTile

	; right tile
	ld a, [wMovingBGTilesCounter2]
	;and 7 ; = %00000111 ; a modulo 8
	cp 6
	ld hl, LanternRightTile1 ; if counter is 0 1 2 3 4 5
	jr c, .copyRightTile
	ld hl, LanternRightTile2 ; if counter is 6 7
.copyRightTile
	ld de, vTileset tile $3B ; right lantern tile
	jp AnimateCopyTile


AnimateFindPointerInTable:
	add a ; doubles a
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	; fallthrough

AnimateCopyTile:
	ld c, $10
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	ret

ScrollTileRight: ; marcelnote - was used in original AnimateWaterTile
	ld c, $10
.right
	ld a, [hl]
	rrca
	ld [hli], a
	dec c
	jr nz, .right
	ret

ScrollTileLeft: ; marcelnote - was used in original AnimateWaterTile
	ld c, $10
.left
	ld a, [hl]
	rlca
	ld [hli], a
	dec c
	jr nz, .left
	ret


WaterTilesTable:
	dw WaterTile1
	dw WaterTile2
	dw WaterTile3
	dw WaterTile4
	dw WaterTile5
	;dw WaterTile6 ; unused
	;dw WaterTile7 ; unused
	;dw WaterTile8 ; unused

WaterAltTilesTable:
	dw WaterAltTile1
	dw WaterAltTile2
	dw WaterAltTile3
	dw WaterAltTile4
	dw WaterAltTile5
	;dw WaterAltTile6 ; unused
	;dw WaterAltTile7 ; unused
	;dw WaterAltTile8 ; unused

WaterBollardTilesTable:
	dw WaterBollardTile1
	dw WaterBollardTile2
	dw WaterBollardTile3
	dw WaterBollardTile4
	dw WaterBollardTile5
	;dw WaterBollardTile6 ; unused
	;dw WaterBollardTile7 ; unused
	;dw WaterBollardTile8 ; unused

WaterBollardAltTilesTable:
	dw WaterBollardAltTile1
	dw WaterBollardAltTile2
	dw WaterBollardAltTile3
	dw WaterBollardAltTile4
	dw WaterBollardAltTile5
	;dw WaterBollardAltTile6 ; unused
	;dw WaterBollardAltTile7 ; unused
	;dw WaterBollardAltTile8 ; unused

FlowerTile1: INCBIN "gfx/tilesets/flower/flower1.2bpp"
FlowerTile2: INCBIN "gfx/tilesets/flower/flower2.2bpp"
FlowerTile3: INCBIN "gfx/tilesets/flower/flower3.2bpp"

WaterTile1: INCBIN "gfx/tilesets/water/water1.2bpp"
WaterTile2: INCBIN "gfx/tilesets/water/water2.2bpp"
WaterTile3: INCBIN "gfx/tilesets/water/water3.2bpp"
WaterTile4: INCBIN "gfx/tilesets/water/water4.2bpp"
WaterTile5: INCBIN "gfx/tilesets/water/water5.2bpp"
;WaterTile6: INCBIN "gfx/tilesets/water/water6.2bpp" ; unused
;WaterTile7: INCBIN "gfx/tilesets/water/water7.2bpp" ; unused
;WaterTile8: INCBIN "gfx/tilesets/water/water8.2bpp" ; unused

WaterAltTile1: INCBIN "gfx/tilesets/water_alt/water_alt1.2bpp"
WaterAltTile2: INCBIN "gfx/tilesets/water_alt/water_alt2.2bpp"
WaterAltTile3: INCBIN "gfx/tilesets/water_alt/water_alt3.2bpp"
WaterAltTile4: INCBIN "gfx/tilesets/water_alt/water_alt4.2bpp"
WaterAltTile5: INCBIN "gfx/tilesets/water_alt/water_alt5.2bpp"
;WaterAltTile6: INCBIN "gfx/tilesets/water_alt/water_alt6.2bpp" ; unused
;WaterAltTile7: INCBIN "gfx/tilesets/water_alt/water_alt7.2bpp" ; unused
;WaterAltTile8: INCBIN "gfx/tilesets/water_alt/water_alt8.2bpp" ; unused

WaterBollardTile1: INCBIN "gfx/tilesets/water_bollard/water_bollard1.2bpp"
WaterBollardTile2: INCBIN "gfx/tilesets/water_bollard/water_bollard2.2bpp"
WaterBollardTile3: INCBIN "gfx/tilesets/water_bollard/water_bollard3.2bpp"
WaterBollardTile4: INCBIN "gfx/tilesets/water_bollard/water_bollard4.2bpp"
WaterBollardTile5: INCBIN "gfx/tilesets/water_bollard/water_bollard5.2bpp"
;WaterBollardTile6: INCBIN "gfx/tilesets/water_bollard/water_bollard6.2bpp" ; unused
;WaterBollardTile7: INCBIN "gfx/tilesets/water_bollard/water_bollard7.2bpp" ; unused
;WaterBollardTile8: INCBIN "gfx/tilesets/water_bollard/water_bollard8.2bpp" ; unused

WaterBollardAltTile1: INCBIN "gfx/tilesets/water_bollard_alt/water_bollard_alt1.2bpp"
WaterBollardAltTile2: INCBIN "gfx/tilesets/water_bollard_alt/water_bollard_alt2.2bpp"
WaterBollardAltTile3: INCBIN "gfx/tilesets/water_bollard_alt/water_bollard_alt3.2bpp"
WaterBollardAltTile4: INCBIN "gfx/tilesets/water_bollard_alt/water_bollard_alt4.2bpp"
WaterBollardAltTile5: INCBIN "gfx/tilesets/water_bollard_alt/water_bollard_alt5.2bpp"
;WaterBollardAltTile6: INCBIN "gfx/tilesets/water_bollard_alt/water_bollard_alt6.2bpp" ; unused
;WaterBollardAltTile7: INCBIN "gfx/tilesets/water_bollard_alt/water_bollard_alt7.2bpp" ; unused
;WaterBollardAltTile8: INCBIN "gfx/tilesets/water_bollard_alt/water_bollard_alt8.2bpp" ; unused

LanternLeftTile1:  INCBIN "gfx/tilesets/lantern/lantern_left1.2bpp"  ; medium light
LanternLeftTile2:  INCBIN "gfx/tilesets/lantern/lantern_left2.2bpp"  ; strong light
;LanternLeftTile3:  INCBIN "gfx/tilesets/lantern/lantern_left3.2bpp"  ; low light ; unused
LanternRightTile1: INCBIN "gfx/tilesets/lantern/lantern_right1.2bpp" ; medium light
LanternRightTile2: INCBIN "gfx/tilesets/lantern/lantern_right2.2bpp" ; strong light
;LanternRightTile3: INCBIN "gfx/tilesets/lantern/lantern_right3.2bpp" ; low light ; unused

LavaTile1:  INCBIN "gfx/tilesets/lava/lava1.2bpp"
LavaTile2:  INCBIN "gfx/tilesets/lava/lava2.2bpp"
LavaTile3:  INCBIN "gfx/tilesets/lava/lava3.2bpp"
LavaTile4:  INCBIN "gfx/tilesets/lava/lava4.2bpp"
