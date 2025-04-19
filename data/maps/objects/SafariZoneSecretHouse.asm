	object_const_def
	const_export SAFARIZONESECRETHOUSE_FISHING_GURU
	const_export SAFARIZONESECRETHOUSE_POSTER ; marcelnote - new

SafariZoneSecretHouse_Object:
	db $0 ; border block ; marcelnote - tileset was changed from LAB to BEACH_HOUSE

	def_warp_events
	warp_event  2,  7, SAFARI_ZONE_WEST, 7
	warp_event  3,  7, SAFARI_ZONE_WEST, 7

	def_bg_events
	bg_event  3,  0, TEXT_SAFARIZONESECRETHOUSE_POSTER ; marcelnote - new

	def_object_events
	object_event  2,  3, SPRITE_FISHING_GURU, STAY, DOWN, TEXT_SAFARIZONESECRETHOUSE_FISHING_GURU ; marcelnote - was 3,  3

	def_warps_to SAFARI_ZONE_SECRET_HOUSE
