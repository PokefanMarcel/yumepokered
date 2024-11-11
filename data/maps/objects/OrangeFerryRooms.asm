; marcelnote - new location
	object_const_def
	const_export ORANGEFERRYROOMS_GENTLEMAN1
	const_export ORANGEFERRYROOMS_NURSE

OrangeFerryRooms_Object:
	db $c ; border block

	def_warp_events
	warp_event 40, 11, ORANGE_FERRY_DECK, 5  ; Captain's room
	warp_event  1, 11, ORANGE_FERRY_DECK, 6  ; top rooms
	warp_event  2, 11, ORANGE_FERRY_DECK, 6
	warp_event 11, 11, ORANGE_FERRY_DECK, 7
	warp_event 12, 11, ORANGE_FERRY_DECK, 7
	warp_event 21, 11, ORANGE_FERRY_DECK, 8
	warp_event 22, 11, ORANGE_FERRY_DECK, 8
	warp_event 31, 11, ORANGE_FERRY_DECK, 9
	warp_event 32, 11, ORANGE_FERRY_DECK, 9
	warp_event  0,  0, ORANGE_FERRY_DECK, 10 ; bottom rooms
	warp_event 10,  0, ORANGE_FERRY_DECK, 11
	warp_event 20,  0, ORANGE_FERRY_DECK, 12
	warp_event 30,  0, ORANGE_FERRY_DECK, 13


	def_bg_events

	def_object_events
	object_event  0,  2, SPRITE_GENTLEMAN, STAY, RIGHT, TEXT_ORANGEFERRYROOMS_GENTLEMAN1, OPP_GENTLEMAN, 9
	object_event  2,  9, SPRITE_NURSE, STAY, DOWN, TEXT_ORANGEFERRYROOMS_NURSE

	def_warps_to ORANGE_FERRY_ROOMS
