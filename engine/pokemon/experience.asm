; calculates the level a mon should be based on its current exp
CalcLevelFromExperience::
	ld a, [wLoadedMonSpecies]
	ld [wCurSpecies], a
	call GetMonHeader
	ld d, 1 ; init level to 1
.loop
	inc d ; increment level
	call CalcExperience
;	push hl
	ld hl, wLoadedMonExp + 2 ; current exp
; compare exp needed for level d with current exp
	ldh a, [hExperience + 2]
	ld c, a
	ld a, [hld]
	sub c
	ldh a, [hExperience + 1]
	ld c, a
	ld a, [hld]
	sbc c
	ldh a, [hExperience]
	ld c, a
	ld a, [hl]
	sbc c
;	pop hl
	jr nc, .loop ; if exp needed for level d is not greater than exp, try the next level
	dec d ; since the exp was too high on the last loop iteration, go back to the previous value and return
	ret

; calculates the amount of experience needed for level d, preserves d
CalcExperience:: ; marcelnote - optimized
; hExperience = floor(cubic_coeff * d^3) + signed_square_coeff * d^2 + linear_coeff * d - constant
; GrowthRateTable entries are:
;   byte 0: high nybble = cubic numerator, low nybble = cubic divisor
;   byte 1: square coefficient, signed magnitude ($80 = negative)
;   byte 2: linear coefficient
;   byte 3: constant
	ld a, [wMonHGrowthRate]
	add a
	add a
	ld c, a
	ld b, 0
	ld hl, GrowthRateTable
	add hl, bc

; Calculate d^2 and keep it in bc. The low 3 bytes of hProduct also alias
; hMultiplicand, and CalcDSquared leaves hMultiplier = d, so the next Multiply
; turns d^2 into d^3.
	call CalcDSquared
	ldh a, [hProduct + 2]
	ld b, a
	ldh a, [hProduct + 3]
	ld c, a                ; bc = d^2
	call Multiply          ; [hProduct] = d^3

; Apply the cubic fraction. Divide's quotient aliases hExperience, so zero-term
; growth rates can return immediately after this.
	ld a, [hl]
	and $f0
	swap a                 ; a = cubic numerator
	ldh [hMultiplier], a
	call Multiply
	ld a, [hli]
	and $0f                ; a = cubic denominator
	ldh [hDivisor], a
	call Divide            ; [hExperience] = floor(cubic_coeff * d^3)

	ld a, [hli]
	and a
	ret z ; remaining coefficients are zero for the zero-square growth rates
	ld e, a                ; e = signed square coeff

; Save the cubic term before using the math buffers for the square and linear
; terms. The stack order is low-to-high when popping below.
	ldh a, [hExperience]
	push af
	ldh a, [hExperience + 1]
	push af
	ldh a, [hExperience + 2]
	push af                ; save high/mid/low of floor(cubic_coeff * d^3)

; Calculate |square coeff| * d^2 from the copy of d^2 in bc.
	xor a
	ldh [hMultiplicand], a
	ld a, b
	ldh [hMultiplicand + 1], a
	ld a, c
	ldh [hMultiplicand + 2], a
	ld a, e
	and $7f                ; a = |square coeff|
	ldh [hMultiplier], a
	call Multiply

; Save the square term above the cubic term so it is popped first.
	ldh a, [hProduct + 1]
	push af
	ldh a, [hProduct + 2]
	push af
	ldh a, [hProduct + 3]
	push af                ; save high/mid/low of |square coeff| * d^2

; Calculate linear * n - constant in hExperience.
	xor a
	ldh [hMultiplicand], a
	ldh [hMultiplicand + 1], a
	ld a, d                ; last time we need d = level
	ldh [hMultiplicand + 2], a
	ld a, [hli]            ; a = linear_coeff
	ldh [hMultiplier], a
	call Multiply
	ld b, [hl]             ; b = constant
	ld hl, hExperience + 2 ; = hProduct + 3
	ld a, [hl]
	sub b
	ld [hld], a
	ld a, [hl]             ; hExperience + 1
	sbc 0
	ld [hld], a
	ld a, [hl]             ; hExperience
	sbc 0
	ld [hli], a            ; [hExperience] = linear_coeff * n - constant

; Add or subtract the square term according to its signed-magnitude bit.
	bit 7, e               ; is signed_square_coeff negative?
	inc hl                 ; hl = hExperience + 2
	pop bc
	ld a, [hl]  ; hExperience + 2
	jr nz, .subtractSquaredTerm
	add b
	ld [hld], a
	pop bc
	ld a, [hl]  ; hExperience + 1
	adc b
	ld [hld], a
	pop bc
	ld a, [hl]  ; hExperience
	adc b
	ld [hli], a ; hl = hExperience + 1
	jr .addCubedTerm
.subtractSquaredTerm
	sub b
	ld [hld], a
	pop bc
	ld a, [hl]  ; hExperience + 1
	sbc b
	ld [hld], a
	pop bc
	ld a, [hl]  ; hExperience
	sbc b
	ld [hli], a ; hl hExperience + 1
.addCubedTerm
; Finally add the saved cubic term back into hExperience.
	inc hl ; hl = hExperience + 2
	pop bc
	ld a, [hl]
	add b
	ld [hld], a ; hExperience + 2
	pop bc
	ld a, [hl]
	adc b
	ld [hld], a ; hExperience + 1
	pop bc
	ld a, [hl]
	adc b
	ld [hl], a  ; hExperience
	ret

; calculates d*d
CalcDSquared:
	xor a
	ldh [hMultiplicand], a
	ldh [hMultiplicand + 1], a
	ld a, d
	ldh [hMultiplicand + 2], a
	ldh [hMultiplier], a
	jp Multiply

INCLUDE "data/growth_rates.asm"
