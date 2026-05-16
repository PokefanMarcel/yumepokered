	object_const_def
	const_export SAFARIZONECENTER_NUGGET

SafariZoneCenter_Object:
	db $0 ; border block

	def_warp_events
	warp_event 14, 25, WARP_DOWN,  SAFARI_ZONE_GATE, 3
	warp_event 15, 25, WARP_DOWN,  SAFARI_ZONE_GATE, 4
	warp_event  0, 10, WARP_LEFT,  SAFARI_ZONE_WEST, 5
	warp_event  0, 11, WARP_LEFT,  SAFARI_ZONE_WEST, 6
	warp_event 14,  0, WARP_UP,    SAFARI_ZONE_NORTH, 5
	warp_event 15,  0, WARP_UP,    SAFARI_ZONE_NORTH, 6
	warp_event 29, 10, WARP_RIGHT, SAFARI_ZONE_EAST, 3
	warp_event 29, 11, WARP_RIGHT, SAFARI_ZONE_EAST, 4
	warp_event 17, 19, ANY_DIR,    SAFARI_ZONE_CENTER_REST_HOUSE, 1

	def_bg_events
	bg_event 18, 20, TEXT_SAFARIZONECENTER_REST_HOUSE_SIGN
	bg_event 14, 22, TEXT_SAFARIZONECENTER_TRAINER_TIPS_SIGN

	def_object_events
	object_event 14, 10, SPRITE_POKE_BALL, STAY, NONE, TEXT_SAFARIZONECENTER_NUGGET, NUGGET

	def_warps_to SAFARI_ZONE_CENTER
