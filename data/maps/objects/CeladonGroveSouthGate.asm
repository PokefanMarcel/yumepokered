; marcelnote - new location
	object_const_def
	const_export CELADONGROVESOUTHGATE_ROCKET
	const_export CELADONGROVESOUTHGATE_CHANNELER

CeladonGroveSouthGate_Object:
	db $a ; border block

	def_warp_events
	warp_event  5,  0, CELADON_GROVE, 1
	warp_event  4,  7, CELADON_CITY, 13
	warp_event  5,  7, CELADON_CITY, 13

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_ROCKET, STAY, DOWN, TEXT_CELADONGROVESOUTHGATE_ROCKET
	object_event  2,  4, SPRITE_CHANNELER, STAY, RIGHT, TEXT_CELADONGROVESOUTHGATE_CHANNELER

	def_warps_to CELADON_GROVE_SOUTH_GATE
