; marcelnote - merged SS Anne B1F and B1FRooms
	object_const_def
	const_export SSANNEB1FROOMS_SAILOR1
	const_export SSANNEB1FROOMS_SAILOR2
	const_export SSANNEB1FROOMS_SAILOR3
	const_export SSANNEB1FROOMS_SAILOR4
	const_export SSANNEB1FROOMS_SAILOR5
	const_export SSANNEB1FROOMS_FISHER
	const_export SSANNEB1FROOMS_SUPER_NERD
	const_export SSANNEB1FROOMS_MACHOKE
	const_export SSANNEB1FROOMS_ETHER
	const_export SSANNEB1FROOMS_TM_REST
	const_export SSANNEB1FROOMS_MAX_POTION

SSAnneB1F_Object:
	db $c ; border block

	def_warp_events
	; Corridor
	warp_event 27,  3, SS_ANNE_1F, 10
	warp_event  7,  1, SS_ANNE_B1F, 7 ; to Room 1
	warp_event 11,  1, SS_ANNE_B1F, 9 ; to Room 2
	warp_event 15,  1, SS_ANNE_B1F, 11 ; to Room 3
	warp_event 19,  1, SS_ANNE_B1F, 13 ; to Room 4
	warp_event 23,  1, SS_ANNE_B1F, 15 ; to Room 5
	; Rooms
	warp_event 36,  5, SS_ANNE_B1F, 2 ; Room 1
	warp_event 37,  5, SS_ANNE_B1F, 2
	warp_event 46,  5, SS_ANNE_B1F, 3 ; Room 2
	warp_event 47,  5, SS_ANNE_B1F, 3
	warp_event 56,  5, SS_ANNE_B1F, 4 ; Room 3
	warp_event 57,  5, SS_ANNE_B1F, 4
	warp_event 66,  5, SS_ANNE_B1F, 5 ; Room 4
	warp_event 67,  5, SS_ANNE_B1F, 5
	warp_event 76,  5, SS_ANNE_B1F, 6 ; Room 5
	warp_event 77,  5, SS_ANNE_B1F, 6

	def_bg_events

	def_object_events
	object_event 64,  3, SPRITE_SAILOR, STAY, DOWN, TEXT_SSANNEB1FROOMS_SAILOR1, OPP_SAILOR, 3
	object_event 66,  1, SPRITE_SAILOR, STAY, DOWN, TEXT_SSANNEB1FROOMS_SAILOR2, OPP_SAILOR, 4
	object_event 46,  3, SPRITE_SAILOR, STAY, LEFT, TEXT_SSANNEB1FROOMS_SAILOR3, OPP_SAILOR, 5
	object_event 56,  2, SPRITE_SAILOR, STAY, DOWN, TEXT_SSANNEB1FROOMS_SAILOR4, OPP_SAILOR, 6
	object_event 34,  2, SPRITE_SAILOR, STAY, RIGHT, TEXT_SSANNEB1FROOMS_SAILOR5, OPP_SAILOR, 7
	object_event 34,  4, SPRITE_FISHER, STAY, RIGHT, TEXT_SSANNEB1FROOMS_FISHER, OPP_FISHER, 2
	object_event 74,  3, SPRITE_SUPER_NERD, STAY, RIGHT, TEXT_SSANNEB1FROOMS_SUPER_NERD
	object_event 75,  2, SPRITE_MONSTER, STAY, NONE, TEXT_SSANNEB1FROOMS_MACHOKE
	object_event 54,  2, SPRITE_POKE_BALL, STAY, NONE, TEXT_SSANNEB1FROOMS_ETHER, ETHER
	object_event 44,  2, SPRITE_POKE_BALL, STAY, NONE, TEXT_SSANNEB1FROOMS_TM_REST, TM_REST
	object_event 76,  1, SPRITE_POKE_BALL, STAY, NONE, TEXT_SSANNEB1FROOMS_MAX_POTION, MAX_POTION

	def_warps_to SS_ANNE_B1F
