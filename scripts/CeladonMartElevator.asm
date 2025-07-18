CeladonMartElevator_Script:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	res BIT_CUR_MAP_LOADED_1, [hl]
	push hl
	call nz, CeladonMartElevatorStoreWarpEntriesScript
	pop hl
	bit BIT_CUR_MAP_USED_ELEVATOR, [hl]
	res BIT_CUR_MAP_USED_ELEVATOR, [hl]
	call nz, CeladonMartElevatorShakeScript
	xor a
	ld [wAutoTextBoxDrawingControl], a
	inc a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ret

CeladonMartElevatorStoreWarpEntriesScript:
	ld hl, wWarpEntries
	ld a, [wWarpedFromWhichWarp]
	ld b, a
	ld a, [wWarpedFromWhichMap]
	ld c, a
	call .StoreWarpEntry
	; fallthrough
.StoreWarpEntry:
	inc hl
	inc hl
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ret

CeladonMartElevatorCopyWarpMapsScript:
	ld hl, CeladonMartElevatorFloors
	call LoadItemList
	ld hl, CeladonMartElevatorWarpMaps
	ld de, wElevatorWarpMaps
	ld bc, CeladonMartElevatorWarpMaps.End - CeladonMartElevatorWarpMaps
	jp CopyData

CeladonMartElevatorFloors:
	db 6 ; #    ; marcelnote - 5 -> 6 floors
	db FLOOR_1F
	db FLOOR_2F
	db FLOOR_3F
	db FLOOR_4F
	db FLOOR_5F
	db FLOOR_6F ; marcelnote - new 6th floor
	db -1 ; end

; These specify where the player goes after getting out of the elevator.
CeladonMartElevatorWarpMaps:
	; warp number, map id
	db  5, CELADON_MART_1F2F3F ; marcelnote - merged 1F 2F 3F
	db  8, CELADON_MART_1F2F3F
	db 11, CELADON_MART_1F2F3F
	db  2, CELADON_MART_4F5F6F ; marcelnote - merged 4F 5F + new 6F
	db  5, CELADON_MART_4F5F6F
	db  8, CELADON_MART_4F5F6F ; marcelnote - new 6th floor
.End:

CeladonMartElevatorShakeScript:
	jpfar ShakeElevator

CeladonMartElevator_TextPointers:
	def_text_pointers
	dw_const CeladonMartElevatorText, TEXT_CELADONMARTELEVATOR

CeladonMartElevatorText:
	text_asm
	call CeladonMartElevatorCopyWarpMapsScript
	ld hl, CeladonMartElevatorWarpMaps
	predef DisplayElevatorFloorMenu
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd
