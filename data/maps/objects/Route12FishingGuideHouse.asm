; marcelnote - from Super Rod to Fishing guide
	object_const_def
	const_export ROUTE12FISHINGGUIDEHOUSE_FISHING_GUIDE

Route12FishingGuideHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 4
	warp_event  3,  7, LAST_MAP, 4

	def_bg_events

	def_object_events
	object_event  3, 3, SPRITE_POKEDEX, STAY, NONE, TEXT_ROUTE12FISHINGGUIDEHOUSE_FISHING_GUIDE

	def_warps_to ROUTE_12_FISHING_GUIDE_HOUSE
