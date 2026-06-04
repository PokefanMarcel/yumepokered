_BrunosRoomBrunoBeforeBattleText::
	text "¡Yo soy BRUNO"
	line "del ALTO MANDO!"

	para "¡Con un riguroso"
	line "entrenamiento,"
	cont "la gente y los"
	cont "#MON pueden"
	cont "fortalecerse!"

	para "¡Yo he entrenado"
	line "a mis #MON"
	cont "con pesas!"

	para "¡<PLAYER>!"

	para "¡Os machacaremos"
	line "con nuestra"
	cont "gran fuerza!"

	para "¡Ja ja ja!"
	done

_BrunosRoomBrunoEndBattleText:: ; marcelnote - added map name to label
	text "¿Qué?"
	line "¿Cómo he"
	cont "podido perder?"
	prompt

_BrunosRoomBrunoAfterBattleText::
	text "¡Yo ya he hecho"
	line "mi trabajo! ¡Te"
	cont "está esperando tu"
	cont "próximo desafío!"
	done

; TODO - Spanish translation
_BrunosRoomBrunoRematchBeforeBattleText:: ; marcelnote - Bruno rematch text
	text "Ready for another"
	line "round, champ?"

	para "My #MON and I"
	line "have kept to a"
	cont "strict workout"
	cont "and diet routine."

	para "Face the results"
	line "of our rigorous"
	cont "training!"

	para "Hoo hah!"
	done

; TODO - Spanish translation
_BrunosRoomBrunoRematchEndBattleText:: ; marcelnote - Bruno rematch text
	text "So my"
	line "training is"
	cont "still lacking..."
	prompt

; TODO - Spanish translation
_BrunosRoomBrunoRematchAfterBattleText:: ; marcelnote - Bruno rematch text
	text "True discipline is"
	line "not accomplished"
	cont "in a day."

	para "Constant training"
	line "over time is key."

	para "On to the next"
	line "battle, champ!"
	done

_BrunosRoomBrunoDontRunAwayText::
	text "Voz de alguien:"
	line "¡No huyas!"
	done
