; marcelnote - moved trainer card stuff here
StartMenu_TrainerInfo::
	call GBPalWhiteOut
	call ClearScreen
	call UpdateSprites
	ldh a, [hTileAnimations]
	push af
	xor a
	ldh [hTileAnimations], a
	call DrawTrainerInfo
	predef DrawBadges ; draw badges
	ld b, SET_PAL_TRAINER_CARD
	call RunPaletteCommand
	call GBPalNormal
	call WaitForTextScrollButtonPress ; wait for button press
	call GBPalWhiteOut
	call ClearScreen ; marcelnote - clear screen for smoother transition
;	call LoadFontTilePatterns ; marcelnote - moved badge numbers out of font tiles
	call LoadScreenTilesFromBuffer2 ; restore saved screen
	call RunDefaultPaletteCommand
	call ReloadMapData
	call LoadGBPal
	pop af
	ldh [hTileAnimations], a
	jp RedisplayStartMenu

; loads tile patterns and draws everything except for gym leader faces / badges
DrawTrainerInfo: ; marcelnote - modified
	call DisableLCD
	; load trainer info text box tile patterns
	ld hl, TrainerInfoTextBoxTileGraphics
	ld de, vChars2 tile $75
	ld bc, 10 tiles
	call TrainerInfo_FarCopyData
	; load badge numbers and leader names tiles ; marcelnote - restored
	ld hl, LeaderNumbersNamesGraphics
	ld de, vChars2 tile $51
	ld bc, $1d tiles
	ASSERT BANK(LeaderNumbersNamesGraphics) == BANK(TrainerInfoTextBoxTileGraphics)
	call TrainerInfo_FarCopyData

	; gym leader face and badge tile patterns ; marcelnote - only load relevant one
	ld a, [wObtainedBadges]
	ld c, a
	ld b, NUM_BADGES
	ld de, vChars2 tile $31
	ld hl, GymLeaderFaceAndBadgeTileGraphics
.loadFaceOrBadge
	rrc c   ; player has badge?
	push bc ; save b = badge counter and c = obtained badges
	ld bc, 4 tiles
	ld a, BANK(GymLeaderFaceAndBadgeTileGraphics)
	jr nc, .loadFace
	; load badge
	add hl, bc
	call FarCopyData2
	jr .continue
.loadFace
	call FarCopyData2
	ld bc, 4 tiles
	add hl, bc
.continue
	pop bc  ; restore b = badge counter and c = obtained badges
	dec b
	jr nz, .loadFaceOrBadge

	call EnableLCD
	; draw player pic
	ld a, [wStatusFlags4] ; marcelnote - add female player
	bit BIT_IS_GIRL, a
	lb bc, BANK(RedPicFront), $01
	ASSERT BANK(GreenPicFront) == BANK(RedPicFront)
	ld de, RedPicFront
	jr z, .gotPicFront
	ld de, GreenPicFront
.gotPicFront
	predef DisplayPicCenteredOrUpperRight
	; draw trainer info box
	ld hl, wTrainerInfoTextBoxWidthPlus1
	ld a, 18 + 1
	ld [hli], a
	dec a
	ld [hli], a
	ld [hl], 1
	hlcoord 0, 0
	call TrainerInfo_DrawTextBox
	; draw badges box
	ld hl, wTrainerInfoTextBoxWidthPlus1
	ld a, 16 + 1
	ld [hli], a
	dec a
	ld [hli], a
	ld [hl], 3
	hlcoord 1, 10
	call TrainerInfo_DrawTextBox
	; draw left side of badges box
	hlcoord 0, 10
	ld a, $7e ; background tile
	call TrainerInfo_DrawVerticalLine
	; draw right side of badges box
	hlcoord 19, 10
	call TrainerInfo_DrawVerticalLine
	; Badges text
	hlcoord 6, 9
	ld de, TrainerInfo_BadgesText
	call PlaceString
	; "Name" "Money" and "Time"
	hlcoord 2, 2
	ld de, TrainerInfo_NameMoneyTimeText
	call PlaceString
	; Player name
	hlcoord 7, 2
	ld de, wPlayerName
	call PlaceString
	; Money
	hlcoord 8, 4
	ld de, wPlayerMoney
	ld c, 3 | LEADING_ZEROES | LEFT_ALIGN | MONEY_SIGN
	call PrintBCDNumber
	; Play time
	hlcoord 9, 6
	ld de, wPlayTimeHours ; hours
	lb bc, LEFT_ALIGN | 1, 3
	call PrintNumber
	ld [hl], "<COLON>" ; colon with tinier dots than ":"
	inc hl
	ld de, wPlayTimeMinutes ; minutes
	lb bc, LEADING_ZEROES | 1, 2
	jp PrintNumber

TrainerInfo_FarCopyData:
	ld a, BANK(TrainerInfoTextBoxTileGraphics)
	jp FarCopyData2

TrainerInfo_NameMoneyTimeText:
	db   "NAME/"
	next "MONEY/"
	next "TIME/@"

; $75 is a circle tile
TrainerInfo_BadgesText:
	db $75,"BADGES",$75,"@"

; draws a text box on the trainer info screen
; height is always 6
; INPUT:
; hl = destination address
; [wTrainerInfoTextBoxWidthPlus1] = width
; [wTrainerInfoTextBoxWidth] = width - 1
; [wTrainerInfoTextBoxNextRowOffset] = distance from the end of a text box row to the start of the next
TrainerInfo_DrawTextBox:
	ld a, $78 ; upper left corner tile ID
	lb de, $79, $7a ; top edge and upper right corner tile ID's
	call TrainerInfo_DrawHorizontalEdge ; draw top edge
	call TrainerInfo_NextTextBoxRow
	ld a, [wTrainerInfoTextBoxWidthPlus1]
	ld e, a
	ld d, 0
	ld c, 6 ; height of the text box
.loop
	ld [hl], $7b ; left edge tile ID
	add hl, de
	ld [hl], $77 ; right edge tile ID
	call TrainerInfo_NextTextBoxRow
	dec c
	jr nz, .loop
	ld a, $7c ; lower left corner tile ID
	lb de, $76, $7d ; bottom edge and lower right corner tile ID's

TrainerInfo_DrawHorizontalEdge:
	ld [hli], a ; place left corner tile
	ld a, [wTrainerInfoTextBoxWidth]
	ld c, a
	ld a, d
.loop
	ld [hli], a ; place edge tile
	dec c
	jr nz, .loop
	ld a, e
	ld [hl], a ; place right corner tile
	ret

TrainerInfo_NextTextBoxRow:
	ld a, [wTrainerInfoTextBoxNextRowOffset] ; distance to the start of the next row
.loop
	inc hl
	dec a
	jr nz, .loop
	ret

; draws a vertical line
; INPUT:
; hl = address of top tile in the line
; a = tile ID
TrainerInfo_DrawVerticalLine:
	ld de, SCREEN_WIDTH
	ld c, 8
.loop
	ld [hl], a
	add hl, de
	dec c
	jr nz, .loop
	ret
