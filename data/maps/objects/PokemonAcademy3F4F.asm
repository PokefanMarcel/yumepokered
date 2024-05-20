; marcelnote - new location
	object_const_def
	const_export POKEMONACADEMY3F_TEACHER
	const_export POKEMONACADEMY3F_YOUNGSTER
	const_export POKEMONACADEMY3F_LITTLE_GIRL_STAT_EXP
	const_export POKEMONACADEMY3F_ROCKER_DVS
	const_export POKEMONACADEMY3F_COOLTRAINER_F_MIST_HAZE
	const_export POKEMONACADEMY3F_BEAUTY_RAZOR_WIND
	const_export POKEMONACADEMY3F_SUPER_NERD_HYPER_BEAM
	const_export POKEMONACADEMY4F_GAMEBOY_KID1
	const_export POKEMONACADEMY4F_GAMEBOY_KID2
	const_export POKEMONACADEMY4F_CLERK

PokemonAcademy3F4F_Object:
	db $00 ; border block

	def_warp_events
	warp_event 15,  0, POKEMON_ACADEMY_1F2F, 5
	warp_event 14,  0, POKEMON_ACADEMY_3F4F, 3
	warp_event 36,  0, POKEMON_ACADEMY_3F4F, 2

	def_bg_events
	bg_event 13,  7, TEXT_POKEMONACADEMY3F_SIGN
	bg_event 35,  7, TEXT_POKEMONACADEMY4F_SIGN
	bg_event  9,  3, TEXT_POKEMONACADEMY3F_STAT_EXP_NOTES
	bg_event  5,  6, TEXT_POKEMONACADEMY3F_DVS_NOTES
	bg_event  7,  9, TEXT_POKEMONACADEMY3F_MIST_HAZE_NOTES
	bg_event  3,  3, TEXT_POKEMONACADEMY3F_HYPER_BEAM_NOTES

	def_object_events
	object_event  8,  1, SPRITE_GIRL, STAY, DOWN, TEXT_POKEMONACADEMY3F_TEACHER
	object_event  8,  7, SPRITE_YOUNGSTER, STAY, UP, TEXT_POKEMONACADEMY3F_YOUNGSTER
	object_event  8,  4, SPRITE_LITTLE_GIRL, STAY, UP, TEXT_POKEMONACADEMY3F_LITTLE_GIRL
	object_event  4,  7, SPRITE_ROCKER, STAY, UP, TEXT_POKEMONACADEMY3F_ROCKER
	object_event  6, 10, SPRITE_COOLTRAINER_F, STAY, UP, TEXT_POKEMONACADEMY3F_COOLTRAINER_F
	object_event  5,  4, SPRITE_BEAUTY, STAY, UP, TEXT_POKEMONACADEMY3F_BEAUTY
	object_event  4,  4, SPRITE_SUPER_NERD, STAY, UP, TEXT_POKEMONACADEMY3F_SUPER_NERD
	object_event 24,  9, SPRITE_GAMEBOY_KID, STAY, DOWN, TEXT_POKEMONACADEMY4F_GAMEBOY_KID1
	object_event 25,  9, SPRITE_GAMEBOY_KID, STAY, DOWN, TEXT_POKEMONACADEMY4F_GAMEBOY_KID2
	object_event 29,  5, SPRITE_GRANNY, STAY, UP, TEXT_POKEMONACADEMY4F_GRANNY

	def_warps_to POKEMON_ACADEMY_3F4F
