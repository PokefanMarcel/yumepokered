	object_const_def
	const_export SAFARIZONECENTERRESTHOUSE_GIRL
	const_export SAFARIZONECENTERRESTHOUSE_SCIENTIST

SafariZoneCenterRestHouse_Object:
	db $0 ; border block ; marcelnote - changed tileset from GATE

	def_warp_events
	warp_event  2,  7, WARP_DOWN, SAFARI_ZONE_CENTER, 9
	warp_event  3,  7, WARP_DOWN, SAFARI_ZONE_CENTER, 9

	def_bg_events

	def_object_events ; marcelnote - modified for new layout
	object_event  3,  2, SPRITE_GIRL, STAY, DOWN, TEXT_SAFARIZONECENTERRESTHOUSE_GIRL
	object_event  1,  4, SPRITE_SCIENTIST, WALK, LEFT_RIGHT, TEXT_SAFARIZONECENTERRESTHOUSE_SCIENTIST

	def_warps_to SAFARI_ZONE_CENTER_REST_HOUSE
