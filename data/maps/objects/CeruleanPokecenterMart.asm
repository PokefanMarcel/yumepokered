; marcelnote - merged Cerulean Pokecenter and Mart
	object_const_def
	; Pokecenter
	const_export CERULEANPOKECENTER_NURSE
	const_export CERULEANPOKECENTER_SUPER_NERD
	const_export CERULEANPOKECENTER_GENTLEMAN
	const_export CERULEANPOKECENTER_LINK_RECEPTIONIST
	const_export CERULEANPOKECENTER_BENCH_GUY ; marcelnote - BenchGuy has a sprite
	; Mart
	const_export CERULEANMART_CLERK
	const_export CERULEANMART_COOLTRAINER_M
	const_export CERULEANMART_COOLTRAINER_F

CeruleanPokecenterMart_Object:
	db $0 ; border block

	def_warp_events
	; Pokecenter
	warp_event  3,  7, LAST_MAP, 3
	warp_event  4,  7, LAST_MAP, 3
	; Mart
	warp_event 19,  7, LAST_MAP, 6
	warp_event 20,  7, LAST_MAP, 6

	def_bg_events

	def_object_events
	; Pokecenter
	object_event  3,  1, SPRITE_NURSE, STAY, DOWN, TEXT_CERULEANPOKECENTER_NURSE
	object_event  7,  6, SPRITE_SUPER_NERD, WALK, ANY_DIR, TEXT_CERULEANPOKECENTER_SUPER_NERD
	object_event  8,  4, SPRITE_GENTLEMAN, STAY, DOWN, TEXT_CERULEANPOKECENTER_GENTLEMAN
	object_event  8,  2, SPRITE_LINK_RECEPTIONIST, STAY, DOWN, TEXT_CERULEANPOKECENTER_LINK_RECEPTIONIST
	object_event  0,  5, SPRITE_BENCH_GUY, STAY, RIGHT, TEXT_CERULEANPOKECENTER_BENCH_GUY ; marcelnote - BenchGuy has a sprite
	; Mart
	object_event 16,  5, SPRITE_CLERK, STAY, RIGHT, TEXT_CERULEANMART_CLERK
	object_event 19,  4, SPRITE_COOLTRAINER_M, WALK, UP_DOWN, TEXT_CERULEANMART_COOLTRAINER_M
	object_event 22,  2, SPRITE_COOLTRAINER_F, WALK, LEFT_RIGHT, TEXT_CERULEANMART_COOLTRAINER_F

	def_warps_to CERULEAN_POKECENTER_MART
