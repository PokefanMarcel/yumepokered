	object_const_def
	;const_export COPYCATSHOUSE1F_MIDDLE_AGED_WOMAN

PalletHouses_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 4
	warp_event  3,  7, LAST_MAP, 4
	warp_event  7,  1, PALLET_HOUSES, 4
	warp_event 21,  1, PALLET_HOUSES, 3
	;warp_event 30,  7, LAST_MAP, 5
	;warp_event 31,  7, LAST_MAP, 5

	def_bg_events

	def_object_events
	;object_event  2,  2, SPRITE_MIDDLE_AGED_WOMAN, STAY, DOWN, TEXT_COPYCATSHOUSE1F_MIDDLE_AGED_WOMAN
	;object_event  5,  4, SPRITE_MIDDLE_AGED_MAN, STAY, LEFT, TEXT_COPYCATSHOUSE1F_MIDDLE_AGED_MAN
	;object_event  1,  4, SPRITE_FAIRY, WALK, UP_DOWN, TEXT_COPYCATSHOUSE1F_CHANSEY

	def_warps_to PALLET_HOUSES
