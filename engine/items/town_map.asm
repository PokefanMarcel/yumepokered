DEF NOT_VISITED EQU $fe

; marcelnote - object gfx share the player's standing tiles; we restore them on exit
DEF TOWN_MAP_CURSOR_TILE   EQU $04
DEF BIRD_BASE_TILE         EQU TOWN_MAP_CURSOR_TILE
DEF MON_NEST_ICON_TILE     EQU $08

DisplayTownMap: ; marcelnote - optimized
	call LoadTownMap
	ld hl, wUpdateSpritesEnabled
	ld a, [hl]
	push af
	ld [hl], $ff
	push hl
	ld a, $1
	ldh [hJoy7], a
	ld a, [wCurMap]
	push af
	ld b, 0
	call DrawPlayerOrBirdSprite
	hlcoord 1, 0
	call PlaceString
	ld hl, vSprites tile TOWN_MAP_CURSOR_TILE
	ld de, TownMapCursor
	lb bc, BANK(TownMapCursor), (TownMapCursorEnd - TownMapCursor) / TILE_1BPP_SIZE
	call CopyVideoDataDouble
	call LoadTownMapUpArrowGraphics ; marcelnote - added up/down arrows
	xor a
	ld [wWhichTownMapLocation], a
	pop af
	jr .enterLoop

.pressedUp
	hlcoord 18, 0 ; marcelnote - added up/down arrows
	ld a, [wWhichTownMapLocation]
	inc a
	cp TownMapOrderEnd - TownMapOrder ; number of list items + 1
	jr nz, .townMapLoop ; no overflow
	xor a
	jr .townMapLoop
.pressedDown
	hlcoord 19, 0 ; marcelnote - added up/down arrows
	ld a, [wWhichTownMapLocation]
	sub 1
	jr nc, .townMapLoop ; no underflow
	ld a, TownMapOrderEnd - TownMapOrder - 1 ; number of list items
	; fallthrough

.townMapLoop
	ld [hl], ' '
	ld [wWhichTownMapLocation], a
	hlcoord 0, 0
	lb bc, 1, 18 ; marcelnote - added up/down arrows
	call ClearScreenArea
	ld hl, TownMapOrder
	ld a, [wWhichTownMapLocation]
	ld c, a ; b = 0 after ClearScreenArea
	add hl, bc
	ld a, [hl]
.enterLoop
	ld de, wTownMapCoords
	call LoadTownMapEntry
	ld a, [de]
	push hl ; hl = pointer to the map name
	call TownMapCoordsToOAMCoords
	ld a, TOWN_MAP_CURSOR_TILE
	ld [wOAMBaseTile], a
	ld hl, wShadowOAMSprite04
	call WriteTownMapSpriteOAM ; town map cursor sprite
	pop de ; de = pointer to the map name
	hlcoord 1, 0
	call PlaceString
	ld hl, wShadowOAMSprite04
	ld de, wShadowOAMBackupSprite04
	ld bc, OBJ_SIZE * 4
	call CopyData
	ld c, 15 ; marcelnote - blink only the pressed arrow while changing locations, as in Fly
	call DelayFrames
	call DrawTownMapArrows
.inputLoop
	call TownMapSpriteBlinkingAnimation
	call JoypadLowSensitivity
	ldh a, [hJoy5]
	and PAD_A | PAD_B | PAD_UP | PAD_DOWN
	jr z, .inputLoop
	ld b, a
	ld a, SFX_TINK
	call PlaySound
	bit B_PAD_UP, b
	jr nz, .pressedUp
	bit B_PAD_DOWN, b
	jr nz, .pressedDown
	xor a
;	ld [wTownMapSpriteBlinkingEnabled], a ; marcelnote - cleared by ExitTownMap below
	ldh [hJoy7], a
	ld [wAnimCounter], a
	call ExitTownMap
	pop hl
	pop af
	ld [hl], a
	ret

INCLUDE "data/maps/town_map_order.asm"

TownMapCursor:
	INCBIN "gfx/town_map/town_map_cursor.1bpp"
TownMapCursorEnd:


LoadTownMap_Nest: ; marcelnote - completely modified for fishing guide
	call LoadTownMap
	ld hl, wUpdateSpritesEnabled
	ld a, [hl]
	push af
	ld [hl], $ff

IF DEF(_FRA)   ; in French: NID DE BULBIZARRE
	hlcoord 1, 0
	ld de, MonsNestText
	call PlaceString
	call GetMonName
	hlcoord 8, 0
	call PlaceString
ELIF DEF(_ESP) ; in Spanish: NIDO DE BULBASAUR
	hlcoord 1, 0
	ld de, MonsNestText
	call PlaceString
	call GetMonName
	hlcoord 9, 0
	call PlaceString
ELSE           ; in English: BULBASAUR's NEST
	call GetMonName
	hlcoord 1, 0
	call PlaceString
	ld h, b
	ld l, c
	ld de, MonsNestText
	call PlaceString
ENDC

	ld a, 3   ; 3 tries before printing Area Unknown
	ld [wAreaUnknownCountdown], a
	call DisplayWildLandLocations
	jr z, .switchToWaterCountdown ; didn't find any Land location
	hlcoord 0, 17
	ld a, $70 ; A button tile
	ld [hli], a
IF DEF(_FRA)
	inc a     ; first "Terre" tile
	ld [hli], a
	inc a     ; second "Terre" tile
	ld [hli], a
	inc a     ; third "Terre" tile
	ld [hl], a
ELIF DEF(_ESP)
	inc a     ; first "Tierra" tile
	ld [hli], a
	inc a     ; second "Tierra" tile
	ld [hli], a
	inc a     ; third "Tierra" tile
	ld [hl], a
ELSE
	inc a     ; first "Land" tile
	ld [hli], a
	inc a     ; second "Land" tile
	ld [hl], a
ENDC
	call WaitForTextScrollButtonPress
	ldh a, [hJoy5]
	and PAD_A
	jr z, .exit
	ld a, SFX_TINK
	call PlaySound
	jr .switchToWater

.exit
	call ExitTownMap
	pop af
	ld [wUpdateSpritesEnabled], a
	ret

.switchToWaterCountdown
	ld hl, wAreaUnknownCountdown
	dec [hl]
	jp z, .printAreaUnknown
.switchToWater
	call Delay3
	call DisplayWildWaterLocations
	jr z, .switchToRodsCountdown ; didn't find any Water location
	xor a
	ld [wAreaUnknownCountdown], a ; reset countdown
	hlcoord 0, 17
	ld a, $70 ; A button tile
	ld [hli], a
IF DEF(_FRA)
	ld a, $74    ; first "Surf" tile
	ld [hli], a
	inc a        ; second "Surf" tile
	ld [hli], a
	ld [hl], $64 ; background water tile
ELIF DEF(_ESP)
	ld a, $74    ; first "Surf" tile
	ld [hli], a
	inc a        ; second "Surf" tile
	ld [hli], a
	ld [hl], $64 ; background water tile
ELSE
	ld a, $73 ; first "Water" tile
	ld [hli], a
	inc a     ; second "Water" tile
	ld [hli], a
	inc a     ; third "Water" tile
	ld [hl], a
ENDC
	call WaitForTextScrollButtonPress
	ldh a, [hJoy5]
	and PAD_A
	jr z, .exit
	ld a, SFX_TINK
	call PlaySound
	jr .switchToRods

.switchToRodsCountdown
	ld hl, wAreaUnknownCountdown
	dec [hl]
	jr z, .printAreaUnknown
.switchToRods
	CheckEvent EVENT_GOT_FISHING_GUIDE
	jr z, .switchToLandCountdown
	call Delay3
	call DisplayWildRodsLocations
	jr z, .switchToLandCountdown ; didn't find any Rods location
	xor a
	ld [wAreaUnknownCountdown], a ; reset countdown
	hlcoord 0, 17
	ld a, $70 ; A button tile
	ld [hli], a
	ld a, $76 ; first "Rods" tile
	ld [hli], a
	inc a     ; second "Rods" tile
	ld [hli], a
	inc a     ; third "Rods" tile
	ld [hl], a
	call WaitForTextScrollButtonPress
	ldh a, [hJoy5]
	and PAD_A
	jr z, .exit
	ld a, SFX_TINK
	call PlaySound
	jr .switchToLand

.switchToLandCountdown
	ld hl, wAreaUnknownCountdown
	dec [hl]
	jr z, .printAreaUnknown
.switchToLand
	call Delay3
	call DisplayWildLandLocations
	jr z, .switchToWaterCountdown
	xor a
	ld [wAreaUnknownCountdown], a ; reset countdown
	hlcoord 1, 17
IF DEF(_FRA)
	ld a, $71 ; first "Terre" tile
	ld [hli], a
	inc a     ; second "Terre" tile
	ld [hli], a
	inc a     ; third "Terre" tile
	ld [hl], a
ELIF DEF(_ESP)
	ld a, $71 ; first "Tierra" tile
	ld [hli], a
	inc a     ; second "Tierra" tile
	ld [hli], a
	inc a     ; third "Tierra" tile
	ld [hl], a
ELSE
	ld a, $71    ; first "Land" tile
	ld [hli], a
	inc a        ; second "Land" tile
	ld [hli], a
	ld [hl], $64 ; background water tile
ENDC
	call WaitForTextScrollButtonPress
	ldh a, [hJoy5]
	and PAD_A
	jp z, .exit
	ld a, SFX_TINK
	call PlaySound
	jp .switchToWater

.printAreaUnknown
	hlcoord 2, 7
	lb bc, 2, 14
	call TextBoxBorder
	hlcoord 3, 9
	ld de, AreaUnknownText
	call PlaceString
	call WaitForTextScrollButtonPress
	jp .exit


LoadTownMap_Fly::
	call ClearSprites
	call LoadTownMap
	call LoadStandingPlayerSpriteGraphics ; marcelnote - load standing sprites only
	ld de, BirdSprite
	ld hl, vSprites tile BIRD_BASE_TILE
	lb bc, BANK(BirdSprite), 4 ; marcelnote - map bird only uses the first frame
	call CopyVideoData
	call LoadTownMapUpArrowGraphics
	call BuildFlyLocationsList
	ld hl, wUpdateSpritesEnabled
	ld a, [hl]
	push af
	ld [hl], $ff
	push hl
	hlcoord 0, 0
	ld de, ToText
	call PlaceString
	ld a, [wCurMap]
	ld b, 0
	call DrawPlayerOrBirdSprite
	ld hl, wFlyLocationsList
	decoord 18, 0
.townMapFlyLoop
	ld a, ' '
	ld [de], a
	push hl
	push hl
	hlcoord 3, 0
	lb bc, 1, 15
	call ClearScreenArea
	pop hl
	ld a, [hl]
	ld b, BIRD_BASE_TILE
	call DrawPlayerOrBirdSprite
	hlcoord 3, 0
	call PlaceString
	ld c, 15
	call DelayFrames
	call DrawTownMapArrows
	pop hl
.inputLoop
	push hl
	call DelayFrame
	call JoypadLowSensitivity
	ldh a, [hJoy5]
	ld b, a
	pop hl
	and PAD_A | PAD_B | PAD_UP | PAD_DOWN
	jr z, .inputLoop
	bit B_PAD_A, b
	jr nz, .pressedA
	ld a, SFX_TINK
	call PlaySound
	bit B_PAD_UP, b
	jr nz, .pressedUp
	bit B_PAD_DOWN, b
	jr nz, .pressedDown
	jr .pressedB
.pressedA
	ld a, SFX_HEAL_AILMENT
	call PlaySound
	ld a, [hl]
	ld [wDestinationMap], a
	ld hl, wStatusFlags6
	set BIT_FLY_WARP, [hl]
	ASSERT wStatusFlags6 + 1 == wStatusFlags7
	inc hl
	set BIT_USED_FLY, [hl]
.pressedB
	xor a
	ld [wTownMapSpriteBlinkingEnabled], a
	call GBPalWhiteOutWithDelay3
	pop hl
	pop af
	ld [hl], a
	ret
.pressedUp
	decoord 18, 0
	inc hl
	ld a, [hl]
	cp NOT_VISITED
	jr c, .townMapFlyLoop
	jr z, .pressedUp ; skip past unvisited towns
	ld hl, wFlyLocationsList ; $ff so wrap to start of list
	jr .townMapFlyLoop
.pressedDown
	decoord 19, 0
	dec hl
	ld a, [hl]
	cp NOT_VISITED
	jr c, .townMapFlyLoop
	jr z, .pressedDown ; skip past unvisited towns
	ld hl, wFlyLocationsList + NUM_CITY_MAPS ; $ff so wrap to end of list
	jr .pressedDown


BuildFlyLocationsList:
	ld hl, wTownVisitedFlag
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, wFlyAnimUsingCoordList
	ld a, $ff
	ld [hli], a
	lb bc, 0, NUM_CITY_MAPS
.loop
	srl d
	rr e
	ld a, b ; store the map number of the town if it has been visited
	jr c, .storeLocation
	ld a, NOT_VISITED
.storeLocation
	ld [hli], a
	inc b
	dec c
	jr nz, .loop
	ld [hl], $ff
	ret

TownMapUpArrow:
	INCBIN "gfx/town_map/up_arrow.1bpp"
TownMapUpArrowEnd:
ASSERT (TownMapUpArrowEnd - TownMapUpArrow) / TILE_1BPP_SIZE == 1

LoadTownMap:
	call GBPalWhiteOutWithDelay3
	call ClearScreen
	call UpdateSprites
	hlcoord 0, 0
	lb bc, $12, $12
	call TextBoxBorder
	call DisableLCD
	ld hl, WorldMapTileGraphics
	ld de, vChars2 tile $60
	ld bc, WorldMapTileGraphicsEnd - WorldMapTileGraphics
	ld a, BANK(WorldMapTileGraphics)
	call FarCopyData
	ld hl, MonNestOptionsTileGraphics ; marcelnote - new gfx for nests
	ld de, vChars2 tile $70
	ld bc, MonNestOptionsTileGraphicsEnd - MonNestOptionsTileGraphics
	ld a, BANK(MonNestOptionsTileGraphics)
	call FarCopyData
	ld hl, MonNestIcon
	ld de, vSprites tile MON_NEST_ICON_TILE
	ld bc, MonNestIconEnd - MonNestIcon
	ld a, BANK(MonNestIcon)
	call FarCopyData ; marcelnote - eye color for mon nest icon
	hlcoord 0, 0
	ld de, CompressedMap
.nextTile
	ld a, [de]
	and a
	jr z, .done
	ld b, a
	and $f
	ld c, a
	ld a, b
	swap a
	and $f
	add $60
.writeRunLoop
	ld [hli], a
	dec c
	jr nz, .writeRunLoop
	inc de
	jr .nextTile
.done
	call EnableLCD
	ld b, SET_PAL_TOWN_MAP
	call RunPaletteCommand
	call Delay3
	call GBPalNormal
	xor a
	ld [wAnimCounter], a
	inc a
	ld [wTownMapSpriteBlinkingEnabled], a
	ret

CompressedMap:
	INCBIN "gfx/town_map/town_map.rle"

ExitTownMap:
; clear town map graphics data and load usual graphics data
	xor a
	ld [wTownMapSpriteBlinkingEnabled], a
	call GBPalWhiteOut
	call ClearScreen
	call ClearSprites
	call LoadStandingPlayerSpriteGraphics ; marcelnote - load standing sprites only
	call UpdateSprites
	jp RunDefaultPaletteCommand

DrawPlayerOrBirdSprite:
; in: a = map number, b = OAM base tile
; out: de = map-name pointer
	ld c, a
	ld a, b
	ld [wOAMBaseTile], a
	ld a, c
	ld de, wTownMapCoords
	call LoadTownMapEntry
	ld a, [de]
	push hl
	call TownMapCoordsToOAMCoords
	call WritePlayerOrBirdSpriteOAM
	ld hl, wShadowOAM
	ld de, wShadowOAMBackup
	ld bc, OAM_COUNT * 4
	call CopyData
	pop de ; marcelnote - return name address directly
	ret

DisplayWildRodsLocations: ; marcelnote - new
	callfar FindWildRodsLocationsOfMon ; builds list of map coords at wBuffer
	jr DisplayWildLocations

DisplayWildWaterLocations: ; marcelnote - new
	callfar FindWildWaterLocationsOfMon ; builds list of map coords at wBuffer
	jr DisplayWildLocations

DisplayWildLandLocations: ; marcelnote - new
	callfar FindWildLandLocationsOfMon ; builds list of map coords at wBuffer
	; fallthrough

DisplayWildLocations:
	ld hl, wShadowOAM
	lb bc, NUM_SPRITE_OAM_STRUCTS - 4, $a0
	ld de, $4
.hideSpritesLoop
	ld [hl], c
	add hl, de
	dec b
	jr nz, .hideSpritesLoop
	ld hl, wShadowOAM
	ld de, wBuffer
.loop
	ld a, [de]
	and a ; terminator is exceptionally 0 because $ff is Mandarin island
	jr z, .exitLoop
	inc de
	cp $19       ; Cerulean Cave's town map coordinates (x=9, y=1 in hexadecimal)
	jr z, .loop  ; skip Cerulean Cave
	cp $70       ; marcelnote - new, Route 28 and Mt Silver's town map coordinates (x=0, y=7)
	jr z, .loop  ; skip Route 28 and Mt Silver
	call TownMapCoordsToOAMCoords
	ld a, b
	ld [hli], a ; nest icon Y
	ld a, c
	ld [hli], a ; nest icon X
	ld a, MON_NEST_ICON_TILE
	ld [hli], a
	xor a
	ld [hli], a
	jr .loop
.exitLoop
	ld a, l
	and a   ; were any OAM entries written?
	push af ; save z flag
	ld hl, wShadowOAM
	ld de, wShadowOAMBackup
	ld bc, OAM_COUNT * 4
	call CopyData ; Copy bc bytes from hl to de, i.e. copy wShadowOAM into wShadowOAMBackup
	pop af
	ret ; if list was empty, return Z, else NZ


TownMapCoordsToOAMCoords: ; marcelnote - removed hl writes to ROM space
; in: lower nybble of a = x, upper nybble of a = y
; out: b = (y * 8) + 24, c = (x * 8) + 24; preserves hl and de
	ld c, a
	and $f0
	srl a
	add 24
	ld b, a
	ld a, c
	and $0f
	swap a
	srl a
	add 24
	ld c, a
	ret

WritePlayerOrBirdSpriteOAM:
	ld a, [wOAMBaseTile]
	and a
	ld hl, wShadowOAMSprite36 ; for player sprite
	jr z, WriteTownMapSpriteOAM
	ld hl, wShadowOAMSprite32 ; for bird sprite

WriteTownMapSpriteOAM: ; marcelnote - optimized
; Subtract 4 from c (X coord) and 3 from b (Y coord), subtracting one extra from Y if X underflows.
	ld a, c
	sub 4
	ld c, a
	ld a, b
	sbc 3
	ld b, a
	; fallthrough

WriteAsymmetricMonPartySpriteOAM:
; Writes 4 OAM blocks for a helix mon party sprite, since it does not have
; a vertical line of symmetry.
	ld d, 2
.loop
	ld e, 2
	push bc
.innerLoop
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, [wOAMBaseTile]
	ld [hli], a
	inc a
	ld [wOAMBaseTile], a
	xor a
	ld [hli], a
	ld a, 8
	add c
	ld c, a
	dec e
	jr nz, .innerLoop
	pop bc
	ld a, 8
	add b
	ld b, a
	dec d
	jr nz, .loop
	ret

WriteSymmetricMonPartySpriteOAM:
; Writes 4 OAM blocks for a mon party sprite other than a helix. All the
; sprites other than the helix one have a vertical line of symmetry which allows
; the X-flip OAM bit to be used so that only 2 rather than 4 tile patterns are
; needed.
	ld d, 2
.loop
	ld e, 2
	push bc
.innerLoop
	ld a, b
	ld [hli], a ; Y
	ld a, c
	ld [hli], a ; X
	ld a, [wOAMBaseTile]
	ld [hli], a ; tile

	; marcelnote - store 0 on first turn, OAM_XFLIP on second
	ld a, e
	rrca          ; carry = column: 0 left, 1 right
	sbc a         ; a = $00 left, $ff right
	and OAM_XFLIP
	ld [hli], a   ; attributes

	ld a, 8
	add c
	ld c, a
	dec e
	jr nz, .innerLoop
	pop bc
	ld a, [wOAMBaseTile]
	add 2
	ld [wOAMBaseTile], a
	ld a, 8
	add b
	ld b, a
	dec d
	jr nz, .loop
	ret

LoadTownMapEntryFar: ; marcelnote - new
	ld a, [wMapCoordsTemp]
	; fallthrough

LoadTownMapEntry:
; in: a = map number
; out: lower nybble of [de] = x, upper nybble of [de] = y, hl = address of name
	cp FIRST_INDOOR_MAP
	jr c, .external
	ld bc, 4
	ld hl, InternalMapEntries
.loop
	cp [hl]
	jr c, .foundEntry
	add hl, bc
	jr .loop
.foundEntry
	inc hl
	jr .readEntry
.external
	ld hl, ExternalMapEntries
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	add hl, bc
.readEntry
	ld a, [hli]
	ld [de], a
	ld [wMapCoordsTemp], a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

LoadGymCityName:: ; marcelnote - new for gym city and leader names
	ld a, [wCurMap]
	ld de, wGymCityName   ; LoadTownMapEntry needs to store town map coordinates at de
	call LoadTownMapEntry ; hl = address of name, preserves de
	ld bc, GYM_CITY_LENGTH
	jp CopyData

INCLUDE "data/maps/town_map_entries.asm"

MonNestIcon:
	INCBIN "gfx/town_map/mon_nest_icon.2bpp" ; marcelnote - eye color for mon nest icon
MonNestIconEnd:


TownMapSpriteBlinkingAnimation::
	ld a, [wAnimCounter]
	inc a
	cp 25
	jr z, .hideSprites
	cp 50
	jr nz, .done
; show sprites when the counter reaches 50
	ld hl, wShadowOAMBackup
	ld de, wShadowOAM
	ld bc, (OAM_COUNT - 4) * 4
	call CopyData ; copy wShadowOAMBackup backup in wShadowOAM
	xor a
	jr .done
.hideSprites ; a = 25
	ld hl, wShadowOAMSprite00YCoord
	lb bc, OAM_COUNT - 4, SCREEN_HEIGHT_PX + OAM_Y_OFS
	ld de, OBJ_SIZE
.hideSpritesLoop
	ld [hl], c
	add hl, de
	dec b
	jr nz, .hideSpritesLoop
.done
	ld [wAnimCounter], a
	jp DelayFrame

LoadTownMapUpArrowGraphics:
; Town/Fly maps only: overwrite the unused nest A-button.
	ld de, TownMapUpArrow
	ld hl, vChars2 tile '▲'
	lb bc, BANK(TownMapUpArrow), (TownMapUpArrowEnd - TownMapUpArrow) / TILE_1BPP_SIZE
	jp CopyVideoDataDouble

DrawTownMapArrows:
	hlcoord 18, 0
	ld a, '▲'
	ld [hli], a
	ld [hl], '▼'
	ret


IF DEF(_FRA)
	INCLUDE "translation/fra/data/text/town_map.fra.asm"
	INCLUDE "translation/fra/data/maps/names.fra.asm"
ELIF DEF(_ESP)
	INCLUDE "translation/esp/data/text/town_map.esp.asm"
	INCLUDE "translation/esp/data/maps/names.esp.asm"
ELSE
	INCLUDE "data/text/town_map.asm"
	INCLUDE "data/maps/names.asm"
ENDC
