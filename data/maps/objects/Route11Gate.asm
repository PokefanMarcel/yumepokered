; marcelnote - merged ROUTE_11_GATE_1F and ROUTE_11_GATE_2F
	object_const_def
	const_export ROUTE11GATE1F_GUARD
	const_export ROUTE11GATE2F_YOUNGSTER
	const_export ROUTE11GATE2F_OAKS_AIDE

Route11Gate_Object:
	db $a ; border block

	def_warp_events
	warp_event  0,  4, LAST_MAP, 1
	warp_event  0,  5, LAST_MAP, 2
	warp_event  7,  4, LAST_MAP, 3
	warp_event  7,  5, LAST_MAP, 4
	warp_event  6,  8, ROUTE_11_GATE, 6
	warp_event  7, 21, ROUTE_11_GATE, 5

	def_bg_events
	bg_event  1, 16, TEXT_ROUTE11GATE2F_LEFT_BINOCULARS
	bg_event  6, 16, TEXT_ROUTE11GATE2F_RIGHT_BINOCULARS

	def_object_events
	object_event  4,  1, SPRITE_GUARD, STAY, NONE, TEXT_ROUTE11GATE1F_GUARD
	object_event  4, 16, SPRITE_YOUNGSTER, WALK, LEFT_RIGHT, TEXT_ROUTE11GATE2F_YOUNGSTER
	object_event  2, 20, SPRITE_SCIENTIST, STAY, NONE, TEXT_ROUTE11GATE2F_OAKS_AIDE

	def_warps_to ROUTE_11_GATE
