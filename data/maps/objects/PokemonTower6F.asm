	object_const_def
	const_export POKEMONTOWER6F_CHANNELER1
	const_export POKEMONTOWER6F_CHANNELER2
	const_export POKEMONTOWER6F_CHANNELER3
	const_export POKEMONTOWER6F_AGATHA ; marcelnote - postgame Agatha event
	const_export POKEMONTOWER6F_RARE_CANDY
	const_export POKEMONTOWER6F_X_ACCURACY

PokemonTower6F_Object:
	db $1 ; border block

	def_warp_events
	warp_event 18,  9, POKEMON_TOWER_5F, 2
	warp_event  9, 16, POKEMON_TOWER_7F, 1

	def_bg_events
	bg_event  4,  9, TEXT_POKEMONTOWER6F_TOMB ; marcelnote - postgame Agatha event

	def_object_events
	object_event 12, 10, SPRITE_CHANNELER, STAY, RIGHT, TEXT_POKEMONTOWER6F_CHANNELER1, OPP_CHANNELER, 19
	object_event  9,  5, SPRITE_CHANNELER, STAY, DOWN, TEXT_POKEMONTOWER6F_CHANNELER2, OPP_CHANNELER, 20
	object_event 16,  5, SPRITE_CHANNELER, STAY, LEFT, TEXT_POKEMONTOWER6F_CHANNELER3, OPP_CHANNELER, 21
	object_event  4, 10, SPRITE_AGATHA, STAY, UP, TEXT_POKEMONTOWER6F_AGATHA ; marcelnote - postgame Agatha event
	object_event  6,  8, SPRITE_POKE_BALL, STAY, NONE, TEXT_POKEMONTOWER6F_RARE_CANDY, RARE_CANDY
	object_event 14, 14, SPRITE_POKE_BALL, STAY, NONE, TEXT_POKEMONTOWER6F_X_ACCURACY, X_ACCURACY

	def_warps_to POKEMON_TOWER_6F
