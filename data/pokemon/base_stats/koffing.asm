	db DEX_KOFFING ; pokedex id

	db  40,  65,  95,  35,  60
	;   hp  atk  def  spd  spc

	db POISON, POISON ; type
	db 190 ; catch rate
	db 114 ; base exp

	INCBIN "gfx/pokemon/front/koffing.pic", 0, 1 ; sprite dimensions
	dw KoffingPicFront, KoffingPicBack

	db TACKLE, POISON_GAS, NO_MOVE, NO_MOVE ; level 1 learnset ; marcelnote - replaced SMOG by POISON_GAS
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	; marcelnote - added DOUBLE_EDGE
	tmhm TOXIC,        RAGE,         THUNDERBOLT,  THUNDER,      MIMIC,        \
	     DOUBLE_TEAM,  BIDE,         SELFDESTRUCT, FIRE_BLAST,   REST,         \
	     EXPLOSION,    SUBSTITUTE,   DOUBLE_EDGE
	; end

	db 0 ; padding
