; marcelnote - merged Viridian Pokecenter and Mart
	object_const_def
	; Pokecenter
	const_export VIRIDIANPOKECENTER_NURSE
	const_export VIRIDIANPOKECENTER_GENTLEMAN
	const_export VIRIDIANPOKECENTER_COOLTRAINER_M
	const_export VIRIDIANPOKECENTER_LINK_RECEPTIONIST
	const_export VIRIDIANPOKECENTER_BENCH_GUY ; marcelnote - BenchGuy has a sprite
	; Mart
	const_export VIRIDIANMART_CLERK
	const_export VIRIDIANMART_YOUNGSTER
	const_export VIRIDIANMART_COOLTRAINER_M

ViridianPokecenterMart_Object:
	db $0 ; border block

	def_warp_events
	; Pokecenter
	warp_event  3,  7, LAST_MAP, 1
	warp_event  4,  7, LAST_MAP, 1
	; Mart
	warp_event 19,  7, LAST_MAP, 2
	warp_event 20,  7, LAST_MAP, 2

	def_bg_events

	def_object_events
	; Pokecenter
	object_event  3,  1, SPRITE_NURSE, STAY, DOWN, TEXT_VIRIDIANPOKECENTER_NURSE
	object_event  6,  4, SPRITE_GENTLEMAN, WALK, UP_DOWN, TEXT_VIRIDIANPOKECENTER_GENTLEMAN
	object_event  7,  6, SPRITE_COOLTRAINER_M, STAY, NONE, TEXT_VIRIDIANPOKECENTER_COOLTRAINER_M
	object_event  8,  2, SPRITE_LINK_RECEPTIONIST, STAY, DOWN, TEXT_VIRIDIANPOKECENTER_LINK_RECEPTIONIST
	object_event  0,  5, SPRITE_BENCH_GUY, STAY, RIGHT, TEXT_VIRIDIANPOKECENTER_BENCH_GUY ; marcelnote - BenchGuy has a sprite
	; Mart
	object_event 16,  5, SPRITE_CLERK, STAY, RIGHT, TEXT_VIRIDIANMART_CLERK
	object_event 21,  5, SPRITE_YOUNGSTER, WALK, UP_DOWN, TEXT_VIRIDIANMART_YOUNGSTER
	object_event 19,  3, SPRITE_COOLTRAINER_M, STAY, NONE, TEXT_VIRIDIANMART_COOLTRAINER_M

	def_warps_to VIRIDIAN_POKECENTER_MART
