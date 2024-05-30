	object_const_def
	const_export ROUTE5GATE_BRUNETTE_GIRL ; marcelnote - added 2nd floor
	const_export ROUTE5GATE_SUPER_NERD    ; marcelnote - added 2nd floor
	const_export ROUTE5GATE_PERSIAN       ; marcelnote - added 2nd floor
	const_export ROUTE5GATE_SANDSLASH     ; marcelnote - added 2nd floor
	const_export ROUTE5GATE_GUARD

Route5Gate_Object:
	db $a ; border block

	def_warp_events
	warp_event  3,  5, LAST_MAP, 3
	warp_event  4,  5, LAST_MAP, 3
	warp_event  3,  0, LAST_MAP, 2
	warp_event  4,  0, LAST_MAP, 1
	warp_event  6,  4, ROUTE_5_GATE, 6 ; marcelnote - added 2nd floor
	warp_event 19,  5, ROUTE_5_GATE, 5 ; marcelnote - added 2nd floor

	def_bg_events

	def_object_events
	object_event 12,  2, SPRITE_BRUNETTE_GIRL, STAY, RIGHT, TEXT_ROUTE5GATE_BRUNETTE_GIRL ; marcelnote - added 2nd floor
	object_event 12,  4, SPRITE_SUPER_NERD, STAY, RIGHT, TEXT_ROUTE5GATE_SUPER_NERD       ; marcelnote - added 2nd floor
	object_event 14,  3, SPRITE_MONSTER, STAY, ANY_DIR, TEXT_ROUTE5GATE_PERSIAN           ; marcelnote - added 2nd floor
	object_event 15,  3, SPRITE_MONSTER, STAY, ANY_DIR, TEXT_ROUTE5GATE_SANDSLASH         ; marcelnote - added 2nd floor
	object_event  1,  3, SPRITE_GUARD, STAY, RIGHT, TEXT_ROUTE5GATE_GUARD

	def_warps_to ROUTE_5_GATE
