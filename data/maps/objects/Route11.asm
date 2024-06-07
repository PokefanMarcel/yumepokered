	object_const_def
	const_export ROUTE11_GAMBLER1
	const_export ROUTE11_GAMBLER2
	const_export ROUTE11_YOUNGSTER1
	const_export ROUTE11_SUPER_NERD1
	const_export ROUTE11_YOUNGSTER2
	const_export ROUTE11_GAMBLER3
	const_export ROUTE11_GAMBLER4
	const_export ROUTE11_YOUNGSTER3
	const_export ROUTE11_SUPER_NERD2
	const_export ROUTE11_YOUNGSTER4
	const_export ROUTE11_YOUNGSTER5 ; marcelnote - new trainer based on A.J.

Route11_Object:
	db $f ; border block

	def_warp_events ; marcelnote - merged ROUTE_11_GATE floors
	warp_event 51,  8, ROUTE_11_GATE, 1 ; marcelnote - reduced size of gate building
	warp_event 51,  9, ROUTE_11_GATE, 2 ; marcelnote - reduced size of gate building
	warp_event 58,  8, ROUTE_11_GATE, 3
	warp_event 58,  9, ROUTE_11_GATE, 4
	warp_event  4,  5, DIGLETTS_CAVE_ROUTE_11, 1

	def_bg_events
	bg_event  1,  5, TEXT_ROUTE11_DIGLETTSCAVE_SIGN

	def_object_events
	object_event 10, 14, SPRITE_GAMBLER, STAY, DOWN, TEXT_ROUTE11_GAMBLER1, OPP_GAMBLER, 1
	object_event 26,  9, SPRITE_GAMBLER, STAY, DOWN, TEXT_ROUTE11_GAMBLER2, OPP_GAMBLER, 2
	object_event 13,  5, SPRITE_YOUNGSTER, STAY, LEFT, TEXT_ROUTE11_YOUNGSTER1, OPP_YOUNGSTER, 9
	object_event 36, 11, SPRITE_SUPER_NERD, STAY, DOWN, TEXT_ROUTE11_SUPER_NERD1, OPP_ENGINEER, 2
	object_event 22,  4, SPRITE_YOUNGSTER, STAY, UP, TEXT_ROUTE11_YOUNGSTER2, OPP_YOUNGSTER, 10
	object_event 45,  7, SPRITE_GAMBLER, STAY, DOWN, TEXT_ROUTE11_GAMBLER3, OPP_GAMBLER, 3
	object_event 33,  3, SPRITE_GAMBLER, STAY, UP, TEXT_ROUTE11_GAMBLER4, OPP_GAMBLER, 4
	object_event 43,  5, SPRITE_YOUNGSTER, STAY, RIGHT, TEXT_ROUTE11_YOUNGSTER3, OPP_YOUNGSTER, 11
	object_event 45, 16, SPRITE_SUPER_NERD, STAY, LEFT, TEXT_ROUTE11_SUPER_NERD2, OPP_ENGINEER, 3
	object_event 22, 12, SPRITE_YOUNGSTER, STAY, UP, TEXT_ROUTE11_YOUNGSTER4, OPP_YOUNGSTER, 12
	object_event 53, 13, SPRITE_YOUNGSTER, STAY, LEFT, TEXT_ROUTE11_YOUNGSTER5, OPP_YOUNGSTER, 14 ; marcelnote - new trainer based on A.J.

	def_warps_to ROUTE_11
