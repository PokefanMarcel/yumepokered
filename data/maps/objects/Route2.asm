	object_const_def
	const_export ROUTE2_MOON_STONE
	const_export ROUTE2_HP_UP

Route2_Object:
	db $f ; border block

	def_warp_events
	warp_event 14,  9, DIGLETTS_CAVE_ROUTE_2, 1
	warp_event  5, 11, VIRIDIAN_FOREST_NORTH_GATE, 2
	warp_event 17, 19, ROUTE_2_TRADE_HOUSE, 1
	warp_event 18, 35, ROUTE_2_GATE, 2
	warp_event 18, 39, ROUTE_2_GATE, 3
	warp_event  5, 43, VIRIDIAN_FOREST_SOUTH_GATE, 3
	warp_event 19, 35, ROUTE_2_GATE, 2 ; marcelnote - second warp above Route2Gate

	def_bg_events
	bg_event  5, 67, TEXT_ROUTE2_SIGN
	bg_event 13, 11, TEXT_ROUTE2_DIGLETTS_CAVE_SIGN

	def_object_events
	object_event 15, 54, SPRITE_POKE_BALL, STAY, NONE, TEXT_ROUTE2_MOON_STONE, MOON_STONE
	object_event 15, 45, SPRITE_POKE_BALL, STAY, NONE, TEXT_ROUTE2_HP_UP, HP_UP

	def_warps_to ROUTE_2

	; unused
;	warp_to  4,  7, 4
;	db $12, $c7, $9, $7
;	warp_to  4,  7, 4
;	warp_to  4,  7, 4
;	warp_to  4,  7, 4
