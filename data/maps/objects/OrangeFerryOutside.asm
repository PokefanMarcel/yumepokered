; marcelnote - new location
	object_const_def
	const_export ORANGEFERRYOUTSIDE_SAILOR1
	const_export ORANGEFERRYOUTSIDE_COOLTRAINER_M

OrangeFerryOutside_Object:
	db $23 ; border block

	def_warp_events
	warp_event 11,  6, ORANGE_FERRY_DECK, 3
	warp_event 20,  6, ORANGE_FERRY_DECK, 4

	def_bg_events

	def_object_events
	object_event  4,  3, SPRITE_SAILOR, STAY, DOWN, TEXT_ORANGEFERRYOUTSIDE_SAILOR1, OPP_SAILOR, 9
	object_event 23,  9, SPRITE_COOLTRAINER_M, STAY, UP, TEXT_ORANGEFERRYOUTSIDE_COOLTRAINER_M, OPP_ENGINEER, 4

	def_warps_to ORANGE_FERRY_OUTSIDE
