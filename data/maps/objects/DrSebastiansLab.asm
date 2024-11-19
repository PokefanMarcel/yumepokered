; marcelnote - new map
	object_const_def
	;const_export OAKSLAB_RIVAL

DrSebastiansLab_Object:
	db $3 ; border block

	def_warp_events
	warp_event  4,  7, LAST_MAP, 3
	warp_event  5,  7, LAST_MAP, 3

	def_bg_events

	def_object_events
	;object_event  4,  3, SPRITE_BLUE, STAY, NONE, TEXT_OAKSLAB_RIVAL, OPP_RIVAL1, 1

	def_warps_to DR_SEBASTIANS_LAB
