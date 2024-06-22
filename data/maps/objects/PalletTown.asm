	object_const_def
	const_export PALLETTOWN_OAK
	const_export PALLETTOWN_GIRL
	const_export PALLETTOWN_FISHER

PalletTown_Object:
	db $b ; border block

	def_warp_events
	warp_event  5,  5, REDS_HOUSE, 1 ; marcelnote - merged RedsHouse floors
	warp_event 13,  5, BLUES_HOUSE, 1
	warp_event 12, 11, OAKS_LAB, 2
	warp_event 21,  5, PALLET_HOUSES, 1 ; marcelnote - new houses
	warp_event 21, 13, PALLET_HOUSES, 5 ; marcelnote - new houses

	def_bg_events
	bg_event 13, 13, TEXT_PALLETTOWN_OAKSLAB_SIGN
	bg_event  7,  9, TEXT_PALLETTOWN_SIGN
	bg_event  3,  5, TEXT_PALLETTOWN_PLAYERSHOUSE_SIGN
	bg_event 11,  5, TEXT_PALLETTOWN_RIVALSHOUSE_SIGN

	def_object_events
	object_event  8,  5, SPRITE_OAK, STAY, NONE, TEXT_PALLETTOWN_OAK
	object_event  3,  8, SPRITE_GIRL, WALK, ANY_DIR, TEXT_PALLETTOWN_GIRL
	object_event 11, 14, SPRITE_FISHER, WALK, ANY_DIR, TEXT_PALLETTOWN_FISHER

	def_warps_to PALLET_TOWN
