; marcelnote - merged ROUTE_18_GATE_1F and ROUTE_18_GATE_2F
	object_const_def
	const_export ROUTE18GATE1F_GUARD
	const_export ROUTE18GATE2F_YOUNGSTER ; marcelnote - merged 2nd floor

Route18Gate_Object:
	db $a ; border block

	def_warp_events
	warp_event  0,  4, LAST_MAP, 1
	warp_event  0,  5, LAST_MAP, 2
	warp_event  7,  4, LAST_MAP, 3
	warp_event  7,  5, LAST_MAP, 4
	warp_event  6,  8, ROUTE_18_GATE, 6 ; marcelnote - merged 2nd floor
	warp_event  7, 21, ROUTE_18_GATE, 5 ; marcelnote - merged 2nd floor

	def_bg_events
	bg_event  1, 16, TEXT_ROUTE18GATE2F_LEFT_BINOCULARS  ; marcelnote - merged 2nd floor
	bg_event  6, 16, TEXT_ROUTE18GATE2F_RIGHT_BINOCULARS ; marcelnote - merged 2nd floor

	def_object_events
	object_event  4,  1, SPRITE_GUARD, STAY, DOWN, TEXT_ROUTE18GATE1F_GUARD
	object_event  4, 16, SPRITE_YOUNGSTER, WALK, LEFT_RIGHT, TEXT_ROUTE18GATE2F_YOUNGSTER ; marcelnote - merged 2nd floor

	def_warps_to ROUTE_18_GATE
