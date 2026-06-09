FlagActionPredef:
	call GetPredefRegisters

FlagAction: ; marcelnote - optimized
; Performs action b on bit c in the bitfield at hl.
; Preserves b, de, hl.
;  b = 0: reset
;  b = 1: set
;  b = 2: read
; Returns the result in c.

	push hl

	; byte
	ld a, c
	srl a
	srl a
	srl a
	add l
	ld l, a
	adc h
	sub l
	ld h, a       ; hl += c/8 is the byte to target

	; bit
	ld a, c
	and %00000111
	ld c, a       ; c in [0,7] is the bit to target

	; bitmask 1 << c
	inc c         ; c in [1,8] for counter
	xor a
	scf           ; set carry flag to rotate 1 in a
.shift
	rla
	dec c
	jr nz, .shift
	ld c, a       ; c = 1 << c

	ld a, b
	and a         ; FLAG_RESET?
	jr z, .reset
	dec a         ; FLAG_SET?
	jr nz, .read

; set
	ld a, [hl]
	or c
	ld [hl], a
	jr .done

.reset
	ld a, [hl]
	cpl
	or c
	cpl
	ld [hl], a
	jr .done

.read
	ld a, [hl]
	and c
	; fallthrough

.done
	ld c, a
	pop hl
	ret
