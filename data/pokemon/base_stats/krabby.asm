	db DEX_KRABBY ; pokedex id

	db  30, 105,  90,  50,  25
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 225 ; catch rate
	db 115 ; base exp

	db SPRITE_DIM_SMALL ; marcelnote - modified data structure
	dw KrabbyPics
	dw 0 ; empty

	db BUBBLE, LEER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     BLIZZARD,     RAGE,         \
	     MIMIC,        DOUBLE_TEAM,  BIDE,         REST,         SUBSTITUTE,   \
	     CUT,          SURF,         STRENGTH
	; end

	; marcelnote - improve Pokemon picture system tutorial
	db BANK(KrabbyPicFront)
	assert BANK(KrabbyPicFront) == BANK(KrabbyPicBack)
