	db DEX_VENONAT ; pokedex id

	db  60,  55,  50,  45,  40
	;   hp  atk  def  spd  spc

	db BUG, POISON ; type
	db 190 ; catch rate
	db 75 ; base exp

	db SPRITE_DIM_SMALL ; marcelnote - modified data structure
	dw VenonatPics
	dw 0 ; empty

	db TACKLE, DISABLE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset ; marcelnote - added FLASH
	tmhm TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  RAGE,         MEGA_DRAIN,   \
	     SOLARBEAM,    PSYCHIC_M,    MIMIC,        DOUBLE_TEAM,  REFLECT,      \
	     BIDE,         REST,         PSYWAVE,      SUBSTITUTE,   FLASH
	; end

	; marcelnote - improve Pokemon picture system tutorial
	db BANK(VenonatPicFront)
	assert BANK(VenonatPicFront) == BANK(VenonatPicBack)
