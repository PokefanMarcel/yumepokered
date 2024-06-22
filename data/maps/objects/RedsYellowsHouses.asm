; marcelnote - merged RedsHouse floors, added Yellow's
	object_const_def
	const_export REDSHOUSE1F_MOM

RedsYellowsHouses_Object:
	db $a ; border block

	def_warp_events
	; Red's house
	warp_event  2,  7, LAST_MAP, 1
	warp_event  3,  7, LAST_MAP, 1
	warp_event  7,  1, REDS_YELLOWS_HOUSES, 4 ; marcelnote - merged RedsHouse floors
	warp_event 21,  1, REDS_YELLOWS_HOUSES, 3 ; marcelnote - merged RedsHouse floors
	; Yellow's house
	warp_event 30,  7, LAST_MAP, 4
	warp_event 31,  7, LAST_MAP, 4
	warp_event 35,  1, REDS_YELLOWS_HOUSES, 8
	warp_event 49,  1, REDS_YELLOWS_HOUSES, 7

	def_bg_events
	bg_event  3,  1, TEXT_REDSHOUSE1F_TV
	bg_event 17,  5, TEXT_REDSHOUSE2F_SNES       ; marcelnote - moved from hidden objects
	;hidden_object 17,  5, ANY_FACING, PrintRedSNESText
	bg_event 44,  1, TEXT_YELLOWSHOUSE2F_GAMEBOY ; marcelnote - new for Yellow's bedroom
	bg_event 43,  4, TEXT_YELLOWSHOUSE2F_TV      ; marcelnote - new for Yellow's bedroom

	def_object_events
	object_event  5,  4, SPRITE_MOM, STAY, LEFT, TEXT_REDSHOUSE1F_MOM
	object_event 42,  6, SPRITE_YELLOW_ASLEEP, STAY, NONE, TEXT_YELLOWSHOUSE2F_ASLEEP

	def_warps_to REDS_YELLOWS_HOUSES
