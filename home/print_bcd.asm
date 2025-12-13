; function to print a BCD (Binary-coded decimal) number
; de = address of BCD number
; hl = destination address
; c = flags and length
; bit 7: if set, do not print leading zeroes
;        if unset, print leading zeroes
; bit 6: if set, left-align the string (do not pad empty digits with spaces)
;        if unset, right-align the string
; bit 5: if set, print currency symbol at the beginning of the string
;        if unset, do not print the currency symbol
; bits 0-4: length of BCD number in bytes
; Note that bits 5 and 7 are modified during execution. The above reflects
; their meaning at the beginning of the functions's execution.
PrintBCDNumber:: ; marcelnote - optimized
	ld a, c ; save flags in c
	and ~(MONEY_SIGN | LEFT_ALIGN | LEADING_ZEROES)
	ld b, a ; b now holds the length
.loop
	ld a, [de]
	swap a
	call PrintBCDDigit ; print upper digit
	ld a, [de]
	call PrintBCDDigit ; print lower digit
	inc de
	dec b
	jr nz, .loop
	bit BIT_LEADING_ZEROES, c ; have we printed something?

IF DEF (_FRA)
	jr z, .checkCurrencySymbol ; if so, check currency symbol
	bit BIT_LEFT_ALIGN, c
	jr nz, .skipRightAlignmentAdjustment
	dec hl ; if the string is right-aligned, it needs to be moved back one space
.skipRightAlignmentAdjustment
	ld [hl], '0'
	call PrintLetterDelay
	inc hl
.checkCurrencySymbol
	bit BIT_MONEY_SIGN, c
	ret z
	ld a, '¥'
	ld [hli], a
	ret
ELSE
	ret z ; if so, we are done
	bit BIT_LEFT_ALIGN, c
	jr nz, .skipRightAlignmentAdjustment
	dec hl ; if the string is right-aligned, it needs to be moved back one space
.skipRightAlignmentAdjustment
	bit BIT_MONEY_SIGN, c
	jr z, .skipCurrencySymbol
	ld a, '¥'
	ld [hli], a
.skipCurrencySymbol
	ld [hl], '0'
	call PrintLetterDelay
	inc hl
	ret
ENDC


PrintBCDDigit:: ; marcelnote - optimized
	and $f
	jr nz, .notZero
	bit BIT_LEADING_ZEROES, c
	jr z, .checkCurrencySign
	bit BIT_LEFT_ALIGN, c
	ret nz
	inc hl ; if right-aligned, "print" a space by advancing the pointer
	ret
.notZero
	res BIT_LEADING_ZEROES, c
.checkCurrencySign

IF DEF(_FRA)
	; do nothing, sign at the end
ELSE
	bit BIT_MONEY_SIGN, c
	jr z, .printDigit
	res BIT_MONEY_SIGN, c
	ld [hl], '¥'
	inc hl
ENDC

.printDigit
	add '0'
	ld [hli], a
	jp PrintLetterDelay
