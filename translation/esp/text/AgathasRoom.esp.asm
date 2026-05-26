_AgathasRoomAgathaBeforeBattleText::
	text "¡Yo soy AGATHA"
	line "del ALTO MANDO!"

	para "¡El PROF. OAK"
	line "parece estar muy"
	cont "interesado en ti!"

	para "¡Hace tiempo ese"
	line "viejo inútil era"
	cont "fuerte y apuesto!"
	cont "¡Pero eso fue"
	cont "hace décadas!"

	para "¡Ahora sólo"
	line "juguetea con su"
	cont "#DEX! ¡Pero"
	cont "está equivocado!"
	cont "¡Los #MON"
	cont "son para luchar!"

	para "¡<PLAYER>! ¡Yo"
	line "te enseñaré cómo"
	cont "lucha un gran"
	cont "entrenador!"
	done

_AgathasRoomAgathaEndBattleText:: ; marcelnote - added map name to label
	text "Oh ho!"
	line "You're something"
	cont "special, child!"
	prompt

_AgathasRoomAgathaAfterBattleText::
	text "¡Tú ganas! ¡Ya sé"
	line "por qué ese viejo"
	cont "inútil te aprecia"
	cont "tanto!"

	para "¡No tengo nada"
	line "más que decir! " 
	cont "¡Vete ya niño!"
	done

_AgathasRoomAgathaRematchBeforeBattleText:: ; marcelnote - Agatha rematch text
	text "Back so soon,"
	line "are you?"

	para "Time has a way"
	line "of moving past"
	cont "us all... But"
	cont "know that I won't"
	cont "fade quietly!"

	para "Show me you are"
	line "worthy of"
	cont "carrying our"
	cont "spirit forward,"
	cont "child!"
	done

; TODO - Spanish translation
_AgathasRoomAgathaRematchEndBattleText:: ; marcelnote - Agatha rematch text
	text "Ah! Like"
	line "that old duff"
	;text "Oh ho! You"
	;line "remind me of OAK"
	cont "in his prime!"
	prompt

; TODO - Spanish translation
_AgathasRoomAgathaRematchAfterBattleText:: ; marcelnote - Agatha rematch text
	text "With you as"
	line "champion, our"
	cont "legacy is in"
	cont "good hands."

	para "Now, off you go."
	line "Go teach that"
	cont "pompous dragon"
	cont "master a lesson!"
	done

_AgathasRoomAgathaDontRunAwayText::
	text "Voz de alguien:"
	line "¡No huyas!"
	done
