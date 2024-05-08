;marcelnote - new location
	;object_const_def
	;const_export MTMOON1F_HIKER

CinnabarVolcano1F_Object:
	db $3 ; border block

	def_warp_events
	warp_event  4,  9, LAST_MAP, 6
	warp_event  5,  9, LAST_MAP, 6

	def_bg_events
	;bg_event 15, 23, TEXT_MTMOON1F_BEWARE_ZUBAT_SIGN

	def_object_events
	;object_event  5,  6, SPRITE_HIKER, STAY, DOWN, TEXT_MTMOON1F_HIKER, OPP_HIKER, 1

	def_warps_to CINNABAR_VOLCANO_1F
