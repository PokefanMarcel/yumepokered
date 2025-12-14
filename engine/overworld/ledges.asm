HandleLedges:: ; marcelnote - modified to check more accurate tiles
	ld a, [wMovementFlags]
	bit BIT_LEDGE_OR_FISHING, a
	ret nz
	ld a, [wCurMapTileset]
	and a ; OVERWORLD?
	jr z, .overworldTileset
	cp CAVERN
	ret nz ; other tilesets do not have ledges
	ld hl, LedgeTilesCavern
	jr .gotTileset
.overworldTileset
	ld hl, LedgeTiles
.gotTileset
	ld a, [wSpritePlayerStateData1FacingDirection]
	ld b, a
	and a ; SPRITE_FACING_DOWN
	jr nz, .notFacingDown
	; facing down
	lda_coord 8, 10
	ld c, a ; c = tile in front of player, northwest
	lda_coord 8, 11
	ld d, a ; d = tile in front of player, southwest
	jr .loop
.notFacingDown
	cp SPRITE_FACING_LEFT
	jr nz, .notFacingLeft
	; facing left
	lda_coord 7, 9
	ld c, a ; c = tile in front of player, southeast
	lda_coord 6, 9
	ld d, a ; d = tile in front of player, southwest
	jr .loop
.notFacingLeft
	cp SPRITE_FACING_RIGHT
	ret nz ; no ledges facing up
	; facing right
	lda_coord 10, 9
	ld c, a ; c = tile in front of player, southwest
	lda_coord 11, 9
	ld d, a ; d = tile in front of player, southeast
	; fallthrough
.loop
	ld a, [hli]
	cp $ff
	ret z
	cp b ; b = facing direction
	jr nz, .nextLedgeTile1
	ld a, [hli]
	cp c ; c = tile player standing on
	jr nz, .nextLedgeTile2
	ld a, [hli]
	cp d ; d =  tile in front of player
	jr nz, .nextLedgeTile3
	ld a, [hl]
	ld e, a
	jr .foundMatch
.nextLedgeTile1
	inc hl
.nextLedgeTile2
	inc hl
.nextLedgeTile3
	inc hl
	jr .loop
.foundMatch
	ldh a, [hJoyHeld]
	and e
	ret z
	ld a, PAD_BUTTONS | PAD_CTRL_PAD
	ld [wJoyIgnore], a
	ld hl, wMovementFlags
	set BIT_LEDGE_OR_FISHING, [hl]
	call StartSimulatingJoypadStates
	ld a, e
	ld [wSimulatedJoypadStatesEnd], a
	ld [wSimulatedJoypadStatesEnd + 1], a
	ld a, $2
	ld [wSimulatedJoypadStatesIndex], a
	call LoadHoppingShadowOAM
	ld a, SFX_LEDGE
	call PlaySound
	ret

INCLUDE "data/tilesets/ledge_tiles.asm"

LoadHoppingShadowOAM:
	ld hl, vChars1 tile $7f
	ld de, LedgeHoppingShadow
	lb bc, BANK(LedgeHoppingShadow), (LedgeHoppingShadowEnd - LedgeHoppingShadow) / TILE_1BPP_SIZE
	call CopyVideoDataDouble
	ld a, $9
	lb bc, $54, $48 ; b, c = y, x coordinates of shadow
	ld de, LedgeHoppingShadowOAMBlock
	call WriteOAMBlock
	ret

LedgeHoppingShadow:
	INCBIN "gfx/overworld/shadow.1bpp"
LedgeHoppingShadowEnd:

LedgeHoppingShadowOAMBlock:
; tile ID, attributes
	db $ff, OAM_PAL1
	db $ff, OAM_XFLIP
	db $ff, OAM_YFLIP
	db $ff, OAM_XFLIP | OAM_YFLIP
