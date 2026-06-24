; marcelnote - new location
_MoveDeleterGreetingText::
;	text "Mmm..."
;	line "Ah, sí, soy el"
;	cont "QUITA-MOVS." ; official translation for MOVE DELETER
	; traducción por NunWinter
	text "Mmm... Ah, sí."
	line "Me conocen como"
	cont "el BORRADÓN."

	para "Puedo hacer que"
	line "los #MON"
	cont "olviden ataques."

	para "¿Quieres que un"
	line "#MON olvide"
	cont "un ataque?"
	done

_MoveDeleterWhichMoveText::
	; traducción por NunWinter
	text "¿Qué ataque"
	line "debe olvidar?"
	done

_MoveDeleterConfirmText::
	; traducción por NunWinter
	text "Oh, ¿quieres que"
	line "olvide @"
	text_ram wStringBuffer
	text "?"
	done

_MoveDeleterForgotText::
	; traducción por NunWinter
	text "¡@"
	text_ram wStringBuffer
	text " fue"
	line "olvidado!"
	done

_MoveDeleterByeText::
	; traducción por NunWinter
	text "¿No? Ven a verme"
	line "otra vez."
	done

_MoveDeleterOneMoveText::
	; traducción por NunWinter
	text "Este #MON"
	line "solo conoce"
	cont "un ataque."
	prompt

_MoveReminderGreetingText::
;	text "Hola, cariño."
;	line "Me llaman la"
;	cont "RICUERDA-MOVS." ; official translation for MOVE REMINDER
	; traducción por NunWinter
	text "Hola, cielo."
	line "Me conocen como"
	cont "la RECORDADOÑA."

	para "Ayudo a los"
	line "#MON a"
	cont "recordar ataques"
	cont "olvidados."

	para "1000¥ por lección."
	line "¿Qué te parece?"
	done

_MoveReminderSaidYesText::
	; traducción por NunWinter
	text "¿Qué #MON va a"
	line "recordar?"
	prompt

_MoveReminderNotEnoughMoneyText::
	; traducción por NunWinter
	text "Mmm..."

	para "¡No tienes"
	line "suficiente dinero!"
	done

_MoveReminderWhichMoveText::
	; traducción por NunWinter
	text "¿Qué ataque"
	line "debe aprender?"
	done

_MoveReminderByeText::
	; traducción por NunWinter
	text "Si alguno de"
	line "tus #MON"
	cont "necesita"
	cont "recordar ataques,"
	cont "¡ven a verme!"
	done

_MoveReminderNoMovesText::
	; traducción por NunWinter
	text "Este #MON no ha"
	line "olvidado ningún"
	cont "ataque."
	prompt
