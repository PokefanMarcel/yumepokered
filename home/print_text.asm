; This function is used to wait a short period after printing a letter to the
; screen unless the player presses the A/B button or the delay is turned off
; through the [wStatusFlags5] or [wLetterPrintingDelayFlags] flags.
PrintLetterDelay:: ; marcelnote - small optimization
	ld a, [wStatusFlags5]
	bit BIT_NO_TEXT_DELAY, a
	ret nz
	ld a, [wLetterPrintingDelayFlags]
	bit BIT_LETTER_PRINTING_DELAY, a
	ret z
	push hl
	push de
	push bc
	bit BIT_FAST_TEXT_DELAY, a
	ld a, 1
	jr z, .loadWaitFrames
	ld a, [wOptions]
	and TEXT_DELAY_MASK ; marcelnote - replaced $f
	jr z, .loadWaitFrames
; marcelnote - 1-2-3 into 1-3-5 with 2a - 1
	rla
	dec a
.loadWaitFrames
	ldh [hFrameCounter], a
.checkButtons
	call Joypad
	ldh a, [hJoyHeld]
	and PAD_A | PAD_B
	jr z, .buttonsNotPressed
	call DelayFrame
	jr .done
.buttonsNotPressed ; if neither A nor B is pressed
	ldh a, [hFrameCounter]
	and a
	jr nz, .checkButtons
.done
	pop bc
	pop de
	pop hl
	ret
