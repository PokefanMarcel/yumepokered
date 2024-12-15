; marcelnote - new location
	object_const_def
	const_export ROUTE22GATE3F_RED
	const_export ROUTE22GATE3F_GREEN
	const_export ROUTE22GATE3F_RECEPTIONIST

Route22Gate3F_Object:
	db $0e ; border block

	def_warp_events
	warp_event 11,  9, ROUTE_22_GATE, 9

	def_bg_events

	def_object_events
	object_event  4,  6, SPRITE_RED, STAY, RIGHT, TEXT_ROUTE22GATE3F_RED, OPP_BUG_CATCHER, 1     ; test trainer for now
	object_event  4,  6, SPRITE_GREEN, STAY, RIGHT, TEXT_ROUTE22GATE3F_GREEN, OPP_BUG_CATCHER, 1 ; test trainer for now
	object_event 10,  4, SPRITE_LINK_RECEPTIONIST, STAY, DOWN, TEXT_ROUTE22GATE3F_RECEPTIONIST

	def_warps_to ROUTE_22_GATE_3F
