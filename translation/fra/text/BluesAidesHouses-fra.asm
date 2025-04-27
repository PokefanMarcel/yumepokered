_BluesHouseDaisyRivalAtLabText::
	text "Salut <PLAYER>!"
	line "<RIVAL> est dans"
	cont "le labo de pépé! "
	done

_BluesHouseDaisyOfferMapText::
	text "Tu dois faire une"
	line "course pour pépé?"
	cont "Prends ceci,"
	cont "ça peut servir!"
	prompt

_GotMapText::
	text "<PLAYER> obtient:"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_BluesHouseDaisyBagFullText::
	text "Votre inventaire"
	line "est plein."
	done

_BluesHouseDaisyUseMapText::
	text "Utilise la CARTE"
	line "pour connaître ta"
	cont "position."
	done

_BluesHouseDaisyWalkingText::
	text "Les #MON sont"
	line "vivants! Une fois"
	cont "fatigués, ils"
	cont "doivent se"
	cont "reposer!"
	done

_BluesHouseTownMapText::
	text "C'est une carte!"
	line "Ca peut être"
	cont "utile!"
	done

_AidesHouseMiddleAgedWomanText:: ; marcelnote - new Pallet house
	text "Mon mari aide le"
	line "PROF. CHEN dans"
	cont "ses recherches."

	para "C'est un travail"
	line "passionnant, mais"
	cont "il est rarement"
	cont "à la maison."
	done

;_TakeThisRareCandyText:: ; marcelnote - make woman give rare candy
;	text "Take this!"
;	done

_AidesHouseMemoText:: ; marcelnote - new Pallet house
	text "Un mémo écrit par"
	line "l'ASSISTANT du"
	line "PROF. CHEN."

	para "..."

	para "Aide aux dresseurs"
	line "sur ROUTE 2,"
	cont "ROUTE 11,"
	cont "ROUTE 15."
	done
