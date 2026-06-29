_Route1Youngster1MartSampleText::
	text "¡Hola! Trabajo"
	line "en una TIENDA"
	cont "#MON."

	para "Tenemos muchas"
	line "cosas. Visítanos"
	cont "en la CIUDAD"
	cont "VERDE."

	para "¡Mira, te daré"
	line "una muestra!"
	cont "¡Aquí tienes!"
	prompt

_Route1Youngster1GotPotionText::
	text "¡<PLAYER> obtuvo"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_Route1Youngster1AlsoGotPokeballsText::
	text "¡También tenemos"
	line "# BALL para"
	cont "capturar a los"
	cont "#MON!"
	done

_Route1Youngster1NoRoomText::
	text "¡Llevas muchas"
	line "cosas!"
	done

_Route1Youngster2Text::
	text "¿Ves esos bordes"
	line "del camino?"

	para "Dan miedo, pero"
	line "puedes saltar por"
	cont "encima de ellos."

	para "¡De esa forma"
	line "podrás volver más"
	cont "rápidamente al"
	cont "PUEBLO PALETA!"
	done

_Route1SignText::
	text "RUTA 1:"
	line "PUEBLO PALETA -"
	cont "CIUDAD VERDE"
	done

_Route1OakBeforeBattleText:: ; marcelnote - postgame Oak fight
	; traducción por NunWinter
	text "OAK: ¡Oh,"
	line "<PLAYER>!"
	cont "Me pillas en"
	cont "mi paseo de la"
	cont "tarde."

	para "De hecho,"
	line "quería verte."

	para "Sabes, yo"
	line "también fui un"
	cont "gran entrenador"
	cont "en mis tiempos."

	para "Ver tu viaje"
	line "desde PUEBLO"
	cont "PALETA hasta"
	cont "convertirte en"
	cont "CAMPEÓN de la"
	cont "LIGA #MON..."

	para "¡Me hizo sentir"
	line "joven otra vez!"

	para "¿Qué dices,"
	line "<PLAYER>?"
	cont "¿Le darías a este"
	cont "viejo una batalla"
	cont "amistosa?"
	done

_Route1OakRefusedBattleText:: ; marcelnote - postgame Oak battle
	; traducción por NunWinter
	text "¡Quizá en otra"
	line "ocasión, entonces!"
	done

_Route1OakAcceptedBattleText:: ; marcelnote - postgame Oak battle
	; traducción por NunWinter
	text "¡Excelente!"
	line "¡Pongamos estos"
	cont "viejos reflejos"
	cont "a prueba!"
	done

_Route1OakDefeatText:: ; marcelnote - postgame Oak battle
	; traducción por NunWinter
	text "¡Qué"
	line "emocionante!"
	prompt

_Route1OakVictoryText:: ; marcelnote - postgame Oak battle
	; traducción por NunWinter
	text "De las"
	line "derrotas también"
	cont "se aprende,"
	cont "<PLAYER>!"

	para "¡Incluso siendo"
	line "el CAMPEÓN!"
	prompt

_Route1OakPostBattleText:: ; marcelnote - postgame Oak battle
	; traducción por NunWinter
	text "OAK: Gracias,"
	line "<PLAYER>."

	para "¡Hacía mucho que"
	line "no sentía esa"
	cont "emoción!"

	para "Bueno, ¡es hora"
	line "de volver al"
	cont "trabajo!"
	done

_Route1OakOneMoreThingText:: ; marcelnote - postgame Oak battle
	; traducción por NunWinter
	text "¡Oh, una cosa"
	line "más!"

	para "Por tus recientes"
	line "hazañas, di"
	cont "instrucciones al"
	cont "guarda de la"
	cont "RUTA 22."

	para "Ahora te dejará"
	line "pasar."

	para "De hecho,"
	line "también autoricé"
	cont "a otra"
	cont "entrenadora de"
	cont "PUEBLO PALETA."

	para "¡Ella derrotó al"
	line "ALTO MANDO y a"
	cont "<RIVAL> en la"
	cont "MESETA AÑIL!"

	para "¡Apuesto a que"
	line "querría"
	cont "enfrentarse al"
	cont "verdadero campeón!"
	done
