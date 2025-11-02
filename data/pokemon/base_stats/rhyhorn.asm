	db DEX_RHYHORN ; pokedex id

	db  80,  85,  95,  25,  30
	;   hp  atk  def  spd  spc

	db GROUND, ROCK ; type
	db 120 ; catch rate
	db 135 ; base exp

	db SPRITE_DIM_LARGE ; marcelnote - modified data structure
	dw RhyhornPics
	dw 0 ; empty

	db HORN_ATTACK, LEER, NO_MOVE, NO_MOVE ; level 1 learnset ; marcelnote - added LEER
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        HORN_DRILL,   BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     RAGE,         THUNDERBOLT,  THUNDER,      EARTHQUAKE,   FISSURE,      \
	     DIG,          MIMIC,        DOUBLE_TEAM,  BIDE,         FIRE_BLAST,   \
	     SKULL_BASH,   REST,         ROCK_SLIDE,   SUBSTITUTE,   STRENGTH
	; end

	; marcelnote - improve Pokemon picture system tutorial
	db BANK(RhyhornPicFront)
	assert BANK(RhyhornPicFront) == BANK(RhyhornPicBack)
