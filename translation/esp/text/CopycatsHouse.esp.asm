; marcelnote - merged Copycat's house floors
_CopycatsHouse1FMiddleAgedWomanText::
	text "¡Mi hija está tan"
	line "metida en sí"
	cont "misma que tiene"
	cont "muy pocos amigos!"
	done

_CopycatsHouse1FMiddleAgedManText::
	text "A mi hija le"
	line "gusta imitar a"
	cont "la gente."

	para "¡Y por eso la"
	line "gente de por aquí"
	cont "le llama la"
	cont "COPIONA!"
	done

_CopycatsHouse1FChanseyText::
	text "CHANSEY: ¡Chaan!"
	line "¡Chaan!@"
	text_end

_CopycatsHouse2FCopycatDoYouLikePokemonText::
	text "<PLAYER>: ¡Hola!"
	line "¿Te gustan los"
	cont "#MON?"

	para "<PLAYER>: ¿No?"
	line "Te he preguntado"
	cont "algo."

	para "<PLAYER>: ¿Eh?"
	line "¡Eres muy rara!"

	para "COPIONA: ¿Qué?"
	line "¿Dejar de imitar?"

	para "¡Es mi hobby"
	line "favorito!"
	prompt

_CopycatsHouse2FCopycatTM31PreReceiveText::
	text "¡Uauuu! ¡Una"
	line "# MUÑECA!"

	para "¿Es para mí?"
	line "¡Gracias!"

	para "¡Pues toma esto!"
	prompt

_CopycatsHouse2FCopycatReceivedTM31Text::
	text "¡<PLAYER> recibió"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_CopycatsHouse2FCopycatTM31Explanation1Text::
	text_start

	para "¡La MT31 contiene"
	line "MIMÉTICO!"

	para "¡Úsala en un buen"
	line "#MON!@"
	text_end

_CopycatsHouse2FCopycatTM31Explanation2Text::
	text "<PLAYER>: ¡Hola!"
	line "¡Muchas gracias"
	cont "por la MT31!"

	para "<PLAYER>: ¿Sí?"

	para "<PLAYER>: ¿Te"
	line "divierte imitar"
	cont "cada uno de mis"
	cont "movimientos?"

	para "COPIONA: ¿Tú"
	line "qué crees? ¡Es"
	cont "muy divertido!"
	done

_CopycatsHouse2FCopycatTM31NoRoomText::
	text "¿No quieres esto?@"
	text_end

_CopycatsHouse2FDoduoText::
	text "DODUO: ¡Dodu!"

	para "¡ESPEJO ESPEJITO!"
	line "¿QUIÉN ES LA"
	cont "MÁS BELLA DE"
	cont "TODAS?"
	done

_CopycatsHouse2FRareDollText::
	text "¡Éste es un raro"
	line "#MON! ¿Eh?"
	cont "¡Pero si es sólo"
	cont "una muñeca!"
	done

_CopycatsHouse2FSNESText::
	text "¡Un juego de"
	line "MARIO con un cubo"
	cont "en su cabeza!"
	done

_CopycatsHouse2FPCMySecretsText::
	text "..."

	para "¡Mis secretos!"

	para "Habilidad: Imitar"
	line "Hobby: Colección"
	cont "de muñecas."
	cont "#MON favorito:"
	cont "¡CLEFAIRY!"
	done

