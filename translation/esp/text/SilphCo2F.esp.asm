SilphCo2FSilphWorkerFPleaseTakeThisText::
	text "¡Socorro!"
	line "¡No! ¡Alto!"

	para "¿No perteneces"
	line "al TEAM ROCKET?"
	cont "Yo pensaba..."
	cont "Lo siento."
	cont "¡Toma esto!"
	prompt

_SilphCo2FSilphWorkerFReceivedTM36Text::
	text "¡<PLAYER> obtiene"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_SilphCo2FSilphWorkerFTM36ExplanationText::
	text "¡La MT36 es"
	line "AUTODESTRUCCIÓN!"

	para "¡Es muy potente,"
	line "pero el #MON"
	cont "que la use se"
	cont "debilitará mucho!"
	cont "¡Ten cuidado!"
	done

_SilphCo2FSilphWorkerFTM36NoRoomText::
	text "¡No tienes sitio"
	line "para esto!"
	done

_SilphCo2FScientist1BattleText::
	text "¡Socorro! ¡Soy"
	line "un empleado de"
	cont "SILPH S.A.!"
	done

_SilphCo2FScientist1EndBattleText::
	text_start
	line "¿Cómo sabías que"
	cont "yo era un ROCKET?"
	prompt

_SilphCo2FScientist1AfterBattleText::
	text "¡Trabajo para"
	line "SILPH S.A. y para"
	cont "el TEAM ROCKET!"
	done

_SilphCo2FScientist2BattleText::
	text "¡Estás en zona"
	line "prohibida!"
	cont "¡Vuelve a casa!"
	done

_SilphCo2FScientist2EndBattleText::
	text "¡Eres"
	line "muy bueno!"
	prompt

_SilphCo2FScientist2AfterBattleText::
	text "¿Puedes resolver"
	line "este laberinto?"
	done

_SilphCo2FRocket1BattleText::
	text "¡Aquí no pueden"
	line "entrar los niños!"
	done

_SilphCo2FRocket1EndBattleText::
	text_start
	line "¡Muy fuerte!"
	prompt

_SilphCo2FRocket1AfterBattleText::
	text "¡Las baldosas con"
	line "forma de diamante"
	cont "son puntos de"
	cont "teletransporte!"

	para "¡Son medios de"
	line "transporte de"
	cont "alta tecnología!"
	done

_SilphCo2FRocket2BattleText::
	text "¡Oye tú, niño!"
	line "¿Qué haces aquí?"
	done

_SilphCo2FRocket2EndBattleText::
	text "¡He"
	line "metido la pata!"
	prompt

_SilphCo2FRocket2AfterBattleText::
	text "¡SILPH S.A. va a"
	line "fusionarse con"
	cont "el TEAM ROCKET!"
	done

