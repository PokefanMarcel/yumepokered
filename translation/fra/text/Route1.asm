_Route1Youngster1MartSampleText::
	text "Salut! Je"
	line "travaille à la"
	cont "BOUTIQUE #MON."

	para "Nous avons plein"
	line "d'articles! Viens"
	cont "nous voir à"
	cont "JADIELLE."

	para "Prends donc"
	line "ceci comme"
	cont "échantillon!"
	prompt

_Route1Youngster1GotPotionText::
	text "<PLAYER> obtient:"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_Route1Youngster1AlsoGotPokeballsText::
	text "Nous avons aussi"
	line "des # BALL"
	cont "pour capturer les"
	cont "#MON!"
	done

_Route1Youngster1NoRoomText::
	text "Ton inventaire"
	line "est plein!"
	done

_Route1Youngster2Text::
	text "Tu vois ces"
	line "rebords le long"
	cont "de la route?"

	para "Tu peux sauter"
	line "par-dessus! C'est"
	cont "dingue, non?"

	para "Tu peux revenir"
	line "plus vite à"
	cont "BOURG PALETTE de"
	cont "cette façon!"
	done

_Route1SignText::
	text "ROUTE 1"
	line "BOURG PALETTE -"
	cont "JADIELLE"
	done
