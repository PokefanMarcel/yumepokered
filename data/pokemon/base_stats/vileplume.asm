	db DEX_VILEPLUME ; pokedex id

	db  75,  80,  85,  50, 100
	;   hp  atk  def  spd  spc

	db GRASS, POISON ; type
	db 45 ; catch rate
	db 184 ; base exp

	db SPRITE_DIM_LARGE ; marcelnote - modified data structure
	dw VileplumePics
	dw 0 ; empty

;	db STUN_SPORE, SLEEP_POWDER, ACID, PETAL_DANCE ; level 1 learnset
	db ABSORB, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset ; marcelnote - changed
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     HYPER_BEAM,   RAGE,         MEGA_DRAIN,   SOLARBEAM,    MIMIC,        \
	     DOUBLE_TEAM,  REFLECT,      BIDE,         REST,         SUBSTITUTE,   \
	     CUT
	; end

	; marcelnote - improve Pokemon picture system tutorial
	db BANK(VileplumePicFront)
	assert BANK(VileplumePicFront) == BANK(VileplumePicBack)
