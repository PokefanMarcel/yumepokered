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
; Search the list at hl for the value in a.
; Returns carry if found.
; If found, then also returns hl the address at which a was found.
	ld e, a
.loop
	ld a, [hl]
	cp -1
	jr z, IsInRestOfArray.notfound
	cp e
	jr z, IsInRestOfArray.found
	inc hl
	jr .loop
