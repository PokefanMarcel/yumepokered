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
	CheckEvent EVENT_GOT_SURFBOARD
	ld hl, MandarinSurfShopClerkHowDoYouLikeYourSurfboardText
	jr nz, .print_text
; don't have surfboard
	ld b, SURF_VOUCHER
	call IsItemInBag
	jr z, .dontHaveVoucher
	ld hl, MandarinSurfShopClerkOhThatsAVoucherText
	call PrintText
	lb bc, SURFBOARD, 1
	call GiveItem
	ld hl, MandarinSurfShopBagFullText
	jr nc, .print_text
	ld a, SURF_VOUCHER
	ldh [hItemToRemoveID], a
	callfar RemoveItemByID
	SetEvent EVENT_GOT_SURFBOARD
	ld hl, MandarinSurfShopExchangedVoucherText
.print_text
	call PrintText
	rst TextScriptEnd

.dontHaveVoucher
	ld hl, MandarinSurfShopClerkWelcomeText
	call PrintText
	xor a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ld a, PAD_A | PAD_B
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
	ld hl, MandarinSurfShopComeAgainText
	bit B_PAD_B, a
	jr nz, .print_text
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .print_text
	ld hl, MandarinSurfShopCantAffordText
	jr .print_text

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

MandarinSurfShopClerkHowDoYouLikeYourSurfboardText:
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
