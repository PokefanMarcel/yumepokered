; marcelnote - new location
	object_const_def
	;const_export MTMOON1F_HIKER

MtSilver1F_Object:
	db $3 ; border block

	def_warp_events
	warp_event 10, 35, ROUTE_28, 1
	warp_event 11, 35, ROUTE_28, 1

	def_bg_events
	;bg_event 15, 23, TEXT_MTMOON1F_BEWARE_ZUBAT_SIGN

	def_object_events
	;object_event  2, 20, SPRITE_POKE_BALL, STAY, NONE, TEXT_MTMOON1F_POTION1, POTION

	def_warps_to MT_SILVER_1F
