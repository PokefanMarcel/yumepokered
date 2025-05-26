; function to do multiplication
; all values are big endian
; INPUTS
; [hMultiplicand] to [hMultiplicand + 2] (3 bytes)
; [hMultiplier] (1 byte)
; OUTPUT
; [hProduct] to [hProduct + 3] (4 bytes)
Multiply::
	push hl
	push de
	push bc
	callfar _Multiply
	pop bc
	pop de
	pop hl
	ret

; function to do division
; all values are big endian
; INPUT
; [hDividend] to [hDividend + 3] (4 bytes)
; [hDivisor] (1 byte)
; OUTPUT
; [hQuotient] to [hQuotient + 3] (4 bytes)
; [hRemainder] (1 byte)
Divide::
	push hl
	push de
	push bc
	homecall _Divide
	pop bc
	pop de
	pop hl
	ret

; marcelnote - modified
; Divides c by d, result in c (quotient) and a (remainder). Preserves hl and de, sets b = 0.
DivideBytes::
	ld b, 8
	xor a        ; initialize remainder at 0
.loop
	sla c        ; rotate dividend bit out and quotient bit left
	rla          ; bring in next bit of c into a
	cp d         ; a ≥ d?
	jr c, .skip  ; if not, move on to next bit
	inc c        ; if yes, increment quotient
	sub d        ; and deduct divisor from a
.skip
	dec b
	jr nz, .loop
	ret
