_OaksLabRivalGrampsIsntAroundText::
	text "<RIVAL>: Yo"
	line "<PLAYER>! Gramps"
	cont "isn't around!"
	done

_OaksLabRivalGoAheadAndChooseText::
	text "<RIVAL>: Heh, I"
	line "don't need to be"
	cont "greedy like you!"

	para "Go ahead and"
	line "choose, <PLAYER>!"
	done

_OaksLabRivalMyPokemonLooksStrongerText::
	text "<RIVAL>: My"
	line "#MON looks a"
	cont "lot stronger."
	done

_OaksLabThoseArePokeBallsText::
	text "Those are #"
	line "BALLs. They"
	cont "contain #MON!"
	done

_OaksLabYouWantCharmanderText::
	text "So! You want the"
	line "fire #MON,"
	cont "CHARMANDER?"
	done

_OaksLabYouWantSquirtleText::
	text "So! You want the"
	line "water #MON,"
	cont "SQUIRTLE?"
	done

_OaksLabYouWantBulbasaurText::
	text "So! You want the"
	line "plant #MON,"
	cont "BULBASAUR?"
	done

_OaksLabMonEnergeticText::
	text "This #MON is"
	line "really energetic!"
	prompt

_OaksLabReceivedMonText::
	text "<PLAYER> received"
	line "a @"
	text_ram wNameBuffer
	text "!@"
	text_end

_OaksLabLastMonText::
	text "That's PROF.OAK's"
	line "last #MON!"
	done

_OaksLabOakWhichPokemonDoYouWantText::
	text "OAK: Now, <PLAYER>,"
	line "which #MON do"
	cont "you want?"
	done

_OaksLabOakYourPokemonCanFightText::
	text "OAK: If a wild"
	line "#MON appears,"
	cont "your #MON can"
	cont "fight against it!"
	done

_OaksLabOakRaiseYourYoungPokemonText::
	text "OAK: <PLAYER>,"
	line "raise your young"
	cont "#MON by making"
	cont "it fight!"
	done

_OaksLabOakDeliverParcelText::
	text "OAK: Oh, <PLAYER>!"

	para "How is my old"
	line "#MON?"

	para "Well, it seems to"
	line "like you a lot."

	para "You must be"
	line "talented as a"
	cont "#MON trainer!"

	para "What? You have"
	line "something for me?"

	para "<PLAYER> delivered"
	line "OAK's PARCEL.@"
	text_end

_OaksLabOakParcelThanksText::
	text_start
	para "Ah! This is the"
	line "custom # BALL"
	cont "I ordered!"
	cont "Thank you!"
	done

_OaksLabOakPokemonAroundTheWorldText::
	text "#MON around the"
	line "world wait for"
	cont "you, <PLAYER>!"
	done

_OaksLabOakReceivedPokeballsText::
	text "OAK: You can't get"
	line "detailed data on"
	cont "#MON by just"
	cont "seeing them."

	para "You must catch"
	line "them! Use these"
	cont "to capture wild"
	cont "#MON."

	para "<PLAYER> got 5"
	line "# BALLs!@"
	text_end

_OaksLabGivePokeballsExplanationText::
	text_start
	para "When a wild"
	line "#MON appears,"
	cont "it's fair game."

	para "Just throw a #"
	line "BALL at it and" ; marcelnote - moved 'try' to next line
	cont "try to catch it!" ; marcelnote - fixed 'line' to 'cont'

	para "This won't always"
	line "work, though."

	para "A healthy #MON"
	line "could escape. You"
	cont "have to be lucky!"
	done

_OaksLabOakComeSeeMeSometimesText::
	text "OAK: Come see me"
	line "sometimes."

	para "I want to know how"
	line "your #DEX is"
	cont "coming along."
	done

_OaksLabOakHowIsYourPokedexComingText::
	text "OAK: Good to see "
	line "you! How is your "
	cont "#DEX coming? "
	cont "Here, let me take"
	cont "a look!"
	prompt

_OaksLabPokedexText::
	text "It's encyclopedia-"
	line "like, but the"
	cont "pages are blank!"
	done

_OaksLabOakWalkingText:: ; marcelnote - this is not seen since this Oak is just for the walking animation
	text "?"
	done

_OaksLabGirlText::
	text "PROF.OAK is the"
	line "authority on"
	cont "#MON!"

	para "Many #MON"
	line "trainers hold him"
	cont "in high regard!"
	done

_OaksLabRivalFedUpWithWaitingText::
	text "<RIVAL>: Gramps!"
	line "I'm fed up with"
	cont "waiting!"
	done

_OaksLabOakChooseMonText::
	text "OAK: <RIVAL>?"
	line "Let me think..."

	para "Oh, that's right,"
	line "I told you to"
	cont "come! Just wait!"

	para "Here, <PLAYER>!"

	para "There are 3"
	line "#MON here!"

	para "Haha!"

	para "They are inside"
	line "the # BALLs."

	para "When I was young,"
	line "I was a serious"
	cont "#MON trainer!"

	para "In my old age, I"
	line "have only 3 left,"
	cont "but you can have"
	cont "one! Choose!"
	done

_OaksLabRivalWhatAboutMeText::
	text "<RIVAL>: Hey!"
	line "Gramps! What"
	cont "about me?"
	done

_OaksLabOakBePatientText::
	text "OAK: Be patient!"
	line "<RIVAL>, you can"
	cont "have one too!"
	done

_OaksLabOakDontGoAwayYetText::
	text "OAK: Hey! Don't go"
	line "away yet!"
	done

_OaksLabRivalIllTakeThisOneText::
	text "<RIVAL>: I'll take"
	line "this one, then!"
	done

_OaksLabRivalReceivedMonText::
	text "<RIVAL> received"
	line "a @"
	text_ram wNameBuffer
	text "!@"
	text_end

_OaksLabRivalIllTakeYouOnText::
	text "<RIVAL>: Wait"
	line "<PLAYER>!"
	cont "Let's check out"
	cont "our #MON!"

	para "Come on, I'll take"
	line "you on!"
	done

_OaksLabRivalIPickedTheWrongPokemonText::
	text "WHAT?"
	line "Unbelievable!"
	cont "I picked the"
	cont "wrong #MON!"
	prompt

_OaksLabRivalAmIGreatOrWhatText::
	text "<RIVAL>: Yeah! Am"
	line "I great or what?"
	prompt

_OaksLabRivalSmellYouLaterText::
	text "<RIVAL>: Okay!"
	line "I'll make my"
	cont "#MON fight to"
	cont "toughen it up!"

	para "<PLAYER>! Gramps!"
	line "Smell you later!"
	done

_OaksLabRivalGrampsText::
	text "<RIVAL>: Gramps!"
	done

_OaksLabRivalWhatDidYouCallMeForText::
	text "<RIVAL>: What did"
	line "you call me for?"
	done

_OaksLabOakIHaveARequestText::
	text "OAK: Oh right! I"
	line "have a request"
	cont "of you two."
	done

_OaksLabOakMyInventionPokedexText::
	text "On the desk there"
	line "is my invention,"
	cont "#DEX!"

	para "It automatically"
	line "records data on"
	cont "#MON you've"
	cont "seen or caught!"

	para "It's a hi-tech"
	line "encyclopedia!"
	done

_OaksLabOakGotPokedexText::
	text "OAK: <PLAYER> and"
	line "<RIVAL>! Take"
	cont "these with you!"

	para "<PLAYER> got"
	line "#DEX from OAK!@"
	text_end

_OaksLabOakThatWasMyDreamText::
	text "To make a complete"
	line "guide on all the"
	cont "#MON in the"
	cont "world..."

	para "That was my dream!"

	para "But, I'm too old!"
	line "I can't do it!"

	para "So, I want you two"
	line "to fulfill my"
	cont "dream for me!"

	para "Get moving, you"
	line "two!"

	para "This is a great"
	line "undertaking in"
	cont "#MON history!"
	done

_OaksLabRivalLeaveItAllToMeText::
	text "<RIVAL>: Alright"
	line "Gramps! Leave it"
	cont "all to me!"

	para "<PLAYER>, I hate to"
	line "say it, but I"
	cont "don't need you!"

	para "I know! I'll"
	line "borrow a TOWN MAP"
	cont "from my sis!"

	para "I'll tell her not"
	line "to lend you one,"
	cont "<PLAYER>! Hahaha!"
	done

_OaksLabScientistText::
	text "I study #MON as"
	line "PROF.OAK's AIDE."
	done

_OaksLabRivalShowingDexText:: ; marcelnote - postgame Rival event
	text "<RIVAL>: Yo,"
	line "<PLAYER>!"

	para "I was just show-"
	line "ing my #DEX"
	cont "to gramps."

	para "I've recorded 146"
	line "different kinds"
	cont "of #MON!"
	cont "Pretty impress-"
	cont "ive, right?"

	para "But gramps keeps"
	line "going on about"
	cont "these legendary"
	cont "birds."

	para "What about you,"
	line "<PLAYER>?"
	cont "Have you come"
	cont "across any of"
	cont "these legendary"
	cont "#MON?"
	prompt


_OaksLabRivalSeenNoBirdText:: ; marcelnote - postgame Rival event
	text "No? That's what"
	line "I figured."

	para "They're probably"
	line "just stories for"
	cont "kids."
	done

; marcelnote - there must be a smarter way to define these text variants
;              by making use of string buffers like wcd6d (stores names) and wStringBuffer
_OaksLabRivalSeenArticunoText:: ; marcelnote - postgame Rival event
	text "So you've seen"
	line "ARTICUNO, huh."

	para "Maybe the stories"
	line "are true after"
	cont "all..."
	done

_OaksLabRivalSeenZapdosText:: ; marcelnote - postgame Rival event
	text "So you've seen"
	line "ZAPDOS, huh."

	para "Maybe the stories"
	line "are true after"
	cont "all..."
	done

_OaksLabRivalSeenMoltresText:: ; marcelnote - postgame Rival event
	text "So you've seen"
	line "MOLTRES, huh."

	para "Maybe the stories"
	line "are true after"
	cont "all..."
	done

_OaksLabRivalSeenArticunoZapdosText:: ; marcelnote - postgame Rival event
	text "What? You've seen"
	line "both ARTICUNO"
	cont "and ZAPDOS?"

	para "Could MOLTRES"
	line "actually be real,"
	cont "as well?"
	done

_OaksLabRivalSeenArticunoMoltresText:: ; marcelnote - postgame Rival event
	text "What? You've seen"
	line "both ARTICUNO"
	cont "and MOLTRES?"

	para "Could ZAPDOS"
	line "actually be real,"
	cont "as well?"
	done

_OaksLabRivalSeenZapdosMoltresText:: ; marcelnote - postgame Rival event
	text "What? You've seen"
	line "both ZAPDOS"
	cont "and MOLTRES?"

	para "Could ARTICUNO"
	line "actually be real,"
	cont "as well?"
	done

_OaksLabRivalSeenAllBirdsText:: ; marcelnote - postgame Rival event
	text "Whoa, have you"
	line "really seen all"
	cont "three legendary"
	cont "birds?"

	para "ARTICUNO, ZAPDOS,"
	line "and MOLTRES..."
	cont "Unbelievable!"

	para "You really are"
	line "something else,"
	cont "<PLAYER>!"
	done

_OaksLabRivalBackToIndigoText:: ; marcelnote - postgame Rival event
	text "Alright, I'm off"
	line "to train at the"
	cont "INDIGO PLATEAU."

	para "Oh, did you hear?"
	line "GIOVANNI was"
	cont "secretly the head"
	cont "of TEAM ROCKET!"

	para "With him gone,"
	line "VIRIDIAN will"
	cont "need a new"
	cont "GYM LEADER."

	para "Think it over,"
	line "<PLAYER>!"
	cont "A steady gig as"
	cont "VIRIDIAN's GYM"
	cont "LEADER sounds"
	cont "like your style!"

	para "<PLAYER>! Gramps!"
	line "Smell you later!"
	done
