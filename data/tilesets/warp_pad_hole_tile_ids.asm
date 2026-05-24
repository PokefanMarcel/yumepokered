WarpPadAndHoleData:
	; tileset id, tile id, value for [wStandingOnWarpPadOrHole]
	db FACILITY, $22, 1 ; warp pad ; marcelnote - refactored warp engine, was $20
	db FACILITY, $11, 2 ; hole
	db CAVERN,   $22, 2 ; hole
	db INTERIOR, $55, 1 ; warp pad
	db -1 ; end
