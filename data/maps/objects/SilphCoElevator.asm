SilphCoElevator_Object:
	db $f ; border block

	def_warp_events
	warp_event  1,  3, SILPH_CO_1F, 1 ; marcelnote - replaced UNUSED_MAP_ED, what does this do?
	warp_event  2,  3, SILPH_CO_1F, 1

	def_bg_events
	bg_event  3,  0, TEXT_SILPHCOELEVATOR_ELEVATOR

	def_object_events

	def_warps_to SILPH_CO_ELEVATOR
