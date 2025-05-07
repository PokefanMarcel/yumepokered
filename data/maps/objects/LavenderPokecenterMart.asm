; marcelnote - merged Lavender Pokecenter and Mart
	object_const_def
	; Pokecenter
	const_export LAVENDERPOKECENTER_NURSE
	const_export LAVENDERPOKECENTER_GENTLEMAN
	const_export LAVENDERPOKECENTER_LITTLE_GIRL
	const_export LAVENDERPOKECENTER_LINK_RECEPTIONIST
	const_export LAVENDERPOKECENTER_BENCH_GUY ; marcelnote - BenchGuy has a sprite
	; Mart
	const_export LAVENDERMART_CLERK
	const_export LAVENDERMART_BALDING_GUY
	const_export LAVENDERMART_COOLTRAINER_M

LavenderPokecenterMart_Object:
	db $0 ; border block

	def_warp_events
	; Pokecenter
	warp_event  3,  7, LAST_MAP, 1
	warp_event  4,  7, LAST_MAP, 1
	; Mart
	warp_event 19,  7, LAST_MAP, 4
	warp_event 20,  7, LAST_MAP, 4

	def_bg_events

	def_object_events
	; Pokecenter
	object_event  3,  1, SPRITE_NURSE, STAY, DOWN, TEXT_LAVENDERPOKECENTER_NURSE
	object_event  8,  4, SPRITE_GENTLEMAN, STAY, NONE, TEXT_LAVENDERPOKECENTER_GENTLEMAN
	object_event  2,  6, SPRITE_LITTLE_GIRL, WALK, UP_DOWN, TEXT_LAVENDERPOKECENTER_LITTLE_GIRL
	object_event  8,  2, SPRITE_LINK_RECEPTIONIST, STAY, DOWN, TEXT_LAVENDERPOKECENTER_LINK_RECEPTIONIST
	object_event  0,  5, SPRITE_BENCH_GUY, STAY, RIGHT, TEXT_LAVENDERPOKECENTER_BENCH_GUY ; marcelnote - BenchGuy has a sprite
	; Mart
	object_event 16,  5, SPRITE_CLERK, STAY, RIGHT, TEXT_LAVENDERMART_CLERK
	object_event 19,  4, SPRITE_BALDING_GUY, STAY, NONE, TEXT_LAVENDERMART_BALDING_GUY
	object_event 23,  2, SPRITE_COOLTRAINER_M, STAY, NONE, TEXT_LAVENDERMART_COOLTRAINER_M

	def_warps_to LAVENDER_POKECENTER_MART
