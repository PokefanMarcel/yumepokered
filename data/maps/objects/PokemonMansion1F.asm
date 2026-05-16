	object_const_def
	const_export POKEMONMANSION1F_SCIENTIST
	const_export POKEMONMANSION1F_ESCAPE_ROPE
	const_export POKEMONMANSION1F_CARBOS

PokemonMansion1F_Object:
	db $2e ; border block

	def_warp_events
	warp_event  4, 27, WARP_DOWN, LAST_MAP, 1
	warp_event  5, 27, WARP_DOWN, LAST_MAP, 1
	warp_event  6, 27, WARP_DOWN, LAST_MAP, 1
	warp_event  7, 27, WARP_DOWN, LAST_MAP, 1
	warp_event  5, 10, ANY_DIR,   POKEMON_MANSION_2F, 1
	warp_event 21, 23, ANY_DIR,   POKEMON_MANSION_B1F, 1
	warp_event 26, 27, WARP_DOWN, LAST_MAP, 1
	warp_event 27, 27, WARP_DOWN, LAST_MAP, 1

	def_bg_events

	def_object_events
	object_event 17, 17, SPRITE_SCIENTIST, STAY, LEFT, TEXT_POKEMONMANSION1F_SCIENTIST, OPP_SCIENTIST, 4
	object_event 14,  3, SPRITE_POKE_BALL, STAY, NONE, TEXT_POKEMONMANSION1F_ESCAPE_ROPE, ESCAPE_ROPE
	object_event 18, 21, SPRITE_POKE_BALL, STAY, NONE, TEXT_POKEMONMANSION1F_CARBOS, CARBOS

	def_warps_to POKEMON_MANSION_1F
