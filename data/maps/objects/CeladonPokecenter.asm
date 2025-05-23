	object_const_def
	const_export CELADONPOKECENTER_NURSE
	const_export CELADONPOKECENTER_GENTLEMAN
	const_export CELADONPOKECENTER_BEAUTY
	const_export CELADONPOKECENTER_LINK_RECEPTIONIST
	const_export CELADONPOKECENTER_BENCH_GUY ; marcelnote - BenchGuy has a sprite

CeladonPokecenter_Object:
	db $0 ; border block

	def_warp_events
	warp_event  3,  7, LAST_MAP, 6
	warp_event  4,  7, LAST_MAP, 6

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, STAY, DOWN, TEXT_CELADONPOKECENTER_NURSE
	object_event  7,  4, SPRITE_GENTLEMAN, WALK, LEFT_RIGHT, TEXT_CELADONPOKECENTER_GENTLEMAN
	object_event  7,  6, SPRITE_BEAUTY, STAY, NONE, TEXT_CELADONPOKECENTER_BEAUTY
	object_event  8,  2, SPRITE_LINK_RECEPTIONIST, STAY, DOWN, TEXT_CELADONPOKECENTER_LINK_RECEPTIONIST
	object_event  0,  5, SPRITE_BENCH_GUY, STAY, RIGHT, TEXT_CELADONPOKECENTER_BENCH_GUY ; marcelnote - BenchGuy has a sprite

	def_warps_to CELADON_POKECENTER
