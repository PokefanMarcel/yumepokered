; marcelnote - merged ROUTE_18_GATE_1F and ROUTE_18_GATE_2F
	object_const_def
	const_export ROUTE18GATE1F_GUARD
	const_export ROUTE18GATE2F_YOUNGSTER ; marcelnote - merged 2nd floor

Route18Gate_Object:
	db $0 ; border block

	def_warp_events
	warp_event  0,  4, WARP_LEFT,  LAST_MAP, 1
	warp_event  0,  5, WARP_LEFT,  LAST_MAP, 2
	warp_event  7,  4, WARP_RIGHT, LAST_MAP, 3
	warp_event  7,  5, WARP_RIGHT, LAST_MAP, 4
	warp_event  6,  8, ANY_DIR,    ROUTE_18_GATE, 6 ; marcelnote - merged 2nd floor
	warp_event  7, 21, ANY_DIR,    ROUTE_18_GATE, 5 ; marcelnote - merged 2nd floor

	def_bg_events
	; marcelnote - binoculars are handled as hidden object

	def_object_events
	object_event  4,  1, SPRITE_GUARD, STAY, DOWN, TEXT_ROUTE18GATE1F_GUARD
	object_event  4, 16, SPRITE_YOUNGSTER, WALK, LEFT_RIGHT, TEXT_ROUTE18GATE2F_YOUNGSTER ; marcelnote - merged 2nd floor

	def_warps_to ROUTE_18_GATE
