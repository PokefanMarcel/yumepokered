; marcelnote - coordinate changes to accommodate Cinnabar Volcano
	object_const_def
	const_export CINNABARISLAND_GIRL
	const_export CINNABARISLAND_GAMBLER

CinnabarIsland_Object:
	db $43 ; border block

	def_warp_events
	warp_event 14,  3, POKEMON_MANSION_1F, 2
	warp_event 26,  3, CINNABAR_GYM, 1
	warp_event 14,  9, CINNABAR_LAB, 1
	warp_event 19, 11, CINNABAR_POKECENTER, 1
	warp_event 23, 11, CINNABAR_MART, 1
	warp_event  4, 11, CINNABAR_VOLCANO_1F, 1 ; marcelnote - new location

	def_bg_events
	bg_event 17,  5, TEXT_CINNABARISLAND_SIGN
	bg_event 24, 11, TEXT_CINNABARISLAND_MART_SIGN
	bg_event 20, 11, TEXT_CINNABARISLAND_POKECENTER_SIGN
	bg_event 17, 11, TEXT_CINNABARISLAND_POKEMONLAB_SIGN
	bg_event 21,  3, TEXT_CINNABARISLAND_GYM_SIGN
	bg_event  7, 13, TEXT_CINNABARISLAND_VOLCANO_SIGN ; marcelnote - sign for Cinnabar Volcano

	def_object_events
	object_event 20,  5, SPRITE_GIRL, WALK, LEFT_RIGHT, TEXT_CINNABARISLAND_GIRL
	object_event 22,  6, SPRITE_GAMBLER, STAY, NONE, TEXT_CINNABARISLAND_GAMBLER

	def_warps_to CINNABAR_ISLAND
