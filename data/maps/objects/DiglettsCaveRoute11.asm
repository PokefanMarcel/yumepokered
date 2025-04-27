	object_const_def
	const_export DIGLETTSCAVEROUTE11_GAMBLER

DiglettsCaveRoute11_Object: ; marcelnote - changed map size
	db $7d ; border block

	def_warp_events
	warp_event  2,  5, LAST_MAP, 5
	warp_event  3,  5, LAST_MAP, 5
	warp_event  4,  2, DIGLETTS_CAVE, 2

	def_bg_events

	def_object_events
	object_event  2,  1, SPRITE_GAMBLER, STAY, NONE, TEXT_DIGLETTSCAVEROUTE11_GAMBLER

	def_warps_to DIGLETTS_CAVE_ROUTE_11
