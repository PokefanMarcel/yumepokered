PrintStatusAilment::
	ld a, [de]
	bit PSN, a
	jr nz, .psn
	bit BRN, a
	jr nz, .brn
	bit FRZ, a
	jr nz, .frz
	bit PAR, a
	jr nz, .par
	and SLP_MASK
	ret z
	; fallthrough

IF DEF(_FRA)
	ld_hli_a_string "SOM"
	ret
.psn
	ld_hli_a_string "PSN"
	ret
.brn
	ld_hli_a_string "BRU"
	ret
.frz
	ld_hli_a_string "GEL"
	ret
.par
	ld_hli_a_string "PAR"
	ret
ELSE
	ld_hli_a_string "SLP"
	ret
.psn
	ld_hli_a_string "PSN"
	ret
.brn
	ld_hli_a_string "BRN"
	ret
.frz
	ld_hli_a_string "FRZ"
	ret
.par
	ld_hli_a_string "PAR"
	ret
ENDC
