; marcelnote - new location
	object_const_def
	const_export MANDARINMRHYPERSHOUSE_MR_HYPER

MandarinMrHypersHouse_Object:
	db $0 ; border block

	def_warp_events
	warp_event  2,  7, WARP_DOWN, LAST_MAP, 3
	warp_event  3,  7, WARP_DOWN, LAST_MAP, 3

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_GRAMPS, STAY, RIGHT, TEXT_MANDARINMRHYPERSHOUSE_MR_HYPER
	object_event  4,  4, SPRITE_POKEDEX, STAY, NONE, TEXT_MANDARINMRHYPERSHOUSE_BOOK

	def_warps_to MANDARIN_MR_HYPERS_HOUSE
