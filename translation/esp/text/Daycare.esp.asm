_DaycareGentlemanIntroText::
	text "Esta GUARDERÍA es"
	line "mía. ¿Quieres que"
	cont "cuide de alguno"
	cont "de tus #MON?"
	done

_DaycareGentlemanWhichMonText::
	text "¿Qué #MON"
	line "quieres que"
	cont "cuide?"
	prompt

_DaycareGentlemanWillLookAfterMonText::
	text "Muy bien, cuidaré"
	line "de @"
	text_ram wNameBuffer
	text_start
	cont "un rato."
	prompt

_DaycareGentlemanComeSeeMeInAWhileText::
	text "Vuelve dentro"
	line "de un rato."
	done

_DaycareGentlemanMonHasGrownText::
	text "¡Tu @"
	text_ram wNameBuffer
	text_start
	line "ha crecido mucho!"

	para "¡Su nivel ha"
	line "subido @"
	text_decimal wDayCareNumLevelsGrown, 1, 3
	text "!"

	para "¿No soy genial?"
	prompt

_DaycareGentlemanOweMoneyText::
	text "Me debes @"
	text_bcd wDayCareTotalCost, 2 | LEADING_ZEROES | LEFT_ALIGN
	text "¥"
	line "por este"
	cont "#MON."
	done

_DaycareGentlemanGotMonBackText::
	text "¡<PLAYER>"
	line "recuperó un"
	cont "@"
	text_ram wDayCareMonName
	text "!"
	done

_DaycareGentlemanMonNeedsMoreTimeText::
	text "¿Ya de vuelta?"
	line "Tu @"
	text_ram wNameBuffer
	text_start
	cont "aún necesita de"
	cont "mis cuidados."
	prompt
_DaycareGentlemanAllRightThenText::
	text "¡Muy bien!"
	line "@"
	text_end

_DaycareGentlemanComeAgainText::
	text "Vuelve después."
	done

_DaycareGentlemanNoRoomForMonText::
	text "¡No tienes sitio"
	line "para este"
	cont "#MON!"
	done

_DaycareGentlemanOnlyHaveOneMonText::
	text "Sólo tienes un"
	line "#MON contigo."
	done

_DaycareGentlemanHeresYourMonText::
	text "¡Gracias! ¡Aquí"
	line "está tu #MON!"
	prompt

_DaycareGentlemanNotEnoughMoneyText::
	text "¡Oye, no tienes"
	line "bastante dinero!"
	done

