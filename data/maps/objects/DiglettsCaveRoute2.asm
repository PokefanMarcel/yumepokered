	object_const_def
	const_export DIGLETTSCAVEROUTE2_FISHING_GURU

DiglettsCaveRoute2_Object: ; marcelnote - changed map size
	db $7d ; border block

	def_warp_events
	warp_event  2,  5, LAST_MAP, 1
	warp_event  3,  5, LAST_MAP, 1
	warp_event  4,  2, DIGLETTS_CAVE, 1

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_FISHING_GURU, STAY, NONE, TEXT_DIGLETTSCAVEROUTE2_FISHING_GURU

	def_warps_to DIGLETTS_CAVE_ROUTE_2
