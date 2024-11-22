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

;_OaksLabOakDeliverParcelText:: ; example of structure for Oak parcel delivery
;	text "OAK: Oh, <PLAYER>!"

;	para "How is my old"
;	line "#MON?"

;	para "Well, it seems to"
;	line "like you a lot."

;	para "You must be"
;	line "talented as a"
;	cont "#MON trainer!"

;	para "What? You have"
;	line "something for me?"

;	para "<PLAYER> delivered"
;	line "OAK's PARCEL.@"
;	text_end

; <PLAYER> hands over FUJI's NOTES.

_MrFujisHouseMrFujiHereIsThePassText:: ; marcelnote - new
	text "MR.FUJI: <PLAYER>."

	para "Here is the"
	line "ORANGE PASS."
	prompt

_MrFujisHouseMrFujiReceivedOrangePassText:: ; marcelnote - new
	text "<PLAYER> received"
	line "an @"
	text_ram wStringBuffer
	text "!@"
	text_end

_MrFujisHouseMrFujiOrangePassExplanationText:: ; marcelnote - new
	text_start

	para "Travel with this"
	line "ORANGE PASS!"
	done

_MrFujisHouseMrFujiGoodLuckText:: ; marcelnote - new
	text "Good luck!"
	done
