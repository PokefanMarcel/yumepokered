; marcelnote - merged Pidgey house and Mr Psychic's house
	object_const_def
	; Pidgey house
	const_export SAFFRONPIDGEYHOUSE_BRUNETTE_GIRL
	const_export SAFFRONPIDGEYHOUSE_PIDGEY
	const_export SAFFRONPIDGEYHOUSE_YOUNGSTER
	const_export SAFFRONPIDGEYHOUSE_PAPER
	; Mr Psychic's house
	const_export MRPSYCHICSHOUSE_MR_PSYCHIC

SaffronHouses_Object:
	db $0 ; border block ; marcelnote - modified blockset

	def_warp_events
	; Pidgey house
	warp_event  2,  7, WARP_DOWN, LAST_MAP, 4
	warp_event  3,  7, WARP_DOWN, LAST_MAP, 4
	; Mr Psychic's house
	warp_event 16,  7, WARP_DOWN, LAST_MAP, 8
	warp_event 17,  7, WARP_DOWN, LAST_MAP, 8

	def_bg_events

	def_object_events
	; Pidgey house
	object_event  2,  3, SPRITE_BRUNETTE_GIRL, STAY, RIGHT, TEXT_SAFFRONPIDGEYHOUSE_BRUNETTE_GIRL
	object_event  0,  4, SPRITE_BIRD, WALK, UP_DOWN, TEXT_SAFFRONPIDGEYHOUSE_PIDGEY
	object_event  4,  1, SPRITE_YOUNGSTER, STAY, DOWN, TEXT_SAFFRONPIDGEYHOUSE_YOUNGSTER
	object_event  3,  3, SPRITE_PAPER, STAY, NONE, TEXT_SAFFRONPIDGEYHOUSE_PAPER
	; Mr Psychic's house
	object_event 19,  3, SPRITE_FISHING_GURU, STAY, LEFT, TEXT_MRPSYCHICSHOUSE_MR_PSYCHIC

	def_warps_to SAFFRON_HOUSES
