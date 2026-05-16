	object_const_def
	const_export SAFARIZONEEASTRESTHOUSE_SCIENTIST
	const_export SAFARIZONEEASTRESTHOUSE_ROCKER
	const_export SAFARIZONEEASTRESTHOUSE_SILPH_WORKER_M

SafariZoneEastRestHouse_Object:
	db $0 ; border block ; marcelnote - changed tileset from GATE

	def_warp_events
	warp_event  2,  7, WARP_DOWN, SAFARI_ZONE_EAST, 5
	warp_event  3,  7, WARP_DOWN, SAFARI_ZONE_EAST, 5

	def_bg_events

	def_object_events ; marcelnote - modified for new layout
	object_event  2,  2, SPRITE_SCIENTIST, WALK, LEFT_RIGHT, TEXT_SAFARIZONEEASTRESTHOUSE_SCIENTIST
	object_event  5,  4, SPRITE_ROCKER, STAY, NONE, TEXT_SAFARIZONEEASTRESTHOUSE_ROCKER
	object_event  6,  6, SPRITE_SILPH_WORKER_M, STAY, NONE, TEXT_SAFARIZONEEASTRESTHOUSE_SILPH_WORKER_M

	def_warps_to SAFARI_ZONE_EAST_REST_HOUSE
