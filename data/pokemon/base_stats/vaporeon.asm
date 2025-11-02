	db DEX_VAPOREON ; pokedex id

	db 130,  65,  60,  65, 110
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 45 ; catch rate
	db 196 ; base exp

	db SPRITE_DIM_MEDIUM ; marcelnote - modified data structure
	dw VaporeonPics
	dw 0 ; empty

	db TACKLE, SAND_ATTACK, NO_MOVE, NO_MOVE ; level 1 learnset ; marcelnote - removed QUICK_ATTACK, WATER_GUN
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   \
	     WATER_GUN,    ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   RAGE,         \
	     MIMIC,        DOUBLE_TEAM,  REFLECT,      BIDE,         SWIFT,        \
	     SKULL_BASH,   REST,         SUBSTITUTE,   SURF
	; end

	; marcelnote - improve Pokemon picture system tutorial
	db BANK(VaporeonPicFront)
	assert BANK(VaporeonPicFront) == BANK(VaporeonPicBack)
