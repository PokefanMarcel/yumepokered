UpdateCinnabarGymGateTileBlocks::
	jpfar UpdateCinnabarGymGateTileBlocks_

CheckForHiddenObjectOrBookshelfOrCardKeyDoor::
	ldh a, [hLoadedROMBank]
	push af
	;ldh a, [hJoyHeld] ; marcelnote - button is already checked before calling the function
	;bit BIT_A_BUTTON, a
	;jr z, .nothingFound
; A button is pressed
	ld a, BANK(CheckForHiddenObject)
	ld [MBC1RomBank], a
	ldh [hLoadedROMBank], a
	call CheckForHiddenObject
	ldh a, [hDidntFindAnyHiddenObject]
	and a
	jr nz, .hiddenObjectNotFound
	ld a, [wHiddenObjectFunctionRomBank]
	ld [MBC1RomBank], a
	ldh [hLoadedROMBank], a
	ld de, .returnAddress
	push de
	jp hl
.returnAddress
	xor a
	jr .done
.hiddenObjectNotFound
	callfar PrintBookshelfText
	ldh a, [hInteractedWithBookshelf]
	and a
	jr z, .done
;.nothingFound
	ld a, $ff
.done
	ldh [hItemAlreadyFound], a
	pop af
	ld [MBC1RomBank], a
	ldh [hLoadedROMBank], a
	ret
