; marcelnote - merged Saffron Pokecenter and Mart
	object_const_def
	; Pokecenter
	const_export SAFFRONPOKECENTER_NURSE
	const_export SAFFRONPOKECENTER_BEAUTY
	const_export SAFFRONPOKECENTER_GENTLEMAN
	const_export SAFFRONPOKECENTER_LINK_RECEPTIONIST
	; Mart
	const_export SAFFRONMART_CLERK
	const_export SAFFRONMART_SUPER_NERD
	const_export SAFFRONMART_COOLTRAINER_F

SaffronPokecenterMart_Object:
	db $0 ; border block

	def_warp_events
	; Pokecenter
	warp_event  3,  7, LAST_MAP, 7
	warp_event  4,  7, LAST_MAP, 7
	; Mart
	warp_event 23,  7, LAST_MAP, 5
	warp_event 24,  7, LAST_MAP, 5

	def_bg_events

	def_object_events
	; Pokecenter
	object_event  3,  1, SPRITE_NURSE, STAY, DOWN, TEXT_SAFFRONPOKECENTER_NURSE
	object_event  5,  5, SPRITE_BEAUTY, STAY, NONE, TEXT_SAFFRONPOKECENTER_BEAUTY
	object_event  8,  3, SPRITE_GENTLEMAN, STAY, DOWN, TEXT_SAFFRONPOKECENTER_GENTLEMAN
	object_event 11,  2, SPRITE_LINK_RECEPTIONIST, STAY, DOWN, TEXT_SAFFRONPOKECENTER_LINK_RECEPTIONIST
	; Mart
	object_event 20,  5, SPRITE_CLERK, STAY, RIGHT, TEXT_SAFFRONMART_CLERK
	object_event 24,  2, SPRITE_SUPER_NERD, STAY, NONE, TEXT_SAFFRONMART_SUPER_NERD
	object_event 26,  5, SPRITE_COOLTRAINER_F, WALK, ANY_DIR, TEXT_SAFFRONMART_COOLTRAINER_F

	def_warps_to SAFFRON_POKECENTER_MART
