_Multiply:: ; marcelnote - adapted from polishedcrystal
; Multiply hMultiplicand (3 bytes) by hMultiplier (1 byte). Result in hProduct (4 bytes).
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
	ld b, a               ; store multiplier in b

	ld c, LOW(hProduct + 3)
	ldh a, [c]
	add l
	ldh [c], a

	dec c ; c = LOW(hProduct + 2)
	ldh a, [c]
	adc h
	ldh [c], a

	dec c ; c = LOW(hProduct + 1)
	ldh a, [c]
	adc e
	ldh [c], a

	dec c ; c = LOW(hProduct)
	ldh a, [c]
	adc d
	ldh [c], a

	ld a, b               ; retrieve multiplier

.next
	add hl, hl            ; multiply hl by 2
	rl e                  ; multiply e by 2 (plus carry)
	rl d                  ; multiply d by 2 (plus carry)
	jr .loop



_Divide:: ; marcelnote - adapted from polishedcrystal
; Divide hDividend (4 bytes) by hDivisor (1 byte). Result in hQuotient (4 bytes).
; All values are big endian.
	ldh a, [hDivisor]
	and a ; is divisor 0?
	ret z ; here Polished Crystal had an error crash

	ld d, a              ; d = divisor
	ld c, LOW(hDividend) ; address tracker to use ldh a, [c]
	ld e, 0              ; e = remainder

; first check if we can skip high bytes equal to 0
	ld b, 4              ; number of bytes to check
.skipZeros
	ldh a, [c]           ; a = [hDividend + nByte], next dividend byte
	and a                ; is this dividend 0?
	jr nz, .loopBytes    ; if not, start division
	inc c                ; otherwise move to next byte
	dec b
	jr nz, .skipZeros
; all dividends are 0 so set remainder to 0 and we're done
	ldh [c], a           ; [hRemainder] = 0
	ret

.loopBytes
	ldh a, [c]    ; a = [hDividend + nByte], next dividend byte
	ld h, a       ; h = dividend for this byte, will become quotient
	ld a, e       ; a = remainder within bits loop
	ld b, 8       ; b = bit counter
.loopBits
	sla h         ; rotate dividend bit out and quotient bit left
	rla           ; bring in next bit of dividend into a
	jr c, .carry  ; if carry from rla, then $1a [9bits] ≥ d so subtract d and increase h
	cp d          ; a ≥ d?
	jr c, .skip   ; if not, move to next bit
.carry
	sub d         ; subtract divisor from remainder
	inc h         ; increase quotient
.skip
	dec b         ; one less bit to do
	jr nz, .loopBits
	ld e, a       ; update remainder
	ld a, h
	ldh [c], a    ; [hQuotient + nByte] = quotient
	inc c         ; move to next dividend byte
	ld a, c
	cp LOW(hRemainder) ; is c = LOW(hRemainder)?
	jr nz, .loopBytes  ; if not, more bytes to divide

	ld a, e
	ldh [c], a    ; [hRemainder] = e
	ret
