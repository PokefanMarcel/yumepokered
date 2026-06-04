_OaksLabRivalGrampsIsntAroundText::
	text "<RIVAL>: ¡Hola"
	line "<PLAYER>! ¡El"
	cont "abuelo no está!"
	done

_OaksLabRivalGoAheadAndChooseText::
	text "<RIVAL>: ¡Yo"
	line "no soy tan"
	cont "avaro como tú!"

	para "¡Venga, elige uno"
	line "<PLAYER>!"
	done

_OaksLabRivalMyPokemonLooksStrongerText::
	text "<RIVAL>: Mi"
	line "#MON parece"
	cont "mucho más fuerte."
	done

_OaksLabThoseArePokeBallsText::
	text "¡Eso de ahí son"
	line "las # BALL!"
	cont "¡Dentro de ellas"
	cont "hay #MON!"
	done

_OaksLabYouWantCharmanderText::
	text "¿Quieres a"
	line "CHARMANDER, el"
	cont "#MON del"
	cont "fuego?"
	done

_OaksLabYouWantSquirtleText::
	text "¿Quieres a"
	line "SQUIRTLE, el"
	cont "#MON"
	cont "acuático?"
	done

_OaksLabYouWantBulbasaurText::
	text "¿Quieres a"
	line "BULBASAUR, el"
	cont "#MON del"
	cont "tipo-planta?"
	done

_OaksLabMonEnergeticText::
	text "¡Este #MON es"
	line "muy energético!"
	prompt

_OaksLabReceivedMonText::
	text "¡<PLAYER> recibió"
	line "@"
	text_ram wNameBuffer
	text "!@"
	text_end

_OaksLabLastMonText::
	text "¡Ése es el último"
	line "#MON del"
	cont "PROF. OAK!"
	done

_OaksLabOakWhichPokemonDoYouWantText::
	text "OAK: <PLAYER>,"
	line "¿Qué #MON"
	cont "quieres?"
	done

_OaksLabOakYourPokemonCanFightText::
	text "OAK: ¡Si aparece"
	line "un #MON"
	cont "salvaje, tu"
	cont "#MON podrá"
	cont "luchar contra él!"
	done

_OaksLabOakRaiseYourYoungPokemonText::
	text "OAK: ¡<PLAYER>,"
	line "entrena a tu"
	cont "joven #MON"
	cont "luchando!"
	done

_OaksLabOakDeliverParcelText::
	text "OAK: ¡<PLAYER>!"

	para "¿Cómo va tu"
	line "#MON?"

	para "¡Creo que te"
	line "quiere mucho!"

	para "¡Pareces ser"
	line "muy hábil como"
	cont "entrenador de"
	cont "#MON!"

	para "¿Qué? ¿Tienes"
	line "algo para mí?"

	para "<PLAYER> entregó"
	line "el CORREO de OAK.@"
	text_end

_OaksLabOakParcelThanksText::
	text_start

	para "¡Ah, sí! ¡Es la"
	line "# BALL que"
	cont "había encargado!"
	cont "¡Gracias!"
	done

_OaksLabOakPokemonAroundTheWorldText::
	text "¡<PLAYER>, los"
	line "#MON del"
	cont "mundo te esperan!"
	done

_OaksLabOakReceivedPokeballsText::
	text "OAK: ¡No sabrás"
	line "más cosas sobre"
	cont "los #MON"
	cont "con sólo verlos!"

	para "¡Tienes que"
	line "atraparlos! Usa"
	cont "las # BALL"
	cont "para atraparlos."

	para "¡<PLAYER> tiene"
	line "5 # BALL!@"
	text_end

_OaksLabGivePokeballsExplanationText::
	text_start

	para "Cuando aparezca"
	line "un #MON"
	cont "salvaje, lucha"
	cont "contra él."

	para "¡Lánzale una"
	line "# BALL para"
	line "capturarlo!"

	para "¡Pero esto no"
	line "siempre funciona!"

	para "¡Un #MON"
	line "sano podría huir!"
	cont "¡También cuenta"
	cont "la suerte!"
	done

_OaksLabOakComeSeeMeSometimesText::
	text "OAK: Ven a verme"
	line "de vez en cuando."

	para "¡Tenme informado"
	line "sobre cómo te va"
	cont "con tu #DEX!"
	done

_OaksLabOakHowIsYourPokedexComingText::
	text "OAK: ¡Encantado"
	line "de verte! ¿Cómo"
	cont "va tu #DEX?"
	cont "¡Déjame que le"
	cont "eche un vistazo!"
	prompt

_OaksLabPokedexText::
	text "¡Es como una"
	line "enciclopedia,"
	cont "pero las páginas"
	cont "están en blanco!"
	done

_OaksLabOakWalkingText:: ; marcelnote - this is not seen since this Oak is just for the walking animation
	text "?"
	done

_OaksLabGirlText::
	text "¡El PROF. OAK es"
	line "un experto en"
	cont "#MON!"

	para "¡Es admirado por"
	line "muchos de los"
	cont "entrenadores de"
	cont "#MON!"
	done

_OaksLabRivalFedUpWithWaitingText::
	text "<RIVAL>: ¡Abuelo!"
	line "¡Estoy harto de"
	cont "esperar!"
	done

_OaksLabOakChooseMonText::
	text "OAK: ¿<RIVAL>?"
	line "Déjame pensar..."

	para "¡Ah, sí! Te pedí"
	line "que vinieras."
	cont "Espera..."

	para "¡<PLAYER>, toma!"

	para "¡Aquí hay"
	line "3 #MON!"

	para "¡Bien!"

	para "¡Están dentro de"
	line "las # BALL!"

	para "¡Cuando yo era"
	line "joven, era un"
	cont "buen entrenador"
	cont "de #MON!"

	para "Pero ahora sólo"
	line "me quedan 3. Te"
	cont "daré uno. ¿Cuál"
	cont "quieres?"
	done

_OaksLabRivalWhatAboutMeText::
	text "<RIVAL>: ¡Oye"
	line "abuelo! ¿Y yo"
	cont "qué?"
	done

_OaksLabOakBePatientText::
	text "OAK: ¡Tranquilo"
	line "<RIVAL>! ¡Te"
	cont "daré otro a ti!"
	done

_OaksLabOakDontGoAwayYetText::
	text "OAK: ¡Oye! ¡No"
	line "te vayas aún!"
	done

_OaksLabRivalIllTakeThisOneText::
	text "<RIVAL>: ¡Pues"
	line "para mí éste!"
	done

_OaksLabRivalReceivedMonText::
	text "¡<RIVAL> recibió"
	line "a @"
	text_ram wNameBuffer
	text "!@"
	text_end

_OaksLabRivalIllTakeYouOnText::
	text "<RIVAL>: ¡Espera"
	line "<PLAYER>!"
	cont "¡Probemos a"
	cont "nuestros"
	cont "#MON!"

	para "¡Adelante,"
	line "luchemos!"
	done

_OaksLabRivalIPickedTheWrongPokemonText::
	text "¿QUÉ?"
	line "¡Increíble!"
	cont "¡Tu #MON es"
	cont "mejor que el mío!"
	prompt

_OaksLabRivalAmIGreatOrWhatText::
	text "<RIVAL>: ¡Bien!"
	line "¿No soy el mejor?"
	prompt

_OaksLabRivalSmellYouLaterText::
	text "<RIVAL>: ¡Vale!"
	line "¡Haré luchar a mi"
	cont "#MON para"
	cont "fortalecerlo!"

	para "¡<PLAYER>!"
	line "¡Abuelo!"
	cont "¡Hasta luego!"
	done

_OaksLabRivalGrampsText::
	text "<RIVAL>:"
	line "¡Abuelo!"
	done

_OaksLabRivalWhatDidYouCallMeForText::
	text "<RIVAL>: ¿Qué"
	line "quieres de mí?"
	done

_OaksLabOakIHaveARequestText::
	text "OAK: ¡Ah sí!"
	line "Quería pediros"
	cont "un favor."
	done

_OaksLabOakMyInventionPokedexText::
	text "¡En la mesa hay"
	line "un invento mío,"
	cont "la #DEX!"

	para "¡Ésta registrará"
	line "automáticamente"
	cont "datos sobre los"
	cont "#MON que"
	cont "hayáis visto o"
	cont "capturado!"

	para "¡Es una tecno-"
	line "enciclopedia!"
	done

_OaksLabOakGotPokedexText::
	text "OAK: ¡<PLAYER> y"
	line "<RIVAL>! ¡Tomad"
	cont "las #DEX!"

	para "¡<PLAYER> obtiene"
	line "una #DEX"
	cont "del PROF.OAK!@"
	text_end

_OaksLabOakThatWasMyDreamText::
	text "Quería hacer"
	line "una guía de todos"
	cont "los #MON"
	cont "del mundo..."

	para "¡Era mi sueño!"

	para "¡Pero ya soy muy"
	line "viejo y no puedo"
	cont "hacerlo!"

	para "¡Por eso quiero"
	line "que vosotros"
	cont "hagáis realidad"
	cont "ese sueño!"

	para "¡Adelante, id"
	line "en su busca!"

	para "¡Será una gran"
	line "proeza en la"
	cont "historia de"
	cont "los #MON!"
	done

_OaksLabRivalLeaveItAllToMeText::
	text "<RIVAL>: ¡No te"
	line "preocupes abuelo!"
	cont "¡Déjalo en mis"
	cont "manos!"

	para "¡<PLAYER>, que"
	line "quede claro que"
	cont "no te necesito!"

	para "¡Le pediré a mi"
	line "hermana su MAPA"
	cont "de los PUEBLOS!"

	para "¡Y le diré que"
	line "no te dé ninguno"
	cont "a ti! ¡Jajaja!"
	done

_OaksLabScientistText::
	text "Estudio a los"
	line "#MON. ¡Soy"
	cont "ayudante del"
	cont "PROF. OAK!"
	done

; TODO - Spanish translation
_OaksLabScientistOakWentForWalkText:: ; marcelnote - new for Oak battle
	text "PROF.OAK went out"
	line "for a walk."
	done

; TODO - Spanish translation
_OaksLabRivalShowingDexText:: ; marcelnote - postgame Rival event
	text "<RIVAL>: Yo,"
	line "<PLAYER>!"

	para "I was just show-"
	line "ing my #DEX"
	cont "to gramps."

	para "I've recorded 146"
	line "different kinds"
	cont "of #MON!"
	cont "Pretty impress-"
	cont "ive, right?"

	para "But gramps keeps"
	line "going on about"
	cont "these legendary"
	cont "birds."

	para "What about you,"
	line "<PLAYER>?"
	cont "Have you come"
	cont "across any of"
	cont "these legendary"
	cont "#MON?"
	prompt


; TODO - Spanish translation
_OaksLabRivalSeenNoBirdText:: ; marcelnote - postgame Rival event
	text "No? That's what"
	line "I figured."

	para "They're probably"
	line "just stories for"
	cont "kids."
	done

; marcelnote - there must be a smarter way to define these text variants
;              by making use of string buffers like wNameBuffer and wStringBuffer
; TODO - Spanish translation
_OaksLabRivalSeenArticunoText:: ; marcelnote - postgame Rival event
	text "So you've seen"
	line "ARTICUNO, huh."

	para "Maybe the stories"
	line "are true after"
	cont "all..."
	done

; TODO - Spanish translation
_OaksLabRivalSeenZapdosText:: ; marcelnote - postgame Rival event
	text "So you've seen"
	line "ZAPDOS, huh."

	para "Maybe the stories"
	line "are true after"
	cont "all..."
	done

; TODO - Spanish translation
_OaksLabRivalSeenMoltresText:: ; marcelnote - postgame Rival event
	text "So you've seen"
	line "MOLTRES, huh."

	para "Maybe the stories"
	line "are true after"
	cont "all..."
	done

; TODO - Spanish translation
_OaksLabRivalSeenArticunoZapdosText:: ; marcelnote - postgame Rival event
	text "What? You've seen"
	line "both ARTICUNO"
	cont "and ZAPDOS?"

	para "Could MOLTRES"
	line "actually be real,"
	cont "as well?"
	done

; TODO - Spanish translation
_OaksLabRivalSeenArticunoMoltresText:: ; marcelnote - postgame Rival event
	text "What? You've seen"
	line "both ARTICUNO"
	cont "and MOLTRES?"

	para "Could ZAPDOS"
	line "actually be real,"
	cont "as well?"
	done

; TODO - Spanish translation
_OaksLabRivalSeenZapdosMoltresText:: ; marcelnote - postgame Rival event
	text "What? You've seen"
	line "both ZAPDOS"
	cont "and MOLTRES?"

	para "Could ARTICUNO"
	line "actually be real,"
	cont "as well?"
	done

; TODO - Spanish translation
_OaksLabRivalSeenAllBirdsText:: ; marcelnote - postgame Rival event
	text "Whoa, have you"
	line "really seen all"
	cont "three legendary"
	cont "birds?"

	para "ARTICUNO, ZAPDOS,"
	line "and MOLTRES..."
	cont "Unbelievable!"

	para "You really are"
	line "something else,"
	cont "<PLAYER>!"
	done

; TODO - Spanish translation
_OaksLabRivalBackToIndigoText:: ; marcelnote - postgame Rival event
	text "Alright, I'm off"
	line "to train at the"
	cont "INDIGO PLATEAU."

	para "Oh, did you hear?"
	line "GIOVANNI was"
	cont "secretly the head"
	cont "of TEAM ROCKET!"

	para "With him gone,"
	line "VIRIDIAN will"
	cont "need a new"
	cont "GYM LEADER."

	para "Think it over,"
	line "<PLAYER>!"
	cont "A steady gig as"
	cont "VIRIDIAN's GYM"
	cont "LEADER sounds"
	cont "like your style!"

	para "<PLAYER>! Gramps!"
	line "Smell you later!"
	done
