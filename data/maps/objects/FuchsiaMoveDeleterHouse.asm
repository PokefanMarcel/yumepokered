; marcelnote - new location
	object_const_def
	const_export FUCHSIAMOVEDELETERHOUSE_MOVE_DELETER

FuchsiaMoveDeleterHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 10
	warp_event  3,  7, LAST_MAP, 10

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_MIDDLE_AGED_MAN, STAY, RIGHT, TEXT_FUCHSIAMOVEDELETERHOUSE_MOVE_DELETER

	def_warps_to FUCHSIA_MOVE_DELETER_HOUSE
