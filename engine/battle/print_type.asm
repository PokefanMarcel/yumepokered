; [wCurSpecies] = pokemon ID
; hl = dest addr
PrintMonType:
	call GetPredefRegisters
	push hl
	call GetMonHeader
	pop hl
	push hl
	ld a, [wMonHType1]
	call PrintType
	ld a, [wMonHType1]
	ld b, a
	ld a, [wMonHType2]
	cp b
	pop hl
	ret z
	ld bc, SCREEN_WIDTH
	add hl, bc

; a = type
; hl = dest addr
PrintType:
	push hl
	jr PrintType_

PrintMoveType:
	call GetPredefRegisters
	push hl
	ld a, [wPlayerMoveType]
	; fallthrough

PrintType_:
	add a
	ld hl, TypeNames
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl
	jp PlaceString

INCLUDE "data/types/names.asm"
