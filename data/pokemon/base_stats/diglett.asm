	db DEX_DIGLETT ; pokedex id

	db  10,  55,  25,  95,  45
	;   hp  atk  def  spd  spc

	db GROUND, GROUND ; type
	db 255 ; catch rate
	db 81 ; base exp

	db SPRITE_DIM_SMALL ; marcelnote - modified data structure
	dw DiglettPics
	dw 0 ; empty

	db SCRATCH, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset ; marcelnote - added GROWL
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	; marcelnote - added CUT
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  RAGE,         \
	     EARTHQUAKE,   FISSURE,      DIG,          MIMIC,        DOUBLE_TEAM,  \
	     BIDE,         REST,         ROCK_SLIDE,   SUBSTITUTE,   CUT
	; end

	; marcelnote - improve Pokemon picture system tutorial
	db BANK(DiglettPicFront)
	assert BANK(DiglettPicFront) == BANK(DiglettPicBack)
