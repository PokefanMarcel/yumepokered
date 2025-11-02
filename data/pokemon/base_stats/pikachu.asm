	db DEX_PIKACHU ; pokedex id

	db  35,  55,  30,  90,  50
	;   hp  atk  def  spd  spc

	db ELECTRIC, ELECTRIC ; type
	db 190 ; catch rate
	db 82 ; base exp

	db SPRITE_DIM_SMALL ; marcelnote - modified data structure
	dw PikachuPics
	dw 0 ; empty

	db THUNDERSHOCK, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	; marcelnote - added SURF
	tmhm MEGA_PUNCH,   MEGA_KICK,    TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  PAY_DAY,      SUBMISSION,   SEISMIC_TOSS, RAGE,         \
	     THUNDERBOLT,  THUNDER,      MIMIC,        DOUBLE_TEAM,  REFLECT,      \
	     BIDE,         SWIFT,        SKULL_BASH,   REST,         THUNDER_WAVE, \
	     SUBSTITUTE,   FLASH,        SURF
	; end

	; marcelnote - improve Pokemon picture system tutorial
	db BANK(PikachuPicFront)
	assert BANK(PikachuPicFront) == BANK(PikachuPicBack)
