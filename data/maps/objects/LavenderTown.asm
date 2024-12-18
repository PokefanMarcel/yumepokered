	object_const_def
	const_export LAVENDERTOWN_LITTLE_GIRL
	const_export LAVENDERTOWN_COOLTRAINER_M
	const_export LAVENDERTOWN_SUPER_NERD

LavenderTown_Object:
	db $2c ; border block

	def_warp_events
	warp_event  3,  5, LAVENDER_POKECENTER_MART, 1 ; marcelnote - merged Lavender Pokecenter and Mart
	warp_event 14,  5, POKEMON_TOWER_1F, 1
	warp_event  7,  9, MR_FUJIS_HOUSE, 1
	warp_event 15, 13, LAVENDER_POKECENTER_MART, 3 ; marcelnote - merged Lavender Pokecenter and Mart
	warp_event  3, 13, LAVENDER_CUBONE_HOUSE, 1
	warp_event  7, 13, NAME_RATERS_HOUSE, 1

	def_bg_events
	bg_event 11,  9, TEXT_LAVENDERTOWN_SIGN
	bg_event  9,  3, TEXT_LAVENDERTOWN_SILPH_SCOPE_SIGN
	bg_event 16, 13, TEXT_LAVENDERTOWN_MART_SIGN
	bg_event  4,  5, TEXT_LAVENDERTOWN_POKECENTER_SIGN
	bg_event  5,  9, TEXT_LAVENDERTOWN_POKEMON_HOUSE_SIGN
	bg_event 17,  7, TEXT_LAVENDERTOWN_POKEMON_TOWER_SIGN

	def_object_events
	object_event 15,  9, SPRITE_LITTLE_GIRL, WALK, ANY_DIR, TEXT_LAVENDERTOWN_LITTLE_GIRL
	object_event  9, 10, SPRITE_COOLTRAINER_M, STAY, NONE, TEXT_LAVENDERTOWN_COOLTRAINER_M
	object_event  8,  7, SPRITE_SUPER_NERD, WALK, LEFT_RIGHT, TEXT_LAVENDERTOWN_SUPER_NERD

	def_warps_to LAVENDER_TOWN
