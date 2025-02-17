	object_const_def
	const_export SSANNE1FROOMS_GENTLEMAN1
	const_export SSANNE1FROOMS_GENTLEMAN2
	const_export SSANNE1FROOMS_YOUNGSTER
	const_export SSANNE1FROOMS_COOLTRAINER_F
	const_export SSANNE1FROOMS_GIRL1
	const_export SSANNE1FROOMS_MIDDLE_AGED_MAN
	const_export SSANNE1FROOMS_LITTLE_GIRL
	const_export SSANNE1FROOMS_WIGGLYTUFF
	const_export SSANNE1FROOMS_GIRL2
	const_export SSANNE1FROOMS_TM_BODY_SLAM
	const_export SSANNE1FROOMS_GENTLEMAN3
	const_export SSANNE1FROOMS_NURSE ; marcelnote - new nurse room

SSAnne1FRooms_Object:
	db $c ; border block

	def_warp_events ; marcelnote - reorganized map
	warp_event  0,  0, SS_ANNE_1F, 3
	warp_event 10,  0, SS_ANNE_1F, 4
	warp_event 20,  0, SS_ANNE_1F, 5
	warp_event 30,  0, SS_ANNE_1F, 6
	warp_event 40,  0, SS_ANNE_1F, 7
	warp_event 50,  0, SS_ANNE_1F, 8
	warp_event 62,  5, SS_ANNE_1F, 12 ; marcelnote - new nurse room
	warp_event 63,  5, SS_ANNE_1F, 12 ; marcelnote - new nurse room

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_GENTLEMAN, STAY, LEFT, TEXT_SSANNE1FROOMS_GENTLEMAN1, OPP_GENTLEMAN, 1
	object_event 11,  4, SPRITE_GENTLEMAN, STAY, UP, TEXT_SSANNE1FROOMS_GENTLEMAN2, OPP_GENTLEMAN, 2
	object_event 41,  4, SPRITE_YOUNGSTER, STAY, UP, TEXT_SSANNE1FROOMS_YOUNGSTER, OPP_YOUNGSTER, 8
	object_event 43,  1, SPRITE_COOLTRAINER_F, STAY, LEFT, TEXT_SSANNE1FROOMS_COOLTRAINER_F, OPP_LASS, 11
	object_event 22,  3, SPRITE_GIRL, WALK, UP_DOWN, TEXT_SSANNE1FROOMS_GIRL1
	object_event 30,  4, SPRITE_MIDDLE_AGED_MAN, STAY, NONE, TEXT_SSANNE1FROOMS_MIDDLE_AGED_MAN
	object_event 32,  1, SPRITE_LITTLE_GIRL, STAY, DOWN, TEXT_SSANNE1FROOMS_LITTLE_GIRL
	object_event 33,  1, SPRITE_FAIRY, STAY, DOWN, TEXT_SSANNE1FROOMS_WIGGLYTUFF
	object_event 40,  3, SPRITE_GIRL, STAY, RIGHT, TEXT_SSANNE1FROOMS_GIRL2
	object_event 42,  5, SPRITE_POKE_BALL, STAY, NONE, TEXT_SSANNE1FROOMS_TM_BODY_SLAM, TM_BODY_SLAM
	object_event 51,  3, SPRITE_GENTLEMAN, WALK, LEFT_RIGHT, TEXT_SSANNE1FROOMS_GENTLEMAN3
	object_event 62,  1, SPRITE_NURSE, STAY, DOWN, TEXT_SSANNE1FROOMS_NURSE ; marcelnote - new nurse room

	def_warps_to SS_ANNE_1F_ROOMS
