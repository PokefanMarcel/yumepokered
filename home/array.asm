; skips a text entries, each of size NAME_LENGTH (like trainer name, OT name, rival name, ...)
; hl: base pointer, will be incremented by NAME_LENGTH * a
; bc: set to NAME_LENGTH
SkipFixedLengthTextEntries::
	ld bc, NAME_LENGTH
	and a
	ret z
	jr AddNTimes.loop

AddNTimes::
; add bc to hl a times
	and a
	ret z
.loop
	add hl, bc
	dec a
	jr nz, .loop
	ret
