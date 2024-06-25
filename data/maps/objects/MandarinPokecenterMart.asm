; marcelnote - new location
	object_const_def
	const_export MANDARINPOKECENTER_NURSE
	;const_export MANDARINPOKECENTERMART_GENTLEMAN
	const_export MANDARINPOKECENTER_LINK_RECEPTIONIST
	const_export MANDARINMART_CLERK

MandarinPokecenterMart_Object:
	db $0 ; border block

	def_warp_events
	; Pokecenter
	warp_event  3,  7, LAST_MAP, 1
	warp_event  4,  7, LAST_MAP, 1
	; Mart
	warp_event 23,  7, LAST_MAP, 2
	warp_event 24,  7, LAST_MAP, 2

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, STAY, DOWN, TEXT_MANDARINPOKECENTER_NURSE
	;object_event 10,  5, SPRITE_GENTLEMAN, WALK, UP_DOWN, TEXT_MANDARINPOKECENTER_GENTLEMAN
	object_event 11,  2, SPRITE_LINK_RECEPTIONIST, STAY, DOWN, TEXT_MANDARINPOKECENTER_LINK_RECEPTIONIST
	object_event 20,  5, SPRITE_CLERK, STAY, RIGHT, TEXT_MANDARINMART_CLERK

	def_warps_to MANDARIN_POKECENTER_MART
