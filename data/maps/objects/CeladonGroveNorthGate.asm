; marcelnote - new location
	object_const_def
	const_export CELADONGROVENORTHGATE_HIKER

CeladonGroveNorthGate_Object:
	db $a ; border block

	def_warp_events
	warp_event  5,  0, ROUTE_3, 1
	warp_event  4,  7, CELADON_GROVE, 3
	warp_event  5,  7, CELADON_GROVE, 4

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_HIKER, WALK, LEFT_RIGHT, TEXT_CELADONGROVENORTHGATE_HIKER
	; marcelnote - aybe add a new OAK AIDE with new item, e.g. VS SEEKER?

	def_warps_to CELADON_GROVE_NORTH_GATE
