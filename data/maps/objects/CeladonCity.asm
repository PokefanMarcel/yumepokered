	object_const_def
	const_export CELADONCITY_LITTLE_GIRL
	const_export CELADONCITY_GRAMPS1
	const_export CELADONCITY_GIRL
	const_export CELADONCITY_GRAMPS2
	const_export CELADONCITY_GRAMPS3
	const_export CELADONCITY_FISHER
	const_export CELADONCITY_POLIWRATH
	const_export CELADONCITY_ROCKET1
	const_export CELADONCITY_ROCKET2
	const_export CELADONCITY_COOLTRAINER_F ; marcelnote -new NPC who mentions Celadon Grove

CeladonCity_Object:
	db $f ; border block

	def_warp_events
	warp_event  8, 13, CELADON_MART_1F2F3F, 1 ; marcelnote - merged 1F 2F 3F
	warp_event 10, 13, CELADON_MART_1F2F3F, 3 ; marcelnote - merged 1F 2F 3F
	warp_event 24,  9, CELADON_MANSION, 1 ; marcelnote - merged Celadon Mansion floors
	warp_event 24,  3, CELADON_MANSION, 3 ; marcelnote - merged Celadon Mansion floors
	warp_event 25,  3, CELADON_MANSION, 3 ; marcelnote - merged Celadon Mansion floors
	warp_event 41,  9, CELADON_POKECENTER, 1
	warp_event 12, 27, CELADON_GYM, 1
	warp_event 28, 19, GAME_CORNER, 1
	warp_event 39, 19, CELADON_MART_4F5F6F, 1 ; marcelnote - was CELADON_MART_5F
	warp_event 33, 19, GAME_CORNER_PRIZE_ROOM, 1
	warp_event 31, 27, CELADON_DINER, 1
	warp_event 35, 27, CELADON_CHIEF_HOUSE, 1
	warp_event 43, 27, CELADON_HOTEL, 1
	warp_event  9,  3, CELADON_GROVE_SOUTH_GATE, 2 ; marcelnote - new for Celadon Grove

	def_bg_events
	bg_event 27, 15, TEXT_CELADONCITY_TRAINER_TIPS1
	bg_event 19, 15, TEXT_CELADONCITY_SIGN
	bg_event 42,  9, TEXT_CELADONCITY_POKECENTER_SIGN
	bg_event 13, 29, TEXT_CELADONCITY_GYM_SIGN
	bg_event 21,  9, TEXT_CELADONCITY_MANSION_SIGN
	bg_event 12, 13, TEXT_CELADONCITY_DEPTSTORE_SIGN
	bg_event 39, 21, TEXT_CELADONCITY_TRAINER_TIPS2
	bg_event 33, 21, TEXT_CELADONCITY_PRIZEEXCHANGE_SIGN
	bg_event 27, 21, TEXT_CELADONCITY_GAMECORNER_SIGN
	bg_event  7,  3, TEXT_CELADONCITY_CELADONGROVE_SIGN ; marcelnote - new for Celadon Grove

	def_object_events
	object_event  8, 17, SPRITE_LITTLE_GIRL, WALK, ANY_DIR, TEXT_CELADONCITY_LITTLE_GIRL
	object_event 11, 28, SPRITE_GRAMPS, STAY, UP, TEXT_CELADONCITY_GRAMPS1
	object_event 14, 19, SPRITE_GIRL, WALK, UP_DOWN, TEXT_CELADONCITY_GIRL
	object_event 25, 22, SPRITE_GRAMPS, STAY, DOWN, TEXT_CELADONCITY_GRAMPS2
	object_event 22, 16, SPRITE_GRAMPS, STAY, DOWN, TEXT_CELADONCITY_GRAMPS3
	object_event 32, 12, SPRITE_FISHER, STAY, LEFT, TEXT_CELADONCITY_FISHER
	object_event 30, 12, SPRITE_MONSTER, STAY, RIGHT, TEXT_CELADONCITY_POLIWRATH
	object_event 32, 29, SPRITE_ROCKET, WALK, LEFT_RIGHT, TEXT_CELADONCITY_ROCKET1
	object_event 42, 14, SPRITE_ROCKET, WALK, LEFT_RIGHT, TEXT_CELADONCITY_ROCKET2
	object_event  2, 10, SPRITE_COOLTRAINER_F, WALK, LEFT_RIGHT, TEXT_CELADONCITY_COOLTRAINER_F ; marcelnote -new NPC who mentions Celadon Grove

	def_warps_to CELADON_CITY
