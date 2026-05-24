DEF BATTLE_HUD_POKEBALL_TILE       EQU $31
DEF BATTLE_HUD_STATUS_BALL_TILE    EQU BATTLE_HUD_POKEBALL_TILE + 1
DEF BATTLE_HUD_FAINTED_BALL_TILE   EQU BATTLE_HUD_POKEBALL_TILE + 2
DEF BATTLE_HUD_EMPTY_BALL_TILE     EQU BATTLE_HUD_POKEBALL_TILE + 3

DrawAllPokeballs:
	call LoadPartyPokeballGfx
	call SetupOwnPartyPokeballs
	ld a, [wIsInBattle]
	dec a
	ret z ; return if wild pokémon
	jr SetupEnemyPartyPokeballs

DrawEnemyPokeballs:
	call LoadPartyPokeballGfx
	jr SetupEnemyPartyPokeballs

LoadPartyPokeballGfx:
	ld de, PokeballTileGraphics
	ld hl, vSprites tile BATTLE_HUD_POKEBALL_TILE
	lb bc, BANK(PokeballTileGraphics), (PokeballTileGraphicsEnd - PokeballTileGraphics) / TILE_SIZE
	jp CopyVideoData

SetupOwnPartyPokeballs:
	call PlacePlayerPokeballsHUDTiles
	ld hl, wPartyMons
	ld de, wPartyCount
	call SetupPokeballs
	ld a, $60
	ld hl, wBaseCoordX
	ld [hli], a
	ld [hl], a
	ld a, 8
	ld [wHUDPokeballGfxOffsetX], a
	ld hl, wShadowOAM
	jr WritePokeballOAMData

SetupEnemyPartyPokeballs:
	call PlaceEnemyHUDTiles
	ld hl, wEnemyMons
	ld de, wEnemyPartyCount
	call SetupPokeballs
	ld hl, wBaseCoordX
	ld a, $48
	ld [hli], a
	ld [hl], $20
	ld a, -8
	ld [wHUDPokeballGfxOffsetX], a
	ld hl, wShadowOAMSprite06
	jr WritePokeballOAMData

SetupPokeballs:
	ld a, [de]
	push af
	ld de, wBuffer
	ld c, PARTY_LENGTH
	ld a, BATTLE_HUD_EMPTY_BALL_TILE
.emptyloop
	ld [de], a
	inc de
	dec c
	jr nz, .emptyloop
	pop af
	ld de, wBuffer
.monloop
	push af
	call PickPokeball
	inc de
	pop af
	dec a
	jr nz, .monloop
	ret

PickPokeball:
	inc hl
	ld a, [hli]
	and a
	jr nz, .alive
	ld a, [hl]
	and a
	ld b, BATTLE_HUD_FAINTED_BALL_TILE
	jr z, .doneFainted
.alive
	inc hl
	inc hl
	ld a, [hl] ; status
	and a
	ld b, BATTLE_HUD_STATUS_BALL_TILE
	jr nz, .done
	dec b ; regular ball
	jr .done
.doneFainted
	inc hl
	inc hl
.done
	ld a, b
	ld [de], a
	ld bc, PARTYMON_STRUCT_LENGTH - MON_STATUS
	add hl, bc ; next mon struct
	ret

WritePokeballOAMData:
	ld de, wBuffer
	ld c, PARTY_LENGTH
.loop
	ld a, [wBaseCoordY]
	ld [hli], a
	ld a, [wBaseCoordX]
	ld [hli], a
	ld a, [de]
	ld [hli], a
	xor a
	ld [hli], a
	ld a, [wBaseCoordX]
	ld b, a
	ld a, [wHUDPokeballGfxOffsetX]
	add b
	ld [wBaseCoordX], a
	inc de
	dec c
	jr nz, .loop
	ret

PlacePlayerPokeballsHUDTiles:
	ld hl, PlayerBattlePokeballsHUDGraphicsTiles
	jr PlacePlayerMonHUDTiles.got_tiles
PlacePlayerMonHUDTiles:
	ld hl, PlayerBattleMonHUDGraphicsTiles
.got_tiles
	ld de, wHUDGraphicsTiles
	ld bc, 2
	call CopyData
	hlcoord 18, 10
	ld de, -1
	jr PlaceHUDTiles

PlayerBattlePokeballsHUDGraphicsTiles:
; The tile numbers for specific parts of the battle display for the player's pokemon
	db "<RIGHT_CORNER>"  ; lower-right corner tile of the HUD
	db "<LEFT_TRIANGLE>" ; lower-left triangle tile of the HUD

PlayerBattleMonHUDGraphicsTiles:
; The tile numbers for specific parts of the battle display for the player's pokemon
	db "<RIGHT_EXP_BAR>" ; lower-right corner tile of the HUD with small bump for Exp Bar
	db "<LEFT_TRIANGLE>" ; lower-left triangle tile of the HUD

PlaceEnemyHUDTiles:
	call DrawOwnedWildMonIcon ; marcelnote - caught mon icon
	ld hl, EnemyBattleHUDGraphicsTiles
	ld de, wHUDGraphicsTiles
	ld bc, 2
	call CopyData
	hlcoord 1, 2
	ld de, $1
	jr PlaceHUDTiles

EnemyBattleHUDGraphicsTiles:
; The tile numbers for specific parts of the battle display for the enemy
	db "<LEFT_CORNER>"    ; lower-left corner tile of the HUD
	db "<RIGHT_TRIANGLE>" ; lower-right triangle tile of the HUD

PlaceHUDTiles:
	ld [hl], '<HUD_VERTI_BAR>'
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld a, [wHUDGraphicsTiles] ; leftmost tile
	ld [hl], a
	ld a, 8
.loop
	add hl, de
	ld [hl], '<HUD_HORIZ_BAR>'
	dec a
	jr nz, .loop
	add hl, de
	ld a, [wHUDGraphicsTiles + 1] ; rightmost tile
	ld [hl], a
	ret

SetupPlayerAndEnemyPokeballs:
	call LoadPartyPokeballGfx
	ld hl, wPartyMons
	ld de, wPartyCount
	call SetupPokeballs
	ld hl, wBaseCoordX
	ld a, $50
	ld [hli], a
	ld [hl], $40
	ld a, 8
	ld [wHUDPokeballGfxOffsetX], a
	ld hl, wShadowOAM
	call WritePokeballOAMData
	ld hl, wEnemyMons
	ld de, wEnemyPartyCount
	call SetupPokeballs
	ld hl, wBaseCoordX
	ld a, $50
	ld [hli], a
	ld [hl], $68
	ld hl, wShadowOAMSprite06
	jp WritePokeballOAMData

DrawOwnedWildMonIcon: ; marcelnote - caught mon icon
; Draws the caught icon beside the enemy HUD if the current wild mon is owned.
	ld a, [wIsInBattle]
	dec a
	ret nz
	ld a, [wBattleType]
	cp BATTLE_TYPE_OLD_MAN
	ret z

	; Convert the enemy species to a Pokédex number and test the owned flag.
	ld a, [wPokedexNum]
	push af
	ld a, [wEnemyMonSpecies2]
	ld [wPokedexNum], a
	predef IndexToPokedex
	ld a, [wPokedexNum]
	dec a
	ld c, a
	ld b, FLAG_TEST
	ld hl, wPokedexOwned
	predef FlagActionPredef
	pop af
	ld [wPokedexNum], a
	ld a, c
	and a
	ret z

	; Place the caught icon.
	hlcoord 1, 1
	ld a, $eb
	ld [hl], a
	ret

CaughtIconTileGraphics:: INCBIN "gfx/battle/caught_icon.1bpp"

; four tiles: pokeball, black pokeball (status ailment), crossed out pokeball (fainted) and pokeball slot (no mon)
PokeballTileGraphics:: INCBIN "gfx/battle/balls.2bpp"
PokeballTileGraphicsEnd:
