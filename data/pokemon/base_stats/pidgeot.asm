	db DEX_PIDGEOT ; pokedex id

	db  83,  80,  75,  91,  70
	;   hp  atk  def  spd  spc

	db NORMAL, FLYING ; type
	db 45 ; catch rate
	db 172 ; base exp

	db SPRITE_DIM_LARGE ; marcelnote - modified data structure
	dw PidgeotPics
	dw 0 ; empty

	db TACKLE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset ; marcelnote - added TACKLE, removed GUST, SAND_ATTACK, QUICK_ATTACK
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm RAZOR_WIND,   WHIRLWIND,    TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  \
	     HYPER_BEAM,   RAGE,         MIMIC,        DOUBLE_TEAM,  REFLECT,      \
	     BIDE,         SWIFT,        SKY_ATTACK,   REST,         SUBSTITUTE,   \
	     FLY
	; end

	; marcelnote - improve Pokemon picture system tutorial
	db BANK(PidgeotPicFront)
	assert BANK(PidgeotPicFront) == BANK(PidgeotPicBack)
