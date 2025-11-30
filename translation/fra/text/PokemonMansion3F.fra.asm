_PokemonMansion3FSuperNerdBattleText::
	text "Fouiii..."
	line "C'est grand ici!"
	done

_PokemonMansion3FSuperNerdEndBattleText::
	text "Yargl!"
	prompt

_PokemonMansion3FSuperNerdAfterBattleText::
	text "Mais où est donc"
	line "mon complice?"
	done

_PokemonMansion3FScientistBattleText::
	text "Mon mentor vivait"
	line "ici autrefois."
	done

_PokemonMansion3FScientistEndBattleText::
	text "!!!"
	line "Impressionnant!"
	prompt

_PokemonMansion3FScientistAfterBattleText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "T'es perdu?"
	line "Essaie de sauter"
	cont "par là-bas!"
	done

.GirlText
	text "T'es perdue?"
	line "Essaie de sauter"
	cont "par là-bas!"
	done

_PokemonMansion3FDiaryText::
	text "Rapport:"
	line "6 Février."
	cont "MEW est papa "
	cont "(ou maman?)"

	para "Le petit fut"
	line "baptisé MEWTWO."
	done
