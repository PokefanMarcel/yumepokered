; marcelnote - merged Blue's house with new Aide's house
	object_const_def
	const_export BLUESHOUSE_DAISY1
	const_export BLUESHOUSE_DAISY2
	const_export AIDESHOUSE_MIDDLE_AGED_WOMAN ; marcelnote - new Pallet house
	const_export BLUESHOUSE_TOWN_MAP

BluesAidesHouses_Object:
	db $a ; border block

	def_warp_events
	; Blue's house
	warp_event  2,  7, LAST_MAP, 2
	warp_event  3,  7, LAST_MAP, 2
	; Aide's house
	warp_event 16,  7, LAST_MAP, 5
	warp_event 17,  7, LAST_MAP, 5

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_DAISY, STAY, RIGHT, TEXT_BLUESHOUSE_DAISY_SITTING
	object_event  6,  4, SPRITE_DAISY, WALK, UP_DOWN, TEXT_BLUESHOUSE_DAISY_WALKING, 0
	object_event 18,  3, SPRITE_MIDDLE_AGED_WOMAN, STAY, RIGHT, TEXT_AIDESHOUSE_MIDDLE_AGED_WOMAN, 0 ; marcelnote - new Pallet house
	object_event  3,  3, SPRITE_POKEDEX, STAY, NONE, TEXT_BLUESHOUSE_TOWN_MAP, 0

	def_warps_to BLUES_AIDES_HOUSES
