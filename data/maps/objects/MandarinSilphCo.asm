; marcelnote - new location
	object_const_def
	;const_export CELADONMANSION1F_GRANNY

MandarinSilphCo_Object:
	db $0 ; border block

	def_warp_events
	warp_event  4, 49, LAST_MAP, 5
	warp_event  5, 49, LAST_MAP, 5

	def_bg_events
	;bg_event  4,  9, TEXT_CELADONMANSION1F_MANAGERS_SUITE_SIGN

	def_object_events
	;object_event  1,  5, SPRITE_GRANNY, STAY, DOWN, TEXT_CELADONMANSION1F_GRANNY

	def_warps_to MANDARIN_SILPH_CO
