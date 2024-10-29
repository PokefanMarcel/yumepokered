; marcelnote - new location
	object_const_def
	const_export MTSILVER1F_PROTEIN
	const_export MTSILVER1F_ESCAPE_ROPE
	const_export MTSILVER1F_ULTRA_BALL
	const_export MTSILVER1F_MAX_ELIXIR

MtSilver1F_Object:
	db $3 ; border block

	def_warp_events
	warp_event 10, 35, ROUTE_28, 1
	warp_event 11, 35, ROUTE_28, 1
	warp_event 17,  3, MT_SILVER_2F, 1

	def_bg_events
	;bg_event 15, 23, TEXT_MTMOON1F_BEWARE_ZUBAT_SIGN

	def_object_events
	object_event 17, 29, SPRITE_POKE_BALL, STAY, NONE, TEXT_MTSILVER1F_PROTEIN, PROTEIN
	object_event  8, 30, SPRITE_POKE_BALL, STAY, NONE, TEXT_MTSILVER1F_ESCAPE_ROPE, ESCAPE_ROPE
	object_event  9, 18, SPRITE_POKE_BALL, STAY, NONE, TEXT_MTSILVER1F_ULTRA_BALL, ULTRA_BALL
	object_event  6,  9, SPRITE_POKE_BALL, STAY, NONE, TEXT_MTSILVER1F_MAX_ELIXIR, MAX_ELIXIR
	;hidden item: 19, 13, ULTRA_BALL
	;hidden item: 18, 23, DIRE_HIT

	def_warps_to MT_SILVER_1F
