; marcelnote - new map
	object_const_def
	const_export DRJABARASLAB_JABARA

DrJabarasLab_Object:
	db $3 ; border block

	def_warp_events
	warp_event  4,  7, LAST_MAP, 1
	warp_event  5,  7, LAST_MAP, 1

	def_bg_events

	def_object_events
	object_event  8,  3, SPRITE_JABARA, WALK, LEFT_RIGHT, TEXT_DRJABARASLAB_JABARA
	object_event  6,  3, SPRITE_POKEDEX, STAY, NONE, TEXT_DRJABARASLAB_JABARA

	def_warps_to DR_JABARAS_LAB
