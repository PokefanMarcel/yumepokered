_CeladonMart1FReceptionistText::
	text "Hello! Welcome to"
	line "CELADON DEPT."
	cont "STORE."

	para "The board on the"
	line "right describes"
	cont "the store layout."
	done

_CeladonMart1FDirectorySignText::
	text "1F: SERVICE"
	line "    COUNTER"

	para "2F: TRAINER'S"
	line "    MARKET"

	para "3F: TV GAME SHOP"

	para "4F: WISEMAN GIFTS"

	para "5F: DRUG STORE"

	para "6F: ???" ; marcelnote - new floor

	para "ROOFTOP SQUARE:"
	line "VENDING MACHINES"
	done

_CeladonMart1FCurrentFloorSignText::
	text "1F: SERVICE"
	line "    COUNTER"
	done

_CeladonMart2FMiddleAgedManText::
	text "SUPER REPEL keeps"
	line "weak #MON at"
	cont "bay..."

	para "Hmm, it's a more"
	line "powerful REPEL!"
	done

_CeladonMart2FGirlText::
	text "For long outings,"
	line "you should buy"
	cont "REVIVE."
	done

_CeladonMart2FBrunetteGirlText:: ; marcelnote - new NPC
	text "Here each BADGE"
	line "allows you to"
	cont "buy more TMs."

	para "I want to teach"
	line "BUBBLEBEAM to"
	cont "WIGGLYTUFF, but"
	cont "the clerk says"
	cont "I need the"
	cont "RAINBOW BADGE..."
	done

_CeladonMart2FCurrentFloorSignText::
	text "Top Grade Items"
	line "for Trainers!"

	para "2F: TRAINER'S"
	line "    MARKET"
	done

_CeladonMart3FClerkTM18PreReceiveText::
	text "Oh, hi! I finally"
	line "finished #MON!"

	para "Not done yet?"
	line "This might be"
	cont "useful!"
	prompt

_CeladonMart3FClerkReceivedTM18Text::
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_CeladonMart3FClerkTM18ExplanationText::
	text "TM18 is COUNTER!"
	line "Not like the one"
	cont "I'm leaning on,"
	cont "mind you!"
	done

_CeladonMart3FClerkTM18NoRoomText::
	text "Your pack is full"
	line "of items!"
	done

_CeladonMart3FGameBoyKid1Text::
	text "Captured #MON"
	line "are registered"
	cont "with an ID No."
	cont "and OT, the name"
	cont "of the Original"
	cont "Trainer that"
	cont "caught it!"
	done

_CeladonMart3FGameBoyKid2Text::
	text "All right!"

	para "My buddy's going"
	line "to trade me his"
	cont "KANGASKHAN for my"
	cont "GRAVELER!"
	done

_CeladonMart3FGameBoyKid3Text::
	text "Come on GRAVELER!"

	para "I love GRAVELER!"
	line "I collect them!"

	para "Huh?"

	para "GRAVELER turned"
	line "into a different"
	cont "#MON!"
	done

_CeladonMart3FLittleBoyText::
	text "You can identify"
	line "#MON you got"
	cont "in trades by"
	cont "their ID Numbers!"
	done

_CeladonMart3FSNESText::
	text "It's an SNES!"
	done

_CeladonMart3FRPGText::
	text "An RPG! There's"
	line "no time for that!"
	done

_CeladonMart3FSportsGameText::
	text "A sports game!"
	line "Dad'll like that!"
	done

_CeladonMart3FPuzzleGameText::
	text "A puzzle game!"
	line "Looks addictive!"
	done

_CeladonMart3FFightingGameText::
	text "A fighting game!"
	line "Looks tough!"
	done

_CeladonMart3FCurrentFloorSignText::
	text "3F: TV GAME SHOP"
	done

_CeladonMart3FPokemonPosterText::
	text "Red and Blue!"
	line "Both are #MON!"
	done
