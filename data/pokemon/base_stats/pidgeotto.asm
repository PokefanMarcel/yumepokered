	db DEX_PIDGEOTTO ; pokedex id

	db  63,  60,  55,  71,  50
	;   hp  atk  def  spd  spc

	db NORMAL, FLYING ; type
	db 120 ; catch rate
	db 113 ; base exp

	db SPRITE_DIM_MEDIUM ; marcelnote - modified data structure
	dw PidgeottoPics
	dw 0 ; empty

	db TACKLE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset ; marcelnote - added TACKLE, removed SAND_ATTACK, GUST
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm RAZOR_WIND,   WHIRLWIND,    TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  \
	     RAGE,         MIMIC,        DOUBLE_TEAM,  REFLECT,      BIDE,         \
	     SWIFT,        SKY_ATTACK,   REST,         SUBSTITUTE,   FLY
	; end

	; marcelnote - improve Pokemon picture system tutorial
	db BANK(PidgeottoPicFront)
	assert BANK(PidgeottoPicFront) == BANK(PidgeottoPicBack)
