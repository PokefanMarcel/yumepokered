	db DEX_DITTO ; pokedex id

	db  48,  48,  48,  48,  48
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 35 ; catch rate
	db 61 ; base exp

	db SPRITE_DIM_SMALL ; marcelnote - modified data structure
	dw DittoPics
	dw 0 ; empty

	db TRANSFORM, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm
	; end

	; marcelnote - improve Pokemon picture system tutorial
	db BANK(DittoPicFront)
	assert BANK(DittoPicFront) == BANK(DittoPicBack)
