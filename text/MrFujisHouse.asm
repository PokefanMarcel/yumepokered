_MrFujisHouseSuperNerdMrFujiIsntHereText::
	text "That's odd, MR.FUJI"
	line "isn't here."
	cont "Where'd he go?"
	done

_MrFujisHouseSuperNerdMrFujiHadBeenPrayingText::
	text "MR.FUJI had been"
	line "praying alone for"
	cont "CUBONE's mother."
	done

_MrFujisHouseLittleGirlThisIsMrFujisHouseText::
	text "This is really"
	line "MR.FUJI's house."

	para "He's really kind!"

	para "He looks after"
	line "abandoned and"
	cont "orphaned #MON!"
	done

_MrFujisHouseLittleGirlPokemonAreNiceToHugText::
	text "It's so warm!"
	line "#MON are so"
	cont "nice to hug!"
	done

_MrFujisHousePsyduckText::
	text "PSYDUCK: Gwappa!@"
	text_end

_MrFujisHouseNidorinoText::
	text "NIDORINO: Gaoo!@"
	text_end

_MrFujisHouseMrFujiIThinkThisMayHelpYourQuestText::
	text "MR.FUJI: <PLAYER>."

	para "Your #DEX quest"
	line "may fail without"
	cont "love for your"
	cont "#MON."

	para "I think this may"
	line "help your quest."
	prompt

_MrFujisHouseMrFujiReceivedPokeFluteText::
	text "<PLAYER> received"
	line "a @"
	text_ram wStringBuffer
	text "!@"
	text_end

_MrFujisHouseMrFujiPokeFluteExplanationText::
	text_start

	para "Upon hearing #"
	line "FLUTE, sleeping"
	cont "#MON will"
	cont "spring awake."

	para "It works on all"
	line "sleeping #MON."
	done

_MrFujisHouseMrFujiMakeRoomText::
	text "You must make"
	line "room for this!"
	done

_MrFujisHouseMrFujiHasMyFluteHelpedYouText::
	text "MR.FUJI: Has my"
	line "FLUTE helped you?"
	done

_MrFujisHouseMrFujiPokedexText::
	text "#MON Monthly"
	line "Grand Prize"
	cont "Drawing!"

	para "The application"
	line "form is..."

	para "Gone! It's been"
	line "clipped out!"
	done

_MrFujisHouseMrFujiPlayerGaveNotesText:: ; marcelnote - new
	text "MR.FUJI: <PLAYER>,"
	line "is your quest"
	cont "going well?"

	para "Hmm? You found"
	line "something?"

	para "<PLAYER> gave"
	line "FUJI's NOTES.@"
	text_end

_MrFujisHouseMrFujiThankYouText:: ; marcelnote - new
	text_start
	para "My research notes!"
	line "I thought they"
	cont "had been lost." ; maybe they were stolen before he left the project?

	;para "Thank you for"
	;line "bringing them"
	;cont "back. They could"
	;cont "have fallen into"
	;cont "the wrong hands."

	para "So, you know about"
	line "CINNABAR, then?"

	;para "What happened"
	;line "there... I would"
	;cont "rather leave it"
	;cont "in the past."

	para "I do not have the" ; FUJI left before MEWTWO escaped
	line "answers you seek,"
	cont "but I know some-"
	cont "one who might."

	para "DR.JABARA was part"
	line "of the research"
	cont "team on CINNABAR."

	para "Now he works on"
	line "MANDARIN ISLAND."
	; fallthrough
_MrFujisHouseMrFujiTakeThisText:: ; marcelnote - new
	para "Here, take this."
	line "You will need it."
	prompt

_MrFujisHouseMrFujiReceivedOrangePassText:: ; marcelnote - new
	text "<PLAYER> received"
	line "an @"
	text_ram wStringBuffer
	text "!@"
	text_end

_MrFujisHouseMrFujiOrangePassExplanationText:: ; marcelnote - new
	text_start

	para "This pass lets you"
	line "board the ferry"
	cont "from VERMILION to"
	cont "MANDARIN ISLAND."

	para "You should find"
	line "DR.JABARA there."
	done

_MrFujisHouseMrFujiBeCarefulText:: ; marcelnote - new
	text "MR.FUJI: DR.JABARA"
	line "might have the"
	cont "answers you seek,"
	cont "but be careful."

	para "Although he is a"
	line "gifted scientist,"
	cont "his methods can"
	cont "be questionable."
	done
