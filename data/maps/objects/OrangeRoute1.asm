; marcelnote - new location
	object_const_def

OrangeRoute1_Object:
	db $43 ; border block

	def_warp_events
	warp_event  8,  5, DR_SEBASTIANS_LAB, 1

	def_bg_events
	;bg_event  5,  5, TEXT_ORANGEROUTE1_SIGN_LAB

	def_object_events
	;object_event 13, 54, SPRITE_POKE_BALL, STAY, NONE, TEXT_ROUTE2_MOON_STONE, MOON_STONE

	def_warps_to ORANGE_ROUTE_1
