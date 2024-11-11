; marcelnote - new location
	object_const_def
	const_export MANDARINDOCK_SAILOR

MandarinDock_Object:
	db $f ; border block

	def_warp_events
	warp_event 10,  0, MANDARIN_ISLAND, 7
	warp_event 10,  3, ORANGE_FERRY_DECK, 1

	def_bg_events

	def_object_events
	object_event 10,  3, SPRITE_SAILOR, STAY, UP, TEXT_MANDARINDOCK_SAILOR

	def_warps_to MANDARIN_DOCK
