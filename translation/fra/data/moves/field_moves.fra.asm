FieldMoveDisplayData:
	; move id, FieldMoveNames index, leftmost tile
	; (leftmost tile = -1 + tile column in which the first
	;  letter of the move's name should be displayed)
	db CUT,        1, $0C ; COUPE
	db FLY,        2, $0C ; VOL
	db ANIM_B4,    3, $0C ; unused
	db SURF,       4, $0C ; SURF
	db STRENGTH,   5, $0C ; FORCE
	db FLASH,      6, $0C ; FLASH
	db DIG,        7, $0C ; TUNNEL
	db TELEPORT,   8, $0A ; TELEPORT
	db SOFTBOILED, 9, $0B ; E-COQUE
	db -1 ; end
