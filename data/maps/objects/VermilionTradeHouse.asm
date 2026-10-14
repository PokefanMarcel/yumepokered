	object_const_def
	const_export VERMILIONTRADEHOUSE_LITTLE_GIRL
	const_export VERMILIONTRADEHOUSE_GENTLEMAN ; marcelnote - new, explains field moves

VermilionTradeHouse_Object:
	db $0 ; border block ; marcelnote - modified blockset

	def_warp_events
	warp_event  2,  7, WARP_DOWN, LAST_MAP, 8
	warp_event  3,  7, WARP_DOWN, LAST_MAP, 8

	def_bg_events

	def_object_events
	object_event  3,  5, SPRITE_LITTLE_GIRL, STAY, UP, TEXT_VERMILIONTRADEHOUSE_LITTLE_GIRL
	object_event  2,  3, SPRITE_GENTLEMAN, STAY, RIGHT, TEXT_VERMILIONTRADEHOUSE_GENTLEMAN ; marcelnote - new

	def_warps_to VERMILION_TRADE_HOUSE
