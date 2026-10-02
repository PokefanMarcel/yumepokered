; Copy the current map's sprites' tile patterns to VRAM again after they have
; been overwritten by other tile patterns.
ReloadMapSpriteTilePatterns::
	ld hl, wFontLoaded
	ld a, [hl]
	push af
	res BIT_FONT_LOADED, [hl]
	push hl
	xor a
	ld [wSpriteSetID], a
	call DisableLCD
	callfar InitMapSprites
	call LoadFontTilePatterns ; marcelnote - load while LCD is off
	call EnableLCD
	pop hl
	pop af
	ld [hl], a
	call LoadStandingPlayerSpriteGraphics ; marcelnote - doesn't overwrite font
	jp UpdateSprites


; marcelnote - those functions have been modified and mmoved here from home/overworld.asm

; Keep all player sheets and the Fly bird in the same bank.
ASSERT BANK(GreenSprite) == BANK(RedSprite)
ASSERT BANK(RedRunSprite) == BANK(RedSprite)
ASSERT BANK(GreenRunSprite) == BANK(RedSprite)
ASSERT BANK(RedBikeSprite) == BANK(RedSprite)
ASSERT BANK(GreenBikeSprite) == BANK(RedSprite)
ASSERT BANK(RedSurfSprite) == BANK(RedSprite)
ASSERT BANK(GreenSurfSprite) == BANK(RedSprite)
ASSERT BANK(BirdSprite) == BANK(RedSprite)

SwitchRunningToWalkingSprites: ; marcelnote - running sprites
	ld a, [wWalkBikeSurfState]
	and a ; WALKING?
	ret nz ; if not walking, do nothing
	ld hl, wStatusFlags6
	bit BIT_RUNNING, [hl]
	ret z ; if wasn't running, do nothing
	; fallthrough

LoadWalkingPlayerSpriteGraphics:: ; marcelnote - add female player
	call GetWalkingPlayerSpriteGraphics
	jr LoadPlayerSpriteGraphicsCommon

LoadRunningPlayerSpriteGraphics:: ; marcelnote - running sprites
	call GetRunningPlayerSpriteGraphics
	jr LoadPlayerSpriteGraphicsCommon

LoadBikePlayerSpriteGraphics:: ; marcelnote - add female player and running sprites
	call GetBikePlayerSpriteGraphics
	jr LoadPlayerSpriteGraphicsCommon

LoadSurfingPlayerSpriteGraphics:: ; marcelnote - add female player and new surfing sprites
	call GetSurfingPlayerSpriteGraphics
	jr LoadPlayerSpriteGraphicsCommon

LoadPlayerSpriteGraphics:: ; marcelnote - modified to not use hTileAnimations
	call GetPlayerSpriteGraphics
	; fallthrough

LoadPlayerSpriteGraphicsCommon::
; de = 24-tile sprite sheet in BANK(RedSprite), also used by the Fly bird.
	call LoadStandingPlayerSpriteGraphicsCommon ; preserves de
	ld hl, 12 tiles
	add hl, de
	ld d, h
	ld e, l
	ld hl, vNPCSprites2
	lb bc, BANK(RedSprite), $0c
	jp CopyVideoData

LoadStandingPlayerSpriteGraphics:: ; marcelnote - preserve font tiles while restoring menu sprites
	call GetPlayerSpriteGraphics
	; fallthrough
LoadStandingPlayerSpriteGraphicsCommon:
; de = selected sprite sheet; its first 12 tiles are the three standing poses.
	ld hl, vNPCSprites
	lb bc, BANK(RedSprite), $0c
	jp CopyVideoData

GetPlayerSpriteGraphics:
; Select the sprite sheet in de; all player sheets are in BANK(RedSprite).
; wWalkBikeSurfState: 0 = walking, 1 = biking, 2 = surfing
	ld a, [wWalkBikeSurfState]
	dec a ; BIKING?
	jr z, .checkIfBikingAllowed
	dec a ; SURFING?
	jr z, GetSurfingPlayerSpriteGraphics
	jr GetWalkingPlayerSpriteGraphics ; defaults to walking
.checkIfBikingAllowed
	call IsBikingAllowed
	jr c, GetBikePlayerSpriteGraphics
	xor a
	ld [wWalkBikeSurfState], a
	; fallthrough

GetWalkingPlayerSpriteGraphics:
	ld hl, wStatusFlags6
	res BIT_RUNNING, [hl]
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld de, RedSprite
	ret z
	ld de, GreenSprite
	ret

GetRunningPlayerSpriteGraphics:
	ld hl, wStatusFlags6
	set BIT_RUNNING, [hl]
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld de, RedRunSprite
	ret z
	ld de, GreenRunSprite
	ret

GetBikePlayerSpriteGraphics:
	ld hl, wStatusFlags6
	res BIT_RUNNING, [hl]
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld de, RedBikeSprite
	ret z
	ld de, GreenBikeSprite
	ret

GetSurfingPlayerSpriteGraphics:
	ld hl, wStatusFlags6
	res BIT_RUNNING, [hl]
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld de, RedSurfSprite
	ret z
	ld de, GreenSurfSprite
	ret
