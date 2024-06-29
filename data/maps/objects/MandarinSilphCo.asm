; marcelnote - new location
	object_const_def
	;const_export CELADONMANSION1F_GRANNY

MandarinSilphCo_Object:
	db $0 ; border block

	def_warp_events
	warp_event  4, 49, LAST_MAP, 5
	warp_event  5, 49, LAST_MAP, 5
	warp_event  6, 42, MANDARIN_SILPH_CO, 4 ; stairs 1F -> 2F
	warp_event  6, 28, MANDARIN_SILPH_CO, 3 ; stairs 2F -> 1F
	warp_event  7, 28, MANDARIN_SILPH_CO, 6 ; stairs 2F -> 3F
	warp_event  7, 14, MANDARIN_SILPH_CO, 5 ; stairs 3F -> 2F
	warp_event  6, 14, MANDARIN_SILPH_CO, 8 ; stairs 3F -> 4F
	warp_event  6,  0, MANDARIN_SILPH_CO, 7 ; stairs 4F -> 3F

	def_bg_events
	;bg_event  4,  9, TEXT_CELADONMANSION1F_MANAGERS_SUITE_SIGN

	def_object_events
	;object_event  1,  5, SPRITE_GRANNY, STAY, DOWN, TEXT_CELADONMANSION1F_GRANNY

	def_warps_to MANDARIN_SILPH_CO
