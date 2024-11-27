	object_const_def
	const_export INDIGOPLATEAULOBBY_NURSE
	const_export INDIGOPLATEAULOBBY_GYM_GUIDE
	const_export INDIGOPLATEAULOBBY_COOLTRAINER_F
	const_export INDIGOPLATEAULOBBY_CLERK
	const_export INDIGOPLATEAULOBBY_LINK_RECEPTIONIST
	const_export INDIGOPLATEAULOBBY_COOLTRAINER_F2 ; marcelnote - added, blocks E4 entrance after 1st victory
	const_export INDIGOPLATEAULOBBY_RIVAL ; marcelnote - added, appears when E4 reopens

IndigoPlateauLobby_Object:
	db $0 ; border block

	def_warp_events
	warp_event  7, 11, LAST_MAP, 1
	warp_event  8, 11, LAST_MAP, 2
	warp_event  8,  0, LORELEIS_ROOM, 1

	def_bg_events

	def_object_events
	object_event  7,  5, SPRITE_NURSE, STAY, DOWN, TEXT_INDIGOPLATEAULOBBY_NURSE
	object_event  4,  9, SPRITE_GYM_GUIDE, STAY, RIGHT, TEXT_INDIGOPLATEAULOBBY_GYM_GUIDE
	object_event  5,  1, SPRITE_COOLTRAINER_F, STAY, DOWN, TEXT_INDIGOPLATEAULOBBY_COOLTRAINER_F
	object_event  0,  5, SPRITE_CLERK, STAY, RIGHT, TEXT_INDIGOPLATEAULOBBY_CLERK
	object_event 13,  6, SPRITE_LINK_RECEPTIONIST, STAY, DOWN, TEXT_INDIGOPLATEAULOBBY_LINK_RECEPTIONIST
IF DEF(_DEBUG) ; marcelnote - added for debug
	object_event  9,  1, SPRITE_COOLTRAINER_F, STAY, DOWN, TEXT_INDIGOPLATEAULOBBY_COOLTRAINER_F2 ; marcelnote - added
ELSE
	object_event  8,  1, SPRITE_COOLTRAINER_F, STAY, DOWN, TEXT_INDIGOPLATEAULOBBY_COOLTRAINER_F2 ; marcelnote - added
ENDC
	object_event  3,  2, SPRITE_BLUE, STAY, NONE, TEXT_INDIGOPLATEAULOBBY_RIVAL ; marcelnote - added

	def_warps_to INDIGO_PLATEAU_LOBBY
