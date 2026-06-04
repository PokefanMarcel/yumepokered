_CeladonGymErikaPreBattleText::
	text "Hola. ¡Qué buen"
	line "tiempo hace! Es"
	cont "tan agradable."

	para "...¡Ah, hola!..."
	line "¡Debo de haberme"
	cont "dormido!"
	cont "¡Bienvenido!"

	para "Me llamo ERIKA."
	line "Soy la LÍDER del"
	cont "GIMNASIO de"
	cont "CIUDAD AZULONA."

	para "Enseño el arte de"
	line "las flores. Mis"
	cont "#MON son del"
	cont "tipo-planta."

	para "¡Oh, perdona! ¡No"
	line "tenía ni idea de"
	cont "que quisieras"
	cont "desafiarme!"

	para "¡Como quieras!"
	line "¡Yo no perderé!"
	done

_CeladonGymErikaReceivedRainbowBadgeText::
	text_start
	line "¡Reconozco"
	cont "mi derrota!"

	para "Eres muy"
	line "fuerte."

	para "Te voy a dar"
	line "la MEDALLA"
	cont "ARCOIRIS."
	prompt

_CeladonGymErikaPostBattleAdviceText::
	text "¿Estás estudiando"
	line "a los #MON?"
	cont "Admito que me has"
	cont "impresionado."

	para "No coleccionaría"
	line "#MON si"
	cont "fueran feos."
	done

_CeladonGymRainbowBadgeInfoText::
	text "La MEDALLA"
	line "ARCOIRIS hará"
	cont "que los #MON"
	cont "de nivel"
	cont "inferior a 50"
	cont "te obedezcan."

	para "Y permitirá que"
	line "los #MON"
	cont "usen la FUERZA"
	cont "dentro y fuera"
	cont "de la batalla."

	para "¡Ah! Y llévate"
	line "esto también."
	done

_CeladonGymReceivedTM21Text::
	text "¡<PLAYER> recibió"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_TM21ExplanationText::
	text_start

	para "La MT21 incluye"
	line "el MEGA AGOTAR."

	para "La mitad del daño"
	line "que produce es"
	cont "usado para curar"
	cont "a tus #MON."
	done

_CeladonGymTM21NoRoomText::
	text "Deberías hacerle"
	line "sitio a esto."
	done

_CeladonGymBattleText2::
	text "¡Oye!"

	para "¡No puedes"
	line "entrar aquí!"
	done

_CeladonGymEndBattleText2::
	text "¡Eres"
	line "demasiado fuerte!"
	prompt

_CeladonGymAfterBattleText2::
	text "¡Eeeh! " ; this space might be off
	line "¡Espero que ERIKA"
	cont "te aniquile!"
	done

_CeladonGymBattleText3::
	text "Me empezaba"
	line "a aburrir."
	done

_CeladonGymEndBattleText3::
	text "¡Oh!"
	line "¡Mi maquillaje!"
	prompt

_CeladonGymAfterBattleText3::
	text "¡Los #MON del"
	line "tipo-planta son"
	cont "difíciles para"
	cont "los acuáticos!"

	para "¡Y tienen ventaja"
	line "sobre los del"
	cont "tipo-roca y los"
	cont "del tipo-tierra!"
	done

_CeladonGymBattleText4::
	text "¿No eras tú"
	line "el mirón?"
	done

_CeladonGymEndBattleText4::
	text_start
	line "¡Estoy"
	cont "impresionada!"
	prompt

_CeladonGymAfterBattleText4::
	text "¿No estabas"
	line "mirando? ¡Vienen"
	cont "muchos bobos!"
	done

_CeladonGymBattleText5::
	text "¡Mira a mis"
	line "#MON del tipo"
	cont "planta!"

	para "¡Son tan fáciles"
	line "de entrenar...!"
	done

_CeladonGymEndBattleText5::
	text "¡No!"
	prompt

_CeladonGymAfterBattleText5::
	text "¡En nuestro"
	line "GIMNASIO sólo"
	cont "usamos los"
	cont "#MON del"
	cont "tipo-planta!"

	para "¡Y también los"
	line "usamos para hacer"
	cont "adornos florales!"
	done

_CeladonGymBattleText6::
	text "¡Aquí no pueden"
	line "entrar los"
	cont "#MON del"
	cont "tipo-fuego o del"
	cont "tipo-bicho!"
	done

_CeladonGymEndBattleText6::
	text "¡Oh!"
	line "¡Villano!"
	prompt

_CeladonGymAfterBattleText6::
	text "¡ERIKA, nuestra"
	line "LÍDER, puede"
	cont "parecer muy"
	cont "tranquila pero"
	cont "es muy hábil!"
	done

_CeladonGymBattleText7::
	text "Encantada de"
	line "conocerte. Mi"
	cont "hobby es entrenar"
	cont "a los #MON."
	done

_CeladonGymEndBattleText7::
	text "¡Oh!"
	line "¡Espléndido!"
	prompt

_CeladonGymAfterBattleText7::
	text "Voy a tener una"
	line "cita a ciegas."
	cont "Mejor aprender"
	cont "buenos modales."
	done

_CeladonGymBattleText8::
	text "¡Bienvenido al"
	line "GIMNASIO de la"
	cont "CIUDAD AZULONA!"

	para "¡No menosprecies"
	line "el poder de las"
	cont "mujeres!"
	done

_CeladonGymEndBattleText8::
	text_start
	line "¡Me has ganado!"
	prompt

_CeladonGymAfterBattleText8::
	text "¡No traje a mis"
	line "mejores #MON!"

	para "¡Ya verás la"
	line "próxima vez!"
	done

; TODO - Spanish translation
_CeladonGymErikaRematchPreBattleText:: ; marcelnote - Erika rematch
	text "Welcome back,"
	line "<PLAYER>."

	para "How about a"
	line "friendly rematch?"

	para "I won't hold back"
	line "this time."
	done

; TODO - Spanish translation
_CeladonGymErikaRematchRefusedBattleText:: ; marcelnote - Erika rematch
	text "Very well. Come"
	line "back anytime."
	done

; TODO - Spanish translation
_CeladonGymErikaRematchAcceptBattleText:: ; marcelnote - Erika rematch
	text "Such a wonderful"
	line "day for a battle."
	cont "Shall we begin?"
	done

; TODO - Spanish translation
_CeladonGymErikaRematchDefeatedText:: ; marcelnote - Erika rematch
	text "Oh!"
	line "It appears it is"
	cont "my loss..." ; from Let's Go Pikachu
	prompt

; TODO - Spanish translation
_CeladonGymAfterRematchText:: ; marcelnote - Erika rematch
	text "I must tend to"
	line "my flowers now."

	para "Let's do this"
	line "again soon!"
	done
