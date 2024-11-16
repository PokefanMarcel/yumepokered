; marcelnote - merged Cinnabar Lab maps
	object_const_def
	; Lobby
	const_export CINNABARLAB_FISHING_GURU
	; Trade room
	const_export CINNABARLABTRADEROOM_SUPER_NERD
	const_export CINNABARLABTRADEROOM_GRAMPS
	const_export CINNABARLABTRADEROOM_BEAUTY
	; Metronome room
	const_export CINNABARLABMETRONOMEROOM_SCIENTIST1
	const_export CINNABARLABMETRONOMEROOM_SCIENTIST2
	; Fossil room
	const_export CINNABARLABFOSSILROOM_SCIENTIST1
	const_export CINNABARLABFOSSILROOM_SCIENTIST2

CinnabarLab_Object:
	db $17 ; border block

	def_warp_events
	; Lobby
	warp_event  2,  7, LAST_MAP, 3
	warp_event  3,  7, LAST_MAP, 3
	warp_event  8,  4, CINNABAR_LAB, 6 ; to Trade room
	warp_event 12,  4, CINNABAR_LAB, 8 ; to Metronome room
	warp_event 16,  4, CINNABAR_LAB, 10 ; to Fossil room
	; Trade room
	warp_event 26,  7, CINNABAR_LAB, 3
	warp_event 27,  7, CINNABAR_LAB, 3
	; Metronome room
	warp_event 40,  7, CINNABAR_LAB, 4
	warp_event 41,  7, CINNABAR_LAB, 4
	; Fossil room
	warp_event 54,  7, CINNABAR_LAB, 5
	warp_event 55,  7, CINNABAR_LAB, 5

	def_bg_events
	; Lobby
	bg_event  3,  2, TEXT_CINNABARLAB_PHOTO
	bg_event  9,  4, TEXT_CINNABARLAB_MEETING_ROOM_SIGN
	bg_event 13,  4, TEXT_CINNABARLAB_R_AND_D_SIGN
	bg_event 17,  4, TEXT_CINNABARLAB_TESTING_ROOM_SIGN
	; Trade room
	; none
	; Metronome room
	bg_event 38,  4, TEXT_CINNABARLABMETRONOMEROOM_PC_KEYBOARD
	bg_event 39,  4, TEXT_CINNABARLABMETRONOMEROOM_PC_MONITOR
	bg_event 40,  1, TEXT_CINNABARLABMETRONOMEROOM_AMBER_PIPE
	; Fossil room
	; none

	def_object_events
	; Lobby
	object_event  1,  3, SPRITE_FISHING_GURU, STAY, NONE, TEXT_CINNABARLAB_FISHING_GURU
	; Trade room
	object_event 27,  2, SPRITE_SUPER_NERD, STAY, DOWN, TEXT_CINNABARLABTRADEROOM_SUPER_NERD
	object_event 25,  4, SPRITE_GRAMPS, STAY, NONE, TEXT_CINNABARLABTRADEROOM_GRAMPS
	object_event 29,  5, SPRITE_BEAUTY, STAY, UP, TEXT_CINNABARLABTRADEROOM_BEAUTY
	; Metronome room
	object_event 45,  2, SPRITE_SCIENTIST, STAY, DOWN, TEXT_CINNABARLABMETRONOMEROOM_SCIENTIST1
	object_event 40,  3, SPRITE_SCIENTIST, WALK, LEFT_RIGHT, TEXT_CINNABARLABMETRONOMEROOM_SCIENTIST2
	; Fossil room
	object_event 57,  2, SPRITE_SCIENTIST, WALK, LEFT_RIGHT, TEXT_CINNABARLABFOSSILROOM_SCIENTIST1
	object_event 59,  6, SPRITE_SCIENTIST, STAY, UP, TEXT_CINNABARLABFOSSILROOM_SCIENTIST2

	def_warps_to CINNABAR_LAB
