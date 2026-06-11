UndergroundPathWestEast_Object:
	db $0 ; border block

	def_warp_events
	warp_event  3,  1, ANY_DIR, UNDERGROUND_PATH_ROUTE_7, 3
	warp_event 46,  1, ANY_DIR, UNDERGROUND_PATH_ROUTE_8, 3

	def_bg_events

	def_object_events

	def_warps_to UNDERGROUND_PATH_WEST_EAST
