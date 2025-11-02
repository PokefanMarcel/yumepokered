	db DEX_GLOOM ; pokedex id

	db  60,  65,  70,  40,  85
	;   hp  atk  def  spd  spc

	db GRASS, POISON ; type
	db 120 ; catch rate
	db 132 ; base exp

	db SPRITE_DIM_MEDIUM ; marcelnote - modified data structure
	dw GloomPics
	dw 0 ; empty

	db ABSORB, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset ; marcelnote - removed POISONPOWDER, STUN_SPORE
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  RAGE,         \
	     MEGA_DRAIN,   SOLARBEAM,    MIMIC,        DOUBLE_TEAM,  REFLECT,      \
	     BIDE,         REST,         SUBSTITUTE,   CUT
	; end

	; marcelnote - improve Pokemon picture system tutorial
	db BANK(GloomPicFront)
	assert BANK(GloomPicFront) == BANK(GloomPicBack)
