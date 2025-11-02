	db DEX_GRIMER ; pokedex id

	db  80,  80,  50,  25,  40
	;   hp  atk  def  spd  spc

	db POISON, POISON ; type
	db 190 ; catch rate
	db 90 ; base exp

	db SPRITE_DIM_SMALL ; marcelnote - modified data structure
	dw GrimerPics
	dw 0 ; empty

	db POUND, DISABLE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	; marcelnote - added STRENGTH, HEX
	tmhm TOXIC,        BODY_SLAM,    RAGE,         MEGA_DRAIN,   THUNDERBOLT,  \
	     THUNDER,      MIMIC,        DOUBLE_TEAM,  BIDE,         SELFDESTRUCT, \
	     FIRE_BLAST,   REST,         EXPLOSION,    SUBSTITUTE,   STRENGTH,     \
	     HEX
	; end

	; marcelnote - improve Pokemon picture system tutorial
	db BANK(GrimerPicFront)
	assert BANK(GrimerPicFront) == BANK(GrimerPicBack)
