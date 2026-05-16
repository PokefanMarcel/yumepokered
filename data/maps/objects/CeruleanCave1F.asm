	object_const_def
	const_export CERULEANCAVE1F_FULL_RESTORE
	const_export CERULEANCAVE1F_MAX_ELIXIR
	const_export CERULEANCAVE1F_NUGGET

CeruleanCave1F_Object:
	db $7d ; border block

	def_warp_events
	warp_event 24, 17, WARP_DOWN, LAST_MAP, 7
	warp_event 25, 17, WARP_DOWN, LAST_MAP, 7
	warp_event 27,  1, ANY_DIR,   CERULEAN_CAVE_2F, 1
	warp_event 23,  7, ANY_DIR,   CERULEAN_CAVE_2F, 2
	warp_event 18,  9, ANY_DIR,   CERULEAN_CAVE_2F, 3
	warp_event  7,  1, ANY_DIR,   CERULEAN_CAVE_2F, 4
	warp_event  1,  3, ANY_DIR,   CERULEAN_CAVE_2F, 5
	warp_event  3, 11, ANY_DIR,   CERULEAN_CAVE_2F, 6
	warp_event  0,  6, ANY_DIR,   CERULEAN_CAVE_B1F, 1

	def_bg_events

	def_object_events
	object_event  7, 13, SPRITE_POKE_BALL, STAY, NONE, TEXT_CERULEANCAVE1F_FULL_RESTORE, FULL_RESTORE
	object_event 19,  3, SPRITE_POKE_BALL, STAY, NONE, TEXT_CERULEANCAVE1F_MAX_ELIXIR, MAX_ELIXIR
	object_event  5,  0, SPRITE_POKE_BALL, STAY, NONE, TEXT_CERULEANCAVE1F_NUGGET, NUGGET

	def_warps_to CERULEAN_CAVE_1F
