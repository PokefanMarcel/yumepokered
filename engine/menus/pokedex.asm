ShowPokedexMenu:
	call GBPalWhiteOut
	call ClearScreen
	call UpdateSprites
	ld a, [wListScrollOffset]
	push af
	xor a
	ld [wCurrentMenuItem], a
	ld [wListScrollOffset], a
	ld [wLastMenuItem], a
	inc a
	ld [wPokedexNum], a
	ldh [hJoy7], a
.setUpGraphics
	ld b, SET_PAL_GENERIC
	call RunPaletteCommand
	callfar LoadPokedexTilePatterns
.doPokemonListMenu
	ld hl, wTopMenuItemY
	ld a, 3
	ld [hli], a ; top menu item Y
	xor a
	ld [hli], a ; top menu item X
	inc a
	ld [wMenuWatchMovingOutOfBounds], a
	inc hl
	inc hl
	ld a, 6
	ld [hli], a ; max menu item ID
	ld [hl], PAD_LEFT | PAD_RIGHT | PAD_B | PAD_A
	call HandlePokedexListMenu
	jr c, .goToSideMenu ; if the player chose a pokemon from the list
.exitPokedex
	xor a
	ld [wMenuWatchMovingOutOfBounds], a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ldh [hJoy7], a
	;ld [wUnusedOverrideSimulatedJoypadStatesIndex], a
	ld [wOverrideSimulatedJoypadStatesMask], a
	pop af
	ld [wListScrollOffset], a
	call GBPalWhiteOutWithDelay3
	call RunDefaultPaletteCommand
	jp ReloadMapData
.goToSideMenu
	call HandlePokedexSideMenu
	dec b
	jr z, .exitPokedex ; if the player chose Quit
	dec b
	jr z, .doPokemonListMenu ; if pokemon not seen or player pressed B button
	jp .setUpGraphics ; if pokemon data or area was shown

; handles the menu on the lower right in the pokedex screen
; OUTPUT:
; b = reason for exiting menu
; 00: showed pokemon data or area
; 01: the player chose Quit
; 02: the pokemon has not been seen yet or the player pressed the B button
HandlePokedexSideMenu:
	call PlaceUnfilledArrowMenuCursor
	ld a, [wCurrentMenuItem]
	push af
	ld b, a
	ld a, [wLastMenuItem]
	push af
	ld a, [wListScrollOffset]
	push af
	add b
	inc a
	ld [wPokedexNum], a
	ld a, [wPokedexNum]
	push af
	ld a, [wDexMaxSeenMon]
	push af ; this doesn't need to be preserved
	ld hl, wPokedexSeen
	call IsPokemonBitSet
	ld b, 2
	jr z, .exitSideMenu
	call PokedexToIndex
	ld hl, wTopMenuItemY
	ld a, 10
	ld [hli], a ; top menu item Y
	ld a, 15
	ld [hli], a ; top menu item X
	xor a
	ld [hli], a ; current menu item ID
	inc hl
	ld a, 3
	ld [hli], a ; max menu item ID
	;ld a, PAD_A | PAD_B
	ld [hli], a ; menu watched keys (A button and B button)
	xor a
	ld [hli], a ; old menu item ID
	ld [wMenuWatchMovingOutOfBounds], a
.handleMenuInput
	call HandleMenuInput
	bit B_PAD_B, a
	ld b, 2
	jr nz, .buttonBPressed
	ld a, [wCurrentMenuItem]
	and a
	jr z, .choseData
	dec a
	jr z, .choseMove ; marcelnote - reorganized for learnset page
	dec a
	jr z, .choseArea
	jr .choseCry
.exitSideMenu
	pop af
	ld [wDexMaxSeenMon], a
	pop af
	ld [wPokedexNum], a
	pop af
	ld [wListScrollOffset], a
	pop af
	ld [wLastMenuItem], a
	pop af
	ld [wCurrentMenuItem], a
	push bc
	hlcoord 0, 3
	ld de, 20
	lb bc, " ", 13
	call DrawTileLine ; cover up the menu cursor in the pokemon list
	pop bc
	ret

.buttonBPressed
	push bc
	hlcoord 15, 10
	ld de, 20
	lb bc, " ", 7
	call DrawTileLine ; cover up the menu cursor in the side menu
	pop bc
	jr .exitSideMenu

.choseData
	call ShowPokedexDataInternal
	ld b, 0
	jr .exitSideMenu

.choseMove ; marcelnote - new for learnset page
    call ShowPokedexMoves
    ld b, 0
    jr .exitSideMenu

.choseArea
	predef LoadTownMap_Nest ; display pokemon areas
	ld b, 0
	jr .exitSideMenu

; play pokemon cry
.choseCry
	ld a, [wPokedexNum]
	push af
	call PlayCry
	pop af
	ld [wPokedexNum], a
;	call GetCryData
;	call PlaySound
	jr .handleMenuInput

; handles the list of pokemon on the left of the pokedex screen
; sets carry flag if player presses A, unsets carry flag if player presses B
HandlePokedexListMenu:
	xor a
	ldh [hAutoBGTransferEnabled], a
; draw the horizontal line separating the seen and owned amounts from the menu
	hlcoord 15, 8
	ld a, "─"
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	hlcoord 14, 0
	ld [hl], $61 ; vertical line tile
	hlcoord 14, 1
	call DrawPokedexVerticalLine
	ld hl, wPokedexSeen
	ld b, wPokedexSeenEnd - wPokedexSeen
	call CountSetBits
	ld de, wNumSetBits
	hlcoord 16, 3
	lb bc, 1, 3
	call PrintNumber ; print number of seen pokemon
	ld hl, wPokedexOwned
	ld b, wPokedexOwnedEnd - wPokedexOwned
	call CountSetBits
	ld de, wNumSetBits
	hlcoord 16, 6
	lb bc, 1, 3
	call PrintNumber ; print number of owned pokemon
	hlcoord 16, 2
	ld de, PokedexSeenText
	call PlaceString
	hlcoord 16, 5
	ld de, PokedexOwnText
	call PlaceString
	hlcoord 1, 1
	ld de, PokedexContentsText
	call PlaceString
	hlcoord 16, 10
	ld de, PokedexMenuItemsText
	call PlaceString
; find the highest pokedex number among the pokemon the player has seen
	ld hl, wPokedexSeenEnd - 1
	ld b, (wPokedexSeenEnd - wPokedexSeen) * 8 + 1
.maxSeenPokemonLoop
	ld a, [hld]
	ld c, 8
.maxSeenPokemonInnerLoop
	dec b
	sla a
	jr c, .storeMaxSeenPokemon
	dec c
	jr nz, .maxSeenPokemonInnerLoop
	jr .maxSeenPokemonLoop

.storeMaxSeenPokemon
	ld a, b
	ld [wDexMaxSeenMon], a
.loop
	xor a
	ldh [hAutoBGTransferEnabled], a
	hlcoord 4, 2
	lb bc, 14, 10
	call ClearScreenArea
	hlcoord 1, 3
	ld a, [wListScrollOffset]
	ld [wPokedexNum], a
	ld d, 7
	ld a, [wDexMaxSeenMon]
	cp 7
	jr nc, .printPokemonLoop
	ld d, a
	dec a
	ld [wMaxMenuItem], a
; loop to print pokemon pokedex numbers and names
; if the player has owned the pokemon, it puts a pokeball beside the name
.printPokemonLoop
	ld a, [wPokedexNum]
	inc a
	ld [wPokedexNum], a
	push af
	push de
	push hl
	ld de, -SCREEN_WIDTH
	add hl, de
	ld de, wPokedexNum
	lb bc, LEADING_ZEROES | 1, 3
	call PrintNumber
	ld de, SCREEN_WIDTH
	add hl, de
	dec hl
	push hl
	ld hl, wPokedexOwned
	call IsPokemonBitSet
	pop hl
	ld a, " "
	jr z, .writeTile
	ld a, $62 ; pokeball tile
.writeTile
	ld [hl], a ; put a pokeball next to pokemon that the player has owned
	push hl
	ld hl, wPokedexSeen
	call IsPokemonBitSet
	jr nz, .getPokemonName ; if the player has seen the pokemon
	ld de, .dashedLine ; print a dashed line in place of the name if the player hasn't seen the pokemon
	jr .skipGettingName
.dashedLine ; for unseen pokemon in the list
	db "----------@"
.getPokemonName
	call PokedexToIndex
	call GetMonName
.skipGettingName
	pop hl
	inc hl
	call PlaceString
	pop hl
	ld bc, 2 * SCREEN_WIDTH
	add hl, bc
	pop de
	pop af
	ld [wPokedexNum], a
	dec d
	jr nz, .printPokemonLoop
	ld a, 01
	ldh [hAutoBGTransferEnabled], a
	call Delay3
	call GBPalNormal
	call HandleMenuInput
	bit B_PAD_B, a
	jp nz, .buttonBPressed
.checkIfUpPressed
	bit B_PAD_UP, a
	jr z, .checkIfDownPressed
.upPressed ; scroll up one row
	ld a, [wListScrollOffset]
	and a
	jp z, .loop
	dec a
	ld [wListScrollOffset], a
	jp .loop
.checkIfDownPressed
	bit B_PAD_DOWN, a
	jr z, .checkIfRightPressed
.downPressed ; scroll down one row
	ld a, [wDexMaxSeenMon]
	cp 7
	jp c, .loop ; can't if the list is shorter than 7
	sub 7
	ld b, a
	ld a, [wListScrollOffset]
	cp b
	jp z, .loop
	inc a
	ld [wListScrollOffset], a
	jp .loop
.checkIfRightPressed
	bit B_PAD_RIGHT, a
	jr z, .checkIfLeftPressed
.rightPressed ; scroll down 7 rows
	ld a, [wDexMaxSeenMon]
	cp 7
	jp c, .loop ; can't if the list is shorter than 7
	sub 6
	ld b, a
	ld a, [wListScrollOffset]
	add 7
	ld [wListScrollOffset], a
	cp b
	jp c, .loop
	dec b
	ld a, b
	ld [wListScrollOffset], a
	jp .loop
.checkIfLeftPressed ; scroll up 7 rows
	bit B_PAD_LEFT, a
	jr z, .buttonAPressed
.leftPressed
	ld a, [wListScrollOffset]
	sub 7
	ld [wListScrollOffset], a
	jp nc, .loop
	xor a
	ld [wListScrollOffset], a
	jp .loop
.buttonAPressed
	scf
	ret
.buttonBPressed
	and a
	ret

DrawPokedexVerticalLine:
	ld c, 17 ; height of line
	ld de, SCREEN_WIDTH
	ld a, $61 ; vertical line tile
.loop
	ld [hl], a
	add hl, de
	xor 1 ; toggle between vertical line tile and box tile
	dec c
	jr nz, .loop
	ret


; tests if a pokemon's bit is set in the seen or owned pokemon bit fields
; INPUT:
; [wPokedexNum] = pokedex number
; hl = address of bit field
IsPokemonBitSet:
	ld a, [wPokedexNum]
	dec a
	ld c, a
	ld b, FLAG_TEST
	predef FlagActionPredef
	ld a, c
	and a
	ret

; function to display pokedex data from outside the pokedex
ShowPokedexData:
	call GBPalWhiteOutWithDelay3
	call ClearScreen
	call UpdateSprites
	callfar LoadPokedexTilePatterns ; load pokedex tiles

; function to display pokedex data from inside the pokedex
ShowPokedexDataInternal:
	ld hl, wStatusFlags2
	set BIT_NO_AUDIO_FADE_OUT, [hl]
	ld a, $33 ; 3/7 volume
	ldh [rAUDVOL], a
	call GBPalWhiteOut ; zero all palettes
	call ClearScreen
	ld a, [wPokedexNum]
	ld [wCurPartySpecies], a
	push af
	ld b, SET_PAL_POKEDEX
	call RunPaletteCommand
	pop af
	ld [wPokedexNum], a
	ldh a, [hTileAnimations]
	push af
	xor a
	ldh [hTileAnimations], a

	hlcoord 0, 0
	ld de, 1
	lb bc, $64, SCREEN_WIDTH
	call DrawTileLine ; draw top border

	hlcoord 0, 17
	ld b, $6d
	call DrawTileLine ; draw bottom border

	hlcoord 0, 1
	ld de, 20
	lb bc, $66, $10
	call DrawTileLine ; draw left border

	hlcoord 19, 1
	ld b, $68
	call DrawTileLine ; draw right border

	ld a, $63 ; upper left corner tile
	ldcoord_a 0, 0
	ld a, $65 ; upper right corner tile
	ldcoord_a 19, 0
	ld a, $6c ; lower left corner tile
	ldcoord_a 0, 17
	ld a, $6e ; lower right corner tile
	ldcoord_a 19, 17

	hlcoord 0, 9
	ld de, PokedexDataDividerLine
	call PlaceString ; draw horizontal divider line

	hlcoord 9, 6
	ld a, [wOptions]
	bit BIT_UNITS_METRIC, a
	ld de, HeightWeightText
	jr z, .gotHTWTText
	ld de, HeightWeightMetricText
.gotHTWTText
	call PlaceString

	call GetMonName
	hlcoord 9, 2
	call PlaceString

	ld hl, PokedexEntryPointers
	ld a, [wPokedexNum]
	dec a
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl] ; de = address of pokedex entry

	hlcoord 9, 4
	call PlaceString ; print species name

	ld h, b
	ld l, c
	push de
	ld a, [wPokedexNum]
	push af
	call IndexToPokedex

	hlcoord 2, 8
	ld a, "№"
	ld [hli], a
	ld a, "<DOT>"
	ld [hli], a
	ld de, wPokedexNum
	lb bc, LEADING_ZEROES | 1, 3
	call PrintNumber ; print pokedex number

	ld hl, wPokedexOwned
	call IsPokemonBitSet
	pop af
	ld [wPokedexNum], a
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	pop de

	push af
	push bc
	push de
	push hl

	call Delay3
	call GBPalNormal
	call GetMonHeader ; load pokemon picture location
	hlcoord 1, 1
	call LoadFlippedFrontSpriteByMonIndex ; draw pokemon picture

	ld a, [wPokedexNum]
	push af
	ld a, [wCurPartySpecies]
	call PlayCry
	pop af
	ld [wPokedexNum], a

	pop hl
	pop de
	pop bc
	pop af

	ld a, c
	and a
	jp z, .waitForButtonPress ; if the pokemon has not been owned, don't print the height, weight, or description
	inc de ; de = address of feet (height)

	ld a, [wOptions]
	bit BIT_UNITS_METRIC, a
	jr nz, .printMetric

; print Imperial
	hlcoord 12, 6
	lb bc, 1, 2
	call PrintNumber ; print feet (height)
	inc hl ; skip "′"
	inc de ; de = address of inches (height)
	lb bc, LEADING_ZEROES | 1, 2
	call PrintNumber ; print inches (height)
; now print the weight (stored in tenths of pounds)
	inc de  ; de = address of lower/first byte of weight (little-endian)
; put weight in big-endian order at wDexWeight
	ld a, [de] ; a = upper byte of weight
	ld [wDexWeight + 1], a
	inc de
	push de ; save de = address of last byte of weight
	ld a, [de] ; a = lower byte of weight
	ld [wDexWeight], a
	ld de, wDexWeight
	hlcoord 11, 8
	lb bc, 2, 5 ; 2 bytes, 5 digits
	call PrintNumber ; print weight
	hlcoord 14, 8
	ld a, [wDexWeight + 1]
	sub 10
	ld a, [wDexWeight]
	sbc 0
	jr nc, .moreThan1Lb
	ld [hl], "0" ; if the weight is less than 10, put a 0 before the decimal point
.moreThan1Lb
	inc hl
	ld a, [hli]
	ld [hld], a ; make space for the decimal point by moving the last digit forward one tile
	ld [hl], "<DOT>" ; decimal point tile
	pop hl ; restore hl = address of last byte of weight (pounds)
	inc hl ; skip metric entries
	inc hl
	inc hl
	inc hl ; hl = address of pokedex description text
	jr .printData

.printMetric
	inc de ; skip imperial entries
	inc de
	inc de
	inc de ; de = address of height in (tenth of) meters

	hlcoord 13, 6
	lb bc, 1, 3
	call PrintNumber ; print height in meters
	hlcoord 14, 6
	ld a, [de]
	cp 10
	jr nc, .moreThan1Meter
	ld [hl], "0" ; if the weight is less than 10, put a 0 before the decimal point
.moreThan1Meter
	inc hl
	ld a, [hli]
	ld [hld], a ; make space for the decimal point by moving the last digit forward one tile
	ld [hl], "<DOT>" ; decimal point tile
; now print the weight (stored in tenths of kg)
	inc de  ; de = address of lower/first byte of weight (little-endian)
; put weight in big-endian order at wDexWeight
	ld a, [de] ; a = upper byte of weight
	ld [wDexWeight + 1], a
	inc de
	push de ; save de = address of last byte of weight
	ld a, [de] ; a = lower byte of weight
	ld [wDexWeight], a
	ld de, wDexWeight
	hlcoord 11, 8
	lb bc, 2, 5 ; 2 bytes, 5 digits
	call PrintNumber ; print weight
	hlcoord 14, 8
	ld a, [wDexWeight + 1]
	sub 10
	ld a, [wDexWeight]
	sbc 0
	jr nc, .moreThan1Kg
	ld [hl], "0" ; if the weight is less than 10, put a 0 before the decimal point
.moreThan1Kg
	inc hl
	ld a, [hli]
	ld [hld], a ; make space for the decimal point by moving the last digit forward one tile
	ld [hl], "<DOT>" ; decimal point tile
	pop hl ; restore hl = address of last byte of weight
	inc hl ; hl = address of pokedex description text

.printData
	bccoord 1, 11
	ld a, %10
	ldh [hClearLetterPrintingDelayFlags], a
	call TextCommandProcessor ; print pokedex description text
	xor a
	ldh [hClearLetterPrintingDelayFlags], a
	CheckEvent EVENT_GOT_POKEDEX
	jr z, .waitForButtonPress ; don't display more pages if showing starters in Oak's lab
.waitForButtonPress2
	call JoypadLowSensitivity
	ldh a, [hJoy5]
	and PAD_A | PAD_B
	jr z, .waitForButtonPress2
	ld a, SFX_PRESS_AB
	call PlaySound
	hlcoord 1, 11
	lb bc, 5, 18
	call ClearScreenArea ; clear below sprite
	hlcoord 9, 6
	lb bc, 3, 10
	call ClearScreenArea ; clear height and weight
	ld c, 20
	call DelayFrames
	hlcoord 9, 6
	ld de, PokedexTypeText
	call PlaceString ; "TYPE/"
	hlcoord 10, 7
	predef PrintMonType ; Pokémon type
	call PrintBaseStats
.waitForButtonPress
	call JoypadLowSensitivity
	ldh a, [hJoy5]
	and PAD_A | PAD_B
	jr z, .waitForButtonPress
	pop af
	ldh [hTileAnimations], a
	call GBPalWhiteOut
	call ClearScreen
	call RunDefaultPaletteCommand
	call LoadTextBoxTilePatterns
	call GBPalNormal
	ld hl, wStatusFlags2
	res BIT_NO_AUDIO_FADE_OUT, [hl]
	ld a, $77 ; max volume
	ldh [rAUDVOL], a
	ret

PrintBaseStats: ; marcelnote - new
	ldh a, [hUILayoutFlags]
	push af
	set BIT_SINGLE_SPACED_LINES, a
	ldh [hUILayoutFlags], a
	hlcoord 2, 11 ; Stats text
	ld de, PokedexStatsText
	call PlaceString
	pop af
	ldh [hUILayoutFlags], a

	ld c, 5                 ; number of stats
	hlcoord 10, 11          ; hl = coord of first stat bar

.loopStats
	push bc ; save c = stat counter
	push hl ; save hl = screen coord

	ld a, 5
	sub c
	ld c, a
	ld b, 0
	ld hl, wMonHBaseStats
	add hl, bc
	ld a, [hl] ; a = [wMonHBaseStats + (5 - c)], current stat 0-255
	srl a
	cp $3f ; is stat >= 128?
	ld e, 0
	jr c, .lessThan128
	sub $3f
	ld e, 8
.lessThan128
	ld c, a    ; c = pixels to fill

	pop hl     ; restore hl = screen coord
	ld b, 8    ; 8 tiles per bar

.loopFullTile
	ld a, c
	sub 8
	jr c, .partialTile
	ld c, a
	ld a, $48  ; full tile
	add e
	ld [hli], a
	dec b
	jr nz, .loopFullTile
	jr .done

.partialTile
	add 8 + $40 ; $40 = empty, $41 = 1px, etc
	add e
	ld [hli], a
	dec b
	jr z, .done

	ld a, $40
	add e
.loopEmptyTile
	ld [hli], a
	dec b
	jr nz, .loopEmptyTile

.done
	ld de, SCREEN_WIDTH - 8 ; line offset between bars
	add hl, de ; move hl to next bar start
	pop bc ; restore c = stat counter
	dec c
	jr nz, .loopStats

	ret


; horizontal line that divides the pokedex text description from the rest of the data
PokedexDataDividerLine:
	db $69, $6a, $67, $6a, $67, $6a, $67, $6a, $67, $67
	db $67, $67, $6a, $67, $6a, $67, $6a, $67, $6a, $6b
	db "@"

; draws a line of tiles
; INPUT:
; b = tile ID
; c = number of tile ID's to write
; de = amount to destination address after each tile (1 for horizontal, 20 for vertical)
; hl = destination address
DrawTileLine:
	push bc
	push de
.loop
	ld [hl], b
	add hl, de
	dec c
	jr nz, .loop
	pop de
	pop bc
	ret

IF DEF(_FRA)
INCLUDE "translation/fra/data/pokemon/dex_entries.asm"
ELSE
INCLUDE "data/pokemon/dex_entries.asm"
ENDC

PokedexToIndex:
	; converts the Pokédex number at [wPokedexNum] to an index
	push bc
	push hl
	ld a, [wPokedexNum]
	ld b, a
	ld c, 0
	ld hl, PokedexOrder

.loop ; go through the list until we find an entry with a matching dex number
	inc c
	ld a, [hli]
	cp b
	jr nz, .loop

	ld a, c
	ld [wPokedexNum], a
	pop hl
	pop bc
	ret

IndexToPokedex:
	; converts the index number at [wPokedexNum] to a Pokédex number
	push bc
	push hl
	ld a, [wPokedexNum]
	dec a
	ld hl, PokedexOrder
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hl]
	ld [wPokedexNum], a
	pop hl
	pop bc
	ret


ShowPokedexMoves: ; marcelnote - new for learnset page
	ld hl, wStatusFlags2
	set BIT_NO_AUDIO_FADE_OUT, [hl]
	ld a, $33 ; 3/7 volume
	ldh [rAUDVOL], a
	call ClearScreen

	hlcoord 0, 0
	ld de, 1
	lb bc, $64, SCREEN_WIDTH
	call DrawTileLine ; draw top border

	hlcoord 0, 17
	ld b, $6d
	call DrawTileLine ; draw bottom border

	hlcoord 0, 1
	ld de, 20
	lb bc, $66, $10
	call DrawTileLine ; draw left border

	hlcoord 19, 1
	ld b, $68
	call DrawTileLine ; draw right border

	ld a, $63 ; upper left corner tile
	ldcoord_a 0, 0
	ld a, $65 ; upper right corner tile
	ldcoord_a 19, 0
	ld a, $6c ; lower left corner tile
	ldcoord_a 0, 17
	ld a, $6e ; lower right corner tile
	ldcoord_a 19, 17

IF DEF(_FRA) ; in French: CAPA. BULBIZARRE
	hlcoord 2, 1
	ld de, PokedexMovesHeader
	call PlaceString
	call GetMonName
	hlcoord 8, 1
	call PlaceString ; Pokémon name
ELSE         ; in English: BULBASAUR's MOVES
	call GetMonName
	hlcoord 2, 1
	call PlaceString ; Pokémon name
	ld h, b
	ld l, c
	ld de, PokedexMovesHeader
	call PlaceString
ENDC

	hlcoord 0, 2
	ld de, PokedexDataDividerLine
	call PlaceString ; draw horizontal divider line

; First, we print level 1 moves.
	ld a, [wPokedexNum]
	push af ; save a = Mon index
	call IndexToPokedex
	ld a, [wPokedexNum]
	dec a
	ld hl, BaseStats
	ld bc, BASE_DATA_SIZE
	call AddNTimes
	ld bc, BASE_MOVES
	add hl, bc
	ld de, wMoveBuffer
	ld a, BANK(BaseStats)
	ld bc, NUM_MOVES
	call FarCopyData ; copy 4 base moves at wMoveBuffer

	decoord  2, 4
	ld hl, wMoveBuffer
.level1Moves
	ld a, [hli]
	and a ; NO_MOVE?
	jr z, .levelUpMoves
	push hl ; save hl = address of next move
	push de ; save de = screen tile
	ld [wNamedObjectIndex], a ; move id
	ld h, d
	ld l, e
	ld a, $6f ; ":L"
	ld [hli], a
	ld a, "1"
	ld [hli], a
	inc hl
	inc hl
	call GetMoveName
	call PlaceString
	pop hl ; restore hl = screen tile
	lb bc, 0, SCREEN_WIDTH
	add hl, bc
	ld d, h
	ld e, l
	pop hl ; restore hl = address of next move
	jr .level1Moves

.levelUpMoves
; Second, we print level-up moves.
	pop af ; restore a = Mon index
	push de ; save de = screen tile
	dec a
	ld hl, EvosMovesPointerTable
	ld b, 0
	ld c, a
	add hl, bc
	add hl, bc
	ld de, wMoveBuffer
	ld a, BANK(EvosMovesPointerTable)
	ld bc, 2
	call FarCopyData ; copy [Mon]EvosMoves pointer at wMoveBuffer

	ld hl, wMoveBuffer
	ld a, [hli]
	ld h, [hl]
	ld l, a          ; hl = [Mon]EvosMoves
	ld de, wMoveBuffer
	ld a, BANK(EvosMovesPointerTable)
	ld bc, 32        ; big enough to copy all [Mon]EvosMoves data
	call FarCopyData ; copy [Mon]EvosMoves data at wMoveBuffer

	pop de ; restore de = screen tile
	ld hl, wMoveBuffer
.skipEvoData
	ld a, [hli]
	and a
	jr nz, .skipEvoData
.loopMoves
	ld a, [hli]
	and a ; terminator?
	jr z, .waitForButtonPress

	ld [wStringBuffer], a     ; level
	ld a, [hli]
	ld [wNamedObjectIndex], a ; move id
	push hl ; save hl = address of next move
	push de ; save de = screen tile

	; check if obtained badges allow printing move
	CheckEvent EVENT_BECAME_CHAMPION
	jr nz, .printMove
	ld a, [wStringBuffer] ; a = level
	call .badgeCheck
	jr nc, .dontPrintMove

.printMove
	ld h, d
	ld l, e
	ld a, $6f ; ":L"
	ld [hli], a
	ld de, wStringBuffer
	lb bc, LEFT_ALIGN | 1, 2
	call PrintNumber
	inc hl
	ld a, [wStringBuffer]
	cp 10
	jr nc, .skipSpace
	inc hl
.skipSpace
	call GetMoveName
	call PlaceString

	pop hl ; restore de = screen tile
	ld b, 0
	ld c, SCREEN_WIDTH
	add hl, bc
	ld d, h
	ld e, l
	pop hl ; restore hl = address of next move
	jr .loopMoves

.dontPrintMove
	ld h, d
	ld l, e
	inc hl
	ld a, "-"
	ld [hli], a
	ld [hli], a
	inc hl
	ld [hli], a

	pop hl ; restore de = screen tile
	ld b, 0
	ld c, SCREEN_WIDTH
	add hl, bc
	ld d, h
	ld e, l
	pop hl ; restore hl = address of next move
	jr .loopMoves

.waitForButtonPress
	call JoypadLowSensitivity
	ldh a, [hJoy5]
	and PAD_A | PAD_B
	jr z, .waitForButtonPress

	call ClearScreen
	ld hl, wStatusFlags2
	res BIT_NO_AUDIO_FADE_OUT, [hl]
	ld a, $77
	ldh [rAUDVOL], a
	ret

.badgeCheck ; a = level move is learned, returns carry flag if allowed to print
	cp 6
	ret c   ; moves below lv5 appear by default
	ld b, 1 << BIT_BOULDERBADGE
	ASSERT BIT_BOULDERBADGE == 0
	cp 11   ; moves between lv6-10 require Boulder Badge
	jr c, .checkBadge
	rlc b   ; 1 << BIT_CASCADEBADGE
	cp 16   ; moves between lv11-15 require Cascade Badge
	jr c, .checkBadge
	rlc b   ; 1 << BIT_THUNDERBADGE
	cp 21   ; etc...
	jr c, .checkBadge
	rlc b   ; 1 << BIT_PRISMBADGE
	cp 26
	jr c, .checkBadge
	rlc b   ; 1 << BIT_SOULBADGE
	cp 31
	jr c, .checkBadge
	rlc b   ; 1 << BIT_MARSHBADGE
	cp 36
	jr c, .checkBadge
	rlc b   ; 1 << BIT_VOLCANOBADGE
	cp 41
	jr c, .checkBadge
	rlc b   ; 1 << BIT_EARTHBADGE
	cp 46   ; moves between lv41-45 require Earth Badge
	jr c, .checkBadge
	ret ; carry flag unset so won't print

.checkBadge
	ld a, [wObtainedBadges]
	and b ; obtained the required badge?
	ret z ; carry flag unset so won't print
	scf
	ret


INCLUDE "data/pokemon/dex_entries.asm"
INCLUDE "data/pokemon/dex_order.asm"

IF DEF(_FRA)
	INCLUDE "translation/fra/data/text/pokedex.asm"
ELSE
	INCLUDE "data/text/pokedex.asm"
ENDC
