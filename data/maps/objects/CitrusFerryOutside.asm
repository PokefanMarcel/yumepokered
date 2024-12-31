; marcelnote - new location
	object_const_def
	const_export CITRUSFERRYOUTSIDE_SAILOR1
	const_export CITRUSFERRYOUTSIDE_COOLTRAINER_M
	const_export CITRUSFERRYOUTSIDE_BEAUTY
	const_export CITRUSFERRYOUTSIDE_COOLTRAINER_F
	const_export CITRUSFERRYOUTSIDE_GRAMPS

CitrusFerryOutside_Object:
	db $23 ; border block

	def_warp_events
	warp_event 11,  6, CITRUS_FERRY_DECK, 3
	warp_event 20,  6, CITRUS_FERRY_DECK, 4

	def_bg_events

	def_object_events
	object_event  4,  3, SPRITE_SAILOR, STAY, DOWN, TEXT_CITRUSFERRYOUTSIDE_SAILOR1, OPP_SAILOR, 9
	object_event 23,  9, SPRITE_COOLTRAINER_M, STAY, UP, TEXT_CITRUSFERRYOUTSIDE_COOLTRAINER_M, OPP_ENGINEER, 4
	object_event 19,  2, SPRITE_BEAUTY, STAY, DOWN, TEXT_CITRUSFERRYOUTSIDE_BEAUTY, OPP_BEAUTY, 18
	object_event  7,  9, SPRITE_COOLTRAINER_F, STAY, UP, TEXT_CITRUSFERRYOUTSIDE_COOLTRAINER_F, OPP_COOLTRAINER_F, 10
	object_event  2,  5, SPRITE_GRAMPS, STAY, LEFT, TEXT_CITRUSFERRYOUTSIDE_GRAMPS
	object_event 23,  2, SPRITE_GIRL, STAY, UP, TEXT_CITRUSFERRYOUTSIDE_GIRL

	def_warps_to CITRUS_FERRY_OUTSIDE