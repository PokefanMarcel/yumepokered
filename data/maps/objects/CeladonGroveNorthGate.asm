; marcelnote - new location
	object_const_def
	;const_export VIRIDIANFORESTSOUTHGATE_GIRL

CeladonGroveNorthGate_Object:
	db $a ; border block

	def_warp_events
	warp_event  5,  0, ROUTE_3, 1
	warp_event  4,  7, CELADON_GROVE, 3
	warp_event  5,  7, CELADON_GROVE, 4

	def_bg_events

	def_object_events
	;object_event  8,  4, SPRITE_GIRL, STAY, LEFT, TEXT_VIRIDIANFORESTSOUTHGATE_GIRL

	def_warps_to CELADON_GROVE_NORTH_GATE
