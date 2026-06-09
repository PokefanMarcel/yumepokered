Predef::
; Call predefined function a.
; To preserve other registers, have the
; destination call GetPredefRegisters.

	; Save the predef id for GetPredefPointer.
	ld [wPredefID], a

	; A hack for LoadDestinationWarpPosition.
	; See LoadTilesetHeader (predef $19).
	ldh a, [hLoadedROMBank]
	ld [wPredefParentBank], a

	push af
	ld a, BANK(GetPredefPointer)
	ldh [hLoadedROMBank], a
	ld [rROMB], a

	call GetPredefPointer

	ld a, [wPredefBank]
	ldh [hLoadedROMBank], a
	ld [rROMB], a

	call _hl_

	pop af
	ldh [hLoadedROMBank], a
	ld [rROMB], a
	ret

GetPredefRegisters:: ; marcelnote - optimized
; Restore the contents of register pairs
; when GetPredefPointer was called.
	ld hl, wPredefBC + 1
	ld a, [hld] ; wPredefBC + 1
	ld c, a
	ld a, [hld] ; wPredefBC
	ld b, a
	ld a, [hld] ; wPredefDE + 1
	ld e, a
	ld a, [hld] ; wPredefDE
	ld d, a
	ld a, [hld] ; wPredefHL + 1
	ld h, [hl]  ; wPredefHL
	ld l, a
	ret
