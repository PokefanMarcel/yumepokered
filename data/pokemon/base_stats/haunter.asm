	db DEX_HAUNTER ; pokedex id

	db  45,  50,  45,  95, 115
	;   hp  atk  def  spd  spc

	db GHOST, POISON ; type
	db 90 ; catch rate
	db 126 ; base exp

	db SPRITE_DIM_MEDIUM ; marcelnote - modified data structure
	dw HaunterPics
	dw 0 ; empty

	db LICK, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset ; marcelnote - replaced LICK, CONFUSE_RAY, NIGHT_SHADE, NO_MOVE
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	; marcelnote - added HEX
	tmhm TOXIC,        RAGE,         MEGA_DRAIN,   THUNDERBOLT,  THUNDER,      \
	     PSYCHIC_M,    MIMIC,        DOUBLE_TEAM,  BIDE,         SELFDESTRUCT, \
	     DREAM_EATER,  REST,         PSYWAVE,      EXPLOSION,    SUBSTITUTE,   \
	     HEX
	; end

	; marcelnote - improve Pokemon picture system tutorial
	db BANK(HaunterPicFront)
	assert BANK(HaunterPicFront) == BANK(HaunterPicBack)
