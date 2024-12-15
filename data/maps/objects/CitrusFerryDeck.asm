; marcelnote - new location
	object_const_def
	const_export CITRUSFERRYDECK_SAILOR1
	const_export CITRUSFERRYDECK_SAILOR2

CitrusFerryDeck_Object:
	db $c ; border block

	def_warp_events
	warp_event 12,  0, LAST_MAP, 2
	warp_event 13,  0, LAST_MAP, 2
	warp_event  0,  5, CITRUS_FERRY_OUTSIDE, 1
	warp_event 23,  5, CITRUS_FERRY_OUTSIDE, 2
	warp_event  5,  6, CITRUS_FERRY_ROOMS, 1 ; Captain's room
	warp_event  5,  3, CITRUS_FERRY_ROOMS, 2 ; top rooms
	warp_event  9,  3, CITRUS_FERRY_ROOMS, 4
	warp_event 17,  3, CITRUS_FERRY_ROOMS, 6
	warp_event  9,  6, CITRUS_FERRY_ROOMS, 8 ; bottom rooms
	warp_event 13,  6, CITRUS_FERRY_ROOMS, 9
	warp_event 17,  6, CITRUS_FERRY_ROOMS, 10

	def_bg_events
	bg_event 21,  4, TEXT_CITRUSFERRYDECK_VENDING_MACHINE

	def_object_events
	object_event 13,  1, SPRITE_SAILOR, STAY, DOWN, TEXT_CITRUSFERRYDECK_SAILOR1
	object_event  7,  4, SPRITE_SAILOR, WALK, LEFT_RIGHT, TEXT_CITRUSFERRYDECK_SAILOR2

	def_warps_to CITRUS_FERRY_DECK
