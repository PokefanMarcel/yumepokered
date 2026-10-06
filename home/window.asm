HandleMenuInput::
	xor a
	ld [wPartyMenuAnimMonEnabled], a
	; fallthrough

HandleMenuInput_:: ; marcelnote - optimized
	ld a, LOW(wTileMap + 11 * SCREEN_WIDTH + 18)
	ld [wMenuScrollArrow], a
	ld a, HIGH(wTileMap + 11 * SCREEN_WIDTH + 18)
	ld [wMenuScrollArrow + 1], a
	jr HandleMenuInputCommon

; HL = scrolling-arrow tile. List menus supply their derived position here.
HandleMenuInputWithScrollArrow::
	ld a, l
	ld [wMenuScrollArrow], a
	ld a, h
	ld [wMenuScrollArrow + 1], a
	; fallthrough

HandleMenuInputCommon:
	ldh a, [hDownArrowBlinkCount1]
	push af
	ldh a, [hDownArrowBlinkCount2]
	push af ; save existing values on stack
	xor a
	ldh [hDownArrowBlinkCount1], a ; blinking down arrow timing value 1
	ld a, 6
	ldh [hDownArrowBlinkCount2], a ; blinking down arrow timing value 2
.loop1
	xor a
	ld [wAnimCounter], a ; counter for pokemon shaking animation
	call PlaceMenuCursor
	call Delay3
.loop2
	ld a, [wPartyMenuAnimMonEnabled]
	and a ; is it a pokemon selection menu?
	jr z, .getJoypadState
	push hl
	callfar AnimatePartyMon ; shake mini sprite of selected pokemon
	pop hl
.getJoypadState
	call JoypadLowSensitivity
	ldh a, [hJoy5]
	ld b, a ; b = button state
	and a ; was a key pressed?
	jr nz, .keyPressed
	push hl
	ld hl, wMenuScrollArrow
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call HandleDownArrowBlinkTiming ; blink down arrow (if any), preserves b
	pop hl
	ld a, [wMenuJoypadPollCount]
	dec a
	jr nz, .loop2
	; if a key wasn't pressed within the specified number of checks
	jr .skipPlayingSound
.keyPressed
	xor a
	ld [wTurnInPlaceDelay], a
	bit B_PAD_UP, b
	jr z, .checkIfDownPressed
; Up pressed
	ld a, [wCurrentMenuItem] ; selected menu item
	and a ; already at the top of the menu?
	jr z, .alreadyAtTop
; not at top
	dec a
	jr .updateCurrentMenuItem
.alreadyAtTop
	ld a, [wMenuWrappingEnabled]
	and a ; is wrapping around enabled?
	jr z, .noWrappingAround
	ld a, [wMaxMenuItem] ; wrap to the bottom of the menu
	jr .updateCurrentMenuItem
.checkIfDownPressed
	bit B_PAD_DOWN, b
	jr z, .checkOtherKeys
; Down pressed
	ld a, [wMaxMenuItem]
	ld c, a
	ld a, [wCurrentMenuItem]
	cp c
	jr c, .notAtBottom
; already at bottom
	ld a, [wMenuWrappingEnabled]
	dec a ; is wrapping around enabled?
	jr nz, .noWrappingAround
	jr .updateCurrentMenuItem ; a = 0, wrap from bottom to top
.notAtBottom
	inc a
.updateCurrentMenuItem
	ld [wCurrentMenuItem], a
	push bc
	call PrintBagInfoText ; marcelnote - for bag pockets and TM printing
	pop bc
.checkOtherKeys
	ld a, [wMenuWatchedKeys]
	and b ; does the menu care about any of the pressed keys?
	jr z, .loop1
.checkIfAButtonOrBButtonPressed
	ld a, b
	and PAD_A | PAD_B
	jr z, .skipPlayingSound
; A or B pressed
	push hl
	ld hl, wMiscFlags
	bit BIT_NO_MENU_BUTTON_SOUND, [hl]
	pop hl
	jr nz, .skipPlayingSound
	ld a, SFX_PRESS_AB
	call PlaySound
.skipPlayingSound
	pop af
	ldh [hDownArrowBlinkCount2], a
	pop af
	ldh [hDownArrowBlinkCount1], a ; restore previous values
	xor a
	ld [wMenuWrappingEnabled], a ; disable menu wrapping
	ld a, b
	ret
.noWrappingAround
	ld a, [wMenuWatchMovingOutOfBounds]
	and a ; should we return if the user tried to go past the top or bottom?
	jr z, .checkOtherKeys
	jr .checkIfAButtonOrBButtonPressed

PlaceMenuCursor:: ; marcelnote - small optim
	ld b, 0
	ld hl, wTopMenuItemY
	ld a, [hli] ; wTopMenuItemY
	ld c, [hl]  ; wTopMenuItemX
	hlcoord 0, 0
	add hl, bc ; hl = top-row position at X
	and a ; is the y coordinate 0?
	jr z, .gotTopMenuPosition
	ld c, SCREEN_WIDTH
.topMenuItemLoop
	add hl, bc
	dec a
	jr nz, .topMenuItemLoop
.gotTopMenuPosition
	push hl ; save hl = position of top menu item
	ldh a, [hUILayoutFlags]
	bit BIT_SINGLE_SPACED_MENU, a
	ld c, SCREEN_WIDTH * 2
	jr z, .gotLineSpace
	srl c ; c = SCREEN_WIDTH
.gotLineSpace
	ld a, [wLastMenuItem]
	and a ; was the previous menu id 0?
	jr z, .checkForArrow1
.lastMenuItemLoop
	add hl, bc
	dec a
	jr nz, .lastMenuItemLoop
.checkForArrow1
	ld a, [hl]
	cp '▶' ; was an arrow next to the previously selected menu item?
	jr nz, .skipClearingArrow
	; clear arrow
	ld a, [wTileBehindCursor]
	ld [hl], a
.skipClearingArrow
	pop hl  ; restore hl = position of top menu item
	ld a, [wCurrentMenuItem]
	ld [wLastMenuItem], a
	and a
	jr z, .checkForArrow2
.currentMenuItemLoop
	add hl, bc
	dec a
	jr nz, .currentMenuItemLoop
.checkForArrow2
	ld a, [hl]
	cp '▶' ; has the right arrow already been placed?
	jr z, .skipSavingTile ; if so, don't lose the saved tile
	ld [wTileBehindCursor], a ; save tile before overwriting with right arrow
.skipSavingTile
	ld [hl], '▶' ; place right arrow
	ld a, l
	ld [wMenuCursorLocation], a
	ld a, h
	ld [wMenuCursorLocation + 1], a
	ret

; This is used to mark a menu cursor other than the one currently being
; manipulated. In the case of submenus, this is used to show the location of
; the menu cursor in the parent menu. In the case of swapping items in list,
; this is used to mark the item that was first chosen to be swapped.
PlaceUnfilledArrowMenuCursor::
; Output: b = original a, hl = cursor address.
	ld b, a
	ld hl, wMenuCursorLocation
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld [hl], '▷'
	ret

; Replaces the menu cursor with a blank space.
EraseMenuCursor::
	ld hl, wMenuCursorLocation
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld [hl], ' '
	ret

; This toggles a blinking down arrow at hl on and off after a delay has passed.
; This is often called even when no blinking is occurring.
; The reason is that most functions that call this initialize hDownArrowBlinkCount1 to 0.
; The effect is that if the tile at hl is initialized with a down arrow,
; this function will toggle that down arrow on and off, but if the tile isn't
; initialized with a down arrow, this function does nothing.
; That allows this to be called without worrying about if a down arrow should
; be blinking.
HandleDownArrowBlinkTiming:: ; marcelnote - small optim
	ld a, [hl]
	cp '▼'
	jr nz, .downArrowOff
.downArrowOn
	ldh a, [hDownArrowBlinkCount1]
	dec a
	ldh [hDownArrowBlinkCount1], a
	ret nz
	ldh a, [hDownArrowBlinkCount2]
	dec a
	ldh [hDownArrowBlinkCount2], a
	ret nz
	ld [hl], ' '
	dec a ; a = $ff
	ldh [hDownArrowBlinkCount1], a
	ld a, $06
	ldh [hDownArrowBlinkCount2], a
	ret
.downArrowOff
	ldh a, [hDownArrowBlinkCount1]
	and a
	ret z
	dec a
	ldh [hDownArrowBlinkCount1], a
	ret nz
	dec a
	ldh [hDownArrowBlinkCount1], a
	ldh a, [hDownArrowBlinkCount2]
	dec a
	ldh [hDownArrowBlinkCount2], a
	ret nz
	ld a, $06
	ldh [hDownArrowBlinkCount2], a
	ld [hl], '▼'
	ret

; The following code either enables or disables the automatic drawing of
; text boxes by DisplayTextID. Both functions cause DisplayTextID to wait
; for a button press after displaying text (unless [wEnteringCableClub] is set).

EnableAutoTextBoxDrawing::
	xor a
	jr AutoTextBoxDrawingCommon

DisableAutoTextBoxDrawing::
	ld a, 1 << BIT_NO_AUTO_TEXT_BOX
	; fallthrough

AutoTextBoxDrawingCommon::
	ld [wAutoTextBoxDrawingControl], a
	xor a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a ; make DisplayTextID wait for button press
	ret

PrintText::
; Print text hl at (1, 14).
	push hl
	ld a, MESSAGE_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	call UpdateSprites
	call Delay3
	pop hl
PrintText_NoCreatingTextBox::
	bccoord 1, 14
	jp TextCommandProcessor
