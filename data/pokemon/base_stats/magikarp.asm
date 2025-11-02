	db DEX_MAGIKARP ; pokedex id

	db  20,  10,  55,  80,  20
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 255 ; catch rate
	db 20 ; base exp

	db SPRITE_DIM_MEDIUM ; marcelnote - modified data structure
	dw MagikarpPics
	dw 0 ; empty

	db SPLASH, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm
	; end

	; marcelnote - improve Pokemon picture system tutorial
	db BANK(MagikarpPicFront)
	assert BANK(MagikarpPicFront) == BANK(MagikarpPicBack)
