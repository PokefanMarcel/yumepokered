	db DEX_GOLEM ; pokedex id

	db  80, 110, 130,  45,  55
	;   hp  atk  def  spd  spc

	db ROCK, GROUND ; type
	db 45 ; catch rate
	db 177 ; base exp

	db SPRITE_DIM_MEDIUM ; marcelnote - modified data structure
	dw GolemPics
	dw 0 ; empty

	db TACKLE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset ; marcelnote - removed DEFENSE_CURL
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   MEGA_KICK,    TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  HYPER_BEAM,   SUBMISSION,   COUNTER,      SEISMIC_TOSS, \
	     RAGE,         EARTHQUAKE,   FISSURE,      DIG,          MIMIC,        \
	     DOUBLE_TEAM,  BIDE,         METRONOME,    SELFDESTRUCT, FIRE_BLAST,   \
	     REST,         EXPLOSION,    ROCK_SLIDE,   SUBSTITUTE,   STRENGTH
	; end

	; marcelnote - improve Pokemon picture system tutorial
	db BANK(GolemPicFront)
	assert BANK(GolemPicFront) == BANK(GolemPicBack)
