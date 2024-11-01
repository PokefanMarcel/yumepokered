; marcelnote - merged Cinnabar Pokecenter and Mart
	object_const_def
	const_export CINNABARPOKECENTER_NURSE
	const_export CINNABARPOKECENTER_COOLTRAINER_F
	const_export CINNABARPOKECENTER_GENTLEMAN
	const_export CINNABARPOKECENTER_LINK_RECEPTIONIST
	const_export CINNABARMART_CLERK
	const_export CINNABARMART_SILPH_WORKER_F
	const_export CINNABARMART_SCIENTIST

CinnabarPokecenterMart_Object:
	db $0 ; border block

	def_warp_events
	; Pokecenter
	warp_event  3,  7, LAST_MAP, 4
	warp_event  4,  7, LAST_MAP, 4
	; Mart
	warp_event 23,  7, LAST_MAP, 5
	warp_event 24,  7, LAST_MAP, 5

	def_bg_events

	def_object_events
	; Pokecenter
	object_event  3,  1, SPRITE_NURSE, STAY, DOWN, TEXT_CINNABARPOKECENTER_NURSE
	object_event  9,  4, SPRITE_COOLTRAINER_F, WALK, ANY_DIR, TEXT_CINNABARPOKECENTER_COOLTRAINER_F
	object_event  2,  6, SPRITE_GENTLEMAN, STAY, NONE, TEXT_CINNABARPOKECENTER_GENTLEMAN
	object_event 11,  2, SPRITE_LINK_RECEPTIONIST, STAY, DOWN, TEXT_CINNABARPOKECENTER_LINK_RECEPTIONIST
	; Mart
	object_event 20,  5, SPRITE_CLERK, STAY, RIGHT, TEXT_CINNABARMART_CLERK
	object_event 26,  2, SPRITE_SILPH_WORKER_F, STAY, NONE, TEXT_CINNABARMART_SILPH_WORKER_F
	object_event 23,  4, SPRITE_SCIENTIST, STAY, NONE, TEXT_CINNABARMART_SCIENTIST

	def_warps_to CINNABAR_POKECENTER_MART
