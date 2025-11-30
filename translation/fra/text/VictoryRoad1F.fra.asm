_VictoryRoad1FCooltrainerFBattleText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Es-tu aussi fort"
	line "que môa? "
	done

.GirlText
	text "Es-tu aussi forte"
	line "que môa? "
	done

_VictoryRoad1FCooltrainerFEndBattleText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Oh!"
	line "Vilain!"
	prompt

.GirlText
	text "Oh!"
	line "Vilaine!"
	prompt

_VictoryRoad1FCooltrainerFAfterBattleText::
	text "Perdre ça craint!"
	done

_VictoryRoad1FCooltrainerMBattleText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Mmm..."
	line "T'as l'air fort!"
	cont "Mais l'es-tu"
	cont "vraiment?"
	done

.GirlText
	text "Mmm..."
	line "T'as l'air forte!"
	cont "Mais l'es-tu"
	cont "vraiment?"
	done

_VictoryRoad1FCooltrainerMEndBattleText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "OK."
	line "T'es fort."
	prompt

.GirlText
	text "OK."
	line "T'es forte."
	prompt

_VictoryRoad1FCooltrainerMAfterBattleText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "T'es fort, "
	line "on a compris!"
	done

.GirlText
	text "T'es forte, "
	line "on a compris!"
	done
