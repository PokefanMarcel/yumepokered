UndergroundPathNorthSouth_Object:
	db $0 ; border block

	def_warp_events
	warp_event  6,  1, ANY_DIR, UNDERGROUND_PATH_ROUTE_5, 3
	warp_event  2, 37, ANY_DIR, UNDERGROUND_PATH_ROUTE_6, 3

	def_bg_events

	def_object_events

	def_warps_to UNDERGROUND_PATH_NORTH_SOUTH
