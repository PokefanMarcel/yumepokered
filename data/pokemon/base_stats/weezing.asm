	db DEX_WEEZING ; pokedex id

	db  65,  90, 120,  60,  85
	;   hp  atk  def  spd  spc

	db POISON, POISON ; type
	db 60 ; catch rate
	db 173 ; base exp

	INCBIN "gfx/pokemon/front/weezing.pic", 0, 1 ; sprite dimensions
	dw WeezingPicFront, WeezingPicBack

	db TACKLE, POISON_GAS, NO_MOVE, NO_MOVE ; level 1 learnset ; marcelnote - changed from TACKLE, SMOG, SLUDGE, NO_MOVE
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	; marcelnote - added DOUBLE_EDGE
	tmhm TOXIC,        HYPER_BEAM,   RAGE,         THUNDERBOLT,  THUNDER,      \
	     MIMIC,        DOUBLE_TEAM,  BIDE,         SELFDESTRUCT, FIRE_BLAST,   \
	     REST,         EXPLOSION,    SUBSTITUTE,   DOUBLE_EDGE
	; end

	db 0 ; padding
