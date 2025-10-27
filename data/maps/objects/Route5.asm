Route5_Object:
	db $a ; border block

	def_warp_events
	warp_event 14, 29, ROUTE_5_GATE, 4
	warp_event 13, 29, ROUTE_5_GATE, 3
	warp_event 14, 33, ROUTE_5_GATE, 1
	warp_event 21, 27, UNDERGROUND_PATH_ROUTE_5, 1
	warp_event 14, 21, DAYCARE, 1

	def_bg_events
	bg_event 21, 29, TEXT_ROUTE5_UNDERGROUND_PATH_SIGN

	def_object_events

	def_warps_to ROUTE_5
