	db DEX_WEEPINBELL ; pokedex id

	db  65,  90,  50,  55,  85
	;   hp  atk  def  spd  spc

	db GRASS, POISON ; type
	db 120 ; catch rate
	db 151 ; base exp

	db SPRITE_DIM_MEDIUM ; marcelnote - modified data structure
	dw WeepinbellPics
	dw 0 ; empty

	db VINE_WHIP, GROWTH, NO_MOVE, NO_MOVE ; level 1 learnset ; marcelnote - removed WRAP
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  RAGE,         \
	     MEGA_DRAIN,   SOLARBEAM,    MIMIC,        DOUBLE_TEAM,  REFLECT,      \
	     BIDE,         REST,         SUBSTITUTE,   CUT
	; end

	; marcelnote - improve Pokemon picture system tutorial
	db BANK(WeepinbellPicFront)
	assert BANK(WeepinbellPicFront) == BANK(WeepinbellPicBack)
