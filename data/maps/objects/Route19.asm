; marcelnote - all coords were adjusted for map expansion
	object_const_def
	const_export ROUTE19_COOLTRAINER_M1
	const_export ROUTE19_COOLTRAINER_M2
	const_export ROUTE19_SWIMMER1
	const_export ROUTE19_SWIMMER2
	const_export ROUTE19_SWIMMER3
	const_export ROUTE19_SWIMMER4
	const_export ROUTE19_SWIMMER5
	const_export ROUTE19_SWIMMER6
	const_export ROUTE19_SWIMMER7
	const_export ROUTE19_SWIMMER8
	const_export ROUTE19_SWIMMER9   ; marcelnote - new trainer
	const_export ROUTE19_BLACKBELT1 ; marcelnote - new trainer
	const_export ROUTE19_BLACKBELT2 ; marcelnote - new trainer
	const_export ROUTE19_FISHER1    ; marcelnote - new trainer

Route19_Object:
	db $43 ; border block

	def_warp_events

	def_bg_events
	bg_event 21,  9, TEXT_ROUTE19_SIGN
	bg_event  9,  7, TEXT_ROUTE19_BEACH_HOUSE_SIGN ; marcelnote - new sign

	def_object_events
	object_event 18,  7, SPRITE_COOLTRAINER_M, STAY, LEFT, TEXT_ROUTE19_COOLTRAINER_M1, OPP_SWIMMER, 2
	object_event 23,  7, SPRITE_COOLTRAINER_M, STAY, LEFT, TEXT_ROUTE19_COOLTRAINER_M2, OPP_SWIMMER, 3
	object_event 23, 25, SPRITE_SWIMMER, STAY, LEFT, TEXT_ROUTE19_SWIMMER1, OPP_SWIMMER, 4
	object_event 14, 27, SPRITE_SWIMMER, STAY, RIGHT, TEXT_ROUTE19_SWIMMER2, OPP_SWIMMER, 5
	object_event 26, 31, SPRITE_SWIMMER, STAY, UP, TEXT_ROUTE19_SWIMMER3, OPP_SWIMMER, 6
	object_event 19, 11, SPRITE_SWIMMER, STAY, DOWN, TEXT_ROUTE19_SWIMMER4, OPP_SWIMMER, 7
	object_event 18, 43, SPRITE_SWIMMER_F, STAY, LEFT, TEXT_ROUTE19_SWIMMER5, OPP_BEAUTY, 12
	object_event 21, 43, SPRITE_SWIMMER_F, STAY, RIGHT, TEXT_ROUTE19_SWIMMER6, OPP_BEAUTY, 13
	object_event 19, 42, SPRITE_SWIMMER, STAY, UP, TEXT_ROUTE19_SWIMMER7, OPP_SWIMMER, 8
	object_event 20, 44, SPRITE_SWIMMER_F, STAY, DOWN, TEXT_ROUTE19_SWIMMER8, OPP_BEAUTY, 14
	object_event  7, 43, SPRITE_SWIMMER_F, STAY, UP, TEXT_ROUTE19_SWIMMER9, OPP_BEAUTY, 17           ; marcelnote - new trainer
	object_event  6, 16, SPRITE_BLACKBELT, STAY, DOWN, TEXT_ROUTE19_BLACKBELT1, OPP_BLACKBELT, 10  ; marcelnote - new trainer
	object_event  5, 29, SPRITE_BLACKBELT, STAY, RIGHT, TEXT_ROUTE19_BLACKBELT2, OPP_BLACKBELT, 11 ; marcelnote - new trainer
	object_event  9, 31, SPRITE_FISHER, STAY, RIGHT, TEXT_ROUTE19_FISHER1, OPP_FISHER, 12          ; marcelnote - new trainer

	def_warps_to ROUTE_19
