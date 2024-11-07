; marcelnote - merged Route12Gate floors
	object_const_def
	const_export ROUTE12GATE1F_GUARD
	const_export ROUTE12GATE2F_BRUNETTE_GIRL

Route12Gate_Object:
	db $a ; border block

	def_warp_events
	warp_event  4,  0, LAST_MAP, 1
	warp_event  5,  0, LAST_MAP, 2
	warp_event  4,  7, LAST_MAP, 3
	warp_event  5,  7, LAST_MAP, 3
	warp_event  8,  6, ROUTE_12_GATE, 6
	warp_event 21,  7, ROUTE_12_GATE, 5

	def_bg_events
	; marcelnote - binoculars are handled as hidden object

	def_object_events
	object_event  1,  3, SPRITE_GUARD, STAY, NONE, TEXT_ROUTE12GATE1F_GUARD
	object_event 17,  4, SPRITE_BRUNETTE_GIRL, WALK, UP_DOWN, TEXT_ROUTE12GATE2F_BRUNETTE_GIRL

	def_warps_to ROUTE_12_GATE
