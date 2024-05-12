;marcelnote - new location
	;object_const_def
	;const_export MTMOON1F_HIKER

CinnabarVolcano1F_Object:
	db $3 ; border block

	def_warp_events
	warp_event 27, 11, LAST_MAP, 6
	warp_event 27, 12, LAST_MAP, 6
	warp_event  2,  2, CINNABAR_VOLCANO_1F, 5
	warp_event  3, 13, CINNABAR_VOLCANO_1F, 6
	warp_event  2, 21, CINNABAR_VOLCANO_1F, 3
	warp_event  3, 33, CINNABAR_VOLCANO_1F, 4
	warp_event 26, 23, CINNABAR_VOLCANO_2F, 1

	def_bg_events
	bg_event  5, 25, TEXT_CINNABARVOLCANO1F_LAVA_SIGN

	def_object_events
	;object_event 18, 12, SPRITE_BOULDER, STAY, DOWN, TEXT_MTMOON1F_HIKER, OPP_HIKER, 1

	def_warps_to CINNABAR_VOLCANO_1F
