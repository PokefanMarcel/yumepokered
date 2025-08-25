_CinnabarLabFossilRoomScientist1Text::
	text "Salut!"

	para "Je suis un"
	line "scientifique très"
	cont "sérieux!"

	para "J'étudie les"
	line "fossiles anciens"
	cont "de #MON!"

	para "Toi! Là!"
	line "T'aurais pas un"
	cont "fossile pour moi?"
	prompt

_CinnabarLabFossilRoomScientist1NoFossilsText::
	text "Non? C'est bien"
	line "dommage!"
	done

_CinnabarLabFossilRoomScientist1GoForAWalkText::
	text "Ca va prendre du"
	line "temps!"

	para "Va te promener"
	line "pendant que je"
	cont "bosse!"
	done

_CinnabarLabFossilRoomScientist1FossilIsBackToLifeText::
	text "Ben alors! Où"
	line "étais-tu passé?"

	para "Ton fossile est"
	line "VIVANT!"

	para "Il ressemble à un"
	line "@"
	text_ram wStringBuffer
	text "!"
	prompt

_CinnabarLabFossilRoomScientist1SeesFossilText::
	text "Oh! C'est un"
	line "@"
	text_ram wNameBuffer
	text "!"

	para "C'est un fossile"
	line "de @"
	text_ram wStringBuffer
	text ","
	cont "un #MON qui a"
	cont "disparu!"

	para "Ma machine à"
	line "réanimer va faire"
	cont "revivre cet"
	cont "ancien #MON!"
	done

_CinnabarLabFossilRoomScientist1TakesFossilText::
	text "Tu te grouilles,"
	line "file-moi ça!"

	para "<PLAYER> donne:"
	line "@"
	text_ram wNameBuffer
	text "!"
	prompt

_CinnabarLabFossilRoomScientist1GoForAWalkText2::
	text "Ca va prendre un"
	line "peu de temps!"

	para "Traîne pas dans"
	line "mes pattes, va"
	cont "faire un tour!"
	done

_CinnabarLabFossilRoomScientist1ComeAgainText::
	text "Argayahhaha!"
	line "Tu reviendras!"
	done
