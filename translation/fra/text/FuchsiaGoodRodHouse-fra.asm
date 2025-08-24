_FuchsiaGoodRodHouseFishingGuruText::
	text "Je suis le grand"
	line "frère du MAITRE"
	cont "PECHEUR!"

	para "Moi, mon truc,"
	line "c'est la pêche!"

	para "T'aimes la"
	line "pêche, petit?"
	done

_FuchsiaGoodRodHouseFishingGuruReceivedGoodRodText::
	text "Cool! T'as l'air"
	line "d'un bon gars!"

	para "Prends ça!"
	line "Que la Grand'"
	cont "Pêche soit avec"
	cont "toi, p'tit!"

	para "<PLAYER> reçoit"
	line "une @"
	text_ram wStringBuffer
	text "!@"
	text_end

_FuchsiaGoodRodHouseFishingGuruThatsSoDisappointingText::
	text "Oh...Pas cool!"
	line "Pas cool du tout!"
	done

_FuchsiaGoodRodHouseFishingGuruHowAreTheFishText::
	text "Salut,"
	line "<PLAYER>!"

	para "Ca mord?"
	done

_FuchsiaGoodRodHouseFishingGuruNoRoomText::
	text "Oh non!"

	para "Ton inventaire"
	line "est plein!"
	done
