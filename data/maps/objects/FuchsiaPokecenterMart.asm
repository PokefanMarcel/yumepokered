; marcelnote - merged Fuchsia Pokecenter and Mart
	object_const_def
	; Pokecenter
	const_export FUCHSIAPOKECENTER_NURSE
	const_export FUCHSIAPOKECENTER_ROCKER
	const_export FUCHSIAPOKECENTER_COOLTRAINER_F
	const_export FUCHSIAPOKECENTER_LINK_RECEPTIONIST
	; Mart
	const_export FUCHSIAMART_CLERK
	const_export FUCHSIAMART_MIDDLE_AGED_MAN
	const_export FUCHSIAMART_COOLTRAINER_F

FuchsiaPokecenterMart_Object:
	db $0 ; border block

	def_warp_events
	; Pokecenter
	warp_event  3,  7, LAST_MAP, 3
	warp_event  4,  7, LAST_MAP, 3
	; Mart
	warp_event 23,  7, LAST_MAP, 1
	warp_event 24,  7, LAST_MAP, 1

	def_bg_events

	def_object_events
	; Pokecenter
	object_event  3,  1, SPRITE_NURSE, STAY, DOWN, TEXT_FUCHSIAPOKECENTER_NURSE
	object_event  2,  3, SPRITE_ROCKER, STAY, NONE, TEXT_FUCHSIAPOKECENTER_ROCKER
	object_event  6,  5, SPRITE_COOLTRAINER_F, WALK, LEFT_RIGHT, TEXT_FUCHSIAPOKECENTER_COOLTRAINER_F
	object_event 11,  2, SPRITE_LINK_RECEPTIONIST, STAY, DOWN, TEXT_FUCHSIAPOKECENTER_LINK_RECEPTIONIST
	; Mart
	object_event 20,  5, SPRITE_CLERK, STAY, RIGHT, TEXT_FUCHSIAMART_CLERK
	object_event 24,  2, SPRITE_MIDDLE_AGED_MAN, STAY, NONE, TEXT_FUCHSIAMART_MIDDLE_AGED_MAN
	object_event 26,  5, SPRITE_COOLTRAINER_F, WALK, UP_DOWN, TEXT_FUCHSIAMART_COOLTRAINER_F

	def_warps_to FUCHSIA_POKECENTER_MART
