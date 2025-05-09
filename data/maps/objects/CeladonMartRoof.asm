	object_const_def
	const_export CELADONMARTROOF_SUPER_NERD
	const_export CELADONMARTROOF_LITTLE_GIRL

CeladonMartRoof_Object:
	db $1b ; border block

	def_warp_events
	warp_event 15,  2, CELADON_MART_4F5F6F, 8 ; marcelnote - merged 4F 5F + new 6F

	def_bg_events
	bg_event 10,  1, TEXT_CELADONMARTROOF_VENDING_MACHINE1
	bg_event 11,  1, TEXT_CELADONMARTROOF_VENDING_MACHINE2
	bg_event 12,  2, TEXT_CELADONMARTROOF_VENDING_MACHINE3
	bg_event 13,  2, TEXT_CELADONMARTROOF_CURRENT_FLOOR_SIGN

	def_object_events
	object_event 10,  4, SPRITE_SUPER_NERD, STAY, LEFT, TEXT_CELADONMARTROOF_SUPER_NERD
	object_event  5,  5, SPRITE_LITTLE_GIRL, WALK, ANY_DIR, TEXT_CELADONMARTROOF_LITTLE_GIRL

	def_warps_to CELADON_MART_ROOF
