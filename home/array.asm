; skips a text entries, each of size NAME_LENGTH (like trainer name, OT name, rival name, ...)
; hl: base pointer, will be incremented by NAME_LENGTH * a
; bc: set to NAME_LENGTH
SkipNameEntries::
	ld bc, NAME_LENGTH
	; fallthrough

AddNTimes:: ; marcelnote - optimized
; add a*bc to hl
	and a
	ret z
	push bc
.loop
	rra ; no carry here so a = a/2
	jr nc, .skip
	add hl, bc
.skip
	sla c
	rl b ; double bc
	and a
	jr nz, .loop
	pop bc
	ret
