_CeladonCityLittleGirlText::
	text "¡Conseguí a mi"
	line "KOFFING en la"
	cont "CIUDAD CANELA!"

	para "¡Es muy simpático"
	line "pero echa veneno"
	cont "cuando se enfada!"
	done

_CeladonCityGramps1Text::
	text "¡Jeje! ¡Este"
	line "GIMNASIO es"
	cont "genial! ¡Está"
	cont "lleno de chicas!"
	done

_CeladonCityGirlText::
	text "¡El CASINO no es"
	line "bueno para la"
	cont "imagen de nuestra"
	cont "ciudad!"
	done

_CeladonCityGramps2Text::
	text "¡Ayyy! ¡Lo perdí"
	line "todo en las"
	cont "tragaperras!"

	para "¡Debería haber"
	line "cambiado todas"
	cont "mis fichas por"
	cont "premios!"
	done

_CeladonCityGramps3Text::
	text "¡Hola a todos!"

	para "¡Te había visto,"
	line "pero nunca había"
	cont "podido hablar"
	cont "contigo!"

	para "¡Éste es tu"
	line "regalo por pasar"
	cont "a verme!"
	prompt

_CeladonCityGramps3ReceivedTM41Text::
	text "¡<PLAYER> recibió"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_CeladonCityGramps3TM41ExplanationText::
	text "¡La MT41 enseña"
	line "la OVOCURACIÓN!" ; marcelnote - was "el AMORTIGUADOR!"

	para "¡Éste sólo puede"
	line "ser usado por un"
	cont "#MON!"

	para "¡Ese #MON"
	line "es CHANSEY!"
	done

_CeladonCityGramps3TM41NoRoomText::
	text "¡Tu mochila está"
	line "llena de objetos!"
	done

_CeladonCityFisherText::
	text "¡Éste es mi fiel"
	line "compañero, " ; this space might be off
	cont "POLIWRATH!"

	para "¡Evolucionó del"
	line "POLIWHIRL al usar"
	cont "la PIEDRA AGUA!"
	done

_CeladonCityPoliwrathText::
	text "POLIWRATH: ¡Poli"
	line "poli!@"
	text_end

_CeladonCityRocket1Text::
	text "¿Qué estás"
	line "mirando?"
	done

_CeladonCityRocket2Text::
	text "¡No te cruces en"
	line "el camino del"
	cont "TEAM ROCKET!"
	done

_CeladonCityTrainerTips1Text::
	text "PISTAS ENTRENADOR"

	para "¡PRECISIÓN X"
	line "aumenta la"
	cont "precisión de"
	cont "los ataques!"

	para "¡El DIRECTO"
	line "aumenta la"
	cont "posibilidad de"
	cont "tiros críticos!"

	para "¡Compra tus"
	line "objetos en el"
	cont "CENTRO COMERCIAL"
	cont "de AZULONA!"
	done

_CeladonCitySignText::
	text "CIUDAD AZULONA"
	line "La ciudad de"
	cont "los sueños de"
	cont "arcoiris."
	done

_CeladonCityGymSignText::
	text "LÍDER del GIMNASIO"
	line "#MON de"
	cont "CIUDAD AZULONA:"
	cont "ERIKA"

	para "¡La princesa"
	line "amante de la"
	cont "naturaleza!"
	done

_CeladonCityMansionSignText::
	text "MANSIÓN AZULONA"
	done

_CeladonCityDeptStoreSignText::
	text "¡Compra lo que"
	line "necesites en el"
	cont "CENTRO COMERCIAL"
	cont "de AZULONA!"
	done

_CeladonCityTrainerTips2Text::
	text "PISTAS ENTRENADOR"

	para "¡PROTECCIÓN ESP."
	line "protege a tus"
	cont "#MON de"
	cont "ataques como el"
	cont "agua y el fuego!"

	para "¡Compra tus"
	line "objetos en el"
	cont "CENTRO COMERCIAL"
	cont "de AZULONA!"
	done

_CeladonCityPrizeExchangeSignText::
	text "¡Se cambian"
	line "fichas por"
	cont "premios!"
	cont "CAMBIO DE PREMIOS"
	done

_CeladonCityGameCornerSignText::
	text "CASINO ROCKET"
	line "¡El parque de"
	cont "los adultos!"
	done

; TODO - Spanish translation
_CeladonCityCeladonGroveSignText:: ; marcelnote - for Celadon Grove
	text "CELADON GROVE"
	done

; TODO - Spanish translation
_CeladonCityCooltrainerFText:: ; marcelnote - new NPC who mentions Celadon Grove
	text "I made a wish"
	line "at the old shrine"
	cont "in CELADON GROVE."

	para "I hope it"
	line "comes true!"
	done
