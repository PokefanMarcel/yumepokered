; marcelnote - new location
	object_const_def
	;const_export MTMOON1F_HIKER

MtSilver3F_Object:
	db $66 ; border block

	def_warp_events
	warp_event  8, 30, MT_SILVER_2F, 2

	def_bg_events
	;bg_event 15, 23, TEXT_MTMOON1F_BEWARE_ZUBAT_SIGN

	def_object_events
	object_event  9,  5, SPRITE_YELLOW, STAY, UP, TEXT_MTSILVER3F_YELLOW, OPP_YELLOW, 1

	def_warps_to MT_SILVER_3F
