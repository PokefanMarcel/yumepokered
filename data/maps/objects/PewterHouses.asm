; marcelnote - merged Pewter houses
	object_const_def
	; Nidoran house
	const_export PEWTERNIDORANHOUSE_NIDORAN
	const_export PEWTERNIDORANHOUSE_LITTLE_BOY
	const_export PEWTERNIDORANHOUSE_MIDDLE_AGED_MAN
	; Speech house
	const_export PEWTERSPEECHHOUSE_GAMBLER
	const_export PEWTERSPEECHHOUSE_YOUNGSTER

PewterHouses_Object:
	db $0 ; border block ; marcelnote - modified blockset

	def_warp_events
	; Nidoran house
	warp_event  2,  7, WARP_DOWN, LAST_MAP, 4
	warp_event  3,  7, WARP_DOWN, LAST_MAP, 4
	; Speech house
	warp_event 16,  7, WARP_DOWN, LAST_MAP, 6
	warp_event 17,  7, WARP_DOWN, LAST_MAP, 6

	def_bg_events

	def_object_events
	; Nidoran house
	object_event  4,  5, SPRITE_MONSTER, STAY, LEFT, TEXT_PEWTERNIDORANHOUSE_NIDORAN
	object_event  3,  5, SPRITE_LITTLE_BOY, STAY, RIGHT, TEXT_PEWTERNIDORANHOUSE_LITTLE_BOY
	object_event  1,  2, SPRITE_MIDDLE_AGED_MAN, STAY, NONE, TEXT_PEWTERNIDORANHOUSE_MIDDLE_AGED_MAN
	; Speech house
	object_event 16,  3, SPRITE_GAMBLER, STAY, RIGHT, TEXT_PEWTERSPEECHHOUSE_GAMBLER
	object_event 18,  5, SPRITE_YOUNGSTER, STAY, NONE, TEXT_PEWTERSPEECHHOUSE_YOUNGSTER

	def_warps_to PEWTER_HOUSES
