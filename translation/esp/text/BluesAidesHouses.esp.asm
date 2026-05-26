_BluesHouseDaisyRivalAtLabText::
	text "¡Hola <PLAYER>!"
	line "¡<RIVAL> está"
	cont "en el laboratorio"
	cont "del abuelo!"
	done

_BluesHouseDaisyOfferMapText::
	text "¿Te encargó algo"
	line "el abuelo?"
	cont "¡Toma esto!"
	cont "¡Te ayudará!"
	prompt

_GotMapText::
	text "¡<PLAYER> obtuvo:"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_BluesHouseDaisyBagFullText::
	text "Llevas demasiadas"
	line "cosas."
	done

_BluesHouseDaisyUseMapText::
	text "Usa el MAPA de"
	line "PUEBLOS para"
	cont "saber dónde"
	cont "te encuentras."
	done

_BluesHouseDaisyWalkingLivingThingsText::
;	text "¡Los #MON" ; original
;	line "son seres vivos!"
;	cont "¡Si se cansan,"
;	cont "déjalos reposar!"

	text "DALIA: ¡Los" ; marcelnote - new to add Daisy's name
	line "#MON son"
	cont "seres vivos!"

	para "¡Si se cansan,"
	line "déjalos reposar!"
	done

; TODO - Spanish translation
_BluesHouseDaisyWalkingPhoneText:: ; marcelnote - new for pay phones
	text "DAISY: Grandpa got" ; DALIA
	line "me a new phone!"

	para "Call me when you"
	line "need help, okay?"
	done

_BluesHouseTownMapText::
	text "¡Es un gran mapa!"
	line "¡Es muy útil!"
	done

; TODO - Spanish translation
_BluesHousePhoneText:: ; marcelnote - new for pay phones
	text "It's DAISY's phone." ; DALIA
	line "Still shiny!"
	done

; TODO - Spanish translation
_AidesHouseMiddleAgedWomanText:: ; marcelnote - new Pallet house
	text "My husband is a"
	line "researcher at"
	cont "PROF.OAK's LAB."

	para "It's rewarding"
	line "work, but he's"
	cont "away from home"
	cont "a lot."
	done

;_TakeThisRareCandyText:: ; marcelnote - make woman give rare candy
;	text "Take this!"
;	done

; TODO - Spanish translation
_AidesHouseMemoText:: ; marcelnote - new Pallet house
	text "It's a memo from"
	line "PROF.OAK's AIDE."

	para "..."

	para "Assist trainers at"
	line "ROUTE 2, ROUTE 6," ; marcelnote - Route 6 for PokéBeeper
	cont "ROUTE 11,"
	cont "and ROUTE 15."
	done
