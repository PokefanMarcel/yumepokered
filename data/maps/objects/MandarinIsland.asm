; marcelnote - new location
	object_const_def
	;const_export MANDARINISLAND_GIRL

MandarinIsland_Object:
	db $43 ; border block

	def_warp_events
	warp_event 21,  5, MANDARIN_POKECENTER_MART, 1
	warp_event  5, 11, MANDARIN_POKECENTER_MART, 3
	warp_event 21, 11, MANDARIN_SURF_SHOP, 1
	warp_event 15, 13, MANDARIN_HOTEL, 1
	warp_event  9,  5, MANDARIN_SILPH_CO, 1
	warp_event 14,  5, MANDARIN_SILPH_FACTORY, 1

	def_bg_events
	bg_event 19, 17, TEXT_MANDARINISLAND_SIGN
	bg_event  6, 11, TEXT_MANDARINISLAND_MART_SIGN
	bg_event 22,  5, TEXT_MANDARINISLAND_POKECENTER_SIGN
	bg_event 21, 13, TEXT_MANDARINISLAND_SURFSHOP_SIGN
	bg_event  7,  5, TEXT_MANDARINISLAND_SILPH_CO_SIGN
	bg_event 13, 13, TEXT_MANDARINISLAND_HOTEL_SIGN

	def_object_events
	;object_event 20,  5, SPRITE_GIRL, WALK, LEFT_RIGHT, TEXT_MANDARINISLAND_GIRL

	def_warps_to MANDARIN_ISLAND
