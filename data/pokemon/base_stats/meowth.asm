	db DEX_MEOWTH ; pokedex id

	db  40,  45,  35,  90,  40
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 255 ; catch rate
	db 69 ; base exp

	db SPRITE_DIM_SMALL ; marcelnote - modified data structure
	dw MeowthPics
	dw 0 ; empty

	db SCRATCH, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	; marcelnote - added CUT
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   \
	     WATER_GUN,    PAY_DAY,      RAGE,         THUNDERBOLT,  THUNDER,      \
	     MIMIC,        DOUBLE_TEAM,  BIDE,         SWIFT,        SKULL_BASH,   \
	     REST,         SUBSTITUTE,   CUT
	; end

	; marcelnote - improve Pokemon picture system tutorial
	db BANK(MeowthPicFront)
	assert BANK(MeowthPicFront) == BANK(MeowthPicBack)
