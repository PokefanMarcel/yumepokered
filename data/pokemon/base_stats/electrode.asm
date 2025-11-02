	db DEX_ELECTRODE ; pokedex id

	db  60,  50,  70, 140,  80
	;   hp  atk  def  spd  spc

	db ELECTRIC, ELECTRIC ; type
	db 60 ; catch rate
	db 150 ; base exp

	db SPRITE_DIM_SMALL ; marcelnote - modified data structure
	dw ElectrodePics
	dw 0 ; empty

	db TACKLE, SCREECH, NO_MOVE, NO_MOVE ; level 1 learnset ; marcelnote - removed SONICBOOM
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        TAKE_DOWN,    HYPER_BEAM,   RAGE,         THUNDERBOLT,  \
	     THUNDER,      TELEPORT,     MIMIC,        DOUBLE_TEAM,  REFLECT,      \
	     BIDE,         SELFDESTRUCT, SWIFT,        SKULL_BASH,   REST,         \
	     THUNDER_WAVE, EXPLOSION,    SUBSTITUTE,   FLASH
	; end

	; marcelnote - improve Pokemon picture system tutorial
	db BANK(ElectrodePicFront)
	assert BANK(ElectrodePicFront) == BANK(ElectrodePicBack)
