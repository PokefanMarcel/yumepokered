	db DEX_SQUIRTLE ; pokedex id

	db  44,  48,  65,  43,  50
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 45 ; catch rate
	db 66 ; base exp

	db SPRITE_DIM_SMALL ; marcelnote - modified data structure
	dw SquirtlePics
	dw 0 ; empty

	db TACKLE, TAIL_WHIP, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   MEGA_KICK,    TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     BLIZZARD,     \
	     SUBMISSION,   COUNTER,      SEISMIC_TOSS, RAGE,         DIG,          \
	     MIMIC,        DOUBLE_TEAM,  REFLECT,      BIDE,         SKULL_BASH,   \
	     REST,         SUBSTITUTE,   SURF,         STRENGTH
	; end

	; marcelnote - improve Pokemon picture system tutorial
	db BANK(SquirtlePicFront)
	assert BANK(SquirtlePicFront) == BANK(SquirtlePicBack)
