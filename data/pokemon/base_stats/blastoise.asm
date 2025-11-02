	db DEX_BLASTOISE ; pokedex id

	db  79,  83, 100,  78,  85
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 45 ; catch rate
	db 210 ; base exp

	db SPRITE_DIM_LARGE ; marcelnote - modified data structure
	dw BlastoisePics
	dw 0 ; empty

	db TACKLE, TAIL_WHIP, NO_MOVE, NO_MOVE ; level 1 learnset ; marcelnote - removed BUBBLE, WATER_GUN
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   MEGA_KICK,    TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     BLIZZARD,     \
	     HYPER_BEAM,   SUBMISSION,   COUNTER,      SEISMIC_TOSS, RAGE,         \
	     EARTHQUAKE,   FISSURE,      DIG,          MIMIC,        DOUBLE_TEAM,  \
	     REFLECT,      BIDE,         SKULL_BASH,   REST,         SUBSTITUTE,   \
	     SURF,         STRENGTH
	; end

	; marcelnote - improve Pokemon picture system tutorial
	db BANK(BlastoisePicFront)
	assert BANK(BlastoisePicFront) == BANK(BlastoisePicBack)
