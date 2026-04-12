; reloads text box tile patterns, current map view, and tileset tile patterns
ReloadMapData::
	ldh a, [hLoadedROMBank]
	push af
	ld a, [wCurMap]
	call SwitchToMapRomBank
	call DisableLCD
	call LoadTextBoxTilePatterns
	call LoadCurrentMapView
	call LoadTilesetTilePatternData
	call EnableLCD
	pop af
	ldh [hLoadedROMBank], a
	ld [rROMB], a
	ret

; reloads tileset tile patterns
ReloadTilesetTilePatterns::
	ldh a, [hLoadedROMBank]
	push af
	ld a, [wCurMap]
	call SwitchToMapRomBank
	call DisableLCD
	call LoadTilesetTilePatternData
	call EnableLCD
	pop af
	ldh [hLoadedROMBank], a
	ld [rROMB], a
	ret

ReloadMapAfterSurfingMinigame:: ; marcelnote - Pikachu Surfing minigame
	; Adapted from pokeyellow's lighter return path to avoid a heavier double reload.
	ldh a, [hLoadedROMBank]
	push af
	call DisableLCD
	ld a, HIGH(vBGMap0)
	ld [wMapViewVRAMPointer + 1], a
	xor a
	ld [wMapViewVRAMPointer], a
	ldh [hSCY], a
	ldh [hSCX], a
	ld [wWalkCounter], a
	ld [wSpriteSetID], a
	ld [wWalkBikeSurfStateCopy], a
	ld a, [wCurMap]
	call SwitchToMapRomBank
	call LoadTileBlockMap
	call LoadTilesetTilePatternData
	call LoadCurrentMapView
	call .CopyMapViewToBGMap0
	ld de, vBGMap1
	call .CopyMapViewToVRAM
	call EnableLCD
	call ReloadMapSpriteTilePatterns
	pop af
	ldh [hLoadedROMBank], a
	ld [rROMB], a
	ret

.CopyMapViewToBGMap0
	ld de, vBGMap0
.CopyMapViewToVRAM
	ld hl, wTileMap
	ld b, SCREEN_HEIGHT
.vramCopyLoop
	ld c, SCREEN_WIDTH
.vramCopyInnerLoop
	ld a, [hli]
	ld [de], a
	inc e
	dec c
	jr nz, .vramCopyInnerLoop
	ld a, TILEMAP_WIDTH - SCREEN_WIDTH
	add e
	ld e, a
	jr nc, .noCarry
	inc d
.noCarry
	dec b
	jr nz, .vramCopyLoop
	ret

; shows the town map and lets the player choose a destination to fly to
ChooseFlyDestination::
	ld hl, wStatusFlags4
	res BIT_NO_BATTLES, [hl]
	jpfar LoadTownMap_Fly

; causes the text box to close without waiting for a button press after displaying text
DisableWaitingAfterTextDisplay::
	ld a, $01
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ret
