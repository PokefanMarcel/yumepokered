	db DEX_MAGNETON ; pokedex id

	db  50,  60,  95,  70, 120
	;   hp  atk  def  spd  spc

	db ELECTRIC, ELECTRIC ; type
	db 60 ; catch rate
	db 161 ; base exp

	db SPRITE_DIM_MEDIUM ; marcelnote - modified data structure
	dw MagnetonPics
	dw 0 ; empty

	db TACKLE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset ; marcelnote - changed from TACKLE, SONICBOOM, THUNDERSHOCK, NO_MOVE
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	; marcelnote - added TRI_ATTACK
	tmhm TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  HYPER_BEAM,   RAGE,         \
	     THUNDERBOLT,  THUNDER,      TELEPORT,     MIMIC,        DOUBLE_TEAM,  \
	     REFLECT,      BIDE,         SWIFT,        REST,         THUNDER_WAVE, \
	     SUBSTITUTE,   FLASH,        TRI_ATTACK
	; end

	; marcelnote - improve Pokemon picture system tutorial
	db BANK(MagnetonPicFront)
	assert BANK(MagnetonPicFront) == BANK(MagnetonPicBack)
