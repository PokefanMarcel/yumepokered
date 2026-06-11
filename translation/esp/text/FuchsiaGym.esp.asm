_FuchsiaGymKogaBeforeBattleText::
	text "KOGA: ¡Uajajaja!"

	para "¿Un niño como"
	line "tú se atreve"
	cont "a desafiarme?"

	para "¡Como maestro"
	line "ninja, te"
	cont "enseñaré qué"
	cont "es el miedo!"

	para "¡Sentirás la"
	line "desesperación de"
	cont "las técnicas del"
	cont "envenenamiento y"
	cont "del sueño!"
	done

_FuchsiaGymKogaReceivedSoulBadgeText::
	text "¡Ejem!"
	line "¡Has demostrado"
	cont "tu valor!"

	para "¡Aquí tienes la"
	line "MEDALLA-ALMA!"
	prompt
_FuchsiaGymKogaPostBattleAdviceText::
	text "¡Si los #MON"
	line "son INTOXICADOS"
	cont "sufrirán más y"
	cont "más durante"
	cont "la batalla!"

	para "¡Y aterrorizará"
	line "a los enemigos!"
	done

_FuchsiaGymKogaSoulBadgeInfoText::
	text "¡Ahora que tienes"
	line "la MEDALLA-ALMA,"
	cont "la DEFENSA de"
	cont "tus #MON"
	cont "aumentará!"

	para "¡Y podrás SURFEAR"
	line "para salir del"
	cont "combate!"

	para "¡Ah! ¡Llévate"
	line "esto también!"
	done

_FuchsiaGymKogaReceivedTM06Text::
	text "¡<PLAYER> recibió"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_FuchsiaGymKogaTM06ExplanationText::
	text_start

	para "¡La MT06 incluye"
	line "el TÓXICO!"

	para "¡Es una técnica"
	line "secreta de hace"
	cont "más de 400 años!"
	done

_FuchsiaGymKogaTM06NoRoomText::
	text "¡Hazle sitio a"
	line "esto, chaval!"
	done

_FuchsiaGymRocker1BattleText::
	text "¡La fuerza no es"
	line "la clave!"

	para "Es la estrategia."

	para "¡Te enseñaré cómo"
	line "la estrategia"
	cont "puede vencer a"
	cont "la fuerza!"
	done

_FuchsiaGymRocker1EndBattleText::
	text_start
	line "¡Extraordinario!"
	prompt

_FuchsiaGymRocker1AfterBattleText::
	text "¿Mezclarás fuerza"
	line "e inteligencia?"
	cont "¡Buena táctica!"
	done

_FuchsiaGymRocker2BattleText::
	text "¡Quería ser un"
	line "ninja y por eso"
	cont "vine a este"
	cont "GIMNASIO!"
	done

_FuchsiaGymRocker2EndBattleText::
	text "¡Bu!"
	line "¡He perdido!"
	prompt

_FuchsiaGymRocker2AfterBattleText::
	text "¡Seguiré"
	line "entrenándome con"
	cont "KOGA, mi maestro"
	cont "ninja!"
	done

_FuchsiaGymRocker3BattleText::
	text "¡A ver si superas"
	line "mis técnicas"
	cont "especiales!"
	done

_FuchsiaGymRocker3EndBattleText::
	text_start
	line "¡Me engañaste!"
	prompt

_FuchsiaGymRocker3AfterBattleText::
	text "¡Me gustan los"
	line "ataques del sueño"
	cont "y los venenos"
	cont "porque perduran"
	cont "tras la batalla!"
	done

_FuchsiaGymRocker4BattleText::
	text "¡Alto ahí!"

	para "¿Te han frustrado"
	line "nuestros muros"
	cont "invisibles?"
	done

_FuchsiaGymRocker4EndBattleText::
	text "¡Uauuu!"
	line "¡Está acabado!"
	prompt

_FuchsiaGymRocker4AfterBattleText::
	text "¡Impresionante!"
	line "¡Ten una pista!"

	para "¡Mira atentamente"
	line "entre los huecos"
	cont "de los muros"
	cont "invisibles!"
	done

_FuchsiaGymRocker5BattleText::
	text "¡También estudio"
	line "técnicas ninja"
	cont "con el maestro"
	cont "KOGA!"

	para "¡Los ninja llevan"
	line "mucho tiempo"
	cont "usando animales!"
	done

_FuchsiaGymRocker5EndBattleText::
	text "¡Auuuu!"
	prompt

_FuchsiaGymRocker5AfterBattleText::
	text "¡Me queda mucho"
	line "por aprender!"
	done

_FuchsiaGymRocker6BattleText::
	text "¡El maestro KOGA"
	line "desciende de una"
	cont "gran familia de"
	cont "ninjas!"

	para "¿Y tú de"
	line "qué familia"
	cont "desciendes?"
	done

_FuchsiaGymRocker6EndBattleText::
	text "..."
	line "Derrotado."
	prompt

_FuchsiaGymRocker6AfterBattleText::
	text "¡Donde hay luz"
	line "hay sombras!"

	para "¡Luz y sombra!"
	line "¿Cuál eliges?"
	done

_FuchsiaGymGymGuideChampInMakingText::
	text "¡Hola,"
	line "posible campeón!"

	para "¡El GIMNASIO"
	line "FUCSIA está lleno"
	cont "de muros"
	cont "invisibles!"

	para "¡Podría parecer"
	line "que KOGA está"
	cont "cerca, pero hay"
	cont "muros invisibles"
	cont "que le protegen!"

	para "¡Encuentra huecos"
	line "entre los muros"
	cont "para llegar a él!"
	done

_FuchsiaGymGymGuideBeatKogaText::
	text "¡Es increíble lo"
	line "terribles que"
	cont "pueden ser los"
	cont "ninjas!"
	done

_FuchsiaGymKogaRematchPreBattleText:: ; marcelnote - Koga rematch
	text "Has vuelto,"
	line "<PLAYER>."

	para "¿Qué tal una"
	line "revancha amistosa?"

	para "Esta vez no me"
	line "contendré."
	done

_FuchsiaGymKogaRematchRefusedBattleText:: ; marcelnote - Koga rematch
	text "Muy bien. Vuelve"
	line "cuando quieras."
	done

; TODO - Spanish translation
_FuchsiaGymKogaRematchAcceptBattleText:: ; marcelnote - Koga rematch
	text "Fwahahaha! Face"
	line "my new ninja"
	cont "techniques!"
	done

; TODO - Spanish translation
_FuchsiaGymKogaRematchDefeatedText:: ; marcelnote - Koga rematch
	text "I must keep"
	line "honing my skills." ; from Let's Go Pikachu
	prompt

; TODO - Spanish translation
_FuchsiaGymAfterRematchText:: ; marcelnote - Koga rematch
	text "Perfecting my arts"
	line "takes practice."

	para "Let's do this"
	line "again soon!"
	done
