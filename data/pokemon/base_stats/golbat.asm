	db DEX_GOLBAT ; pokedex id

	db  75,  80,  70,  90,  75
	;   hp  atk  def  spd  spc

	db POISON, FLYING ; type
	db 90 ; catch rate
	db 171 ; base exp

	db SPRITE_DIM_LARGE ; marcelnote - modified data structure
	dw GolbatPics
	dw 0 ; empty

	db LEECH_LIFE, SUPERSONIC, NO_MOVE, NO_MOVE ; level 1 learnset ; marcenote - replaced SCREECH by SUPERSONIC, removed BITE
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	; marcelnote - added HEX
	tmhm RAZOR_WIND,   WHIRLWIND,    TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  \
	     HYPER_BEAM,   RAGE,         MEGA_DRAIN,   MIMIC,        DOUBLE_TEAM,  \
	     BIDE,         SWIFT,        REST,         SUBSTITUTE,   HEX
	; end

	; marcelnote - improve Pokemon picture system tutorial
	db BANK(GolbatPicFront)
	assert BANK(GolbatPicFront) == BANK(GolbatPicBack)
