	db DEX_SCYTHER ; pokedex id

	db  70, 110,  80, 105,  55
	;   hp  atk  def  spd  spc

	db BUG, FLYING ; type
	db 45 ; catch rate
	db 187 ; base exp

	db SPRITE_DIM_LARGE ; marcelnote - modified data structure
	dw ScytherPics
	dw 0 ; empty

	db QUICK_ATTACK, LEER, NO_MOVE, NO_MOVE ; level 1 learnset ; marcelnote - added LEER
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset ; marcelnote - added RAZOR_WIND
	tmhm SWORDS_DANCE, TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  HYPER_BEAM,   \
	     RAGE,         MIMIC,        DOUBLE_TEAM,  BIDE,         SWIFT,        \
	     SKULL_BASH,   REST,         SUBSTITUTE,   CUT,          RAZOR_WIND
	; end

	; marcelnote - improve Pokemon picture system tutorial
	db BANK(ScytherPicFront)
	assert BANK(ScytherPicFront) == BANK(ScytherPicBack)
