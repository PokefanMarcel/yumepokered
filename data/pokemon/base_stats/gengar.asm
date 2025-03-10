	db DEX_GENGAR ; pokedex id

	db  60,  65,  60, 110, 130
	;   hp  atk  def  spd  spc

	db GHOST, POISON ; type
	db 45 ; catch rate
	db 190 ; base exp

	INCBIN "gfx/pokemon/front/gengar.pic", 0, 1 ; sprite dimensions
	dw GengarPicFront, GengarPicBack

	db LICK, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset ; marcelnote - replaced LICK, CONFUSE_RAY, NIGHT_SHADE, NO_MOVE
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	; marcelnote - added HEX
	tmhm MEGA_PUNCH,   MEGA_KICK,    TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  HYPER_BEAM,   SUBMISSION,   COUNTER,      SEISMIC_TOSS, \
	     RAGE,         MEGA_DRAIN,   THUNDERBOLT,  THUNDER,      PSYCHIC_M,    \
	     MIMIC,        DOUBLE_TEAM,  BIDE,         METRONOME,    SELFDESTRUCT, \
	     SKULL_BASH,   DREAM_EATER,  REST,         PSYWAVE,      EXPLOSION,    \
	     SUBSTITUTE,   STRENGTH,     HEX
	; end

	; marcelnote - improve Pokemon picture system tutorial
	db BANK(GengarPicFront)
	assert BANK(GengarPicFront) == BANK(GengarPicBack)
