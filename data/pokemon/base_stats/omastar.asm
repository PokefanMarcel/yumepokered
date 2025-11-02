	db DEX_OMASTAR ; pokedex id

	db  70,  60, 125,  55, 115
	;   hp  atk  def  spd  spc

	db ROCK, WATER ; type
	db 45 ; catch rate
	db 199 ; base exp

	db SPRITE_DIM_MEDIUM ; marcelnote - modified data structure
	dw OmastarPics
	dw 0 ; empty

	db CONSTRICT, WITHDRAW, HORN_ATTACK, NO_MOVE ; level 1 learnset ; marcelnote - replaced WATER_GUN by CONSTRICT
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        HORN_DRILL,   BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   \
	     SUBMISSION,   SEISMIC_TOSS, RAGE,         MIMIC,        DOUBLE_TEAM,  \
	     REFLECT,      BIDE,         SKULL_BASH,   REST,         SUBSTITUTE,   \
	     SURF
	; end

	; marcelnote - improve Pokemon picture system tutorial
	db BANK(OmastarPicFront)
	assert BANK(OmastarPicFront) == BANK(OmastarPicBack)
