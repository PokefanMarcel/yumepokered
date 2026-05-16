MtMoonB1F_Object:
	db $3 ; border block

	def_warp_events
	warp_event  5,  5, ANY_DIR, MT_MOON_1F, 3
	warp_event 17, 11, ANY_DIR, MT_MOON_B2F, 1
	warp_event 25,  9, ANY_DIR, MT_MOON_1F, 4
	warp_event 25, 15, ANY_DIR, MT_MOON_1F, 5
	warp_event 21, 17, ANY_DIR, MT_MOON_B2F, 2
	warp_event 13, 27, ANY_DIR, MT_MOON_B2F, 3
	warp_event 23,  3, ANY_DIR, MT_MOON_B2F, 4
	warp_event 27,  3, ANY_DIR, ROUTE_4, 3 ; marcelnote - added Mt Moon Square
	warp_event  3, 23, ANY_DIR, MT_MOON_B2F, 5 ; marcelnote - added Mt Moon Square
	warp_event  1, 27, ANY_DIR, MT_MOON_SQUARE, 1 ; marcelnote - added Mt Moon Square

	def_bg_events

	def_object_events

	def_warps_to MT_MOON_B1F
