	db DEX_GASTLY ; pokedex id

	db  30,  35,  30,  80, 100
	;   hp  atk  def  spd  spc

	db GHOST, POISON ; type
	db 190 ; catch rate
	db 95 ; base exp

	INCBIN "gfx/pokemon/front/gastly.pic", 0, 1 ; sprite dimensions
	dw GastlyPicFront, GastlyPicBack

	db LICK, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset ; marcelnote - removed CONFUSE_RAY, NIGHT_SHADE
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	; marcelnote - added HEX
	tmhm TOXIC,        RAGE,         MEGA_DRAIN,   THUNDERBOLT,  THUNDER,      \
	     PSYCHIC_M,    MIMIC,        DOUBLE_TEAM,  BIDE,         SELFDESTRUCT, \
	     DREAM_EATER,  REST,         PSYWAVE,      EXPLOSION,    SUBSTITUTE,   \
	     HEX
	; end

	; marcelnote - improve Pokemon picture system tutorial
	db BANK(GastlyPicFront)
	assert BANK(GastlyPicFront) == BANK(GastlyPicBack)
