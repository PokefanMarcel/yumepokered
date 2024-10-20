; marcelnote - new location
MandarinSurfShop_Script:
	jp EnableAutoTextBoxDrawing

MandarinSurfShop_TextPointers:
	def_text_pointers
	dw_const MandarinSurfShopClerkText,        TEXT_MANDARINSURFSHOP_CLERK
	dw_const MandarinSurfShopBrunetteGirlText, TEXT_MANDARINSURFSHOP_BRUNETTE_GIRL
	dw_const MandarinSurfShopGirlText,         TEXT_MANDARINSURFSHOP_GIRL

MandarinSurfShopClerkText:
	text_asm
	ld hl, MandarinSurfShopClerkWelcomeText
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
	ld de, MandarinSurfShopMenuText
	call PlaceString
	hlcoord 8, 3
	ld de, MandarinSurfShopMenuPrice
	call PlaceString
	ld hl, MandarinSurfShopClerkDoYouWantItText
	call PrintText
	ld hl, wStatusFlags5 ; marcelnote - moved code from below
	res BIT_NO_TEXT_DELAY, [hl]
	call HandleMenuInput
	bit BIT_B_BUTTON, a
	jr nz, .cancel
	;ld hl, wStatusFlags5 ; marcelnote - moved above to fix instant text bug
	;res BIT_NO_TEXT_DELAY, [hl]
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .cancel
	ld hl, MandarinSurfShopCantAffordText
	call PrintText
.cancel
	ld hl, MandarinSurfShopComeAgainText
	call PrintText
.Done
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

MandarinSurfShopMenuText:
	db   "SURFBOARD"
	next "CANCEL@"

MandarinSurfShopMenuPrice:
	db "¥2000000@"

MandarinSurfShopClerkWelcomeText:
	text_far _MandarinSurfShopClerkWelcomeText
	text_end

MandarinSurfShopClerkDoYouWantItText:
	text_far _MandarinSurfShopClerkDoYouWantItText
	text_end

MandarinSurfShopCantAffordText:
	text_far _MandarinSurfShopCantAffordText
	text_end

MandarinSurfShopClerkOhThatsAVoucherText:
	text_far _MandarinSurfShopClerkOhThatsAVoucherText
	text_end

MandarinSurfShopExchangedVoucherText:
	text_far _MandarinSurfShopExchangedVoucherText
	sound_get_key_item
	text_end

MandarinSurfShopComeAgainText:
	text_far _MandarinSurfShopComeAgainText
	text_end

MandarinSurfShopClerkHowDoYouLikeYourBicycleText:
	text_far _MandarinSurfShopClerkHowDoYouLikeYourSurfboardText
	text_end

MandarinSurfShopBagFullText:
	text_far _MandarinSurfShopBagFullText
	text_end

MandarinSurfShopBrunetteGirlText:
	text_far _MandarinSurfShopBrunetteGirlText
	text_end

MandarinSurfShopGirlText:
	text_far _MandarinSurfShopGirlText
	text_end
