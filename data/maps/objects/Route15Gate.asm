; marcelnote - merged ROUTE_15_GATE_1F and ROUTE_15_GATE_2F
	object_const_def
	const_export ROUTE15GATE1F_GUARD
	const_export ROUTE15GATE2F_OAKS_AIDE

Route15Gate_Object:
	db $a ; border block

	def_warp_events
	warp_event  0,  4, LAST_MAP, 1
	warp_event  0,  5, LAST_MAP, 2
	warp_event  7,  4, LAST_MAP, 3
	warp_event  7,  5, LAST_MAP, 4
	warp_event  6,  8, ROUTE_15_GATE, 6
	warp_event  7, 21, ROUTE_15_GATE, 5

	def_bg_events
	; marcelnote - Left binoculars (seeing Articuno) are handled as hidden object
	bg_event  6, 16, TEXT_ROUTE15GATE2F_RIGHT_BINOCULARS

	def_object_events
	object_event  4,  1, SPRITE_GUARD, STAY, NONE, TEXT_ROUTE15GATE1F_GUARD
	object_event  4, 16, SPRITE_SCIENTIST, STAY, DOWN, TEXT_ROUTE15GATE2F_OAKS_AIDE

	def_warps_to ROUTE_15_GATE
