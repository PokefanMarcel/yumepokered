	db DEX_CATERPIE ; pokedex id

	db  45,  30,  35,  45,  20
	;   hp  atk  def  spd  spc

	db BUG, BUG ; type
	db 255 ; catch rate
	db 53 ; base exp

	db SPRITE_DIM_SMALL ; marcelnote - modified data structure
	dw CaterpiePics
	dw 0 ; empty

	db TACKLE, STRING_SHOT, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	; marcelnote - added TAKE_DOWN and DOUBLE_EDGE
	tmhm TAKE_DOWN,    DOUBLE_EDGE
	; end

	; marcelnote - improve Pokemon picture system tutorial
	db BANK(CaterpiePicFront)
	assert BANK(CaterpiePicFront) == BANK(CaterpiePicBack)
