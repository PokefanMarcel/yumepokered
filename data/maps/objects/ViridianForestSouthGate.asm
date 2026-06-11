	object_const_def
	const_export VIRIDIANFORESTSOUTHGATE_GIRL
	const_export VIRIDIANFORESTSOUTHGATE_LITTLE_GIRL

ViridianForestSouthGate_Object:
	db $0 ; border block

	def_warp_events
	warp_event  4,  0, ANY_DIR,   VIRIDIAN_FOREST, 4 ; unreachable
	warp_event  5,  0, ANY_DIR,   VIRIDIAN_FOREST, 5
	warp_event  4,  7, WARP_DOWN, LAST_MAP, 6
	warp_event  5,  7, WARP_DOWN, LAST_MAP, 6

	def_bg_events

	def_object_events
	object_event  8,  4, SPRITE_GIRL, STAY, LEFT, TEXT_VIRIDIANFORESTSOUTHGATE_GIRL
	object_event  2,  4, SPRITE_LITTLE_GIRL, WALK, UP_DOWN, TEXT_VIRIDIANFORESTSOUTHGATE_LITTLE_GIRL

	def_warps_to VIRIDIAN_FOREST_SOUTH_GATE
