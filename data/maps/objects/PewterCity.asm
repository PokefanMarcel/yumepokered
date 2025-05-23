	object_const_def
	const_export PEWTERCITY_COOLTRAINER_F
	const_export PEWTERCITY_COOLTRAINER_M
	const_export PEWTERCITY_SUPER_NERD1
	const_export PEWTERCITY_SUPER_NERD2
	const_export PEWTERCITY_YOUNGSTER

PewterCity_Object:
	db $2c ; border block

	def_warp_events
	warp_event 14,  7, PEWTER_MUSEUM, 1 ; marcelnote - merged Pewter Museum floors
	warp_event 19,  5, PEWTER_MUSEUM, 3 ; marcelnote - merged Pewter Museum floors
	warp_event 16, 17, PEWTER_GYM, 1
	warp_event 29, 13, PEWTER_NIDORAN_HOUSE, 1
	warp_event 23, 17, PEWTER_POKECENTER_MART, 3 ; marcelnote - merged Pewter Pokecenter and Mart
	warp_event  7, 29, PEWTER_SPEECH_HOUSE, 1
	warp_event 13, 25, PEWTER_POKECENTER_MART, 1 ; marcelnote - merged Pewter Pokecenter and Mart

	def_bg_events
	bg_event 19, 29, TEXT_PEWTERCITY_TRAINER_TIPS
	bg_event 33, 19, TEXT_PEWTERCITY_POLICE_NOTICE_SIGN
	bg_event 24, 17, TEXT_PEWTERCITY_MART_SIGN
	bg_event 14, 25, TEXT_PEWTERCITY_POKECENTER_SIGN
	bg_event 15,  9, TEXT_PEWTERCITY_MUSEUM_SIGN
	bg_event 11, 17, TEXT_PEWTERCITY_GYM_SIGN
	bg_event 25, 23, TEXT_PEWTERCITY_SIGN
	bg_event 10, 23, TEXT_PEWTERCITY_PHONE ; marcelnote - new pay phones

	def_object_events
	object_event  8, 16, SPRITE_COOLTRAINER_F, STAY, NONE, TEXT_PEWTERCITY_COOLTRAINER_F
	object_event 17, 25, SPRITE_COOLTRAINER_M, STAY, NONE, TEXT_PEWTERCITY_COOLTRAINER_M
	object_event 27, 17, SPRITE_SUPER_NERD, STAY, NONE, TEXT_PEWTERCITY_SUPER_NERD1
	object_event 26, 25, SPRITE_SUPER_NERD, WALK, LEFT_RIGHT, TEXT_PEWTERCITY_SUPER_NERD2
	object_event 35, 16, SPRITE_YOUNGSTER, STAY, DOWN, TEXT_PEWTERCITY_YOUNGSTER

	def_warps_to PEWTER_CITY
