	db DEX_GROWLITHE ; pokedex id

	db  55,  70,  45,  60,  50
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db 190 ; catch rate
	db 91 ; base exp

	db SPRITE_DIM_SMALL ; marcelnote - modified data structure
	dw GrowlithePics
	dw 0 ; empty

	db TACKLE, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset - marcelnote - replaced BITE, ROAR, NO_MOVE, NO_MOVE
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	; marcelnote - added FLASH, SOLARBEAM
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  RAGE,         \
	     DRAGON_RAGE,  DIG,          MIMIC,        DOUBLE_TEAM,  REFLECT,      \
	     BIDE,         FIRE_BLAST,   SWIFT,        SKULL_BASH,   REST,         \
	     SUBSTITUTE,   FLASH,        SOLARBEAM
	; end

	; marcelnote - improve Pokemon picture system tutorial
	db BANK(GrowlithePicFront)
	assert BANK(GrowlithePicFront) == BANK(GrowlithePicBack)
