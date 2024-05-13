	object_const_def
	const_export POKEMONTOWER7F_ROCKET1
	const_export POKEMONTOWER7F_ROCKET2
	const_export POKEMONTOWER7F_ROCKET3
	const_export POKEMONTOWER7F_MR_FUJI
	const_export POKEMONTOWER7F_CHANNELER ; marcelnote - added 7FChanneler

PokemonTower7F_Object:
	db $1 ; border block

	def_warp_events
	warp_event  9, 16, POKEMON_TOWER_6F, 2

	def_bg_events

	def_object_events
	object_event  9, 11, SPRITE_ROCKET, STAY, RIGHT, TEXT_POKEMONTOWER7F_ROCKET1, OPP_ROCKET, 19
	object_event 12,  9, SPRITE_ROCKET, STAY, LEFT, TEXT_POKEMONTOWER7F_ROCKET2, OPP_ROCKET, 20
	object_event  9,  7, SPRITE_ROCKET, STAY, RIGHT, TEXT_POKEMONTOWER7F_ROCKET3, OPP_ROCKET, 21
	object_event 10,  3, SPRITE_MR_FUJI, STAY, DOWN, TEXT_POKEMONTOWER7F_MR_FUJI
	object_event 11,  3, SPRITE_CHANNELER, STAY, DOWN, TEXT_POKEMONTOWER7F_CHANNELER ; marcelnote - added 7FChanneler

	def_warps_to POKEMON_TOWER_7F
