; marcelnote - new animations
AnimateTiles::
	ldh a, [hTileAnimations]
	and a
	ret z

	ldh a, [hMovingBGTilesCounter1]
	inc a
	ldh [hMovingBGTilesCounter1], a
	cp 10  ; no animation for tick < 10
	ret c
	cp 22  ; maintain a h-tick period of 22 to keep original speed
	jr nc, .reset
	; animations on ticks 10–21
	sub 10 ; a = 0–9
	ld hl, AnimationsTable
	add a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.reset
	ldh a, [hMovingBGTilesCounter2] ; increment w-counter
	inc a
	and $7 ; %00000111 ; a mod 8 (8 is the period of the animations)
	ldh [hMovingBGTilesCounter2], a

	xor a
	ldh [hMovingBGTilesCounter1], a ; reset h-counter at tick 22
	ret

AnimationsTable: ; each animation happens on a different counter tick
	dw AnimateWaterTile        ; 10
	dw AnimateWaterBollardTile ; 11
	dw AnimateFlowerTile       ; 12
	dw AnimateRicePlantTile    ; 13
	dw AnimateLanternLeftTile  ; 14
	dw AnimateLanternRightTile ; 15
	dw AnimateLavaTile         ; 16
	dw AnimateLavaBubble1Tile  ; 17
	dw AnimateLavaBubble2Tile  ; 18
	dw AnimateSlowWaterTile    ; 19
	dw AnimateLiveWaterTile    ; 20
	dw AnimateWaterfallTile    ; 21


;AnimateWaterTile: ; marcelnote - original function, scrolled water tile left and right
;	ld hl, vTileset tile $14
;	ld c, $10
;
;	ldh a, [hMovingBGTilesCounter2]
;	inc a
;	and $7 ; %00000111 ; a modulo 8
;	ldh [hMovingBGTilesCounter2], a
;
;	and 4 ; %00000100 ; a >= 4 ?
;	jp z, ScrollTileRight ; scroll right when counter is 0 1 2 3
;	jp ScrollTileLeft     ; scroll left when counter is 4 5 6 7


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
	ldh a, [hMovingBGTilesCounter2]
	ld de, vTileset tile $14 ; water tile
	jp AnimateFindPointerInTable


WaterTilesTable:
	dw WaterTile1 ; 0
	dw WaterTile2 ; 1
	dw WaterTile3 ; 2
	dw WaterTile4 ; 3
	dw WaterTile5 ; 4
	dw WaterTile4 ; 5
	dw WaterTile3 ; 6
	dw WaterTile2 ; 7

WaterAltTilesTable:
	dw WaterAltTile1 ; 0
	dw WaterAltTile2 ; 1
	dw WaterAltTile3 ; 2
	dw WaterAltTile4 ; 3
	dw WaterAltTile5 ; 4
	dw WaterAltTile4 ; 5
	dw WaterAltTile3 ; 6
	dw WaterAltTile2 ; 7


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
	ldh a, [hMovingBGTilesCounter2]
	ld de, vTileset tile $5e ; water bollard tile
	jp AnimateFindPointerInTable


WaterBollardTilesTable:
	dw WaterBollardTile1 ; 0
	dw WaterBollardTile2 ; 1
	dw WaterBollardTile3 ; 2
	dw WaterBollardTile4 ; 3
	dw WaterBollardTile5 ; 4
	dw WaterBollardTile4 ; 5
	dw WaterBollardTile3 ; 6
	dw WaterBollardTile2 ; 7

WaterBollardAltTilesTable:
	dw WaterBollardAltTile1 ; 0
	dw WaterBollardAltTile2 ; 1
	dw WaterBollardAltTile3 ; 2
	dw WaterBollardAltTile4 ; 3
	dw WaterBollardAltTile5 ; 4
	dw WaterBollardAltTile4 ; 5
	dw WaterBollardAltTile3 ; 6
	dw WaterBollardAltTile2 ; 7


AnimateSlowWaterTile:
	ldh a, [hTileAnimations]
	bit BIT_ANIM_LIVEWATER, a
	ret z
	ld hl, vTileset tile $14 ; water tile
	jr AnimateLavaTile.gotTile

AnimateLavaTile: ; marcelnote - reuse function initially used for water
	ldh a, [hTileAnimations]
	bit BIT_ANIM_LAVA, a
	ret z
	ld hl, vTileset tile $4B ; lava tile
.gotTile
	ldh a, [hMovingBGTilesCounter2]
	rra   ; rotate bit 0 into carry
	ret c ; don't animate if counter is odd
	and 2 ; %00000010 ; a >= 2 ?
	jp z, ScrollTileRight ; scroll right when counter is 0 1 2 3
	jp ScrollTileLeft     ; scroll left when counter is 4 5 6 7


AnimateWaterfallTile:
	ldh a, [hTileAnimations]
	bit BIT_ANIM_WATERFALL, a
	ret z
	ld hl, vTileset tile $48 ; waterfall tile
	jp ScrollTileDown


AnimateFlowerTile:
	ldh a, [hTileAnimations]
	bit BIT_ANIM_FLOWER, a
	ret z

	ldh a, [hMovingBGTilesCounter2]
	and $3 ; = %00000011 ; a modulo 4
	cp 2
	ld hl, FlowerTile1 ; if counter is 0 or 1
	jr c, .copy
	ld hl, FlowerTile2 ; if counter is 2
	jr z, .copy
	ld hl, FlowerTile3 ; if counter is 3
.copy
	ld de, vTileset tile $03 ; flower tile
	jp AnimateCopyTile


AnimateRicePlantTile:
	ldh a, [hTileAnimations]
	bit BIT_ANIM_FLOWER, a
	ret z

	ldh a, [hMovingBGTilesCounter2]
	and $7 ; = %00000111 ; a modulo 8
	cp 4
	ld hl, RicePlantTile1 ; if counter is 0,1,2,3,4
	jr nc, .copy
	ld hl, RicePlantTile2 ; if counter is 5,6,7
.copy
	ld de, vTileset tile $23 ; rice plant tile
	jp AnimateCopyTile


AnimateLavaBubble1Tile: ; first lava tile
	ldh a, [hTileAnimations]
	bit BIT_ANIM_LAVA, a
	ret z
	ld hl, LavaBubbleTilesTable
	ldh a, [hMovingBGTilesCounter2]
	srl a ; divide a by 2
	ld de, vTileset tile $4A ; first lava bubble tile
	jp AnimateFindPointerInTable

AnimateLavaBubble2Tile: ; second lava tile
	ldh a, [hTileAnimations]
	bit BIT_ANIM_LAVA, a
	ret z
	ld hl, LavaBubbleTilesTable
	ldh a, [hMovingBGTilesCounter2]
	add $3
	and $7
	srl a ; divide a by 2
	ld de, vTileset tile $49 ; second lava bubble tile
	jp AnimateFindPointerInTable

LavaBubbleTilesTable:
	dw LavaBubbleTile1
	dw LavaBubbleTile2
	dw LavaBubbleTile3
	dw LavaBubbleTile4


AnimateLanternLeftTile:
	ldh a, [hTileAnimations]
	bit BIT_ANIM_LANTERN, a
	ret z
	; left tile
	ldh a, [hMovingBGTilesCounter2]
	;and $7 ; = %00000111 ; a modulo 8
	cp 5
	ld hl, LanternLeftTile1 ; if counter is 0 1 2 3 4
	jr c, .copy
	cp 7
	ld hl, LanternLeftTile2 ; if counter is 5 6
	jr c, .copy
	ld hl, LanternLeftTile1 ; if counter is 7
.copy
	ld de, vTileset tile $3A ; left lantern tile
	jp AnimateCopyTile


AnimateLanternRightTile:
	ldh a, [hTileAnimations]
	bit BIT_ANIM_LANTERN, a
	ret z
	; right tile
	ldh a, [hMovingBGTilesCounter2]
	;and $7 ; = %00000111 ; a modulo 8
	cp 6
	ld hl, LanternRightTile1 ; if counter is 0 1 2 3 4 5
	jr c, .copy
	ld hl, LanternRightTile2 ; if counter is 6 7
.copy
	ld de, vTileset tile $3B ; right lantern tile
	jp AnimateCopyTile


AnimateLiveWaterTile:
	ldh a, [hTileAnimations]
	bit BIT_ANIM_LIVEWATER, a
	ret z
	ld hl, LiveWaterTilesTable
	ldh a, [hMovingBGTilesCounter2]
	ld de, vTileset tile $15 ; livewater tile
	jp AnimateFindPointerInTable

LiveWaterTilesTable:
	dw LiveWaterTile1 ; 0
	dw LiveWaterTile2 ; 1
	dw LiveWaterTile3 ; 2
	dw LiveWaterTile4 ; 3
	dw LiveWaterTile5 ; 4
	dw LiveWaterTile6 ; 5
	dw LiveWaterTile7 ; 6
	dw LiveWaterTile7 ; 7



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

ScrollTileRight: ; marcelnote - part of original water animation
	ld c, $10
.right
	ld a, [hl]
	rrca
	ld [hli], a
	dec c
	jr nz, .right
	ret

ScrollTileLeft: ; marcelnote - part of original water animation
	ld c, $10
.left
	ld a, [hl]
	rlca
	ld [hli], a
	dec c
	jr nz, .left
	ret

ScrollTileDown: ; marcelnote - from pokecrystal
	ld de, 16 - 2 ; 16 bytes per tile, first two bytes are read right away
	push hl
	add hl, de
	ld a, [hli]
	ld d, a
	ld e, [hl]
	pop hl
	ld b, 16 / 4 ; 16 bytes per tile, loop does 4 bytes per go
.loop
	ld a, d
	ld d, [hl]
	ld [hli], a
	ld a, e
	ld e, [hl]
	ld [hli], a
	ld a, d
	ld d, [hl]
	ld [hli], a
	ld a, e
	ld e, [hl]
	ld [hli], a
	dec b
	jr nz, .loop
	ret



FlowerTile1: INCBIN "gfx/tilesets/flower/flower1.2bpp"
FlowerTile2: INCBIN "gfx/tilesets/flower/flower2.2bpp"
FlowerTile3: INCBIN "gfx/tilesets/flower/flower3.2bpp"

RicePlantTile1: INCBIN "gfx/tilesets/rice_plant/rice_plant1.2bpp"
RicePlantTile2: INCBIN "gfx/tilesets/rice_plant/rice_plant2.2bpp"

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

LavaBubbleTile1:  INCBIN "gfx/tilesets/lava_bubble/lava_bubble1.2bpp"
LavaBubbleTile2:  INCBIN "gfx/tilesets/lava_bubble/lava_bubble2.2bpp"
LavaBubbleTile3:  INCBIN "gfx/tilesets/lava_bubble/lava_bubble3.2bpp"
LavaBubbleTile4:  INCBIN "gfx/tilesets/lava_bubble/lava_bubble4.2bpp"

LiveWaterTile1:  INCBIN "gfx/tilesets/live_water/live_water1.2bpp"
LiveWaterTile2:  INCBIN "gfx/tilesets/live_water/live_water2.2bpp"
LiveWaterTile3:  INCBIN "gfx/tilesets/live_water/live_water3.2bpp"
LiveWaterTile4:  INCBIN "gfx/tilesets/live_water/live_water4.2bpp"
LiveWaterTile5:  INCBIN "gfx/tilesets/live_water/live_water5.2bpp"
LiveWaterTile6:  INCBIN "gfx/tilesets/live_water/live_water6.2bpp"
LiveWaterTile7:  INCBIN "gfx/tilesets/live_water/live_water7.2bpp"
