SaveTrainerName::
	ld hl, TrainerNamePointers
	ld a, [wTrainerClass]
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wNameBuffer
.CopyCharacter
	ld a, [hli]
	ld [de], a
	inc de
	cp '@'
	jr nz, .CopyCharacter
	ret

IF DEF(_FRA)
	INCLUDE "translation/fra/data/trainers/name_pointers.fra.asm"
ELIF DEF(_ESP)
	INCLUDE "translation/esp/data/trainers/name_pointers.esp.asm"
ELSE
	INCLUDE "data/trainers/name_pointers.asm"
ENDC
