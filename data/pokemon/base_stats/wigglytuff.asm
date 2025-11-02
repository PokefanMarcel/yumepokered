	db DEX_WIGGLYTUFF ; pokedex id

	db 140,  70,  45,  45,  50
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 50 ; catch rate
	db 109 ; base exp

	db SPRITE_DIM_MEDIUM ; marcelnote - modified data structure
	dw WigglytuffPics
	dw 0 ; empty

	db SING, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset ; marcelnote - removed DISABLE, DEFENSE_CURL, DOUBLESLAP
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   MEGA_KICK,    TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     BLIZZARD,     \
	     HYPER_BEAM,   SUBMISSION,   COUNTER,      SEISMIC_TOSS, RAGE,         \
	     SOLARBEAM,    THUNDERBOLT,  THUNDER,      PSYCHIC_M,    TELEPORT,     \
	     MIMIC,        DOUBLE_TEAM,  REFLECT,      BIDE,         FIRE_BLAST,   \
	     SKULL_BASH,   REST,         THUNDER_WAVE, PSYWAVE,      TRI_ATTACK,   \
	     SUBSTITUTE,   STRENGTH,     FLASH
	; end

	; marcelnote - improve Pokemon picture system tutorial
	db BANK(WigglytuffPicFront)
	assert BANK(WigglytuffPicFront) == BANK(WigglytuffPicBack)
