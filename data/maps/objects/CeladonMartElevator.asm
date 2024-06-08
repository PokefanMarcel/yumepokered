CeladonMartElevator_Object:
	db $f ; border block

	def_warp_events
	warp_event  1,  3, CELADON_MART_1F2F3F, 6 ; marcelnote - merged 1F 2F 3F
	warp_event  2,  3, CELADON_MART_1F2F3F, 6

	def_bg_events
	bg_event  3,  0, TEXT_CELADONMARTELEVATOR

	def_object_events

	def_warps_to CELADON_MART_ELEVATOR
