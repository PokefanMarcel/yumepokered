_BrunosRoomBrunoBeforeBattleText::
	text "Mon nom est ALDO"
	line "du CONSEIL des 4!"

	para "Ma passion à moi"
	line "et à mes #MON,"
	cont "c'est la muscu!"

	para "Pour frimer sur"
	line "la plage ou pour"
	cont "boxer les nabots,"
	cont "rien de tel qu'un"
	cont "corps de rêve!"

	para "<PLAYER>!"

	para "Ton équipe..."
	line "J'vais en faire"
	cont "du yaourt!"

	para "A table!"
	done

_BrunosRoomBrunoEndBattleText::
	text "Pourquoi?"
	line "Et mes muscles?"
	prompt

_BrunosRoomBrunoAfterBattleText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Bien joué, p'tit!"
	line "La prochaine"
	cont "t'attend!"
	done

.GirlText
	text "Bien joué, p'tite!"
	line "La prochaine"
	cont "t'attend!"
	done


_BrunosRoomBrunoRematchEndBattleText:: ; marcelnote - Bruno rematch text
	text "J'manque"
	line "encore de jus..."
	prompt

_BrunosRoomBrunoRematchBeforeBattleText:: ; marcelnote - Bruno rematch text
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "On y va pour un"
	line "nouveau round,"
	cont "champion?"

	para "Avec mes #MON,"
	line "on a suivi un"
	cont "régime strict,"
	cont "muscu et brocoli."

	para "Prêt à manger"
	line "tes dents, p'tit?"

	para "A table!"
	done

.GirlText
	text "On y va pour un"
	line "nouveau round,"
	cont "championne?"

	para "Avec mes #MON,"
	line "on a suivi un"
	cont "régime strict,"
	cont "muscu et brocoli."

	para "Prête à manger"
	line "tes dents, p'tite?"

	para "A table!"
	done

_BrunosRoomBrunoRematchAfterBattleText:: ; marcelnote - Bruno rematch text
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "La discipline,"
	line "ça s'improvise pas"
	cont "en un jour."

	para "Faut bosser,"
	line "répéter, encore"
	cont "et encore!"

	para "Allez, va voir"
	line "la prochaine,"
	cont "champion!"
	done

.GirlText
	text "La discipline,"
	line "ça s'improvise pas"
	cont "en un jour."

	para "Faut bosser,"
	line "répéter, encore"
	cont "et encore!"

	para "Allez, va voir"
	line "la prochaine,"
	cont "championne!"
	done

_BrunosRoomBrunoDontRunAwayText::
	text "Une voix:"
	line "Ne fuis pas!"
	done
