	db DEX_TENTACRUEL ; pokedex id

	db  80,  70,  65, 100, 120
	;   hp  atk  def  spd  spc

	db WATER, POISON ; type
	db 60 ; catch rate
	db 205 ; base exp

	INCBIN "gfx/pokemon/front/tentacruel.pic", 0, 1 ; sprite dimensions
	dw TentacruelPicFront, TentacruelPicBack

	db POISON_STING, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset ; marcelnote - changed from ACID, SUPERSONIC, WRAP, NO_MOVE
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	; marcelnote - added HEX
	tmhm SWORDS_DANCE, TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   \
	     WATER_GUN,    ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   RAGE,         \
	     MEGA_DRAIN,   MIMIC,        DOUBLE_TEAM,  REFLECT,      BIDE,         \
	     SKULL_BASH,   REST,         SUBSTITUTE,   CUT,          SURF,         \
	     HEX
	; end

	; marcelnote - improve Pokemon picture system tutorial
	db BANK(TentacruelPicFront)
	assert BANK(TentacruelPicFront) == BANK(TentacruelPicBack)
