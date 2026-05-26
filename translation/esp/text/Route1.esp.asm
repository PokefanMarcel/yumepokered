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
	text "OAK: Oh,"
	line "<PLAYER>!"
	cont "You caught me"
	cont "on my afternoon"
	cont "stroll."

	para "Actually, I've"
	line "been wanting"
	cont "to see you."

	para "You know, I was"
	line "quite the trainer"
	cont "too, back in"
	cont "my day."

	para "Witnessing your"
	line "journey from"
	cont "PALLET TOWN to"
	cont "becoming the"
	cont "#MON LEAGUE"
	cont "champion..."

	para "It made me feel"
	line "young again!"

	para "What do you say,"
	line "<PLAYER>?"
	cont "Would you indulge"
	cont "this old man in a"
	cont "friendly battle?"
	done

; TODO - Spanish translation
_Route1OakRefusedBattleText:: ; marcelnote - postgame Oak battle
	text "Perhaps another"
	line "time, then!"
	done

; TODO - Spanish translation
_Route1OakAcceptedBattleText:: ; marcelnote - postgame Oak battle
	text "Excellent!"
	line "Let's put those"
	cont "old reflexes"
	cont "to the test!"
	done

_Route1OakDefeatText:: ; marcelnote - postgame Oak battle
; TODO - Spanish translation
_Route1OakVictoryText:: ; marcelnote - postgame Oak battle
	text "Truly"
	line "exhilarating!"
	prompt

; TODO - Spanish translation
_Route1OakPostBattleText:: ; marcelnote - postgame Oak battle
	text "OAK: Thank you,"
	line "<PLAYER>."

	para "I hadn't felt"
	line "that rush in"
	cont "a long time!"

	para "Well, back to"
	line "work now!"
	done

; TODO - Spanish translation
_Route1OakOneMoreThingText:: ; marcelnote - postgame Oak battle
	text "Oh, one more"
	line "thing!"

	para "Given your recent"
	line "feats, I've"
	cont "instructed the"
	cont "guard at ROUTE 22"
	cont "to let you pass."

	para "Actually, I just"
	line "authorized"
	cont "another trainer"
	cont "from PALLET, too."

	para "She defeated the"
	line "ELITE FOUR and"
	cont "<RIVAL> at the"
	cont "INDIGO PLATEAU!"

	para "I bet she'd like"
	line "to face the"
	cont "true champion!"
	done
