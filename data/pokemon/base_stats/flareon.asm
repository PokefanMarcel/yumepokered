	db DEX_FLAREON ; pokedex id

	db  65, 130,  60,  65, 110
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db 45 ; catch rate
	db 198 ; base exp

	db SPRITE_DIM_MEDIUM ; marcelnote - modified data structure
	dw FlareonPics
	dw 0 ; empty

	db TACKLE, SAND_ATTACK, NO_MOVE, NO_MOVE ; level 1 learnset ; marcelnote - removed QUICK_ATTACK, EMBER
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	; marcelnote - added SOLARBEAM, FLASH
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  HYPER_BEAM,   \
	     RAGE,         MIMIC,        DOUBLE_TEAM,  REFLECT,      BIDE,         \
	     FIRE_BLAST,   SWIFT,        SKULL_BASH,   REST,         SUBSTITUTE,   \
	     SOLARBEAM,    FLASH
	; end

	; marcelnote - improve Pokemon picture system tutorial
	db BANK(FlareonPicFront)
	assert BANK(FlareonPicFront) == BANK(FlareonPicBack)
