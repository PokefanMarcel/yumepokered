_Route1Youngster1MartSampleText::
	text "Hi! I work at a"
	line "#MON MART."

	para "It's a convenient"
	line "shop, so please"
	cont "visit us in"
	cont "VIRIDIAN CITY."

	para "I know, I'll give"
	line "you a sample!"
	cont "Here you go!"
	prompt

_Route1Youngster1GotPotionText::
	text "<PLAYER> got"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_Route1Youngster1AlsoGotPokeballsText::
	text "We also carry"
	line "# BALLs for"
	cont "catching #MON!"
	done

_Route1Youngster1NoRoomText::
	text "You have too much"
	line "stuff with you!"
	done

_Route1Youngster2Text::
	text "See those ledges"
	line "along the road?"

	para "It's a bit scary,"
	line "but you can jump"
	cont "from them."

	para "You can get back"
	line "to PALLET TOWN"
	cont "quicker that way."
	done

_Route1SignText::
	text "ROUTE 1"
	line "PALLET TOWN -"
	cont "VIRIDIAN CITY"
	done

_Route1OakBeforeBattleText:: ; marcelnote - postgame Oak fight
	text "OAK: Oh,"
	line "<PLAYER>!"
	cont "You caught me"
	cont "on my afternoon"
	cont "stroll."

	para "Actually, I've"
	line "been wanting"
	cont "to see you."

	para "You know, I was"
	line "quite the trainer"
	cont "too, back in"
	cont "my day."

	para "Witnessing your"
	line "journey from"
	cont "PALLET TOWN to"
	cont "becoming the"
	cont "#MON LEAGUE"
	cont "champion..."

	para "It made me feel"
	line "young again!"

	para "What do you say,"
	line "<PLAYER>?"
	cont "Would you indulge"
	cont "this old man in a"
	cont "friendly battle?"
	done

_Route1OakRefusedBattleText:: ; marcelnote - postgame Oak battle
	text "Perhaps another"
	line "time, then!"
	done

_Route1OakAcceptedBattleText:: ; marcelnote - postgame Oak battle
	text "Excellent!"
	line "Let's put those"
	cont "old reflexes"
	cont "to the test!"
	done

_Route1OakDefeatText:: ; marcelnote - postgame Oak battle
	text "Truly"
	line "exhilarating!"
	prompt

_Route1OakVictoryText:: ; marcelnote - postgame Oak battle
	text "Truly"
	line "exhilarating!"
	prompt

_Route1OakPostBattleText:: ; marcelnote - postgame Oak battle
	text "OAK: Thank you,"
	line "<PLAYER>."

	para "I hadn't felt"
	line "that rush in"
	cont "a long time!"

	para "Well, back to"
	line "work now!"
	done

_Route1OakOneMoreThingText:: ; marcelnote - postgame Oak battle
	text "Oh, one more"
	line "thing!"

	para "Given your recent"
	line "feats, I've"
	cont "instructed the"
	cont "guard at ROUTE 22"
	cont "to let you pass."

	para "Actually, I just"
	line "authorized"
	cont "another trainer"
	cont "from PALLET, too."

	para "She defeated the"
	line "ELITE FOUR and"
	cont "<RIVAL> at the"
	cont "INDIGO PLATEAU!"

	para "I bet she'd like"
	line "to face the"
	cont "true champion!"
	done
