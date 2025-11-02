	db DEX_NIDORAN_F ; pokedex id

	db  55,  47,  52,  41,  40
	;   hp  atk  def  spd  spc

	db POISON, POISON ; type
	db 235 ; catch rate
	db 59 ; base exp

	db SPRITE_DIM_SMALL ; marcelnote - modified data structure
	dw NidoranFPics
	dw 0 ; empty

	db TACKLE, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset ; marcelnote - added DIG
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  BLIZZARD,     \
	     RAGE,         THUNDERBOLT,  THUNDER,      MIMIC,        DOUBLE_TEAM,  \
	     REFLECT,      BIDE,         SKULL_BASH,   REST,         SUBSTITUTE,   \
	     DIG
	; end

	; marcelnote - improve Pokemon picture system tutorial
	db BANK(NidoranFPicFront)
	assert BANK(NidoranFPicFront) == BANK(NidoranFPicBack)
