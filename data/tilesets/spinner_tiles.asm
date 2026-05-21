; marcelnote - modified spinners engine
; Need to check both tiles under the player.
; format: bottom-left tile offset, bottom-right tile offset, direction
SpinnerArrowTileOffsets:
	db 3, 3, PAD_RIGHT
	db 2, 2, PAD_LEFT
	db 0, 1, PAD_UP
	db 2, 3, PAD_DOWN
	db -1

SpinnerArrowAnimTiles:
	INCBIN "gfx/overworld/spinners.2bpp"
