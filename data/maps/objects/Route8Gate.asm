	object_const_def
	const_export ROUTE8GATE_MIDDLE_AGED_WOMAN ; marcelnote - added 2nd floor
	const_export ROUTE8GATE_BALDING_GUY       ; marcelnote - added 2nd floor
	const_export ROUTE8GATE_LITTLE_GIRL       ; marcelnote - added 2nd floor
	const_export ROUTE8GATE_GUARD

Route8Gate_Object:
	db $a ; border block

	def_warp_events
	warp_event  0,  3, WARP_LEFT,  LAST_MAP, 1
	warp_event  0,  4, WARP_LEFT,  LAST_MAP, 2
	warp_event  5,  3, WARP_RIGHT, LAST_MAP, 3
	warp_event  5,  4, WARP_RIGHT, LAST_MAP, 4
	warp_event  4,  6, ANY_DIR,    ROUTE_8_GATE, 6
	warp_event  5, 19, ANY_DIR,    ROUTE_8_GATE, 5

	def_bg_events

	def_object_events
	object_event  4, 16, SPRITE_MIDDLE_AGED_WOMAN, STAY, LEFT, TEXT_ROUTE8GATE_MIDDLE_AGED_WOMAN ; marcelnote - added 2nd floor
	object_event  0, 15, SPRITE_BALDING_GUY, STAY, DOWN, TEXT_ROUTE8GATE_BALDING_GUY             ; marcelnote - added 2nd floor
	object_event  0, 18, SPRITE_LITTLE_GIRL, STAY, UP, TEXT_ROUTE8GATE_LITTLE_GIRL               ; marcelnote - added 2nd floor
	object_event  2,  1, SPRITE_GUARD, STAY, DOWN, TEXT_ROUTE8GATE_GUARD

	def_warps_to ROUTE_8_GATE
