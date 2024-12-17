; marcelnote - new location
	object_const_def
	const_export BATTLEHALL_RED
	const_export BATTLEHALL_GREEN
	const_export BATTLEHALL_RECEPTIONIST

BattleHall_Object:
	db $0e ; border block

	def_warp_events
	warp_event 11,  9, ROUTE_22_GATE, 9

	def_bg_events

	def_object_events
	object_event  4,  6, SPRITE_RED, STAY, RIGHT, TEXT_BATTLEHALL_RED, OPP_RED, 1
	object_event  4,  6, SPRITE_GREEN, STAY, RIGHT, TEXT_BATTLEHALL_GREEN, OPP_GREEN, 1
	object_event 10,  4, SPRITE_LINK_RECEPTIONIST, STAY, DOWN, TEXT_BATTLEHALL_RECEPTIONIST

	def_warps_to BATTLE_HALL
