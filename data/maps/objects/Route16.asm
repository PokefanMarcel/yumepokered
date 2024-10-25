	object_const_def
	const_export ROUTE16_BIKER1
	const_export ROUTE16_BIKER2
	const_export ROUTE16_BIKER3
	const_export ROUTE16_BIKER4
	const_export ROUTE16_BIKER5
	const_export ROUTE16_BIKER6
	const_export ROUTE16_SNORLAX

Route16_Object: ; marcelnote - all objects were shifted to expand the map
	db $43 ; border block ; marcelnote - was $0f, changed to solve visual bug

	def_warp_events
	warp_event 21, 12, ROUTE_16_GATE, 1 ; marcelnote - merged ROUTE_16_GATE floors
	warp_event 21, 13, ROUTE_16_GATE, 2
	warp_event 28, 12, ROUTE_16_GATE, 3
	warp_event 28, 13, ROUTE_16_GATE, 4
	warp_event 21,  6, ROUTE_16_GATE, 5
	warp_event 21,  7, ROUTE_16_GATE, 6
	warp_event 28,  6, ROUTE_16_GATE, 7
	warp_event 28,  7, ROUTE_16_GATE, 8
	warp_event 11,  7, ROUTE_16_FLY_HOUSE, 1

	def_bg_events
	bg_event 31, 13, TEXT_ROUTE16_CYCLING_ROAD_SIGN
	bg_event  9, 19, TEXT_ROUTE16_SIGN

	def_object_events
	object_event 21, 14, SPRITE_BIKER, STAY, LEFT, TEXT_ROUTE16_BIKER1, OPP_BIKER, 5
	object_event 18, 15, SPRITE_BIKER, STAY, RIGHT, TEXT_ROUTE16_BIKER2, OPP_CUE_BALL, 1
	object_event 15, 14, SPRITE_BIKER, STAY, UP, TEXT_ROUTE16_BIKER3, OPP_CUE_BALL, 2
	object_event 13, 13, SPRITE_BIKER, STAY, LEFT, TEXT_ROUTE16_BIKER4, OPP_BIKER, 6
	object_event 10, 12, SPRITE_BIKER, STAY, RIGHT, TEXT_ROUTE16_BIKER5, OPP_CUE_BALL, 3
	object_event  7, 14, SPRITE_BIKER, STAY, RIGHT, TEXT_ROUTE16_BIKER6, OPP_BIKER, 7
	object_event 30, 12, SPRITE_SNORLAX, STAY, DOWN, TEXT_ROUTE16_SNORLAX

	def_warps_to ROUTE_16
