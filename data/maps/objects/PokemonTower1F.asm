	object_const_def
	const_export POKEMONTOWER1F_RECEPTIONIST
	const_export POKEMONTOWER1F_MIDDLE_AGED_WOMAN
	const_export POKEMONTOWER1F_BALDING_GUY
	const_export POKEMONTOWER1F_GIRL
	const_export POKEMONTOWER1F_CHANNELER
	const_export POKEMONTOWER1F_LITTLE_BOY  ; marcelnote - added 7FChanneler
	const_export POKEMONTOWER1F_AGATHA      ; marcelnote - postgame Agatha event
	const_export POKEMONTOWER1F_GENTLEMAN   ; marcelnote - postgame Agatha event

PokemonTower1F_Object:
	db $1 ; border block

	def_warp_events
	warp_event 10, 17, LAST_MAP, 2
	warp_event 11, 17, LAST_MAP, 2
	warp_event 18,  9, POKEMON_TOWER_2F, 2

	def_bg_events

	def_object_events
	object_event 15, 13, SPRITE_LINK_RECEPTIONIST, STAY, UP, TEXT_POKEMONTOWER1F_RECEPTIONIST
	object_event  6,  8, SPRITE_MIDDLE_AGED_WOMAN, STAY, NONE, TEXT_POKEMONTOWER1F_MIDDLE_AGED_WOMAN
	object_event  8, 12, SPRITE_BALDING_GUY, STAY, NONE, TEXT_POKEMONTOWER1F_BALDING_GUY
	object_event 13,  7, SPRITE_GIRL, STAY, NONE, TEXT_POKEMONTOWER1F_GIRL
	object_event 17,  7, SPRITE_CHANNELER, STAY, LEFT, TEXT_POKEMONTOWER1F_CHANNELER
	object_event  5,  8, SPRITE_LITTLE_BOY, STAY, DOWN, TEXT_POKEMONTOWER1F_LITTLE_BOY  ; marcelnote - added 7FChanneler
	object_event 11, 13, SPRITE_AGATHA, STAY, RIGHT, TEXT_POKEMONTOWER1F_AGATHA  ; marcelnote - postgame Agatha event
	object_event 12, 13, SPRITE_GENTLEMAN, STAY, LEFT, TEXT_POKEMONTOWER1F_GENTLEMAN  ; marcelnote - postgame Agatha event

	def_warps_to POKEMON_TOWER_1F
