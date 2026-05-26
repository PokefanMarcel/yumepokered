; marcelnote - merged Cinnabar Lab maps
_CinnabarLabFishingGuruText::
	text "Aquí estudiamos a"
	line "los #MON."

	para "La gente suele"
	line "traernos a raros"
	cont "#MON para"
	cont "analizarlos."
	done

_CinnabarLabPhotoText::
	text "¡Una foto del"
	line "fundador del"
	cont "LABORATORIO,"
	cont "el DR.FUJI!"
	done

_CinnabarLabMeetingRoomSignText::
	text "LABORATORIO <PKMN>"
	line "Reuniones"
	done

_CinnabarLabRAndDSignText::
	text "LABORATORIO <PKMN>"
	line "Sala de I-D"
	done

_CinnabarLabTestingRoomSignText::
	text "LABORATORIO <PKMN>"
	line "Sala de Pruebas"
	done

_CinnabarLabTradeRoomSuperNerdText::
	text "¡Encontré este"
	line "fósil tan raro en"
	cont "el MT. MOON!"

	para "¡Creo que es un"
	line "prehistórico y"
	cont "raro #MON!"
	done

_CinnabarLabMetronomeRoomScientist1Text::
	text "¡Tac-tac! ¡Hice"
	line "una genial MT!"

	para "¡Es tremendamente"
	line "divertida!"
	prompt

_CinnabarLabMetronomeRoomScientist1ReceivedTM35Text::
	text "¡<PLAYER> obtiene"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_CinnabarLabMetronomeRoomScientist1TM35ExplanationText::
	text "¡Tac-tac-tac!"
	line "¡Ése es el sonido"
	cont "de un METRÓNOMO!"

	para "¡Lleva al cerebro"
	line "de tu #MON"
	cont "a usar ataques"
	cont "que no conoce!"
	done

_CinnabarLabMetronomeRoomScientist1TM35NoRoomText::
	text "¡Tu mochila está"
	line "llenísima!"
	done

_CinnabarLabMetronomeRoomScientist2Text::
	text "EEVEE puede"
	line "evolucionar en"
	cont "tres tipos de"
	cont "#MON."
	done

_CinnabarLabMetronomeRoomPCText::
	text "¡Hay un mensaje"
	line "e-mail!"

	para "..."

	para "Los 3 legendarios"
	line "pájaros #MON"
	cont "son ARTICUNO,"
	cont "ZAPDOS y MOLTRES."

	para "Desconocemos"
	line "sus guaridas."

	para "Pensamos explorar"
	line "la caverna que"
	cont "hay cerca de la"
	cont "CIUDAD CELESTE."

	para "De: EQUIPO de"
	line "INVESTIGACIÓN"
	cont "#MON"

	para "..."
	done

_CinnabarLabMetronomeRoomAmberPipeText::
	text "¡Pipa de ámbar!"
	done

_CinnabarLabFossilRoomScientist1Text::
	text "¡Hola!"

	para "¡Soy un doctor"
	line "muy importante!"

	para "¡Y aquí estudio"
	line "raros fósiles de"
	cont "#MON!"

	para "¿Tienes algún"
	line "fósil para mí?"
	prompt

_CinnabarLabFossilRoomScientist1NoFossilsText::
	text "¡No! ¡Qué pena!"
	done

_CinnabarLabFossilRoomScientist1GoForAWalkText::
	text "¡Tardaré un poco!"

	para "¡Date un paseo"
	line "mientras tanto!"
	done

_CinnabarLabFossilRoomScientist1FossilIsBackToLifeText::
	text "¿Dónde estabas?"

	para "¡Tu fósil ha"
	line "revivido!"

	para "¡Sabía que era un"
	line "@"
	text_ram wStringBuffer
	text "!"
	prompt

_CinnabarLabFossilRoomScientist1SeesFossilText::
	text "¡Oh! ¡Es un"
	line "@"
	text_ram wNameBuffer
	text "!"

	para "¡Es un fósil de"
	line "@"
	text_ram wStringBuffer
	text ","
	cont "un #MON"
	cont "ya extinto!"

	para "¡Mi Máquina de"
	line "Resurrección"
	cont "revivirá a ese"
	cont "#MON!"
	done

_CinnabarLabFossilRoomScientist1TakesFossilText::
	text "¡Date prisa y"
	line "dame eso!"

	para "¡<PLAYER> le"
	line "dio @"
	text_ram wNameBuffer
	text "!"
	prompt

_CinnabarLabFossilRoomScientist1GoForAWalkText2::
	text "¡Me llevará un"
	line "poco de tiempo!"

	para "¡Vete a dar un"
	line "paseo!"
	done

_CinnabarLabFossilRoomScientist1ComeAgainText::
	text "¡Eh! ¡Has venido"
	line "a molestarme!"
	done
