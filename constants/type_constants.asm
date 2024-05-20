; TypeNames indexes (see data/types/names.asm)
	const_def

DEF PHYSICAL EQU const_value
	const NORMAL       ; $00
	const FIGHTING     ; $01
	const FLYING       ; $02
	const POISON       ; $03
	const GROUND       ; $04
	const ROCK         ; $05
	const BIRD         ; $06
	const BUG          ; $07
	const DRAGON       ; $08 ; marcelnote - switched GHOST and DRAGON but should break trade compatibility

DEF UNUSED_TYPES EQU const_value
	const_next 20
DEF UNUSED_TYPES_END EQU const_value

DEF SPECIAL EQU const_value
	const FIRE         ; $14
	const WATER        ; $15
	const GRASS        ; $16
	const ELECTRIC     ; $17
	const PSYCHIC_TYPE ; $18
	const ICE          ; $19
	const GHOST        ; $1A ; marcelnote - switched GHOST and DRAGON but should break trade compatibility

; marcelnote - to reestablish trade compatibility, should switch them back
; then need to look into battle/core.asm to correctly allocate Type constants to PHYSICAL or SPECIAL
; essentially need to say that move is PHYSICAL if type between $00 - $07,
; SPECIAL between $08 - $19, and PHYSICAL again if $1A

DEF NUM_TYPES EQU const_value
