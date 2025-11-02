	db DEX_DUGTRIO ; pokedex id

	db  35,  80,  50, 120,  70
	;   hp  atk  def  spd  spc

	db GROUND, GROUND ; type
	db 50 ; catch rate
	db 153 ; base exp

	db SPRITE_DIM_LARGE ; marcelnote - modified data structure
	dw DugtrioPics
	dw 0 ; empty

	db SCRATCH, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset ; marcelnote - removed DIG
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	; marcelnote - added CUT, TRI_ATTACK
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  HYPER_BEAM,   \
	     RAGE,         EARTHQUAKE,   FISSURE,      DIG,          MIMIC,        \
	     DOUBLE_TEAM,  BIDE,         REST,         ROCK_SLIDE,   SUBSTITUTE,   \
	     CUT,          TRI_ATTACK
	; end

	; marcelnote - improve Pokemon picture system tutorial
	db BANK(DugtrioPicFront)
	assert BANK(DugtrioPicFront) == BANK(DugtrioPicBack)
