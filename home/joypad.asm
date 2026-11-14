ReadJoypad:: ; marcelnote - optimized
; Poll joypad input.
; Unlike the hardware register, button
; presses are indicated by a set bit.
	ld c, LOW(rJOYP)

	ld a, JOYP_GET_CTRL_PAD
	ldh [c], a
REPT 4 ; aligned on GB programming manual, 9 to keep same timing as vanilla
	ldh a, [c]
ENDR
	and JOYP_INPUTS
	swap a
	ld b, a

	ld a, JOYP_GET_BUTTONS
	ldh [c], a
REPT 12 ; aligned on GB programming manual, 15 to keep same timing as vanilla
	ldh a, [c]
ENDR
	and JOYP_INPUTS
	or b

	cpl
	ldh [hJoyInput], a

	ld a, JOYP_GET_NONE
	ldh [c], a
	ret

TrySoftReset:
	call DelayFrame
;	ld a, JOYP_GET_NONE ; deselect keys (redundant)
;	ldh [rJOYP], a
	ld hl, hSoftReset
	dec [hl]
	jp z, SoftReset
	; fallthrough

Joypad::
; Update the joypad state variables:
; [hJoyReleased]  keys released since last time
; [hJoyPressed]   keys pressed since last time
; [hJoyHeld] currently pressed keys
	ldh a, [hJoyInput]
	cp PAD_BUTTONS ; soft reset
	jr z, TrySoftReset

	ld b, a
	ldh a, [hJoyLast]
	ld e, a
	xor b
	ld d, a
	and e
	ldh [hJoyReleased], a
	ld a, d
	and b
	ldh [hJoyPressed], a
	ld a, b
	ldh [hJoyLast], a

	ld a, [wStatusFlags5]
	bit BIT_DISABLE_JOYPAD, a
	jr nz, DiscardButtonPresses

	ldh a, [hJoyLast]
	ldh [hJoyHeld], a

	ld a, [wJoyIgnore]
	and a
	ret z

	cpl
	ld b, a
	ldh a, [hJoyHeld]
	and b
	ldh [hJoyHeld], a
	ldh a, [hJoyPressed]
	and b
	ldh [hJoyPressed], a
	ret

DiscardButtonPresses::
	xor a
	ldh [hJoyHeld], a
	ldh [hJoyPressed], a
	ldh [hJoyReleased], a
	ret


; this function is used when lower button sensitivity is wanted (e.g. menus)
; OUTPUT: [hJoy5] = pressed buttons in usual format
; there are two flags that control its functionality, [hJoy6] and [hJoy7]
; there are essentially three modes of operation
; 1. Get newly pressed buttons only
;    ([hJoy7] == 0, [hJoy6] == any)
;    Just copies [hJoyPressed] to [hJoy5].
; 2. Get currently pressed buttons at low sample rate with delay
;    ([hJoy7] == 1, [hJoy6] != 0)
;    If the user holds down buttons for more than half a second,
;    report buttons as being pressed up to 12 times per second thereafter.
;    If the user holds down buttons for less than half a second,
;    report only one button press.
; 3. Same as 2, but report no buttons as pressed if A or B is held down.
;    ([hJoy7] == 1, [hJoy6] == 0)
JoypadLowSensitivity:: ; marcelnote - optimized
	call Joypad
	ldh a, [hJoyPressed] ; newly pressed buttons
	and a ; have any buttons been newly pressed since last check?
	jr z, .noNewlyPressedButtons
; newly pressed buttons
	ld a, 30 ; half a second delay
	ldh [hFrameCounter], a
.selectButtons
	ldh a, [hJoy7] ; flag
	and a ; get all currently pressed buttons or only newly pressed buttons?
	ldh a, [hJoyPressed] ; newly pressed buttons
	jr z, .storeButtonState
	ldh a, [hJoyHeld] ; all currently pressed buttons
.storeButtonState
	ldh [hJoy5], a
	ret

.noNewlyPressedButtons
	ldh a, [hFrameCounter]
	and a ; is the delay over?
	jr nz, .clearButtonState ; if not, report no buttons as pressed
	ld a, 5 ; 1/12 of a second delay
	ldh [hFrameCounter], a
; if [hJoy6] = 0 and A or B is pressed, report no buttons as pressed
	ldh a, [hJoyHeld]
	and PAD_A | PAD_B
	jr z, .selectButtons
	ldh a, [hJoy6] ; flag
	and a
	jr nz, .selectButtons
.clearButtonState
	xor a
	ldh [hJoy5], a
	ret
