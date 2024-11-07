	object_const_def
	const_export ROUTE22GATE_GUARD
	const_export ROUTE22GATE_GUARD2        ; marcelnote - new guard
	const_export ROUTE22GATE_COOLTRAINER_M ; marcelnote - new NPC
	const_export ROUTE22GATE_COOLTRAINER_F ; marcelnote - new NPC
	const_export ROUTE22GATE_YOUNGSTER     ; marcelnote - new NPC
	const_export ROUTE22GATE_RECEPTIONIST  ; marcelnote - new NPC

Route22Gate_Object:
	db $a ; border block

	def_warp_events
	warp_event 12,  7, LAST_MAP, 1 ; marcelnote - adjusted coords
	warp_event 13,  7, LAST_MAP, 1 ; marcelnote - adjusted coords
	warp_event 12,  0, LAST_MAP, 1 ; marcelnote - adjusted coords
	warp_event 13,  0, LAST_MAP, 2 ; marcelnote - adjusted coords
	warp_event  0,  3, ROUTE_22, 3 ; marcelnote - added for Route 28
	warp_event  0,  4, ROUTE_22, 4 ; marcelnote - added for Route 28
	warp_event  7,  7, ROUTE_22_GATE, 8 ; marcelnote - added 2nd floor
	warp_event 25,  7, ROUTE_22_GATE, 7 ; marcelnote - added 2nd floor
	warp_event 35,  7, ROUTE_22_GATE_3F, 1 ; marcelnote - added 3rd floor

	def_bg_events
	; marcelnote - binoculars are handled as hidden object

	def_object_events
	object_event 14,  2, SPRITE_GUARD, STAY, LEFT, TEXT_ROUTE22GATE_GUARD  ; marcelnote - adjusted coords
	object_event  3,  1, SPRITE_GUARD, STAY, DOWN, TEXT_ROUTE22GATE_GUARD2 ; marcelnote - new guard
	object_event  8,  2, SPRITE_COOLTRAINER_M, WALK, UP_DOWN, TEXT_ROUTE22GATE_COOLTRAINER_M    ; marcelnote - new NPC
	object_event 31,  3, SPRITE_COOLTRAINER_F, WALK, LEFT_RIGHT, TEXT_ROUTE22GATE_COOLTRAINER_F ; marcelnote - new NPC
	object_event 26,  5, SPRITE_YOUNGSTER, STAY, RIGHT, TEXT_ROUTE22GATE_YOUNGSTER              ; marcelnote - new NPC
	object_event 34,  4, SPRITE_LINK_RECEPTIONIST, STAY, DOWN, TEXT_ROUTE22GATE_RECEPTIONIST    ; marcelnote - new NPC

	def_warps_to ROUTE_22_GATE
