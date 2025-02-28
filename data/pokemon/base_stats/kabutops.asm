	db DEX_KABUTOPS ; pokedex id

	db  60, 115, 105,  80,  70
	;   hp  atk  def  spd  spc

	db ROCK, WATER ; type
	db 45 ; catch rate
	db 201 ; base exp

	INCBIN "gfx/pokemon/front/kabutops.pic", 0, 1 ; sprite dimensions
	dw KabutopsPicFront, KabutopsPicBack

	db SCRATCH, HARDEN, FURY_SWIPES, NO_MOVE ; level 1 learnset ; marcelnote - replaced ABSORB by FURY_SWIPES
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset ; marcelnote - added CUT and MEGA_DRAIN, removed RAZOR_WIND
	tmhm MEGA_DRAIN,   SWORDS_DANCE, MEGA_KICK,    TOXIC,        BODY_SLAM,    \
	     TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     \
	     BLIZZARD,     HYPER_BEAM,   SUBMISSION,   SEISMIC_TOSS, RAGE,         \
	     MIMIC,        DOUBLE_TEAM,  REFLECT,      BIDE,         SKULL_BASH,   \
	     REST,         SUBSTITUTE,   SURF,         CUT
	; end

	; marcelnote - improve Pokemon picture system tutorial
	db BANK(KabutopsPicFront)
	assert BANK(KabutopsPicFront) == BANK(KabutopsPicBack)
