BikeShop_Script:
	jp EnableAutoTextBoxDrawing

BikeShop_TextPointers:
	def_text_pointers
	dw_const BikeShopClerkText,             TEXT_BIKESHOP_CLERK
	dw_const BikeShopMiddleAgedWomanText,   TEXT_BIKESHOP_MIDDLE_AGED_WOMAN
	dw_const BikeShopYoungsterText,         TEXT_BIKESHOP_YOUNGSTER

BikeShopClerkText: ; marcelnote - optimized
	text_asm
	CheckEvent EVENT_GOT_BICYCLE
	ld hl, BikeShopClerkHowDoYouLikeYourBicycleText
	jr nz, .print_text
; don't have bike
	ld b, BIKE_VOUCHER
	call IsItemInBag
	jr z, .dontHaveVoucher
	ld hl, BikeShopClerkOhThatsAVoucherText
	call PrintText
	lb bc, BICYCLE, 1
	call GiveItem
	ld hl, BikeShopBagFullText
	jr nc, .print_text
	ld a, BIKE_VOUCHER
	ldh [hItemToRemoveID], a
	farcall RemoveItemByID
	SetEvent EVENT_GOT_BICYCLE
	ld hl, BikeShopExchangedVoucherText
.print_text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd
.dontHaveVoucher
	ld hl, BikeShopClerkWelcomeText
	call PrintText
	xor a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ld a, A_BUTTON | B_BUTTON
	ld [wMenuWatchedKeys], a
	ld a, $1
	ld [wMaxMenuItem], a
	ld a, $2
	ld [wTopMenuItemY], a
	ld a, $1
	ld [wTopMenuItemX], a
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl]
	hlcoord 0, 0
	ld b, 4
	ld c, 15
	call TextBoxBorder
	call UpdateSprites
	hlcoord 2, 2
	ld de, BikeShopMenuText
	call PlaceString
	hlcoord 8, 3
	ld de, BikeShopMenuPrice
	call PlaceString
	ld hl, BikeShopClerkDoYouLikeItText
	call PrintText
	ld hl, wStatusFlags5 ; marcelnote - moved code from below
	res BIT_NO_TEXT_DELAY, [hl]
	call HandleMenuInput
	ld hl, BikeShopComeAgainText
	bit BIT_B_BUTTON, a
	jr nz, .print_text
	;ld hl, wStatusFlags5 ; marcelnote - moved above to fix instant text bug
	;res BIT_NO_TEXT_DELAY, [hl]
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .print_text
	ld hl, BikeShopCantAffordText
	jr .print_text

BikeShopMenuText:
	db   "BICYCLE"
	next "CANCEL@"

BikeShopMenuPrice:
	db "¥1000000@"

BikeShopClerkWelcomeText:
	text_far _BikeShopClerkWelcomeText
	text_end

BikeShopClerkDoYouLikeItText:
	text_far _BikeShopClerkDoYouLikeItText
	text_end

BikeShopCantAffordText:
	text_far _BikeShopCantAffordText
	text_end

BikeShopClerkOhThatsAVoucherText:
	text_far _BikeShopClerkOhThatsAVoucherText
	text_end

BikeShopExchangedVoucherText:
	text_far _BikeShopExchangedVoucherText
	sound_get_key_item
	text_end

BikeShopComeAgainText:
	text_far _BikeShopComeAgainText
	text_end

BikeShopClerkHowDoYouLikeYourBicycleText:
	text_far _BikeShopClerkHowDoYouLikeYourBicycleText
	text_end

BikeShopBagFullText:
	text_far _BikeShopBagFullText
	text_end

BikeShopMiddleAgedWomanText:
	text_asm
	ld hl, .Text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.Text:
	text_far _BikeShopMiddleAgedWomanText
	text_end

BikeShopYoungsterText:
	text_asm
	CheckEvent EVENT_GOT_BICYCLE
	ld hl, .CoolBikeText
	jr nz, .gotBike
	ld hl, .TheseBikesAreExpensiveText
.gotBike
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.TheseBikesAreExpensiveText:
	text_far _BikeShopYoungsterTheseBikesAreExpensiveText
	text_end

.CoolBikeText:
	text_far _BikeShopYoungsterCoolBikeText
	text_end
