DisplayElevatorFloorMenu: ; marcelnote - refactored warp engine
	ld hl, WhichFloorText
	call PrintText
	ld hl, wItemList
	ld a, l
	ld [wListPointer], a
	ld a, h
	ld [wListPointer + 1], a
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
	ld b, a ; warp ID
	ld a, [hl]
	ld c, a ; warp map
	ld hl, wWarpEntries + 2
	call .UpdateWarp
	inc hl
	inc hl
	ld a, [wCurMap]
	cp ROCKET_HIDEOUT_ELEVATOR
	jr nz, .UpdateWarp
	inc b ; Rocket Hideout elevator has 2 exit warps
.UpdateWarp
	ld a, [hl]
	and WARP_DIR_MASK ; preserve warp direction
	or b
	ld [hli], a ; direction/warp ID
	ld a, c
	ld [hli], a ; destination map ID
	ret

WhichFloorText:
	text_far _WhichFloorText
	text_end
