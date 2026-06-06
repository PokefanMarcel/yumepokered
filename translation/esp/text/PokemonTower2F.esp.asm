_PokemonTower2FRivalWhatBringsYouHereText::
	text "<RIVAL>: ¡Oye,"
	line "<PLAYER>! ¿Qué"
	cont "haces por aquí?"
	cont "¡Tus #MON no"
	cont "pueden morir!"

	para "¡Al menos puedo"
	line "debilitarlos!"
	cont "¡Vamos chico!"
	done

_PokemonTower2FRivalDefeatedText::
	text "¿Qué?"
	line "¡Qué malo eres!"

	para "¡Y te había"
	line "tomado en serio!"
	prompt

_PokemonTower2FRivalVictoryText::
	text "<RIVAL>: ¡Mira"
	line "qué canijos son" ; marcelnote - fixed accent
	cont "tus #MON!"

	para "¡Fortalécelos"
	line "un poco!"
	prompt

_PokemonTower2FRivalHowsYourDexText::
	text "¿Qué tal va tu"
	line "#DEX? ¡Acabo"
	cont "de capturar"
	cont "un CUBONE!"

	para "¡Todavía no he"
	line "encontrado al"
	cont "MAROWAK adulto!"

	para "¡No creo que"
	line "quede ninguno!"
	cont "¡Mejor que me"
	cont "vaya! ¡Me queda"
	cont "mucho por hacer!"

	para "¡Hasta luego!"
	done

_PokemonTower2FChannelerText::
	text "¡Ni siquiera"
	line "pudimos"
	cont "identificar a"
	cont "los GHOST!"

	para "El SCOPE SILPH"
	line "podría"
	cont "desenmascararlos."
	done

; TODO - Spanish translation
_PokemonTower2FGhostBattleText:: ; marcelnote - postgame Agatha event
	text "Intruders..."
	line "In our home..."
	done

; TODO - Spanish translation
_PokemonTower2FGhostVanishedText:: ; marcelnote - postgame Agatha event
	text "The ghost"
	line "vanished..."
	done
