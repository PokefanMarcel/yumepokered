; divide hMoney by hDivideBCDDivisor
; return output in hDivideBCDQuotient (same as hDivideBCDDivisor)
; used only to halve player money upon losing a fight
DivideBCDPredef::
	call GetPredefRegisters

DivideBCD::
	xor a
	ldh [hDivideBCDBuffer], a
	ldh [hDivideBCDBuffer+1], a
	ldh [hDivideBCDBuffer+2], a
	ld d, $1
.mulBy10Loop
; multiply the divisor by 10 until the leading digit is nonzero
; to set up the standard long division algorithm
	ldh a, [hDivideBCDDivisor]
	and $f0
	jr nz, .next
	inc d
	ldh a, [hDivideBCDDivisor]
	swap a
	and $f0
	ld b, a
	ldh a, [hDivideBCDDivisor+1]
	swap a
	ldh [hDivideBCDDivisor+1], a
	and $f
	or b
	ldh [hDivideBCDDivisor], a
	ldh a, [hDivideBCDDivisor+1]
	and $f0
	ld b, a
	ldh a, [hDivideBCDDivisor+2]
	swap a
	ldh [hDivideBCDDivisor+2], a
	and $f
	or b
	ldh [hDivideBCDDivisor+1], a
	ldh a, [hDivideBCDDivisor+2]
	and $f0
	ldh [hDivideBCDDivisor+2], a
	jr .mulBy10Loop

.next
	push de
	push de
	call DivideBCD_getNextDigit
	pop de
	ld a, b
	swap a
	and $f0
	ldh [hDivideBCDBuffer], a
	dec d
	jr z, .next2
	push de
	call DivideBCD_divDivisorBy10
	call DivideBCD_getNextDigit
	pop de
	ldh a, [hDivideBCDBuffer]
	or b
	ldh [hDivideBCDBuffer], a
	dec d
	jr z, .next2
	push de
	call DivideBCD_divDivisorBy10
	call DivideBCD_getNextDigit
	pop de
	ld a, b
	swap a
	and $f0
	ldh [hDivideBCDBuffer+1], a
	dec d
	jr z, .next2
	push de
	call DivideBCD_divDivisorBy10
	call DivideBCD_getNextDigit
	pop de
	ldh a, [hDivideBCDBuffer+1]
	or b
	ldh [hDivideBCDBuffer+1], a
	dec d
	jr z, .next2
	push de
	call DivideBCD_divDivisorBy10
	call DivideBCD_getNextDigit
	pop de
	ld a, b
	swap a
	and $f0
	ldh [hDivideBCDBuffer+2], a
	dec d
	jr z, .next2
	push de
	call DivideBCD_divDivisorBy10
	call DivideBCD_getNextDigit
	pop de
	ldh a, [hDivideBCDBuffer+2]
	or b
	ldh [hDivideBCDBuffer+2], a
.next2
	ldh a, [hDivideBCDBuffer]
	ldh [hDivideBCDQuotient], a ; the same memory location as hDivideBCDDivisor
	ldh a, [hDivideBCDBuffer+1]
	ldh [hDivideBCDQuotient+1], a
	ldh a, [hDivideBCDBuffer+2]
	ldh [hDivideBCDQuotient+2], a
	pop de
	ld a, $6
	sub d
	and a
	ret z
.divResultBy10loop
	push af
	call DivideBCD_divDivisorBy10
	pop af
	dec a
	jr nz, .divResultBy10loop
	ret

DivideBCD_divDivisorBy10:
	ldh a, [hDivideBCDDivisor+2]
	swap a
	and $f
	ld b, a
	ldh a, [hDivideBCDDivisor+1]
	swap a
	ldh [hDivideBCDDivisor+1], a
	and $f0
	or b
	ldh [hDivideBCDDivisor+2], a
	ldh a, [hDivideBCDDivisor+1]
	and $f
	ld b, a
	ldh a, [hDivideBCDDivisor]
	swap a
	ldh [hDivideBCDDivisor], a
	and $f0
	or b
	ldh [hDivideBCDDivisor+1], a
	ldh a, [hDivideBCDDivisor]
	and $f
	ldh [hDivideBCDDivisor], a
	ret

DivideBCD_getNextDigit:
	ld bc, $3
.loop
	ld de, hMoney ; the dividend
	ld hl, hDivideBCDDivisor
	push bc
	call StringCmp
	pop bc
	ret c
	inc b
	ld de, hMoney + 2 ; since SubBCD works starting from the least significant digit
	ld hl, hDivideBCDDivisor + 2
	push bc
	call SubBCD
	pop bc
	jr .loop


AddBCDPredef::
	call GetPredefRegisters
	; fallthrough

; add BCD number at hl to BCD number at de
; c = number of bytes to add
; hl, de = address of last byte
AddBCD:: ; marcelnote - optimized
	xor a   ; clear carry for first adc
	ld b, c ; b = number of bytes to add
.add
	ld a, [de]
	adc [hl]    ; uses carry from previous adc
	daa         ; adjust result of adc to BCD
	ld [de], a
	dec de
	dec hl
	dec c       ; more bytes to add?
	jr nz, .add
	ret nc      ; if no carry from adc, we're done
	; else cap at 9 for each nibble
	ld a, $99
.fill
	inc de
	ld [de], a
	dec b
	jr nz, .fill
	ret


SubBCDPredef::
	call GetPredefRegisters
	; fallthrough

; subtract BCD number at hl from BCD number at de
; c = number of bytes to subtract
; hl, de = address of last byte
SubBCD:: ; marcelnote - optimized
	xor a   ; clear carry for first adc
	ld b, c ; b = number of bytes to add
.sub
	ld a, [de]
	sbc [hl]    ; uses carry from previous sbc
	daa         ; adjust result of adc to BCD
	ld [de], a
	dec de
	dec hl
	dec c       ; more bytes to subtract?
	jr nz, .sub
	ret nc      ; if no carry from sbc, we're done
	; else clamp at 0 for each nibble
	ld a, $00
.fill
	inc de
	ld [de], a
	dec b
	jr nz, .fill
	scf         ; in this case set carry
	ret
