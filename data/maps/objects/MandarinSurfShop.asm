; marcelnote - new location
	object_const_def
	const_export MANDARINSURFSHOP_CLERK
	const_export MANDARINSURFSHOP_BRUNETTE_GIRL
	const_export MANDARINSURFSHOP_GIRL

MandarinSurfShop_Object:
	db $e ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 3
	warp_event  3,  7, LAST_MAP, 3

	def_bg_events

	def_object_events
	object_event  6,  2, SPRITE_BIKE_SHOP_CLERK, STAY, NONE, TEXT_MANDARINSURFSHOP_CLERK
	object_event  5,  4, SPRITE_BRUNETTE_GIRL, WALK, UP_DOWN, TEXT_MANDARINSURFSHOP_BRUNETTE_GIRL
	object_event  2,  2, SPRITE_GIRL, STAY, UP, TEXT_MANDARINSURFSHOP_GIRL

	def_warps_to MANDARIN_SURF_SHOP
