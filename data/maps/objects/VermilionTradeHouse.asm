	object_const_def
	const_export VERMILIONTRADEHOUSE_LITTLE_GIRL

VermilionTradeHouse_Object:
	db $0 ; border block ; marcelnote - modified blockset

	def_warp_events
	warp_event  2,  7, LAST_MAP, 8
	warp_event  3,  7, LAST_MAP, 8

	def_bg_events

	def_object_events
	object_event  3,  5, SPRITE_LITTLE_GIRL, STAY, UP, TEXT_VERMILIONTRADEHOUSE_LITTLE_GIRL

	def_warps_to VERMILION_TRADE_HOUSE
