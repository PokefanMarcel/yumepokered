	db DEX_METAPOD ; pokedex id

	db  50,  20,  55,  30,  25
	;   hp  atk  def  spd  spc

	db BUG, BUG ; type
	db 120 ; catch rate
	db 72 ; base exp

	INCBIN "gfx/pokemon/front/metapod.pic", 0, 1 ; sprite dimensions
	dw MetapodPicFront, MetapodPicBack

	db TACKLE, STRING_SHOT, HARDEN, NO_MOVE ; level 1 learnset ; marcelnote - added TACKLE and STRING_SHOT
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	; marcelnote - added TAKE_DOWN and DOUBLE_EDGE
	tmhm TAKE_DOWN,    DOUBLE_EDGE
	; end

	db 0 ; padding
