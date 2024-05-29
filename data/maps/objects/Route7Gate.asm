	object_const_def
	const_export ROUTE7GATE_COOK ; marcelnote - added 2nd floor
	const_export ROUTE7GATE_GIRL ; marcelnote - added 2nd floor
	const_export ROUTE7GATE_GUARD

Route7Gate_Object:
	db $a ; border block

	def_warp_events
	warp_event  0,  3, LAST_MAP, 4
	warp_event  0,  4, LAST_MAP, 4
	warp_event  5,  3, LAST_MAP, 1
	warp_event  5,  4, LAST_MAP, 2
	warp_event  4,  6, ROUTE_7_GATE, 6 ; marcelnote - added 2nd floor
	warp_event  5, 19, ROUTE_7_GATE, 5 ; marcelnote - added 2nd floor

	def_bg_events

	def_object_events
	object_event  0, 16, SPRITE_COOK, STAY, RIGHT, TEXT_ROUTE7GATE_COOK ; marcelnote - added 2nd floor
	object_event  2, 17, SPRITE_GIRL, STAY, LEFT, TEXT_ROUTE7GATE_GIRL ; marcelnote - added 2nd floor
	object_event  3,  1, SPRITE_GUARD, STAY, DOWN, TEXT_ROUTE7GATE_GUARD

	def_warps_to ROUTE_7_GATE
