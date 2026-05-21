; marcelnote - modified spinners engine, adapted from PureRGB
; Spinners now act based on the tile the player is standing on, not pre-set itineraries.
LoadSpinnerArrowTiles::
	; Spin the player sprite every four movement frames.
	ld a, [wWalkCounter]
	and %11
	ret nz
	ld a, [wSpritePlayerStateData1ImageIndex]
	srl a
	srl a
	ld hl, SpinnerPlayerFacingDirections
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	ld [wSpritePlayerStateData1ImageIndex], a
	; Flip the arrows every two tiles to keep the visual cadence close to vanilla.
	ld a, [wWalkCounter]
	and a
	ret nz
	ld hl, wSpinnerArrowAnimFlags
	bit BIT_SPINNER_ARROW_NEW, [hl]
	jr z, .advanceArrowTimer
	res BIT_SPINNER_ARROW_NEW, [hl]
	jr LoadSpinnerArrowTiles_
.advanceArrowTimer
	bit BIT_SPINNER_ARROW_TICK, [hl]
	jr z, .setArrowTimer
	res BIT_SPINNER_ARROW_TICK, [hl]
	ld a, [hl]
	xor 1 << BIT_SPINNER_ARROW_PHASE
	ld [hl], a
	jr LoadSpinnerArrowTiles_
.setArrowTimer
	set BIT_SPINNER_ARROW_TICK, [hl]
	ret

LoadSpinnerArrowTiles_:
	; Arrow tiles are contiguous, so each copy updates all four in one row.
	ld a, [wCurMapTileset]
	cp FACILITY
	jr nz, .gym
	ld hl, vTileset tile $20
	ld a, [wSpinnerArrowAnimFlags]
	bit BIT_SPINNER_ARROW_PHASE, a
	jr nz, .animated
	ld de, Facility_GFX tile $20
	ld b, BANK(Facility_GFX)
	jr .copy
.gym
	ld hl, vTileset tile $3c
	ld a, [wSpinnerArrowAnimFlags]
	bit BIT_SPINNER_ARROW_PHASE, a
	jr nz, .animated
	ld de, Gym_GFX tile $3c
	ld b, BANK(Gym_GFX)
	jr .copy
.animated
	ld de, SpinnerArrowAnimTiles
	ld b, BANK(SpinnerArrowAnimTiles)
.copy
	ld c, 4
	jp CopyVideoData

CheckStartStopSpinning::
	; Called by spinner-map scripts when the player is between steps. Queue one
	; simulated d-pad input at a time so direction changes can be detected on
	; every tile the player crosses.
	lda_coord 9, 9 ; bottom right tile under player
	ld c, a
	lda_coord 8, 9 ; bottom left tile under player
	ld b, a
	ld a, [wCurMapTileset]
	cp FACILITY
	ld a, $5e ; facility stop tile
	ld d, $20 ; facility spinner tile base
	jr z, .checkStop
	ld a, $4d ; gym stop tile
	ld d, $3c ; gym spinner tile base
.checkStop
	cp b
	jr z, .stopSpinning
	ld hl, SpinnerArrowTileOffsets
.checkArrowTile
	; If the two tiles under the player match an arrow shape, use that arrow's
	; direction. This lets the next arrow tile turn the player automatically.
	ld a, [hli]
	cp $ff
	jr z, .notArrowTile
	add d
	cp b
	jr nz, .nextArrowTile
	ld a, [hli]
	add d
	cp c
	jr nz, .nextArrowTileDirection
	ld a, [hl]
	ld [wSimulatedJoypadStatesEnd], a
	jr .keepSpinning
.nextArrowTile
	inc hl
.nextArrowTileDirection
	inc hl
	jr .checkArrowTile

.notArrowTile
	; The player is between arrows. If already spinning, keep using the previous
	; simulated d-pad direction until a stop tile is reached.
	ld hl, wMovementFlags
	bit BIT_SPINNING, [hl]
	ret z
	ld a, [wSimulatedJoypadStatesEnd]
	and PAD_CTRL_PAD
	jr z, .stopSpinning
.keepSpinning
	ld a, 1
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld hl, wMovementFlags
	bit BIT_SPINNING, [hl]
	ret nz
	; First frame on an arrow: mark the player as spinning, play the sound, and
	; ignore real input until a stop tile clears the state.
	ld a, (1 << BIT_SPINNER_ARROW_NEW) | (1 << BIT_SPINNER_ARROW_PHASE)
	ld [wSpinnerArrowAnimFlags], a
	set BIT_SPINNING, [hl]
	ld a, SFX_ARROW_TILES
	call PlaySound
	ld a, PAD_BUTTONS | PAD_CTRL_PAD
	ld [wJoyIgnore], a
	ret

.stopSpinning
	; Avoid replaying the cleanup every frame while standing on a stop tile.
	ld hl, wMovementFlags
	bit BIT_SPINNING, [hl]
	ret z
	res BIT_SPINNING, [hl]
	xor a
	ld [wSpinnerArrowAnimFlags], a
	ld [wJoyIgnore], a
	ld [wSimulatedJoypadStatesIndex], a
	ld [wSimulatedJoypadStatesEnd], a
	ld hl, wStatusFlags5
	res BIT_SCRIPTED_MOVEMENT_STATE, [hl]
	; Restore the tileset's default arrow graphics.
	jp LoadSpinnerArrowTiles_

INCLUDE "data/tilesets/spinner_tiles.asm"

SpinnerPlayerFacingDirections:
; This isn't the order of the facing directions.  Rather, it's a list of
; the facing directions that come next. For example, when the player is
; facing down (00), the next facing direction is left (08).
	db SPRITE_FACING_LEFT  ; down -> left
	db SPRITE_FACING_RIGHT ; up -> right
	db SPRITE_FACING_UP    ; left -> up
	db SPRITE_FACING_DOWN  ; right -> down
