; marcelnote - new location
	object_const_def
	const_export ROUTE28_BOTTLE_CAP

Route28_Object:
	db $2c ; border block

	def_warp_events
	warp_event 16,  1, ANY_DIR, MT_SILVER_1F, 1

	def_bg_events
	bg_event 69,  5, TEXT_ROUTE28_SIGN

	def_object_events
	object_event  7,  7, SPRITE_POKE_BALL, STAY, NONE, TEXT_ROUTE28_BOTTLE_CAP, BOTTLE_CAP

	def_warps_to ROUTE_28
