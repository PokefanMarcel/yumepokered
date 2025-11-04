; marcelnote - moved options menu here

IF DEF(_FRA)
	DEF OPTIONS_MENU_X_COORD EQU 11
ELSE
	DEF OPTIONS_MENU_X_COORD EQU 11
ENDC

DisplayOptionMenu: ; marcelnote - modified
	hlcoord 0, 0
	lb bc, SCREEN_HEIGHT - 2, SCREEN_WIDTH - 2
	call TextBoxBorder ; marcelnote - draw only one big box instead of 3 small ones
	hlcoord 2, 2
	ld de, AllOptionsText
	call PlaceString
	hlcoord OPTIONS_MENU_X_COORD - 1, 3
	ld de, OptionsColonsText
	call PlaceString
	xor a
	ld [wOptionsCursorLocation], a
	ld b, 5 ; the number of options to loop through
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
	and PAD_START | PAD_B
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
	dw OptionsMenu_SpriteStyle
	dw OptionsMenu_MeasureUnits
	dw OptionsMenu_Dummy
	dw OptionsMenu_Dummy
	dw OptionsMenu_Cancel


OptionsMenu_TextSpeed:
	call GetTextSpeed ; c = 0 (instant), 1 (fast), 2 (medium), 3 (slow),
	ldh a, [hJoy5]    ; d = left speed, e = right speed
	bit B_PAD_RIGHT, a
	jr nz, .pressedRight
	bit B_PAD_LEFT, a
	jr nz, .pressedLeft
	jr .nonePressed
.pressedRight ; pick right speed e and increase c
	inc c
	ld a, c
	cp 4
	jr nz, .save
	ld c, 0   ; wrap around to 0 if c = 4
	jr .save
.pressedLeft  ; pick left speed d and decrease c
	ld e, d
	dec c
	ld a, c
	cp -1 ; inc a
	jr nz, .save
	ld c, 3   ; wrap around to 3 if c = 0
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
	hlcoord OPTIONS_MENU_X_COORD, 3
	call PlaceString
	and a
	ret

GetTextSpeed:
	ld a, [wOptions]
	and TEXT_DELAY_MASK
	ld c, a
	jr z, .instantTextOption
	dec a
	jr z, .fastTextOption
	dec a
	jr z, .mediumTextOption
; slow text option
	lb de, TEXT_DELAY_MEDIUM, TEXT_DELAY_INSTANT
	ret
.mediumTextOption
	lb de, TEXT_DELAY_FAST, TEXT_DELAY_SLOW
	ret
.fastTextOption
	lb de, TEXT_DELAY_INSTANT, TEXT_DELAY_MEDIUM
	ret
.instantTextOption
	lb de, TEXT_DELAY_SLOW, TEXT_DELAY_FAST
	ret

TextSpeedStringsPointerTable:
	dw InstantText
	dw FastText
	dw MediumText
	dw SlowText


OptionsMenu_BattleAnimations: ; bit set = animations off
	ldh a, [hJoy5]
	and PAD_RIGHT | PAD_LEFT
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
	hlcoord OPTIONS_MENU_X_COORD, 5
	call PlaceString
	and a
	ret

AnimationOptionStringsPointerTable:
	dw AnimationOnText
	dw AnimationOffText


OptionsMenu_BattleStyle: ; bit set = metric
	ldh a, [hJoy5]
	and PAD_LEFT | PAD_RIGHT
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
	hlcoord OPTIONS_MENU_X_COORD, 7
	call PlaceString
	and a
	ret

BattleStyleOptionStringsPointerTable:
	dw BattleStyleShiftText
	dw BattleStyleSetText


OptionsMenu_MeasureUnits: ; bit set = metric
	ldh a, [hJoy5]
	and PAD_LEFT | PAD_RIGHT
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
	hlcoord OPTIONS_MENU_X_COORD, 11
	call PlaceString
	and a
	ret

MeasureUnitsOptionStringsPointerTable:
	dw MeasureUnitsImperialText
	dw MeasureUnitsMetricText


OptionsMenu_SpriteStyle:
	call GetSpriteStyle ; c = 0 (SPRITE_STYLE_BLUE), 1 (SPRITE_STYLE_CRYSTAL), 2 (SPRITE_STYLE_GREEN)
	ldh a, [hJoy5]      ; d = left style, e = right style
	bit B_PAD_RIGHT, a
	jr nz, .pressedRight
	bit B_PAD_LEFT, a
	jr nz, .pressedLeft
	jr .nonePressed
.pressedRight ; pick right style e and increase c
	inc c
	ld a, c
	cp 3
	jr nz, .save
	ld c, 0   ; wrap around to 0
	jr .save
.pressedLeft  ; pick left style d and decrease c
	ld e, d
	dec c
	ld a, c
	inc a
	jr nz, .save
	ld c, 2   ; wrap around to last
.save
	ld a, [wOptions]
	and ~SPRITE_STYLE_MASK
	or e
	ld [wOptions], a
.nonePressed
	ld b, 0
	sla c
	ld hl, SpriteStyleStringsPointerTable
	add hl, bc
	ld a, [hli]
	ld e, a
	ld d, [hl]
	hlcoord OPTIONS_MENU_X_COORD, 9
	call PlaceString
	and a
	ret

GetSpriteStyle:
	ld a, [wOptions]
	and SPRITE_STYLE_MASK
	ld c, a
	jr z, .blueSpriteStyleOption
	rr c
	rr c
	cp SPRITE_STYLE_CRYSTAL
	jr z, .crystalSpriteStyleOption
; green sprite style option
	lb de, SPRITE_STYLE_CRYSTAL, SPRITE_STYLE_BLUE
	ret
.blueSpriteStyleOption
	lb de, SPRITE_STYLE_GREEN, SPRITE_STYLE_CRYSTAL
	ret
.crystalSpriteStyleOption
	lb de, SPRITE_STYLE_BLUE, SPRITE_STYLE_GREEN
	ret

SpriteStyleStringsPointerTable:
	dw SpriteStyleBlueText
	dw SpriteStyleCrystalText
	dw SpriteStyleGreenText


OptionsMenu_Dummy:
	and a
	ret


OptionsMenu_Cancel:
	ldh a, [hJoy5]
	and PAD_A ; clears carry
	ret z
	scf ; set carry flag to exit options menu
	ret


OptionsControl:
	ld hl, wOptionsCursorLocation
	ldh a, [hJoy5]
	cp PAD_DOWN
	jr z, .pressedDown
	cp PAD_UP
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
	cp 4    ; if last option, go down to Cancel
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
	ld [hl], 4
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

IF DEF(_FRA)
	INCLUDE "translation/fra/data/text/options.fra.asm"
ELSE
	INCLUDE "data/text/options.asm"
ENDC
