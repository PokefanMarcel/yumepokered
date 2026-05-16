	object_const_def
	const_export FUCHSIAMEETINGROOM_SAFARI_ZONE_WORKER1
	const_export FUCHSIAMEETINGROOM_SAFARI_ZONE_WORKER2
	const_export FUCHSIAMEETINGROOM_SAFARI_ZONE_WORKER3

FuchsiaMeetingRoom_Object:
	db $0 ; border block ; marcelnote - modified blockset

	def_warp_events
	warp_event  4,  7, WARP_DOWN, LAST_MAP, 7
	warp_event  5,  7, WARP_DOWN, LAST_MAP, 7

	def_bg_events
	bg_event 11,  5, TEXT_FUCHSIAMEETINGROOM_PHONE ; marcelnote - new pay phones

	def_object_events
	object_event  4,  1, SPRITE_SAFARI_ZONE_WORKER, STAY, DOWN, TEXT_FUCHSIAMEETINGROOM_SAFARI_ZONE_WORKER1
	object_event  0,  2, SPRITE_SAFARI_ZONE_WORKER, STAY, UP, TEXT_FUCHSIAMEETINGROOM_SAFARI_ZONE_WORKER2
	object_event 10,  1, SPRITE_SAFARI_ZONE_WORKER, STAY, DOWN, TEXT_FUCHSIAMEETINGROOM_SAFARI_ZONE_WORKER3

	def_warps_to FUCHSIA_MEETING_ROOM
