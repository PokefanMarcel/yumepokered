_MrPsychicsHouseMrPsychicYouWantedThisText::
	text "...¡Alto! ¡No"
	line "digas nada!"

	para "¡Querías esto!"
	prompt

_MrPsychicsHouseMrPsychicReceivedTM29Text::
	text "¡<PLAYER> recibió"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_MrPsychicsHouseMrPsychicTM29ExplanationText::
	text "MT29 es PSÍQUICO."

	para "¡Puede reducir"
	line "las habilidades"
	cont "especiales del"
	cont "objetivo!"
	done

_MrPsychicsHouseMrPsychicTM29NoRoomText::
	text "¿Dónde piensas"
	line "poner esto?"
	done

