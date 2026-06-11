	object_const_def
	const_export ROUTE2GATE_OAKS_AIDE
	const_export ROUTE2GATE_YOUNGSTER

Route2Gate_Object:
	db $0 ; border block

	def_warp_events
	warp_event  4,  0, ANY_DIR,   LAST_MAP, 4 ; unreachable
	warp_event  5,  0, ANY_DIR,   LAST_MAP, 4
	warp_event  4,  7, WARP_DOWN, LAST_MAP, 5
	warp_event  5,  7, WARP_DOWN, LAST_MAP, 5

	def_bg_events

	def_object_events
	object_event  1,  4, SPRITE_SCIENTIST, STAY, LEFT, TEXT_ROUTE2GATE_OAKS_AIDE
	object_event  5,  4, SPRITE_YOUNGSTER, WALK, LEFT_RIGHT, TEXT_ROUTE2GATE_YOUNGSTER

	def_warps_to ROUTE_2_GATE
