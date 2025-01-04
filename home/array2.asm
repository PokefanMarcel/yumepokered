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

IsInArray::
; Search an array at hl for the value in a.
; Entry size is de bytes.
; Return index b and carry if found.
	ld b, 0

IsInRestOfArray::
	ld c, a
.loop
	ld a, [hl]
	cp -1
	jr z, .notfound
	cp c
	jr z, .found
	inc b
	add hl, de
	jr .loop

.notfound
	and a
	ret

.found
	scf
	ret


IsInList:: ; marcelnote - simpler, uses e only, for arrays with entry size 1
; Search a list at hl for the value in a.
; Sets z flag if not found.
; Returns hl the address at which a was found.
	ld e, a
.loop
	ld a, [hl]
	cp -1
	ret z ; not found
	cp e
	jr z, .found
	inc hl
	jr .loop

.found
	inc a ; a cannot be -1 else would set z flag
	ret
