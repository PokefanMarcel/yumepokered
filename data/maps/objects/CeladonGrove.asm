; marcelnote - new location
	object_const_def
;	const_export VIRIDIANFOREST_YOUNGSTER1

CeladonGrove_Object:
	db $3 ; border block

	def_warp_events
	warp_event 38, 47, CELADON_GROVE_SOUTH_GATE, 1
	warp_event 39, 47, CELADON_GROVE_SOUTH_GATE, 1
	warp_event  4,  0, CELADON_GROVE_NORTH_GATE, 2
	warp_event  5,  0, CELADON_GROVE_NORTH_GATE, 3

	def_bg_events
	;bg_event 24, 40, TEXT_VIRIDIANFOREST_TRAINER_TIPS1

	def_object_events
	;object_event 16, 43, SPRITE_YOUNGSTER, STAY, NONE, TEXT_VIRIDIANFOREST_YOUNGSTER1

	def_warps_to CELADON_GROVE
