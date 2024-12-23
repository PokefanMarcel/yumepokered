; marcelnote - shinpokered xorshift RNG
Random_::
; Generate a random 16-bit value.
;	ldh a, [rDIV]
;	ld b, a
;	ldh a, [hRandomAdd]
;	adc b
;	ldh [hRandomAdd], a
;	ldh a, [rDIV]
;	ld b, a
;	ldh a, [hRandomSub]
;	sbc b
;	ldh [hRandomSub], a
;	ret

;joenote - implement Patrik Rak's xorshift RNG
;Found at https://gist.github.com/raxoft/2275716fea577b48f7f0
;Patrik Rak released this code into public domain.

; 8-bit Xor-Shift random number generator.
; Created by Patrik Rak in 2008 and revised in 2011/2012.
; See http://www.worldofspectrum.org/forums/showthread.php?t=23070

;Note about the hram locations and how they hold random values:
;hRandomAdd = x[n]
;hRandomLast = x[n-1]
;hRandomSub = x[n-2]
;hRandomLast+1 = x[n-3]
;This gives up to 4 random values to pick from so long as this function as been called at least 4 times.

	;load Seed[n] into bc
	ld hl, hRandomAdd + 1 ; hRandomSub
	ld a, [hld]
	ld b, a     ; b = x[n-2]
	ld a, [hl]
	ld c, a     ; b = x[n]
	;load Seed[n-1] into de
	ld hl, hRandomLast + 1
	ld a, [hld]
	ld d, a
	ld a, [hli]
	ld e, a
	;Seed[n-1] = Seed[n]
	ld a, b
	ld [hld], a
	ld a, c
	ld [hl], a

	ld a, c
	add a
	add a
	add a
	xor c
	ld c, a
	ld a, d
	add a
	xor d
	ld b, a
	rra
	xor b
	xor c
	ld b, e
	ld c, a

	ld hl, hRandomAdd + 1
	ld a, b
	ld [hld], a
	ld a, c
	ld [hl], a
	ret
