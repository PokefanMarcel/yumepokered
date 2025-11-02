	db DEX_SLOWPOKE ; pokedex id

	db  90,  65,  65,  15,  40
	;   hp  atk  def  spd  spc

	db WATER, PSYCHIC_TYPE ; type
	db 190 ; catch rate
	db 99 ; base exp

	db SPRITE_DIM_SMALL ; marcelnote - modified data structure
	dw SlowpokePics
	dw 0 ; empty

	db POUND, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset ; marcelnote - changed from CONFUSION, NO_MOVE, NO_MOVE, NO_MOVE
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   \
	     WATER_GUN,    ICE_BEAM,     BLIZZARD,     PAY_DAY,      RAGE,         \
	     EARTHQUAKE,   FISSURE,      DIG,          PSYCHIC_M,    TELEPORT,     \
	     MIMIC,        DOUBLE_TEAM,  REFLECT,      BIDE,         FIRE_BLAST,   \
	     SWIFT,        SKULL_BASH,   REST,         THUNDER_WAVE, PSYWAVE,      \
	     TRI_ATTACK,   SUBSTITUTE,   SURF,         STRENGTH,     FLASH
	; end

	; marcelnote - improve Pokemon picture system tutorial
	db BANK(SlowpokePicFront)
	assert BANK(SlowpokePicFront) == BANK(SlowpokePicBack)
