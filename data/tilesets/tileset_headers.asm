MACRO tileset
	db BANK(\1_GFX)
	dw \1_Block, \1_GFX, \1_Coll
	db \2, \3, \4 ; counter tiles
	db \5         ; grass tile
	db \6         ; animations (TILEANIM_* value)
ENDM

Tilesets:
	table_width 12, Tilesets
	; name, 3 counter tiles, grass tile, animations
	tileset Overworld,    -1, -1, -1, $52, TILEANIM_WATER_FLOWER ; marcelnote - will change to TILEANIM_WATER_FLOWER_WBOLLARD
	tileset BigHouse,     -1, -1, -1,  -1, TILEANIM_NONE  ; marcelnote - renamed REDS_HOUSE_1 tileset
	tileset Forest,       -1, -1, -1, $20, TILEANIM_WATER
	tileset Safari,       -1, -1, -1, $20, TILEANIM_WATER   ; marcelnote - new tileset from FOREST
	tileset Pokecenter,  $18,$19,$1E,  -1, TILEANIM_NONE
	tileset Gym,         $3A, -1, -1,  -1, TILEANIM_WATER_FLOWER
	tileset House,        -1, -1, -1,  -1, TILEANIM_NONE
	tileset Underground,  -1, -1, -1,  -1, TILEANIM_NONE
	tileset Gate,        $17,$32, -1,  -1, TILEANIM_NONE
	tileset Ship,         -1, -1, -1,  -1, TILEANIM_WATER
	tileset ShipPort,     -1, -1, -1,  -1, TILEANIM_WATER ; marcelnote - will change to TILEANIM_WATER_WBOLLARD
	tileset Cemetery,    $12, -1, -1,  -1, TILEANIM_NONE
	tileset Interior,     -1, -1, -1,  -1, TILEANIM_NONE
	tileset Cavern,       -1, -1, -1,  -1, TILEANIM_WATER
	tileset Lobby,       $15,$36, -1,  -1, TILEANIM_NONE
	tileset Mansion,     $16,$36, -1,  -1, TILEANIM_NONE    ; marcelnote - added counter tiles
	tileset Lab,          -1, -1, -1,  -1, TILEANIM_NONE
	tileset Club,        $07,$17, -1,  -1, TILEANIM_NONE
	tileset Facility,    $12, -1, -1,  -1, TILEANIM_WATER
	tileset Plateau,      -1, -1, -1, $45, TILEANIM_WATER
	tileset Academy,      -1, -1, -1,  -1, TILEANIM_NONE    ; marcelnote - new tileset
	tileset Mountain,     -1, -1, -1,  -1, TILEANIM_WATER   ; marcelnote - new tileset
	assert_table_length NUM_TILESETS
