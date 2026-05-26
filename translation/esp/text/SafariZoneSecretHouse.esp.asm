_SafariZoneSecretHouseFishingGuruYouHaveWonText::
	text "¡Ah! ¡Por fin!"

	para "¡Eres el primero"
	line "que llega a la"
	cont "CASA SECRETA!"

	para "Estaba empezando"
	line "a preocuparme"
	cont "que nadie ganara"
	cont "nuestro premio."

	para "¡Enhorabuena!"
	line "¡Eres el ganador!"
	prompt

_SafariZoneSecretHouseFishingGuruReceivedHM03Text::
	text "¡<PLAYER> recibió"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_SafariZoneSecretHouseFishingGuruHM03ExplanationText::
	text "¡La MO03 es SURF!"

	para "¡Un #MON"
	line "podrá llevarte"
	cont "por el agua!"

	para "¡Y esta MO puede"
	line "ser utilizada una"
	cont "y otra vez!"

	para "¡Tienes muchísima"
	line "suerte! ¡Eres el"
	cont "ganador de este"
	cont "fabuloso premio!"
	done

_SafariZoneSecretHouseFishingGuruHM03NoRoomText::
	text "¡No tienes sitio"
	line "para este premio"
	cont "tan fabuloso!"
	done

_SafariZoneSecretHousePosterText:: ; marcelnote - new
	text "SURF lovers, come"
	line "visit our shop on"
	cont "MANDARIN ISLAND!"
	cont "WAVE CRAZE"
	done
