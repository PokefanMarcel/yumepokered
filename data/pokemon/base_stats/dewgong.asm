	db DEX_DEWGONG ; pokedex id

	db  90,  70,  80,  70,  95
	;   hp  atk  def  spd  spc

	db WATER, ICE ; type
	db 75 ; catch rate
	db 176 ; base exp

	INCBIN "gfx/pokemon/front/dewgong.pic", 0, 1 ; sprite dimensions
	dw DewgongPicFront, DewgongPicBack

	db HORN_ATTACK, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset ; marcelnote - changed from HEADBUTT, GROWL, AURORA_BEAM, NO_MOVE
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        HORN_DRILL,   BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   \
	     PAY_DAY,      RAGE,         MIMIC,        DOUBLE_TEAM,  BIDE,         \
	     SKULL_BASH,   REST,         SUBSTITUTE,   SURF,         STRENGTH
	; end

	; marcelnote - improve Pokemon picture system tutorial
	db BANK(DewgongPicFront)
	assert BANK(DewgongPicFront) == BANK(DewgongPicBack)
