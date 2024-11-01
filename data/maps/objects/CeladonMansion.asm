; marcelnote - merged Celadon Mansion floors, added 4F
	object_const_def
	const_export CELADONMANSION1F_MEOWTH
	const_export CELADONMANSION1F_GRANNY
	const_export CELADONMANSION1F_CLEFAIRY
	const_export CELADONMANSION1F_NIDORANF
	const_export CELADONMANSION3F_PROGRAMMER
	const_export CELADONMANSION3F_GRAPHIC_ARTIST
	const_export CELADONMANSION3F_WRITER
	const_export CELADONMANSION3F_GAME_DESIGNER

CeladonMansion_Object:
	db $0 ; border block ; marcelnote - changed from $f

	def_warp_events ; marcelnote - warps were modified for the map changes
	; 1F
	warp_event  4, 65, LAST_MAP, 3
	warp_event  5, 65, LAST_MAP, 3
	warp_event  2, 54, LAST_MAP, 4
	warp_event  6, 54, CELADON_MANSION, 6 ; 1F -> 2F main
	warp_event  4, 54, CELADON_MANSION, 8 ; 1F -> 2F back
	; 2F
	warp_event  6, 36, CELADON_MANSION,  4 ; 2F -> 1F main
	warp_event  7, 36, CELADON_MANSION, 10 ; 2F -> 3F main
	warp_event  4, 36, CELADON_MANSION,  5 ; 2F -> 1F back
	warp_event  2, 36, CELADON_MANSION, 12 ; 2F -> 3F back
	; 3F
	warp_event  7, 18, CELADON_MANSION,  7 ; 3F -> 2F main
	warp_event  6, 18, CELADON_MANSION, 14 ; 3F -> 4F main
	warp_event  2, 18, CELADON_MANSION,  9 ; 3F -> 2F back
	warp_event  4, 18, CELADON_MANSION, 16 ; 3F -> 4F back
	; 4F
	warp_event  6,  0, CELADON_MANSION, 11      ; 4F -> 3F main
	warp_event  7,  0, CELADON_MANSION_ROOF, 1 ; 4F -> Roof main
	warp_event  4,  0, CELADON_MANSION, 13      ; 4F -> 3F back
	warp_event  2,  0, CELADON_MANSION_ROOF, 2 ; 4F -> Roof back

	def_bg_events
	; 1F
	bg_event  4, 63, TEXT_CELADONMANSION1F_MANAGERS_SUITE_SIGN
	; 2F
	bg_event  4, 45, TEXT_CELADONMANSION2F_MEETING_ROOM_SIGN
	; 3F
	bg_event  1, 21, TEXT_CELADONMANSION3F_GAME_PROGRAM_PC
	bg_event  4, 21, TEXT_CELADONMANSION3F_PLAYING_GAME_PC
	bg_event  1, 24, TEXT_CELADONMANSION3F_GAME_SCRIPT_PC
	bg_event  4, 27, TEXT_CELADONMANSION3F_DEV_ROOM_SIGN
	; 4F
	bg_event  1,  3, TEXT_CELADONMANSION4F_EXEGGUTOR_SURF_PC
	bg_event  4,  9, TEXT_CELADONMANSION4F_YUME_LABS_SIGN

	def_object_events
	; 1F
	object_event  0, 59, SPRITE_MONSTER, STAY, RIGHT, TEXT_CELADONMANSION1F_MEOWTH
	object_event  1, 59, SPRITE_GRANNY, STAY, DOWN, TEXT_CELADONMANSION1F_GRANNY
	object_event  1, 62, SPRITE_FAIRY, WALK, LEFT_RIGHT, TEXT_CELADONMANSION1F_CLEFAIRY
	object_event  4, 58, SPRITE_MONSTER, WALK, UP_DOWN, TEXT_CELADONMANSION1F_NIDORANF
	; 2F
	; nothing
	; 3F
	object_event  0, 22, SPRITE_BIKE_SHOP_CLERK, STAY, UP, TEXT_CELADONMANSION3F_PROGRAMMER
	object_event  3, 22, SPRITE_CLERK, STAY, UP, TEXT_CELADONMANSION3F_GRAPHIC_ARTIST
	object_event  0, 25, SPRITE_SUPER_NERD, STAY, UP, TEXT_CELADONMANSION3F_WRITER
	object_event  2, 21, SPRITE_SILPH_WORKER_M, STAY, NONE, TEXT_CELADONMANSION3F_GAME_DESIGNER
	; 4F
	object_event  0,  4, SPRITE_COOLTRAINER_M, STAY, UP, TEXT_CELADONMANSION4F_HACKER

	def_warps_to CELADON_MANSION
