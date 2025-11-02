	db DEX_RATTATA ; pokedex id

	db  30,  56,  35,  72,  25
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 255 ; catch rate
	db 57 ; base exp

	db SPRITE_DIM_SMALL ; marcelnote - modified data structure
	dw RattataPics
	dw 0 ; empty

	db TACKLE, TAIL_WHIP, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	; marcelnote - added SWORDS_DANCE, ICE_BEAM
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   \
	     WATER_GUN,    ICE_BEAM,     BLIZZARD,     RAGE,         THUNDERBOLT,  \
	     THUNDER,      DIG,          MIMIC,        DOUBLE_TEAM,  BIDE,         \
	     SWIFT,        SKULL_BASH,   REST,         SUBSTITUTE,   SWORDS_DANCE
	; end

	; marcelnote - improve Pokemon picture system tutorial
	db BANK(RattataPicFront)
	assert BANK(RattataPicFront) == BANK(RattataPicBack)
