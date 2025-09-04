; marcelnote - merged Celadon Mart 1st 2nd 3rd floors
	object_const_def
	const_export CELADONMART1F_RECEPTIONIST
	const_export CELADONMART2F_CLERK1
	const_export CELADONMART2F_CLERK2
	const_export CELADONMART2F_MIDDLE_AGED_MAN
	const_export CELADONMART2F_GIRL
	const_export CELADONMART2F_BRUNETTE_GIRL ; marcelnote - new NPC
	const_export CELADONMART3F_CLERK
	const_export CELADONMART3F_GAMEBOY_KID1
	const_export CELADONMART3F_GAMEBOY_KID2
	const_export CELADONMART3F_GAMEBOY_KID3
	const_export CELADONMART3F_LITTLE_BOY

CeladonMart1F2F3F_Object:
	db $f ; border block

	def_warp_events
	warp_event  2, 35, LAST_MAP, 1
	warp_event  3, 35, LAST_MAP, 1
	warp_event 16, 35, LAST_MAP, 2
	warp_event 17, 35, LAST_MAP, 2
	warp_event 12, 29, CELADON_MART_1F2F3F,   7 ; marcelnote - 1F going upstairs
	warp_event  1, 29, CELADON_MART_ELEVATOR, 1 ; marcelnote - elevator 1F
	warp_event 12, 15, CELADON_MART_1F2F3F,   5 ; marcelnote - 2F going downstairs
	warp_event 16, 15, CELADON_MART_1F2F3F,  11 ; marcelnote - 2F going upstairs
	warp_event  1, 15, CELADON_MART_ELEVATOR, 1 ; marcelnote - elevator 2F
	warp_event 12,  1, CELADON_MART_4F5F6F,   1 ; marcelnote - 3F going upstairs
	warp_event 16,  1, CELADON_MART_1F2F3F,   8 ; marcelnote - 3F going downstairs
	warp_event  1,  1, CELADON_MART_ELEVATOR, 1 ; marcelnote - elevator 3F

	def_bg_events
	bg_event 11, 32, TEXT_CELADONMART1F_DIRECTORY_SIGN
	bg_event 14, 29, TEXT_CELADONMART1F_CURRENT_FLOOR_SIGN
	bg_event 16, 29, TEXT_CELADONMART1F_PHONE1 ; marcelnote - new
	bg_event 17, 29, TEXT_CELADONMART1F_PHONE2 ; marcelnote - new
	bg_event 14, 15, TEXT_CELADONMART2F_CURRENT_FLOOR_SIGN
	bg_event  2,  4, TEXT_CELADONMART3F_SNES1
	bg_event  5,  4, TEXT_CELADONMART3F_SNES2
	bg_event  2,  6, TEXT_CELADONMART3F_SNES3
	bg_event  5,  6, TEXT_CELADONMART3F_SNES4
	bg_event 14,  1, TEXT_CELADONMART3F_CURRENT_FLOOR_SIGN
	bg_event  4,  1, TEXT_CELADONMART3F_POKEMON_POSTER1
	bg_event  6,  1, TEXT_CELADONMART3F_POKEMON_POSTER2
	bg_event 10,  1, TEXT_CELADONMART3F_POKEMON_POSTER3

	def_object_events
	object_event  8, 31, SPRITE_LINK_RECEPTIONIST, STAY, DOWN, TEXT_CELADONMART1F_RECEPTIONIST
	object_event  5, 17, SPRITE_CLERK, STAY, DOWN, TEXT_CELADONMART2F_CLERK1
	object_event  6, 17, SPRITE_CLERK, STAY, DOWN, TEXT_CELADONMART2F_CLERK2
	object_event 19, 19, SPRITE_MIDDLE_AGED_MAN, STAY, NONE, TEXT_CELADONMART2F_MIDDLE_AGED_MAN
	object_event 14, 18, SPRITE_GIRL, WALK, UP_DOWN, TEXT_CELADONMART2F_GIRL
	object_event  6, 20, SPRITE_BRUNETTE_GIRL, WALK, LEFT_RIGHT, TEXT_CELADONMART2F_BRUNETTE_GIRL ; marcelnote - new NPC
	object_event 16,  5, SPRITE_CLERK, STAY, NONE, TEXT_CELADONMART3F_CLERK
	object_event 11,  6, SPRITE_GAMEBOY_KID, STAY, RIGHT, TEXT_CELADONMART3F_GAMEBOY_KID1
	object_event  7,  2, SPRITE_GAMEBOY_KID, STAY, DOWN, TEXT_CELADONMART3F_GAMEBOY_KID2
	object_event  8,  2, SPRITE_GAMEBOY_KID, STAY, DOWN, TEXT_CELADONMART3F_GAMEBOY_KID3
	object_event  2,  5, SPRITE_LITTLE_BOY, STAY, UP, TEXT_CELADONMART3F_LITTLE_BOY

	def_warps_to CELADON_MART_1F2F3F
