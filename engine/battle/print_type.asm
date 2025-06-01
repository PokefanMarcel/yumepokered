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


PrintMoveType: ; marcelnote - modified to be right-aligned
	call GetPredefRegisters
	push hl ; save printing address
	ld a, [wPlayerMoveType]
	add a
	ld hl, TypeNames
	ld e, a
	ld d, 0
	add hl, de ; hl = address of name pointer
	ld a, [hli]
	ld d, [hl]
	ld e, a    ; de = address of name
	; possible option: c = 0 if right-aligned, c = 1 is left-aligned
;	dec c
;	jr z, .leftAligned
	ld h, d
	ld l, e
	ld c, 9 ; max number of spaces + 1
	ld b, "@"
.loop
	dec c
	ld a, [hli]
	cp b
	jr nz, .loop
;.leftAligned
	pop hl  ; restore printing address
	ld b, 0
	add hl, bc
	jp PlaceString


INCLUDE "data/types/names.asm"
