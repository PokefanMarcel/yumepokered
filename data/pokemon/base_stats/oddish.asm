	db DEX_ODDISH ; pokedex id

	db  45,  50,  55,  30,  75
	;   hp  atk  def  spd  spc

	db GRASS, POISON ; type
	db 255 ; catch rate
	db 78 ; base exp

	db SPRITE_DIM_SMALL ; marcelnote - modified data structure
	dw OddishPics
	dw 0 ; empty

	db ABSORB, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  RAGE,         \
	     MEGA_DRAIN,   SOLARBEAM,    MIMIC,        DOUBLE_TEAM,  REFLECT,      \
	     BIDE,         REST,         SUBSTITUTE,   CUT
	; end

	; marcelnote - improve Pokemon picture system tutorial
	db BANK(OddishPicFront)
	assert BANK(OddishPicFront) == BANK(OddishPicBack)
