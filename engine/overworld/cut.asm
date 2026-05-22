UsedCut:
	xor a
	ld [wActionResultOrTookBattleTurn], a ; initialise to failure value
	ld a, [wCurMapTileset]
	and a ; OVERWORLD
	jr z, .overworld
	cp GYM
	jr nz, .nothingToCut
	ld a, [wTileInFrontOfPlayer]
	cp $50 ; gym cut tree
	jr nz, .nothingToCut
	jr .canCut
.overworld
	ld a, [wTileInFrontOfPlayer]
	cp $3d ; cut tree
	jr z, .canCut
	cp $52 ; grass
	jr z, .canCut
.nothingToCut
	ld hl, .NothingToCutText
	jp PrintText

.NothingToCutText
	text_far _NothingToCutText
	text_end

.canCut
	ld [wCutTile], a
	ld a, 1
	ld [wActionResultOrTookBattleTurn], a ; used cut
	ld a, [wWhichPokemon]
	ld hl, wPartyMonNicks
	call GetPartyMonName
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl]
	call GBPalWhiteOutWithDelay3
	call ClearSprites
	call RestoreScreenTilesAndReloadTilePatterns
	ld a, SCREEN_HEIGHT_PX
	ldh [hWY], a
	call Delay3
	call LoadGBPal
	call LoadCurrentMapView
	call SaveScreenTilesToBuffer2
	call Delay3
	xor a
	ldh [hWY], a
	ld hl, UsedCutText
	call PrintText
	call LoadScreenTilesFromBuffer2
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	ld a, $ff
	ld [wUpdateSpritesEnabled], a
	call InitCutAnimOAM
	call ReplaceTreeTileBlock
	call RedrawMapView
	callfar AnimCut
	ld a, 1
	ld [wUpdateSpritesEnabled], a
	ld a, SFX_CUT
	call PlaySound
	ld a, $90
	ldh [hWY], a
	call UpdateSprites
	jp RedrawMapView

InitCutAnimOAM: ; marcelnote - modified cut/boulder dust animation
; Load the tiles used by the 2x2 cut animation, then write four OAM entries.
; Tree uses four distinct quadrants. Grass uses the same leaf tile four times,
; with flips applied below to make the 2x2 puff.
	xor a
	ld [wWhichAnimationOffsets], a
	ld a, %11100100
	ldh [rOBP1], a
	ld a, [wCutTile]
	cp $52
	jr z, .grass
; tree
	; Tree quadrants are distinct, so keep both rows.
	ld de, Overworld_GFX tile $2d ; cuttable tree sprite top row
	ld hl, vChars1 tile $7c
	lb bc, BANK(Overworld_GFX), 2
	call CopyVideoData
	ld de, Overworld_GFX tile $3d ; cuttable tree sprite bottom row
	ld hl, vChars1 tile $7e
	lb bc, BANK(Overworld_GFX), 2
	call CopyVideoData
	call GetCutOrBoulderDustAnimationOffsets
	ld a, $9
	ld de, CutTreeOAMBlock
	jp WriteOAMBlock
.grass
	; One leaf tile is enough; the four OAM entries flip it into a 2x2 puff.
	ld de, MoveAnimationTiles1 tile $6 ; leaf tile
	ld hl, vChars1 tile $7c
	lb bc, BANK(MoveAnimationTiles1), 1
	call CopyVideoData
	call GetCutOrBoulderDustAnimationOffsets
	ld a, $9
	ld de, GrassOrBoulderDustOAMBlock
	call WriteOAMBlock
	ld hl, wShadowOAMSprite36Attributes
	ld de, OBJ_SIZE
	ld a, OAM_XFLIP | OAM_PAL1
	ld c, e
.loop
	ld [hl], a
	add hl, de
	xor OAM_YFLIP | OAM_XFLIP
	dec c
	jr nz, .loop
	ret

CutTreeOAMBlock:
	db $fc, OAM_PAL1
	db $fd, OAM_PAL1
	db $fe, OAM_PAL1
	db $ff, OAM_PAL1

GrassOrBoulderDustOAMBlock:
	db $fc, OAM_PAL1
	db $fc, OAM_PAL1
	db $fc, OAM_PAL1
	db $fc, OAM_PAL1

GetCutOrBoulderDustAnimationOffsets:
; Return the animation origin in bc, relative to the player's sprite position.
; wWhichAnimationOffsets selects cut tree/grass offsets or boulder dust offsets.
	ld hl, wSpritePlayerStateData1YPixels
	ld a, [hli] ; player's sprite screen Y position
	ld b, a
	inc hl
	ld a, [hli] ; player's sprite screen X position
	ld c, a ; bc holds ypos/xpos of player's sprite
	inc hl
	inc hl
	ld a, [hl] ; a holds direction of player (00: down, 04: up, 08: left, 0C: right)
	srl a
	ld e, a
	ld d, 0 ; de holds direction (00: down, 02: up, 04: left, 06: right)
	ld a, [wWhichAnimationOffsets]
	and a
	ld hl, CutAnimationOffsets
	jr z, .next
	ld hl, BoulderDustAnimationOffsets
.next
	add hl, de
	ld a, [hli] ; x offset
	add c
	ld c, a
	ld a, [hl]  ; y offset
	add b
	ld b, a
	ret

CutAnimationOffsets:
; x, y offsets from the player for the cut tree/grass animation.
	db  8, 36 ; player is facing down
	db  8,  4 ; player is facing up
	db -8, 20 ; player is facing left
	db 24, 20 ; player is facing right

BoulderDustAnimationOffsets:
; x, y offsets from the player for boulder dust, two blocks ahead.
	db   8,  52 ; player is facing down
	db   8, -12 ; player is facing up
	db -24,  20 ; player is facing left
	db  40,  20 ; player is facing right

; marcelnote - modified cut trees engine
ReplaceTreeTileBlock:
; Replace the cuttable block in front of the player, and record tree cuts so
; they can be replayed if the map is rebuilt during a connected-map transition.
	call GetCutTreeBlock ; hl = destination block, wBuffer = source block pointer
	ret nc
	ld de, CutTreeBlockSwaps
	ld c, [hl] ; current block ID

; Find the current block in CutTreeBlockSwaps.
.loop
	ld a, [de]
	cp $ff
	ret z
	inc de
	cp c
	jr z, .found
	inc de
	jr .loop
.found
	ld a, [de] ; replacement tile block from matching array entry
	ld [hl], a ; update wOverworldMap
	; fallthrough

RecordTemporaryCutTreeBlockReplacement:
; Append the last replaced tree block to wTemporaryTileBlockReplacements.
; wBuffer + 1 = source block pointer, a = replacement block ID.
	ld [wBuffer + 3], a ; replacement block
	ld a, [wCutTile]
	cp $52 ; cut grass does not need to persist across map rebuilds
	ret z

; Stop recording if the fixed-size table is already full.
	ld a, [wTemporaryTileBlockReplacementsCount]
	cp NUM_CUT_TREE_REPLACEMENTS
	ret nc

; Increment counter and advance to the next free entry.
	ld hl, wTemporaryTileBlockReplacementsCount
	inc [hl]
	inc hl ; hl = wTemporaryTileBlockReplacements
	ld bc, CUT_TREE_REPLACEMENT_LENGTH
	call AddNTimes
	ld a, [wCurMap] ; map ID
	ld [hli], a
	ld a, [wBuffer + 1] ; source block pointer low byte
	ld [hli], a
	ld a, [wBuffer + 2] ; source block pointer high byte
	ld [hli], a
	ld a, [wBuffer + 3] ; replacement block
	ld [hl], a
	ret

GetCutTreeBlock:
; Return the block in front of the player.
; hl = wOverworldMap destination, wBuffer + 1 = map data source, carry = found
; First get the target tile coordinates from the player's position and facing.
	ld a, [wYCoord]
	ld b, a
	ld a, [wXCoord]
	ld c, a
	ld a, [wSpritePlayerStateData1FacingDirection]
	and a ; SPRITE_FACING_DOWN?
	jr nz, .notFacingDown
	inc b
	jr .gotTargetTileCoords
.notFacingDown
	cp SPRITE_FACING_UP
	jr nz, .notFacingUp
	dec b
	jr .gotTargetTileCoords
.notFacingUp
	cp SPRITE_FACING_LEFT
	jr nz, .notFacingLeft
	dec c
	jr .gotTargetTileCoords
.notFacingLeft
	inc c
.gotTargetTileCoords
; Only record blocks that belong to the current map's own map data.
	ld hl, wCurrentMapHeight2
	ld a, b
	cp [hl]
	ret nc ; no match if b >= map height
	inc hl ; hl = wCurrentMapWidth2
	ld a, c
	cp [hl]
	ret nc ; no match if c >= map width
	srl b
	srl c

; Convert target block coordinates to a source pointer in the map's block data.
	push bc
	ld a, [wCurMapDataPtr]
	ld l, a
	ld a, [wCurMapDataPtr + 1]
	ld h, a
	ld a, b
	and a
	jr z, .gotSourceRow
	ld a, [wCurMapWidth]
	ld e, a
	ld d, 0
.sourceRowLoop
	add hl, de
	dec b
	jr nz, .sourceRowLoop
.gotSourceRow ; b = 0
	add hl, bc
	ld a, l
	ld [wBuffer + 1], a
	ld a, h
	ld [wBuffer + 2], a
	pop bc

; Convert target block coordinates to the matching destination in wOverworldMap.
	ld a, [wCurMapWidth]
	add MAP_BORDER * 2
	ld e, a
	ld d, 0        ; de = row size
	ld hl, wOverworldMap
	ld a, b
	add MAP_BORDER ; also skip 3 border rows
.destRow
	add hl, de
	dec a
	jr nz, .destRow
	ld a, c
	add MAP_BORDER
	ld e, a
	ld d, 0
	add hl, de
	scf
	ret

ApplyTemporaryTileBlockReplacements::
; Replay recorded cut-tree replacements after LoadTileBlockMap has rebuilt
; wOverworldMap for the current map and its connection borders.
	ld a, [wTemporaryTileBlockReplacementsCount]
	and a
	ret z
	ld b, a ; b = cut trees count
	ld hl, wTemporaryTileBlockReplacements

; Load each table entry into scratch and try to apply it to the visible map.
.loop
	push bc
	ld a, [hli] ; map ID
	ld [wBuffer], a
	ld a, [hli] ; source block pointer low byte
	ld [wBuffer + 1], a
	ld a, [hli] ; source block pointer high byte
	ld [wBuffer + 2], a
	ld a, [hli] ; replacement block
	ld [wBuffer + 3], a
	push hl
	call ApplyTemporaryTileBlockReplacement
	pop hl
	pop bc
	dec b
	jr nz, .loop
	ret

ApplyTemporaryTileBlockReplacement:
; Try the current map first, then each connected map whose border is loaded.
	ld a, [wBuffer] ; map ID
	ld c, a
	ld a, [wCurMap]
	cp c
	jr nz, .northConnection
	call ApplyTemporaryTileBlockReplacementToCurrentMap
	ret c
.northConnection
	ld a, [wNorthConnectedMap]
	cp $ff
	jr z, .southConnection
	ld c, a
	ld a, [wBuffer] ; map ID
	cp c
	jr nz, .southConnection
	ld hl, wNorthConnectionHeader
	call ApplyTemporaryTileBlockReplacementToNorthSouthConnection
	ret c
.southConnection
	ld a, [wSouthConnectedMap]
	cp $ff
	jr z, .westConnection
	ld c, a
	ld a, [wBuffer] ; map ID
	cp c
	jr nz, .westConnection
	ld hl, wSouthConnectionHeader
	call ApplyTemporaryTileBlockReplacementToNorthSouthConnection
	ret c
.westConnection
	ld a, [wWestConnectedMap]
	cp $ff
	jr z, .eastConnection
	ld c, a
	ld a, [wBuffer] ; map ID
	cp c
	jr nz, .eastConnection
	ld hl, wWestConnectionHeader
	call ApplyTemporaryTileBlockReplacementToEastWestConnection
	ret c
.eastConnection
	ld a, [wEastConnectedMap]
	cp $ff
	ret z
	ld c, a
	ld a, [wBuffer] ; map ID
	cp c
	ret nz
	ld hl, wEastConnectionHeader
	jr ApplyTemporaryTileBlockReplacementToEastWestConnection

ApplyTemporaryTileBlockReplacementToCurrentMap:
; Set up a full current-map region.
	ld a, [wCurMapWidth]
	ld [wBuffer + 4], a ; source stride
	add MAP_BORDER * 2
	ld [wBuffer + 5], a ; destination stride
	ld e, a
	ld d, 0
	ld hl, wOverworldMap
	add hl, de
	add hl, de
	add hl, de
	ld e, MAP_BORDER
	add hl, de ; skip north and west borders
	ld d, h
	ld e, l
	ld a, [wCurMapDataPtr]
	ld l, a
	ld a, [wCurMapDataPtr + 1]
	ld h, a
	ld a, [wCurMapHeight]
	ld b, a
	ld a, [wCurMapWidth]
	ld c, a
	jr ApplyTemporaryTileBlockReplacementToRegion

ApplyTemporaryTileBlockReplacementToNorthSouthConnection:
; Set up the visible 3-row strip for a north or south connection.
	inc hl ; connected map
	ld a, [hli] ; strip source
	ld e, a
	ld a, [hli]
	ld d, a
	push de
	ld a, [hli] ; strip destination
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli] ; strip width
	ld c, a
	ld a, [hl] ; connected map width
	ld [wBuffer + 4], a ; source stride
	ld a, [wCurMapWidth]
	add MAP_BORDER * 2
	ld [wBuffer + 5], a ; destination stride
	ld b, MAP_BORDER
	pop hl
	jr ApplyTemporaryTileBlockReplacementToRegion

ApplyTemporaryTileBlockReplacementToEastWestConnection:
; Set up the visible 3-column strip for a west or east connection.
	inc hl ; connected map
	ld a, [hli] ; strip source
	ld e, a
	ld a, [hli]
	ld d, a
	push de
	ld a, [hli] ; strip destination
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli] ; strip height
	ld b, a
	ld a, [hl] ; connected map width
	ld [wBuffer + 4], a ; source stride
	ld a, [wCurMapWidth]
	add MAP_BORDER * 2
	ld [wBuffer + 5], a ; destination stride
	ld c, MAP_BORDER
	pop hl
	; fallthrough

ApplyTemporaryTileBlockReplacementToRegion:
; hl = source top-left, de = destination top-left, b = rows, c = columns
; Scan a source region for the recorded source pointer. If found, patch the
; corresponding destination block in wOverworldMap.
.row
	push bc
	push hl
	push de
.innerLoop
	ld a, [wBuffer + 2]
	cp h
	jr nz, .nextBlock
	ld a, [wBuffer + 1]
	cp l
	jr nz, .nextBlock

; The recorded source pointer is visible in this region; replay the block swap.
	ld a, [wBuffer + 3]
	ld [de], a
	pop de
	pop hl
	pop bc
	scf
	ret
.nextBlock
	inc hl
	inc de
	dec c
	jr nz, .innerLoop

; Move source and destination pointers to the next row of their regions.
	pop de
	pop hl
	ld a, [wBuffer + 4]
	ld b, c ; c = 0
	ld c, a
	add hl, bc
	ld a, [wBuffer + 5]
	add e
	ld e, a
	jr nc, .noDestCarry
	inc d
.noDestCarry
	pop bc
	dec b
	jr nz, .row
	and a
	ret

INCLUDE "data/tilesets/cut_tree_blocks.asm"
