	db DEX_CHARIZARD ; pokedex id

	db  78,  84,  78, 100,  85
	;   hp  atk  def  spd  spc

	db FIRE, FLYING ; type
	db 45 ; catch rate
	db 209 ; base exp

	db SPRITE_DIM_LARGE ; marcelnote - modified data structure
	dw CharizardPics
	dw 0 ; empty

	db SCRATCH, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset ; marcelnote - removed EMBER, LEER
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	; marcelnote - added FLY, FLASH
	tmhm MEGA_PUNCH,   SWORDS_DANCE, MEGA_KICK,    TOXIC,        BODY_SLAM,    \
	     TAKE_DOWN,    DOUBLE_EDGE,  HYPER_BEAM,   SUBMISSION,   COUNTER,      \
	     SEISMIC_TOSS, RAGE,         DRAGON_RAGE,  EARTHQUAKE,   FISSURE,      \
	     DIG,          MIMIC,        DOUBLE_TEAM,  REFLECT,      BIDE,         \
	     FIRE_BLAST,   SWIFT,        SKULL_BASH,   REST,         SUBSTITUTE,   \
	     CUT,          STRENGTH,     FLY,          FLASH
	; end

	; marcelnote - improve Pokemon picture system tutorial
	db BANK(CharizardPicFront)
	assert BANK(CharizardPicFront) == BANK(CharizardPicBack)
