	db DEX_NIDOQUEEN ; pokedex id

	db  90,  82,  87,  76,  75
	;   hp  atk  def  spd  spc

	db POISON, GROUND ; type
	db 45 ; catch rate
	db 194 ; base exp

	db SPRITE_DIM_LARGE ; marcelnote - modified data structure
	dw NidoqueenPics
	dw 0 ; empty

	;db TACKLE, SCRATCH, TAIL_WHIP, BODY_SLAM ; level 1 learnset
	db TACKLE, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset ; marcelnote - changed
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   MEGA_KICK,    TOXIC,        HORN_DRILL,   BODY_SLAM,    \
	     TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     \
	     BLIZZARD,     HYPER_BEAM,   PAY_DAY,      SUBMISSION,   COUNTER,      \
	     SEISMIC_TOSS, RAGE,         THUNDERBOLT,  THUNDER,      EARTHQUAKE,   \
	     FISSURE,      MIMIC,        DOUBLE_TEAM,  REFLECT,      BIDE,         \
	     FIRE_BLAST,   SKULL_BASH,   REST,         ROCK_SLIDE,   SUBSTITUTE,   \
	     SURF,         STRENGTH
	; end

	; marcelnote - improve Pokemon picture system tutorial
	db BANK(NidoqueenPicFront)
	assert BANK(NidoqueenPicFront) == BANK(NidoqueenPicBack)
