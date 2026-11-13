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


WaitForTextScrollButtonPress:: ; marcelnote - small optim
	push hl
	ld hl, hDownArrowBlinkCount1
	ASSERT hDownArrowBlinkCount2 == hDownArrowBlinkCount1 + 1
	ld a, [hli] ; hDownArrowBlinkCount1
	push af
	ld a, [hld] ; hDownArrowBlinkCount2
	push af
	xor a
	ld [hli], a ; hDownArrowBlinkCount1
	ld [hl], 6  ; hDownArrowBlinkCount2
.loop
	ld a, [wTownMapSpriteBlinkingEnabled]
	and a
	call nz, TownMapSpriteBlinkingAnimation
	hlcoord 18, 16
	call HandleDownArrowBlinkTiming
	call JoypadLowSensitivity
	predef CableClub_Run
	ldh a, [hJoy5]
	and PAD_A | PAD_B
	jr z, .loop
	pop af
	ldh [hDownArrowBlinkCount2], a
	pop af
	ldh [hDownArrowBlinkCount1], a
	pop hl
	ret

; (unless in link battle) waits for A or B being pressed and outputs the scrolling sound effect
ManualTextScroll::
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	jr z, .inLinkBattle
	call WaitForTextScrollButtonPress
	ld a, SFX_PRESS_AB
	jp PlaySound
.inLinkBattle
	ld c, 65
	jp DelayFrames
