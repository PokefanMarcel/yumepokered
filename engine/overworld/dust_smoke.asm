AnimateBoulderDust: ; marcelnote - modified cut/boulder dust animation
; Must stay in the same bank as cut.asm.
	ld a, 1
	ld [wWhichAnimationOffsets], a ; select the boulder dust offsets
	ld a, [wUpdateSpritesEnabled]
	push af
	ld a, $ff
	ld [wUpdateSpritesEnabled], a
	ld a, %11100100
	ldh [rOBP1], a
	call LoadSmokeTile
	call GetCutOrBoulderDustAnimationOffsets
	ld a, $9
	ld de, GrassOrBoulderDustOAMBlock
	call WriteOAMBlock
	; Pick the coordinate byte to move and whether the dust drifts positive or
	; negative on that axis.
	ld b, 8 ; number of steps in animation
	ld a, [wSpritePlayerStateData1FacingDirection]
	and a ; SPRITE_FACING_DOWN?
	ld hl, wShadowOAMSprite36YCoord
	ld de, OBJ_SIZE
	jr z, .moveDustNegativeLoop
	cp SPRITE_FACING_UP
	jr z, .moveDustPositiveLoop
	ld hl, wShadowOAMSprite36XCoord
	cp SPRITE_FACING_LEFT
	jr z, .moveDustPositiveLoop
.moveDustNegativeLoop
	push hl
	ld c, 4
.moveDustNegativeOAMLoop
	; Move all four dust sprites one pixel up/left.
	dec [hl]
	add hl, de
	dec c
	jr nz, .moveDustNegativeOAMLoop
	ldh a, [rOBP1]
	xor %01100100
	ldh [rOBP1], a
	call Delay3
	pop hl
	dec b
	jr nz, .moveDustNegativeLoop
	jr .done
.moveDustPositiveLoop
	push hl
	ld c, 4
.moveDustPositiveOAMLoop
	; Move all four dust sprites one pixel down/right.
	inc [hl]
	add hl, de
	dec c
	jr nz, .moveDustPositiveOAMLoop
	ldh a, [rOBP1]
	xor %01100100
	ldh [rOBP1], a
	call Delay3
	pop hl
	dec b
	jr nz, .moveDustPositiveLoop
.done
	pop af
	ld [wUpdateSpritesEnabled], a
	jp LoadPlayerSpriteGraphics

LoadSmokeTile::
; Load the single smoke/dust tile used by all four OAM entries.
	ld hl, vChars1 tile $7c
	ld de, SSAnneSmokePuffTile
	lb bc, BANK(SSAnneSmokePuffTile), (SSAnneSmokePuffTileEnd - SSAnneSmokePuffTile) / TILE_SIZE
	jp CopyVideoData

SSAnneSmokePuffTile:
	INCBIN "gfx/overworld/smoke.2bpp"
SSAnneSmokePuffTileEnd:
