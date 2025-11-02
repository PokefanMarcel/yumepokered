	db DEX_IVYSAUR ; pokedex id

	db  60,  62,  63,  60,  80
	;   hp  atk  def  spd  spc

	db GRASS, POISON ; type
	db 45 ; catch rate
	db 141 ; base exp

	db SPRITE_DIM_MEDIUM ; marcelnote - modified data structure
	dw IvysaurPics
	dw 0 ; empty

	db TACKLE, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset ; marcelnote - removed LEECH_SEED
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     RAGE,         MEGA_DRAIN,   SOLARBEAM,    MIMIC,        DOUBLE_TEAM,  \
	     REFLECT,      BIDE,         REST,         SUBSTITUTE,   CUT
	; end

	; marcelnote - improve Pokemon picture system tutorial
	db BANK(IvysaurPicFront)
	assert BANK(IvysaurPicFront) == BANK(IvysaurPicBack)
