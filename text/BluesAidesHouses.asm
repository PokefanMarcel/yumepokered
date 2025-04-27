_BluesHouseDaisyRivalAtLabText::
	text "Hi <PLAYER>!"
	line "<RIVAL> is out at"
	cont "Grandpa's lab."
	done

_BluesHouseDaisyOfferMapText::
	text "Grandpa asked you"
	line "to run an errand?"
	cont "Here, this will"
	cont "help you!"
	prompt

_GotMapText::
	text "<PLAYER> got a"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_BluesHouseDaisyBagFullText::
	text "You have too much"
	line "stuff with you."
	done

_BluesHouseDaisyUseMapText::
	text "Use the TOWN MAP"
	line "to find out where"
	cont "you are."
	done

_BluesHouseDaisyWalkingText::
	text "#MON are living"
	line "things! If they"
	cont "get tired, give"
	cont "them a rest!"
	done

_BluesHouseTownMapText::
	text "It's a big map!"
	line "This is useful!"
	done

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

_AidesHouseMemoText:: ; marcelnote - new Pallet house
	text "It's a memo from"
	line "PROF.OAK's AIDE."

	para "..."

	para "Assist trainers at"
	line "ROUTE 2,"
	cont "ROUTE 11,"
	cont "ROUTE 15."
	done
