; marcelnote - new location
	object_const_def
	;const_export ORANGEFERRY1F_WAITER
	const_export ORANGEFERRYDECK_SAILOR

OrangeFerryDeck_Object:
	db $c ; border block

	def_warp_events
	warp_event 16,  0, LAST_MAP, 2
	warp_event 17,  0, LAST_MAP, 2
	warp_event  0,  5, ORANGE_FERRY_OUTSIDE, 1
	warp_event 27,  5, ORANGE_FERRY_OUTSIDE, 2
	warp_event  5,  6, ORANGE_FERRY_ROOMS, 1 ; Captain's room
	warp_event  5,  3, ORANGE_FERRY_ROOMS, 2 ; top rooms
	warp_event  9,  3, ORANGE_FERRY_ROOMS, 4
	warp_event 13,  3, ORANGE_FERRY_ROOMS, 6
	warp_event 21,  3, ORANGE_FERRY_ROOMS, 8
	warp_event  9,  6, ORANGE_FERRY_ROOMS, 10 ; bottom rooms
	warp_event 13,  6, ORANGE_FERRY_ROOMS, 11
	warp_event 17,  6, ORANGE_FERRY_ROOMS, 12
	warp_event 21,  6, ORANGE_FERRY_ROOMS, 13

	def_bg_events

	def_object_events
	;object_event  4,  6, SPRITE_WAITER, WALK, LEFT_RIGHT, TEXT_ORANGEFERRYDECK_WAITER
	object_event 17,  1, SPRITE_SAILOR, STAY, DOWN, TEXT_ORANGEFERRYDECK_SAILOR

	def_warps_to ORANGE_FERRY_DECK
