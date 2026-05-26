_NameRatersHouseNameRaterWantMeToRateText::
	text "¡Hola a todos!"
	line "¡Soy el INSPECTOR"
	cont "de los NOMBRES!"

	para "¿Quieres que"
	line "evalúe los motes"
	cont "de tus #MON?"
	done

_NameRatersHouseNameRaterWhichPokemonText::
	text "¿Qué #MON"
	line "debería evaluar?"
	prompt

_NameRatersHouseNameRaterGiveItANiceNameText::
	text "¿@"
	text_ram wNameBuffer
	text "?"
	line "¡Es un buen mote!"

	para "¿Quieres que le"
	line "dé otro nombre"
	cont "mejor?"

	para "¿Qué te parece?"
	done

_NameRatersHouseNameRaterWhatShouldWeNameItText::
	text "¿Cómo podríamos"
	line "llamarlo?"
	prompt

_NameRatersHouseNameRaterPokemonHasBeenRenamedText::
	text "¡Este #MON ha"
	line "sido renombrado"
	cont "@"
	text_ram wBuffer
	text "!"

	para "¡Ese nombre es"
	line "mejor que el"
	cont "anterior!"
	done

_NameRatersHouseNameRaterComeAnyTimeYouLikeText::
	text "¡Bien! ¡Vuelve"
	line "cuando quieras!"
	done

_NameRatersHouseNameRaterATrulyImpeccableNameText::
	text "¿@"
	text_ram wNameBuffer
	text "?"
	line "¡Ese nombre es"
	cont "perfecto!"

	para "¡Cuida bien de"
	line "@"
	text_ram wNameBuffer
	text "!"
	done
