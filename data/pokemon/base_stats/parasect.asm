	db DEX_PARASECT ; pokedex id

	db  60,  95,  80,  30,  80
	;   hp  atk  def  spd  spc

	db BUG, GRASS ; type
	db 75 ; catch rate
	db 128 ; base exp

	db SPRITE_DIM_LARGE ; marcelnote - modified data structure
	dw ParasectPics
	dw 0 ; empty

	db SCRATCH, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset ; marcelnote - removed STUN_SPORE, LEECH_LIFE
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     HYPER_BEAM,   RAGE,         MEGA_DRAIN,   SOLARBEAM,    DIG,          \
	     MIMIC,        DOUBLE_TEAM,  REFLECT,      BIDE,         SKULL_BASH,   \
	     REST,         SUBSTITUTE,   CUT
	; end

	; marcelnote - improve Pokemon picture system tutorial
	db BANK(ParasectPicFront)
	assert BANK(ParasectPicFront) == BANK(ParasectPicBack)
