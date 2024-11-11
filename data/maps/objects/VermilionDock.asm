	object_const_def
	const_export VERMILIONDOCK_SAILOR ; marcelnote - new

VermilionDock_Object:
	db $f ; border block

	def_warp_events
	warp_event 38,  0, VERMILION_CITY, 10    ; marcelnote - new dock
	warp_event 38,  3, ORANGE_FERRY_DECK, 1  ; marcelnote - new dock
	warp_event 14,  0, VERMILION_CITY, 6     ; marcelnote - was LAST_MAP
	warp_event 14,  2, SS_ANNE_1F, 2

	def_bg_events

	def_object_events
	object_event 38,  3, SPRITE_SAILOR, STAY, UP, TEXT_VERMILIONDOCK_SAILOR ; marcelnote - new

	def_warps_to VERMILION_DOCK
