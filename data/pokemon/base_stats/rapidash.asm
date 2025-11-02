	db DEX_RAPIDASH ; pokedex id

	db  65, 100,  70, 105,  80
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db 60 ; catch rate
	db 192 ; base exp

	db SPRITE_DIM_LARGE ; marcelnote - modified data structure
	dw RapidashPics
	dw 0 ; empty

	db EMBER, TAIL_WHIP, NO_MOVE, NO_MOVE ; level 1 learnset ; marcelnote - removed STOMP, GROWL
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset ; marcelnote - added MEGA_KICK
	tmhm TOXIC,        HORN_DRILL,   BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     HYPER_BEAM,   RAGE,         MIMIC,        DOUBLE_TEAM,  REFLECT,      \
	     BIDE,         FIRE_BLAST,   SWIFT,        SKULL_BASH,   REST,         \
	     SUBSTITUTE,   MEGA_KICK
	; end

	; marcelnote - improve Pokemon picture system tutorial
	db BANK(RapidashPicFront)
	assert BANK(RapidashPicFront) == BANK(RapidashPicBack)
