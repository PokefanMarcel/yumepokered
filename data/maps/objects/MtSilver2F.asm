; marcelnote - new location
	object_const_def
	;const_export MTMOON1F_HIKER

MtSilver2F_Object:
	db $3 ; border block

	def_warp_events
	warp_event 17, 29, MT_SILVER_1F, 3
	warp_event 11,  4, MT_SILVER_3F, 1

	def_bg_events
	;bg_event 15, 23, TEXT_MTMOON1F_BEWARE_ZUBAT_SIGN

	def_object_events
	;object_event  2, 20, SPRITE_POKE_BALL, STAY, NONE, TEXT_MTMOON1F_POTION1, POTION

	def_warps_to MT_SILVER_2F
