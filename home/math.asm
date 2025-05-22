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
