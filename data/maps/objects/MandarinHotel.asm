; marcelnote - new location
	object_const_def
	;const_export CELADONMANSION1F_GRANNY

MandarinHotel_Object:
	db $f ; border block

	def_warp_events
	; 1F
	warp_event  4, 11, LAST_MAP, 4
	warp_event  5, 11, LAST_MAP, 4
	warp_event  8,  2, MANDARIN_HOTEL,  4 ; stairs to 2F
	; 2F
	warp_event 24,  0, MANDARIN_HOTEL,  3 ; stairs to 1F ; warp 4
	warp_event 25,  0, MANDARIN_HOTEL, 12 ; stairs to 3F
	warp_event 18,  0, MANDARIN_HOTEL,  8 ; door to left room
	warp_event 22,  0, MANDARIN_HOTEL, 10 ; door to right room
	warp_event 18, 11, MANDARIN_HOTEL,  6 ; left room entrance
	warp_event 19, 11, MANDARIN_HOTEL,  6 ; left room entrance
	warp_event 28, 11, MANDARIN_HOTEL,  7 ; right room entrance
	warp_event 29, 11, MANDARIN_HOTEL,  7 ; right room entrance
	; 3F
	warp_event 45,  0, MANDARIN_HOTEL,  5 ; stairs to 2F ; warp 12
	warp_event 44,  0, MANDARIN_HOTEL, 20 ; stairs to 4F
	warp_event 38,  0, MANDARIN_HOTEL, 16 ; door to left room
	warp_event 42,  0, MANDARIN_HOTEL, 18 ; door to right room
	warp_event 38, 11, MANDARIN_HOTEL, 14 ; left room entrance
	warp_event 39, 11, MANDARIN_HOTEL, 14 ; left room entrance
	warp_event 48, 11, MANDARIN_HOTEL, 15 ; right room entrance
	warp_event 49, 11, MANDARIN_HOTEL, 15 ; right room entrance
	; 4F
	warp_event 64,  0, MANDARIN_HOTEL, 13 ; stairs to 3F ; warp 20
	warp_event 62,  0, MANDARIN_HOTEL, 22 ; door to room
	warp_event 62, 11, MANDARIN_HOTEL, 21 ; room entrance
	warp_event 63, 11, MANDARIN_HOTEL, 21 ; room entrance

	def_bg_events
	bg_event 23,  0, TEXT_MANDARINHOTEL2F_ROOM_11
	bg_event 19,  0, TEXT_MANDARINHOTEL2F_ROOM_12
	bg_event 43,  0, TEXT_MANDARINHOTEL3F_ROOM_21
	bg_event 39,  0, TEXT_MANDARINHOTEL3F_ROOM_22
	bg_event 63,  0, TEXT_MANDARINHOTEL4F_SUITE

	def_object_events
	object_event  1,  7, SPRITE_WAITER, STAY, RIGHT, TEXT_MANDARINHOTEL1F_WAITER

	def_warps_to MANDARIN_HOTEL
