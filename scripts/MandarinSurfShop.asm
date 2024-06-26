; marcelnote - new location
MandarinSurfShop_Script:
	jp EnableAutoTextBoxDrawing

MandarinSurfShop_TextPointers:
	def_text_pointers
	dw_const MandarinSurfShopClerkText,        TEXT_MANDARINSURFSHOP_CLERK
	dw_const MandarinSurfShopBrunetteGirlText, TEXT_MANDARINSURFSHOP_BRUNETTE_GIRL
	dw_const MandarinSurfShopGirlText,         TEXT_MANDARINSURFSHOP_GIRL

MandarinSurfShopClerkText:
	text_far _MandarinSurfShopClerkHowDoYouLikeYourSurfboardText
	text_end

MandarinSurfShopBrunetteGirlText:
	text_far _MandarinSurfShopBrunetteGirlText
	text_end

MandarinSurfShopGirlText:
	text_far _MandarinSurfShopGirlText
	text_end
