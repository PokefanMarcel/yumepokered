CeladonMansionRoof_Object:
	db $9 ; border block

	def_warp_events
	warp_event  6,  1, CELADON_MANSION, 15 ; marcelnote - merged Celadon Mansion floors and added 4F
	warp_event  2,  1, CELADON_MANSION, 17 ; marcelnote - merged Celadon Mansion floors and added 4F
	warp_event  2,  7, CELADON_MANSION_ROOF_HOUSE, 1

	def_bg_events
	bg_event  3,  7, TEXT_CELADONMANSIONROOF_HOUSE_SIGN

	def_object_events

	def_warps_to CELADON_MANSION_ROOF
