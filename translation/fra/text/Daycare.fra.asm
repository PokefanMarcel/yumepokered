_DaycareGentlemanIntroText::
	text "Je m'occupe de la"
	line "PENSION. Veux-tu"
	cont "que j'élève un de"
	cont "tes #MON?"
	done

_DaycareGentlemanWhichMonText::
	text "Quel #MON"
	line "veux-tu me"
	cont "confier?"
	prompt

_DaycareGentlemanWillLookAfterMonText::
	text "Très bien, je"
	line "vais m'occuper de"
	cont "@"
	text_ram wNameBuffer
	text "."
	prompt

_DaycareGentlemanComeSeeMeInAWhileText::
	text "Reviens un peu"
	line "plus tard."
	done

_DaycareGentlemanMonHasGrownText::
	text "Ton @"
	text_ram wNameBuffer
	text_start
	line "a bien évolué!"

	para "Ses niveaux ont"
	line "augmenté de @"
	text_decimal wDayCareNumLevelsGrown, 1, 3
	text "!"

	para "Merci qui? Hein?"
	prompt

_DaycareGentlemanOweMoneyText::
	text "Donne-moi ¥@"
	text_bcd wDayCareTotalCost, 2 | LEADING_ZEROES | LEFT_ALIGN
	text_start
	line "et je te rends"
	cont "ton #MON."
	done

_DaycareGentlemanGotMonBackText::
	text "<PLAYER> récupère"
	line "@"
	text_ram wDayCareMonName
	text "!"
	done

_DaycareGentlemanMonNeedsMoreTimeText::
	text "Déjà de retour?"
	line "Ton @"
	text_ram wNameBuffer
	text_start
	cont "doit rester"
	cont "encore un peu."
	prompt

_DaycareGentlemanAllRightThenText::
	text "Parfait!"
	line "@"
	text_end

_DaycareGentlemanComeAgainText::
	text "A plus tard."
	done

_DaycareGentlemanNoRoomForMonText::
	text "Tu n'as plus de"
	line "place pour ce"
	cont "#MON!"
	done

_DaycareGentlemanOnlyHaveOneMonText::
	text "Tu n'as qu'un"
	line "#MON sur toi."
	done

;_DaycareGentlemanCantAcceptMonWithHMText:: ; marcelnote - daycare can erase HM moves
;	text "Je ne peux pas"
;	line "m'occuper d'un"
;	cont "#MON qui a"
;	cont "appris une CS."
;	done

_DaycareGentlemanHeresYourMonText::
	text "Merci! Voilà ton"
	line "p'tit #MON!"
	prompt

_DaycareGentlemanNotEnoughMoneyText::
	text "Hé! Tu n'as pas"
	line "assez d'argent!"
	done