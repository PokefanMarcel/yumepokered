	object_const_def
	const_export PALLETTOWN_OAK
	const_export PALLETTOWN_GIRL
	const_export PALLETTOWN_FISHER
	const_export PALLETTOWN_COOLTRAINER_F ; marcelnote - new

PalletTown_Object:
	db $b ; border block

	def_warp_events
	warp_event  5,  5, REDS_YELLOWS_HOUSES, 1 ; marcelnote - merged RedsHouse floors, added YellowsHouse
	warp_event 13,  5, BLUES_AIDES_HOUSES, 1 ; marcelnote - merged Blue's house with new Aide's house
	warp_event 12, 11, OAKS_LAB, 2
	warp_event 23,  5, REDS_YELLOWS_HOUSES, 5 ; marcelnote - new houses
	warp_event 21, 13, BLUES_AIDES_HOUSES, 3 ; marcelnote - new Aide's house

	def_bg_events
	bg_event 13, 13, TEXT_PALLETTOWN_OAKSLAB_SIGN
	bg_event  7,  9, TEXT_PALLETTOWN_SIGN
	bg_event  3,  5, TEXT_PALLETTOWN_PLAYERSHOUSE_SIGN
	bg_event 11,  5, TEXT_PALLETTOWN_RIVALSHOUSE_SIGN
	bg_event 21,  5, TEXT_PALLETTOWN_YELLOWSHOUSE_SIGN

	def_object_events
	object_event  9,  5, SPRITE_OAK, STAY, UP, TEXT_PALLETTOWN_OAK ; marcelnote - changed from x=8, NONE
	object_event  3,  8, SPRITE_GIRL, WALK, ANY_DIR, TEXT_PALLETTOWN_GIRL
	object_event 11, 14, SPRITE_FISHER, WALK, ANY_DIR, TEXT_PALLETTOWN_FISHER
	object_event 23, 11, SPRITE_COOLTRAINER_F, WALK, LEFT_RIGHT, TEXT_PALLETTOWN_COOLTRAINER_F ; marcelnote - new

	def_warps_to PALLET_TOWN
