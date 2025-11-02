	db DEX_CHARMELEON ; pokedex id

	db  58,  64,  58,  80,  65
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db 45 ; catch rate
	db 142 ; base exp

	db SPRITE_DIM_MEDIUM ; marcelnote - modified data structure
	dw CharmeleonPics
	dw 0 ; empty

	db SCRATCH, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset ; marcelnote - removed EMBER
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	; marcelnote - added FLASH
	tmhm MEGA_PUNCH,   SWORDS_DANCE, MEGA_KICK,    TOXIC,        BODY_SLAM,    \
	     TAKE_DOWN,    DOUBLE_EDGE,  SUBMISSION,   COUNTER,      SEISMIC_TOSS, \
	     RAGE,         DRAGON_RAGE,  DIG,          MIMIC,        DOUBLE_TEAM,  \
	     REFLECT,      BIDE,         FIRE_BLAST,   SWIFT,        SKULL_BASH,   \
	     REST,         SUBSTITUTE,   CUT,          STRENGTH,     FLASH
	; end

	; marcelnote - improve Pokemon picture system tutorial
	db BANK(CharmeleonPicFront)
	assert BANK(CharmeleonPicFront) == BANK(CharmeleonPicBack)
