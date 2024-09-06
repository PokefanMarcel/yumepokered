; new location
	object_const_def
	;const_export ROCKETHIDEOUTB1F_ROCKET1
	;const_export ROCKETHIDEOUTB1F_ESCAPE_ROPE

MandarinSilphFactory_Object:
	db $2e ; border block

	def_warp_events
	warp_event 10, 27, MANDARIN_ISLAND, 6
	warp_event 11, 27, MANDARIN_ISLAND, 6

	def_bg_events

	def_object_events
	;object_event 26,  8, SPRITE_ROCKET, STAY, LEFT, TEXT_ROCKETHIDEOUTB1F_ROCKET1, OPP_ROCKET, 8
	;object_event 11, 14, SPRITE_POKE_BALL, STAY, NONE, TEXT_ROCKETHIDEOUTB1F_ESCAPE_ROPE, ESCAPE_ROPE

	def_warps_to MANDARIN_SILPH_FACTORY
