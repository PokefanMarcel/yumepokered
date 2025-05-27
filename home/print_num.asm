PrintNumber::
; Print the c-digit, b-byte value at de.
; Allows 2 to 7 digits. For 1-digit numbers, add
; the value to char "0" instead of calling PrintNumber.
; Flags LEADING_ZEROES and LEFT_ALIGN can be given
; in bits 7 and 6 of b respectively.
; Preserves bc, moves hl to next tile to write.
	push bc
	xor a
	ldh [hDividend], a
	ldh [hDividend + 1], a
	ldh [hDividend + 2], a

	ld a, c
	ldh [hNumDigitsToPrint], a ; save c = number of digits to print
	dec a   ; a = tile offset
	add l
	ld l, a
	jr nc, .noCarry
	inc h   ; hl = coord of rightmost tile to write
.noCarry

	push hl ; save hl = coord of rightmost tile to write

	ld a, b ; a = number of bytes to print + printing flags
	and $3  ; remove flags
	dec a   ; print 1 byte?
	jr z, .byte
	dec a   ; print 2 bytes?
	jr z, .word
	; print 3 bytes
	ld a, [de]
	ldh [hDividend + 1], a
	inc de
.word
	ld a, [de]
	ldh [hDividend + 2], a
	inc de
.byte
	ld a, [de]
	ldh [hDividend + 3], a

; Print the number right-aligned by default,
; we will move it later if needed.
.loopDivide
	ld a, 10
	ldh [hDivisor], a ; hDivisor = hRemainder get overwritten
	call Divide
	ldh a, [hRemainder]
	add "0"           ; a = character number to write
	ld [hld], a

	bit BIT_LEADING_ZEROES, b
	jr nz, .continue ; if printing leading zeroes, keep going
	; else check if we have printed everything
	ldh a, [hQuotient + 3]
	and a
	jr nz, .continue
	ldh a, [hQuotient + 2]
	and a
	jr nz, .continue
	ldh a, [hQuotient + 1]
	and a
	jr nz, .continue
	; we have printed everything, so check left alignment
	dec c                 ; c = number of digits to print - number of digits printed
	jr z, .done_PopHL     ; if no more digits to print, we're done anyway
	bit BIT_LEFT_ALIGN, b
	jr z, .done_PopHL     ; if no left alignment, we're also done
	jr .handleLeftAlign   ; else we must move the printed number to the left

.continue
	dec c ; one less digit to print
	jr nz, .loopDivide

.done_PopHL
	pop hl  ; restore hl = coord of rightmost tile to write
.done
	inc hl  ; hl = coord of next tile after printed number
	pop bc
	ret


.handleLeftAlign
	ldh a, [hNumDigitsToPrint]
	sub c       ; c = number of digits to print - number of digits printed
	ld b, a     ; b = number of digits printed
;	push de     ; save de = address of number to print (low byte)

	ld d, h
	ld a, l
	sub c
	ld e, a
	jr nc, .noCarry2
	dec d       ; de = coord of written tile
.noCarry2

.moveDigit
	inc hl      ; hl = coord of read tile
	inc de      ; de = coord of written tile
	ld a, [hl]
	ld [de], a
	dec b
	jr nz, .moveDigit

	ld a, " "
.fill
	ld [hld], a
	dec c
	jr nz, .fill

;	pop de      ; restore de = address of number to print (low byte)
	pop af      ; discard pushed hl
	jr .done
