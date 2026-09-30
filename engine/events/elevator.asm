DisplayElevatorFloorMenu: ; marcelnote - refactored warp engine
	ld hl, WhichFloorText
	call PrintText
	call DisplayCurrentFloorBox ; marcelnote - new for elevator current floor
	ld hl, wListPointer ; marcelnote - optimized load into wListPointer
	ld a, LOW(wItemList)
	ld [hli], a
	ld [hl], HIGH(wItemList)
	ld a, [wListScrollOffset]
	push af
	xor a
	ld [wCurrentMenuItem], a
	ld [wListScrollOffset], a
	ld [wPrintItemPrices], a
	ld a, SPECIALLISTMENU
	ld [wListMenuID], a
	call DisplayListMenuID
	pop bc
	ld a, b
	ld [wListScrollOffset], a
	ret c
	ld hl, wCurrentMapScriptFlags
	set BIT_CUR_MAP_USED_ELEVATOR, [hl]
	ld hl, wElevatorWarpMaps
	ld a, [wWhichPokemon]
	add a
	ld d, 0
	ld e, a
	add hl, de
	ld a, [hli]
	and WARP_ID_MASK
	ld b, a    ; warp ID
	ld c, [hl] ; warp map
	ld hl, wWarpEntries + 2
	call .updateWarp
	inc hl
	inc hl
	ld a, [wCurMap]
	cp ROCKET_HIDEOUT_ELEVATOR
	jr nz, .updateWarp
	inc b ; Rocket Hideout elevator has 2 exit warps
.updateWarp
	ld a, [hl]
	and WARP_DIR_MASK ; preserve warp direction
	or b
	ld [hli], a ; direction/warp ID
	ld a, c
	ld [hli], a ; destination map ID
	ret

; Show the current floor's name in the upper-left box.
DisplayCurrentFloorBox: ; marcelnote - adapted from PureRGB's current-floor display
	; Draw the box.
	ld a, CURRENT_FLOOR_BOX_TEMPLATE
	ld [wTextBoxID], a
	; Read the floor reached when entering or using the elevator.
	call DisplayTextBoxID
	ld hl, wWarpedFromWhichWarp
	ld a, [hli]
	ld c, [hl] ; c = [wWarpedFromWhichMap]
	ld b, a    ; b = [wWarpedFromWhichWarp]
	ld hl, wElevatorWarpMaps ; list of (warp number, map id), e.g. SilphCoElevatorWarpMaps
	ld de, wItemList + 1     ; floor list, e.g. SilphCoElevatorFloors
	; Find current floor by looking for a map/warp match.
	; Not compatible with merging Rocket Hideout maps!
.findFloor
	ld a, [hli] ; destination warp number
	cp b ; matching warp?
	jr z, .checkMap
	; Only Celadon Mart's merged maps need a matching warp ID; other floors have unique maps.
	ld a, [wCurMap]
	cp CELADON_MART_ELEVATOR
	jr z, .nextFloor ; if Celadon Mart, skip the map check since we already have wrong warp
.checkMap
	ld a, [hl] ; destination map
	cp c ; matching maps?
	jr z, .foundFloor
.nextFloor
	inc hl
	inc de
	jr .findFloor
.foundFloor
	ld a, [de] ; floor item ID
	ld [wNamedObjectIndex], a
	call GetItemName ; de points to the floor name
	; Right-align floor name.
	ld h, d
	ld l, e
	lb bc, '@', 7
.countName
	dec c
	ld a, [hli]
	sub b
	jr nz, .countName
	; c = 6 - name length
	hlcoord 1, 1
	ld b, a
	add hl, bc
	jp PlaceString

WhichFloorText:
	text_far _WhichFloorText
	text_end
