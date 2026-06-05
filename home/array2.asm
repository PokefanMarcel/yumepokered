CallFunctionInTable::
; Call function a in jumptable hl.
; de is not preserved.
	push hl
	push de
	push bc
	add a
	ld d, 0
	ld e, a
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .returnAddress
	push de
	jp hl
.returnAddress
	pop bc
	pop de
	pop hl
	ret

IsInArray:: ; marcelnote - small optim
; Search an array at hl for the value in a.
; Entry size is de bytes.
; Return index b and carry if found.
	ld b, 0

IsInRestOfArray::
	ld c, a
.loop
	ld a, [hl]
	cp -1
	ret z ; not found, carry flag clear
	cp c
	jr z, .found
	inc b
	add hl, de
	jr .loop

.found
	scf
	ret


IsInList:: ; marcelnote - simpler, uses e only, for arrays with entry size 1
; Search the list at hl for the value in a.
; Returns carry if found.
	ld e, a
.loop
	ld a, [hli]
	cp -1
	ret z ; not found, carry flag clear
	cp e
	jr nz, .loop
	scf
	ret
