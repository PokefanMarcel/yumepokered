_MrPsychicsHouseMrPsychicYouWantedThisText::
	text "...Chut! Pas un"
	line "mot!"

	para "Tu veux ça?"
	prompt

_MrPsychicsHouseMrPsychicReceivedTM29Text::
	text "<PLAYER> obtient:"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_MrPsychicsHouseMrPsychicTM29ExplanationText::
	text "CT29: PSYKO!"

	para "Cette attaque"
	line "diminue le"
	cont "SPECIAL de la"
	cont "cible."
	done

_MrPsychicsHouseMrPsychicTM29NoRoomText::
	text "Ton inventaire"
	line "est plein!"
	done
