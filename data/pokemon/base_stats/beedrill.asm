	db DEX_BEEDRILL ; pokedex id

	db  65,  80,  40,  75,  45
	;   hp  atk  def  spd  spc

	db BUG, POISON ; type
	db 45 ; catch rate
	db 159 ; base exp

	db SPRITE_DIM_LARGE ; marcelnote - modified data structure
	dw BeedrillPics
	dw 0 ; empty

	db POISON_STING, STRING_SHOT, NO_MOVE, NO_MOVE ; level 1 learnset ; marcelnote - added POISON_STING and STRING_SHOT, removed FURY_ATTACK
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  HYPER_BEAM,   \
	     RAGE,         MEGA_DRAIN,   MIMIC,        DOUBLE_TEAM,  REFLECT,      \
	     BIDE,         SWIFT,        SKULL_BASH,   REST,         SUBSTITUTE,   \
	     CUT
	; end

	; marcelnote - improve Pokemon picture system tutorial
	db BANK(BeedrillPicFront)
	assert BANK(BeedrillPicFront) == BANK(BeedrillPicBack)
