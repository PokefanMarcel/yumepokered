; marcelnote - merged Vermilion Pokecenter and Mart
	object_const_def
	; Pokecenter
	const_export VERMILIONPOKECENTER_NURSE
	const_export VERMILIONPOKECENTER_FISHING_GURU
	const_export VERMILIONPOKECENTER_SAILOR
	const_export VERMILIONPOKECENTER_LINK_RECEPTIONIST
	; Mart
	const_export VERMILIONMART_CLERK
	const_export VERMILIONMART_COOLTRAINER_M
	const_export VERMILIONMART_COOLTRAINER_F

VermilionPokecenterMart_Object:
	db $0 ; border block

	def_warp_events
	; Pokecenter
	warp_event  3,  7, LAST_MAP, 1
	warp_event  4,  7, LAST_MAP, 1
	; Mart
	warp_event 23,  7, LAST_MAP, 3
	warp_event 24,  7, LAST_MAP, 3

	def_bg_events

	def_object_events
	; Pokecenter
	object_event  3,  1, SPRITE_NURSE, STAY, DOWN, TEXT_VERMILIONPOKECENTER_NURSE
	object_event 10,  5, SPRITE_FISHING_GURU, STAY, NONE, TEXT_VERMILIONPOKECENTER_FISHING_GURU
	object_event  5,  4, SPRITE_SAILOR, STAY, NONE, TEXT_VERMILIONPOKECENTER_SAILOR
	object_event 11,  2, SPRITE_LINK_RECEPTIONIST, STAY, DOWN, TEXT_VERMILIONPOKECENTER_LINK_RECEPTIONIST
	; Mart
	object_event 20,  5, SPRITE_CLERK, STAY, RIGHT, TEXT_VERMILIONMART_CLERK
	object_event 25,  6, SPRITE_COOLTRAINER_M, STAY, NONE, TEXT_VERMILIONMART_COOLTRAINER_M
	object_event 23,  3, SPRITE_COOLTRAINER_F, WALK, LEFT_RIGHT, TEXT_VERMILIONMART_COOLTRAINER_F

	def_warps_to VERMILION_POKECENTER_MART
