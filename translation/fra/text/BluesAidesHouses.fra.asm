_BluesHouseDaisyRivalAtLabText::
	text "Salut <PLAYER>!"
	line "<RIVAL> est dans"
	cont "le labo de pépé! "
	done

_BluesHouseDaisyOfferMapText::
;	text "Tu dois faire une" ; original
;	line "course pour pépé?"
;	cont "Prends ceci,"
;	cont "ça peut servir!"

	text "NINA: Tu dois" ; marcelnote - new to add Daisy's name
	line "faire une course"
	cont "pour pépé?"

	para "Prends ceci,"
	line "ça peut servir!"
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

_BluesHouseDaisyWalkingLivingThingsText::
;	text "Les #MON sont" ; original
;	line "vivants! Une fois"
;	cont "fatigués, ils"
;	cont "doivent se"
;	cont "reposer!"

	text "NINA: Les #MON" ; marcelnote - new to add Daisy's name
	line "sont vivants!"

	para "Une fois fatigués,"
	line "ils doivent se"
	cont "reposer!"
	done

_BluesHouseDaisyWalkingPhoneText:: ; marcelnote - new for pay phones
	text "NINA: Pépé m'a"
	line "offert un nouveau"
	cont "téléphone!"

	para "Appelle-moi si tu"
	line "as besoin d'aide,"
	cont "d'accord?"
	done

_BluesHouseTownMapText::
	text "C'est une carte!"
	line "Ca peut être"
	cont "utile!"
	done

_BluesHousePhoneText:: ; marcelnote - new for pay phones
	text "Le téléphone de"
	line "NINA. Tout neuf!"
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
	cont "ROUTE 6, ROUTE 11"
	cont "et ROUTE 15."
	done
