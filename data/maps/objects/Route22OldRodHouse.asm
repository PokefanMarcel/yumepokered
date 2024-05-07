; marcelnote - new location
	object_const_def
	const_export ROUTE22OLDRODHOUSE_FISHING_GURU

Route22OldRodHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 2
	warp_event  3,  7, LAST_MAP, 2

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_FISHING_GURU, STAY, RIGHT, TEXT_ROUTE22OLDRODHOUSE_FISHING_GURU

	def_warps_to ROUTE_22_OLD_ROD_HOUSE
