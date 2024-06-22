; marcelnote - merged RedsHouse floors
	object_const_def
	const_export REDSHOUSE1F_MOM

RedsHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 1
	warp_event  3,  7, LAST_MAP, 1
	warp_event  7,  1, REDS_HOUSE, 4 ; marcelnote - merged RedsHouse floors
	warp_event 21,  1, REDS_HOUSE, 3 ; marcelnote - merged RedsHouse floors

	def_bg_events
	bg_event  3,  1, TEXT_REDSHOUSE1F_TV

	def_object_events
	object_event  5,  4, SPRITE_MOM, STAY, LEFT, TEXT_REDSHOUSE1F_MOM

	def_warps_to REDS_HOUSE
