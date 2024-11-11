; marcelnote - new location
	object_const_def
	const_export MANDARINISLAND_FISHER
	const_export MANDARINISLAND_LITTLE_GIRL
	const_export MANDARINISLAND_ROCKER
	const_export MANDARINISLAND_SWIMMER
	const_export MANDARINISLAND_SWIMMER_F
	const_export MANDARINISLAND_COOLTRAINER_M
	const_export MANDARINISLAND_SILPH_WORKER_F
	const_export MANDARINISLAND_SILPH_GIRL
	const_export MANDARINISLAND_SAILOR_FERRIES

MandarinIsland_Object:
	db $43 ; border block

	def_warp_events
	warp_event 23,  5, MANDARIN_POKECENTER_MART, 1
	warp_event  7, 11, MANDARIN_POKECENTER_MART, 3
	warp_event 23, 11, MANDARIN_SURF_SHOP, 1
	warp_event 17, 13, MANDARIN_HOTEL, 1
	warp_event 11,  5, MANDARIN_SILPH_CO, 1
	warp_event 16,  5, SILPH_FACTORY_2F, 1
	warp_event 26, 27, MANDARIN_DOCK, 1
	warp_event 27, 27, MANDARIN_DOCK, 1

	def_bg_events
	bg_event 21, 17, TEXT_MANDARINISLAND_SIGN
	bg_event  8, 11, TEXT_MANDARINISLAND_MART_SIGN
	bg_event 24,  5, TEXT_MANDARINISLAND_POKECENTER_SIGN
	bg_event 23, 13, TEXT_MANDARINISLAND_SURFSHOP_SIGN
	bg_event  9,  5, TEXT_MANDARINISLAND_SILPH_CO_SIGN
	bg_event 15, 13, TEXT_MANDARINISLAND_HOTEL_SIGN

	def_object_events
	object_event 12, 22, SPRITE_FISHER, STAY, LEFT, TEXT_MANDARINISLAND_FISHER
	object_event  6, 16, SPRITE_LITTLE_GIRL, WALK, LEFT_RIGHT, TEXT_MANDARINISLAND_LITTLE_GIRL
	object_event 25, 14, SPRITE_ROCKER, WALK, LEFT_RIGHT, TEXT_MANDARINISLAND_ROCKER
	object_event  6, 21, SPRITE_SWIMMER, STAY, LEFT, TEXT_MANDARINISLAND_SWIMMER
	object_event  4, 21, SPRITE_SWIMMER_F, STAY, NONE, TEXT_MANDARINISLAND_SWIMMER_F
	object_event 27,  7, SPRITE_COOLTRAINER_M, WALK, LEFT_RIGHT, TEXT_MANDARINISLAND_COOLTRAINER_M
	object_event  9,  7, SPRITE_SILPH_WORKER_F, WALK, LEFT_RIGHT, TEXT_MANDARINISLAND_SILPH_WORKER_F
	object_event  6, 14, SPRITE_GIRL, STAY, NONE, TEXT_MANDARINISLAND_GIRL
	object_event 27, 26, SPRITE_SAILOR, STAY, UP, TEXT_MANDARINISLAND_SAILOR_FERRIES

	def_warps_to MANDARIN_ISLAND
