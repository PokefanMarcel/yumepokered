; marcelnote - new location
	object_const_def

Route28_Object:
	db $2c ; border block

	def_warp_events
	;warp_event 12,  9, DIGLETTS_CAVE_ROUTE_2, 1

	def_bg_events
	bg_event 69,  5, TEXT_ROUTE28_SIGN

	def_object_events
	;object_event 13, 54, SPRITE_POKE_BALL, STAY, NONE, TEXT_ROUTE2_MOON_STONE, MOON_STONE

	def_warps_to ROUTE_28
