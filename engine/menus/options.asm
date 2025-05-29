; marcelnote - moved options menu here
DisplayOptionMenu: ; marcelnote - modified
	hlcoord 0, 0
	lb bc, SCREEN_HEIGHT - 2, SCREEN_WIDTH - 2
	call TextBoxBorder ; marcelnote - draw only one big box instead of 3 small ones
	hlcoord 2, 2
	ld de, AllOptionsText
	call PlaceString
	hlcoord 10, 3
	ld de, OptionsColonsText
	call PlaceString
	xor a
	ld [wOptionsCursorLocation], a
	ld b, 4 ; the number of options to loop through
.loop
	push bc
	call GetOptionPointer ; updates the next option
	pop bc
	ld hl, wOptionsCursorLocation
	inc [hl] ; moves the cursor for the highlighted option
	dec b
	jr nz, .loop
	xor a
	ld [wOptionsCursorLocation], a
	inc a
	ldh [hAutoBGTransferEnabled], a
	call Delay3
.optionMenuLoop
	call JoypadLowSensitivity
	ldh a, [hJoy5]
	and START | B_BUTTON
	ret nz ; exit option menu
	call OptionsControl
	jr c, .dpadDelay
	call GetOptionPointer
	ret c  ; exit option menu
.dpadDelay
	call OptionsMenu_UpdateCursorPosition
	call Delay3
	jr .optionMenuLoop


OptionsMenu_UpdateCursorPosition:
	hlcoord 1, 1
	ld de, SCREEN_WIDTH
	ld c, 16
.loop
	ld [hl], " "
	add hl, de
	dec c
	jr nz, .loop
	hlcoord 1, 2
	ld bc, SCREEN_WIDTH * 2
	ld a, [wOptionsCursorLocation]
	call AddNTimes
	ld [hl], "▶"
	ret


AllOptionsText:
	db   "TEXT SPEED"
	next "BATTLE ANIMATION"
	next "BATTLE STYLE"
	next "MEASURE UNITS"
	next ""
	next ""
	next ""
	next "DONE@" ; marcelnote - changed from CANCEL@

OptionsColonsText:
	db   ":"
	next ":"
	next ":"
	next ":@"


GetOptionPointer:
	ld a, [wOptionsCursorLocation]
	add a
	ld e, a
	ld d, 0
	ld hl, OptionMenuJumpTable
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl ; jump to the function for the current highlighted option


OptionMenuJumpTable:
	dw OptionsMenu_TextSpeed
	dw OptionsMenu_BattleAnimations
	dw OptionsMenu_BattleStyle
	dw OptionsMenu_MeasureUnits
	dw OptionsMenu_Dummy
	dw OptionsMenu_Dummy
	dw OptionsMenu_Dummy
	dw OptionsMenu_Cancel


OptionsMenu_TextSpeed:
	call GetTextSpeed ; c = 0 (fast), 1 (medium), 2 (slow),
	ldh a, [hJoy5]    ; d = left speed, e = right speed
	bit BIT_D_RIGHT, a
	jr nz, .pressedRight
	bit BIT_D_LEFT, a
	jr nz, .pressedLeft
	jr .nonePressed
.pressedRight ; pick right speed e and increase c
	inc c
	ld a, c
	cp 3
	jr nz, .save
	ld c, 0   ; wrap around to 0 if c = 3
	jr .save
.pressedLeft  ; pick left speed d and decrease c
	ld e, d
	dec c
	ld a, c
	cp -1 ; inc a
	jr nz, .save
	ld c, 2   ; wrap around to 2 if c = 0
.save
	ld a, [wOptions]
	and ~TEXT_DELAY_MASK
	or e
	ld [wOptions], a
.nonePressed
	ld b, 0
	sla c
	ld hl, TextSpeedStringsPointerTable
	add hl, bc
	ld a, [hli]
	ld e, a
	ld d, [hl]
	hlcoord 11, 3
	call PlaceString
	and a
	ret

GetTextSpeed:
	ld a, [wOptions]
	and TEXT_DELAY_MASK
	cp TEXT_DELAY_FAST
	jr z, .fastTextOption
	cp TEXT_DELAY_MEDIUM
	jr z, .mediumTextOption
; slow text option
	ld c, 2
	lb de, TEXT_DELAY_MEDIUM, TEXT_DELAY_FAST
	ret
.mediumTextOption
	ld c, 1
	lb de, TEXT_DELAY_FAST, TEXT_DELAY_SLOW
	ret
.fastTextOption
	ld c, 0
	lb de, TEXT_DELAY_SLOW, TEXT_DELAY_MEDIUM
	ret

TextSpeedStringsPointerTable:
	dw FastText
	dw MediumText
	dw SlowText

FastText:
	db "FAST  @"
MediumText:
	db "MEDIUM@"
SlowText:
	db "SLOW  @"


OptionsMenu_BattleAnimations: ; bit set = animations off
	ldh a, [hJoy5]
	and D_RIGHT | D_LEFT
	ld a, [wOptions]
	jr z, .keep
	xor 1 << BIT_BATTLE_ANIM_OFF
	ld [wOptions], a
.keep
	and 1 << BIT_BATTLE_ANIM_OFF
	ld bc, $0
	ASSERT BIT_BATTLE_ANIM_OFF == 7
	rla
	rl c
	ld hl, AnimationOptionStringsPointerTable
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld e, a
	ld d, [hl]
	hlcoord 11, 5
	call PlaceString
	and a
	ret

AnimationOptionStringsPointerTable:
	dw AnimationOnText
	dw AnimationOffText

AnimationOnText:
	db "ON @"
AnimationOffText:
	db "OFF@"


OptionsMenu_BattleStyle: ; bit set = metric
	ldh a, [hJoy5]
	and D_LEFT | D_RIGHT
	ld a, [wOptions]
	jr z, .keep
	xor 1 << BIT_BATTLE_SET
	ld [wOptions], a
.keep
	and 1 << BIT_BATTLE_SET
	ld bc, $0
	ASSERT BIT_BATTLE_SET == 6
	rla
	rla
	rl c
	ld hl, BattleStyleOptionStringsPointerTable
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld e, a
	ld d, [hl]
	hlcoord 11, 7
	call PlaceString
	and a
	ret

BattleStyleOptionStringsPointerTable:
	dw BattleStyleShiftText
	dw BattleStyleSetText

BattleStyleShiftText:
	db "SHIFT@"
BattleStyleSetText:
	db "SET  @"


OptionsMenu_MeasureUnits: ; bit set = metric
	ldh a, [hJoy5]
	and D_LEFT | D_RIGHT
	ld a, [wOptions]
	jr z, .keep
	xor 1 << BIT_UNITS_METRIC
	ld [wOptions], a
.keep
	and 1 << BIT_UNITS_METRIC
	ld bc, $0
	ASSERT BIT_UNITS_METRIC == 5
	rla
	rla
	rla
	rl c
	ld hl, MeasureUnitsOptionStringsPointerTable
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld e, a
	ld d, [hl]
	hlcoord 11, 9
	call PlaceString
	and a
	ret

MeasureUnitsOptionStringsPointerTable:
	dw MeasureUnitsImperialText
	dw MeasureUnitsMetricText

MeasureUnitsImperialText:
	db "IMPERIAL@"
MeasureUnitsMetricText:
	db "METRIC  @"


OptionsMenu_Dummy:
	and a
	ret


OptionsMenu_Cancel:
	ldh a, [hJoy5]
	and A_BUTTON ; clears carry
	ret z
	scf ; set carry flag to exit options menu
	ret


OptionsControl:
	ld hl, wOptionsCursorLocation
	ldh a, [hJoy5]
	cp D_DOWN
	jr z, .pressedDown
	cp D_UP
	jr z, .pressedUp
	and a
	ret

.pressedDown
	ld a, [hl]
	cp 7    ; if Cancel, go back to top
	jr nz, .doNotWrapAround
	ld [hl], 0
	scf
	ret
.doNotWrapAround
	cp 3    ; if last option, go down to Cancel
	jr c, .regularIncrement
	ld [hl], 6
.regularIncrement
	inc [hl]
	scf
	ret

.pressedUp
	ld a, [hl]
	cp 7    ; if Cancel, go up to last option
	jr nz, .notCancel
	ld [hl], 3
	scf
	ret
.notCancel
	and a    ; if first option, go down to Cancel
	jr nz, .regularDecrement
	ld [hl], 8
.regularDecrement
	dec [hl]
	scf
	ret
