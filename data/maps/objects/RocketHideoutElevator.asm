RocketHideoutElevator_Object: ; marcelnote - map was modified and sized down
	db $f ; border block

	def_warp_events ; marcelnote - reorganized Rocket hideout warps
	warp_event  1,  1, ANY_DIR, ROCKET_HIDEOUT_B1F, 4
	warp_event  2,  1, ANY_DIR, ROCKET_HIDEOUT_B1F, 5

	def_bg_events
	bg_event  0,  1, TEXT_ROCKETHIDEOUTELEVATOR

	def_object_events

	def_warps_to ROCKET_HIDEOUT_ELEVATOR
