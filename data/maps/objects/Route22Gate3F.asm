; marcelnote - new location
	object_const_def
	const_export ROUTE22GATE3F_RECEPTIONIST

Route22Gate3F_Object:
	db $0e ; border block

	def_warp_events
	warp_event 11,  9, ROUTE_22_GATE, 9

	def_bg_events

	def_object_events
	object_event  6,  6, SPRITE_LINK_RECEPTIONIST, STAY, LEFT, TEXT_ROUTE22GATE3F_RECEPTIONIST

	def_warps_to ROUTE_22_GATE_3F
