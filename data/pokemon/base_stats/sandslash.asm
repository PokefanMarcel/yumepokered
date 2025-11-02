	db DEX_SANDSLASH ; pokedex id

	db  75, 100, 110,  65,  55
	;   hp  atk  def  spd  spc

	db GROUND, GROUND ; type
	db 90 ; catch rate
	db 163 ; base exp

	db SPRITE_DIM_MEDIUM ; marcelnote - modified data structure
	dw SandslashPics
	dw 0 ; empty

	db SCRATCH, DEFENSE_CURL, NO_MOVE, NO_MOVE ; level 1 learnset ; marcelnote - added DEFENSE_CURL, removed SAND_ATTACK
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     HYPER_BEAM,   SUBMISSION,   SEISMIC_TOSS, RAGE,         EARTHQUAKE,   \
	     FISSURE,      DIG,          MIMIC,        DOUBLE_TEAM,  BIDE,         \
	     SWIFT,        SKULL_BASH,   REST,         ROCK_SLIDE,   SUBSTITUTE,   \
	     CUT,          STRENGTH
	; end

	; marcelnote - improve Pokemon picture system tutorial
	db BANK(SandslashPicFront)
	assert BANK(SandslashPicFront) == BANK(SandslashPicBack)
