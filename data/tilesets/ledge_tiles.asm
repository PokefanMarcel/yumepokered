LedgeTiles: ; marcelnote - modified
	; SPRITE_FACING_DOWN, tile below the player (northwest), tile below the player (southwest), input required
	db SPRITE_FACING_DOWN,  $2C, $37, PAD_DOWN
	db SPRITE_FACING_DOWN,  $39, $37, PAD_DOWN
	db SPRITE_FACING_DOWN,  $39, $36, PAD_DOWN
	; SPRITE_FACING_LEFT, tile left of player (southeast), tile left of the player (southwest), input required
	db SPRITE_FACING_LEFT,  $2C, $27, PAD_LEFT
	db SPRITE_FACING_LEFT,  $39, $27, PAD_LEFT
	; SPRITE_FACING_RIGHT, tile right of player (southwest), tile right of the player (southeast), input required
	db SPRITE_FACING_RIGHT, $0D, $24, PAD_RIGHT
	db -1 ; end

LedgeTilesCavern: ; marcelnote - new for Cavern ledges
	; player direction, tile player standing on, ledge tile, input required
	db SPRITE_FACING_DOWN,  $20, $43, PAD_DOWN
	db SPRITE_FACING_LEFT,  $20, $42, PAD_LEFT
	db SPRITE_FACING_RIGHT, $47, $45, PAD_RIGHT
	db -1 ; end
