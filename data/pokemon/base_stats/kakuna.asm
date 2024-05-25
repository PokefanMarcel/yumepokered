	db DEX_KAKUNA ; pokedex id

	db  45,  25,  50,  35,  25
	;   hp  atk  def  spd  spc

	db BUG, POISON ; type
	db 120 ; catch rate
	db 71 ; base exp

	INCBIN "gfx/pokemon/front/kakuna.pic", 0, 1 ; sprite dimensions
	dw KakunaPicFront, KakunaPicBack

	db POISON_STING, STRING_SHOT, HARDEN, NO_MOVE ; level 1 learnset ; marcelnote - added POISON_STING and STRING_SHOT
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	; marcelnote - added TAKE_DOWN and DOUBLE_EDGE
	tmhm TAKE_DOWN,    DOUBLE_EDGE
	; end

	db 0 ; padding
