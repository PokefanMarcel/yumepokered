	db DEX_EXEGGCUTE ; pokedex id

	db  60,  40,  80,  40,  60
	;   hp  atk  def  spd  spc

	db GRASS, PSYCHIC_TYPE ; type
	db 90 ; catch rate
	db 98 ; base exp

	db SPRITE_DIM_LARGE ; marcelnote - modified data structure
	dw ExeggcutePics
	dw 0 ; empty

	db ABSORB, HYPNOSIS, NO_MOVE, NO_MOVE ; level 1 learnset ; marcelnote - replaced BARRAGE with ABSORB
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  RAGE,         PSYCHIC_M,    \
	     TELEPORT,     MIMIC,        DOUBLE_TEAM,  REFLECT,      BIDE,         \
	     SELFDESTRUCT, EGG_BOMB,     REST,         PSYWAVE,      EXPLOSION,    \
	     SUBSTITUTE
	; end

	; marcelnote - improve Pokemon picture system tutorial
	db BANK(ExeggcutePicFront)
	assert BANK(ExeggcutePicFront) == BANK(ExeggcutePicBack)
