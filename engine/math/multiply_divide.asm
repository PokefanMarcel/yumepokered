_Multiply:: ; marcelnote - adjusted from polishedcrystal
; Multiply hMultiplicand (3 bytes) by hMultiplier (1 byte). Result in hProduct.
; All values are big endian.

	ldh a, [hMultiplicand]
	ld e, a
	ldh a, [hMultiplicand + 1]
	ld h, a
	ldh a, [hMultiplicand + 2]
	ld l, a

	xor a
	ld d, a
	ldh [hProduct], a
	ldh [hProduct + 1], a
	ldh [hProduct + 2], a
	ldh [hProduct + 3], a
	ldh a, [hMultiplier]

.loop ; performs dehl * a
	and a                 ; a = 0?
	ret z                 ; if yes, we're done

	; here a ≠ 0, carry not set
	rra                   ; divide a by 2, is the last bit 1?
	jr nc, .next          ; if not, just multiply dehl by 2

	; else, add dehl to result before multiplying it by 2
	ld c, a               ; store multiplier in c

	ldh a, [hProduct + 3]
	add l
	ldh [hProduct + 3], a
	ldh a, [hProduct + 2]
	adc h
	ldh [hProduct + 2], a
	ldh a, [hProduct + 1]
	adc e
	ldh [hProduct + 1], a
	ldh a, [hProduct]
	adc d
	ldh [hProduct], a

	ld a, c               ; retrieve multiplier

.next
	add hl, hl            ; multiply hl by 2
	rl e                  ; multiply e by 2 (accounting for carry)
	rl d                  ; multiply d by 2 (accounting for carry)
	jr .loop


_Divide::
	xor a
	ldh [hDivideBuffer], a
	ldh [hDivideBuffer+1], a
	ldh [hDivideBuffer+2], a
	ldh [hDivideBuffer+3], a
	ldh [hDivideBuffer+4], a
	ld a, $9
	ld e, a
.loop
	ldh a, [hDivideBuffer]
	ld c, a
	ldh a, [hDividend+1] ; (aliases: hMultiplicand)
	sub c
	ld d, a
	ldh a, [hDivisor] ; (aliases: hDivisor, hMultiplier, hPowerOf10)
	ld c, a
	ldh a, [hDividend] ; (aliases: hProduct, hPastLeadingZeros, hQuotient)
	sbc c
	jr c, .next
	ldh [hDividend], a ; (aliases: hProduct, hPastLeadingZeros, hQuotient)
	ld a, d
	ldh [hDividend+1], a ; (aliases: hMultiplicand)
	ldh a, [hDivideBuffer+4]
	inc a
	ldh [hDivideBuffer+4], a
	jr .loop
.next
	ld a, b
	cp $1
	jr z, .done
	ldh a, [hDivideBuffer+4]
	sla a
	ldh [hDivideBuffer+4], a
	ldh a, [hDivideBuffer+3]
	rl a
	ldh [hDivideBuffer+3], a
	ldh a, [hDivideBuffer+2]
	rl a
	ldh [hDivideBuffer+2], a
	ldh a, [hDivideBuffer+1]
	rl a
	ldh [hDivideBuffer+1], a
	dec e
	jr nz, .next2
	ld a, $8
	ld e, a
	ldh a, [hDivideBuffer]
	ldh [hDivisor], a ; (aliases: hDivisor, hMultiplier, hPowerOf10)
	xor a
	ldh [hDivideBuffer], a
	ldh a, [hDividend+1] ; (aliases: hMultiplicand)
	ldh [hDividend], a ; (aliases: hProduct, hPastLeadingZeros, hQuotient)
	ldh a, [hDividend+2]
	ldh [hDividend+1], a ; (aliases: hMultiplicand)
	ldh a, [hDividend+3]
	ldh [hDividend+2], a
.next2
	ld a, e
	cp $1
	jr nz, .okay
	dec b
.okay
	ldh a, [hDivisor] ; (aliases: hDivisor, hMultiplier, hPowerOf10)
	srl a
	ldh [hDivisor], a ; (aliases: hDivisor, hMultiplier, hPowerOf10)
	ldh a, [hDivideBuffer]
	rr a
	ldh [hDivideBuffer], a
	jr .loop
.done
	ldh a, [hDividend+1] ; (aliases: hMultiplicand)
	ldh [hRemainder], a ; (aliases: hDivisor, hMultiplier, hPowerOf10)
	ldh a, [hDivideBuffer+4]
	ldh [hQuotient+3], a
	ldh a, [hDivideBuffer+3]
	ldh [hQuotient+2], a
	ldh a, [hDivideBuffer+2]
	ldh [hQuotient+1], a ; (aliases: hMultiplicand)
	ldh a, [hDivideBuffer+1]
	ldh [hDividend], a ; (aliases: hProduct, hPastLeadingZeros, hQuotient)
	ret
