	object_const_def
	const_export ROUTE6GATE_MIDDLE_AGED_WOMAN ; marcelnote - added 2nd floor
	const_export ROUTE6GATE_YOUNGSTER         ; marcelnote - added 2nd floor
	const_export ROUTE6GATE_GUARD

Route6Gate_Object:
	db $a ; border block

	def_warp_events
	warp_event  3,  5, WARP_DOWN, LAST_MAP, 3
	warp_event  4,  5, WARP_DOWN, LAST_MAP, 3
	warp_event  3,  0, ANY_DIR,   LAST_MAP, 2
	warp_event  4,  0, ANY_DIR,   LAST_MAP, 2
	warp_event  6,  4, ANY_DIR,   ROUTE_6_GATE, 6 ; marcelnote - added 2nd floor
	warp_event 19,  5, ANY_DIR,   ROUTE_6_GATE, 5 ; marcelnote - added 2nd floor

	def_bg_events

	def_object_events
	object_event 12,  2, SPRITE_SCIENTIST, STAY, RIGHT, TEXT_ROUTE6GATE_OAKS_AIDE                ; marcelnote - new for PokéBeeper
	object_event 18,  2, SPRITE_MIDDLE_AGED_WOMAN, STAY, LEFT, TEXT_ROUTE6GATE_MIDDLE_AGED_WOMAN ; marcelnote - added 2nd floor
	object_event 14,  3, SPRITE_YOUNGSTER, WALK, UP_DOWN, TEXT_ROUTE6GATE_YOUNGSTER              ; marcelnote - added 2nd floor
	object_event  6,  2, SPRITE_GUARD, STAY, LEFT, TEXT_ROUTE6GATE_GUARD

	def_warps_to ROUTE_6_GATE
