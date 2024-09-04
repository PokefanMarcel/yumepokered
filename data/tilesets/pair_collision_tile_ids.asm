; FORMAT: tileset number, tile 1, tile 2
; terminated by -1
; these entries indicate that the player may not cross between tile 1 and tile 2
; it's mainly used to simulate differences in elevation

TilePairCollisionsLand::
	db CAVERN,   $20, $05
	db CAVERN,   $41, $05
	db CAVERN,   $2A, $05
	db CAVERN,   $05, $21
	db SAFARI,   $30, $2E ; marcelnote - new tileset from FOREST
	db SAFARI,   $52, $2E
	db SAFARI,   $55, $2E
	db SAFARI,   $56, $2E
	db SAFARI,   $20, $2E
	db SAFARI,   $5E, $2E
	db SAFARI,   $5F, $2E
	db FOREST,   $5D, $30 ; marcelnote - platform to ground
	db FOREST,   $4C, $30 ; marcelnote - platform to ground
	db FOREST,   $1F, $01 ; marcelnote - stairs (roof) to grassy ground
	db MOUNTAIN, $2E, $20 ; marcelnote - floors of different elevations
	db MOUNTAIN, $24, $20 ; marcelnote - upper floor to cave door
	db -1 ; end

TilePairCollisionsWater::
	db SAFARI,   $14, $2E ; marcelnote - new tileset from FOREST
	db SAFARI,   $48, $2E
	db CAVERN,   $14, $05
	db CAVERN,   $14, $41 ; marcelnote - collision with elevation tile
	db MOUNTAIN, $14, $2E ; marcelnote - new tileset
	db -1 ; end
