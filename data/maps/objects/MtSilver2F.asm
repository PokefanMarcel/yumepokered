; marcelnote - new location
	object_const_def
	const_export MTSILVER2F_PP_UP
	const_export MTSILVER2F_CALCIUM
	const_export MTSILVER2F_ULTRA_BALL
	const_export MTSILVER2F_MAX_REVIVE
	const_export MTSILVER2F_FULL_RESTORE

MtSilver2F_Object:
	db $3 ; border block

	def_warp_events
	warp_event 17, 29, MT_SILVER_1F, 3
	warp_event 11,  4, MT_SILVER_3F, 1
	warp_event 13, 20, MT_SILVER_2F, 5
	warp_event 23,  2, MT_SILVER_2F, 6
	warp_event  9, 39, MT_SILVER_2F, 3
	warp_event 21, 43, MT_SILVER_2F, 4

	def_bg_events
	;bg_event 15, 23, TEXT_MTMOON1F_BEWARE_ZUBAT_SIGN

	def_object_events
	object_event  4, 18, SPRITE_POKE_BALL, STAY, NONE, TEXT_MTSILVER2F_PP_UP, PP_UP
	object_event 24,  8, SPRITE_POKE_BALL, STAY, NONE, TEXT_MTSILVER2F_CALCIUM, CALCIUM
	object_event 22, 22, SPRITE_POKE_BALL, STAY, NONE, TEXT_MTSILVER2F_ULTRA_BALL, ULTRA_BALL
	object_event  2, 39, SPRITE_POKE_BALL, STAY, NONE, TEXT_MTSILVER2F_MAX_REVIVE, MAX_REVIVE
	object_event 27, 39, SPRITE_POKE_BALL, STAY, NONE, TEXT_MTSILVER2F_FULL_RESTORE, FULL_RESTORE
	;hidden item: 14, 29, MAX_POTION

	def_warps_to MT_SILVER_2F
