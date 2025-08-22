_MrFujisHouseSuperNerdMrFujiIsntHereText::
	text "Ce sacré MR.FUJI"
	line "n'est pas là."
	cont "Où est-il?"
	done

_MrFujisHouseSuperNerdMrFujiHadBeenPrayingText::
	text "MR.FUJI a prié"
	line "pour le repos de"
	cont "la mère de"
	cont "OSSELAIT."
	done

_MrFujisHouseLittleGirlThisIsMrFujisHouseText::
	text "Voici la maison"
	line "de MR.FUJI."

	para "C'est vraiment un"
	line "chic type!"

	para "Il est à la"
	line "recherche des"
	cont "#MON orphelins"
	cont "et abandonnés!"
	done

_MrFujisHouseLittleGirlPokemonAreNiceToHugText::
	text "C'est si doux!"
	line "Faire un câlin à"
	cont "un #MON,"
	cont "c'est chou!"
	done

_MrFujisHousePsyduckText::
	text "PSYKOKWAK: Kwak!@"
	text_end

_MrFujisHouseNidorinoText::
	text "NIDORINO: Nido!@"
	text_end

_MrFujisHouseMrFujiIThinkThisMayHelpYourQuestText::
	text "MR.FUJI: <PLAYER>."

	para "Ta quête pour"
	line "compléter ton"
	cont "#DEX échouera"
	cont "si tu n'aimes pas"
	cont "tes #MON."

	para "Je crois que ceci"
	line "te sera utile."
	prompt

_MrFujisHouseMrFujiReceivedPokeFluteText::
	text "<PLAYER> obtient:"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_MrFujisHouseMrFujiPokeFluteExplanationText::
	text_start

	para "En jouant de la"
	line "#FLUTE, les"
	cont "#MON endormis"
	cont "se réveilleront."

	para "Elle marche sur"
	line "tous les #MON."
	done

_MrFujisHouseMrFujiPokeFluteNoRoomText::
	text "Votre inventaire"
	line "est plein!"
	done

_MrFujisHouseMrFujiHasMyFluteHelpedYouText::
	text "MR.FUJI: Ma FLUTE"
	line "t'a été utile?"
	done

_MrFujisHouseMrFujiPokedexText::
	text "Grand concours de"
	line "dessin de"
	cont "#MON!"

	para "Le formulaire"
	line "d'inscription"
	cont "est..."

	para "...Hein? Il a"
	line "disparu!"
	done

_MrFujisHouseMrFujiPlayerGaveNotesText:: ; TODO marcelnote - new
	text "MR.FUJI: <PLAYER>,"
	line "is your quest"
	cont "going well?"

	para "Hmm? You found"
	line "something?"

	para "<PLAYER> gave"
	line "FUJI's NOTES.@"
	text_end

_MrFujisHouseMrFujiThankYouText:: ; TODO marcelnote - new
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
_MrFujisHouseMrFujiTakeThisText:: ; TODO marcelnote - new
	para "Here, take this."
	line "You will need it."
	prompt

_MrFujisHouseMrFujiReceivedCitrusPassText:: ; TODO marcelnote - new
	text "<PLAYER> received"
	line "a @"
	text_ram wStringBuffer
	text "!@"
	text_end

_MrFujisHouseMrFujiCitrusPassExplanationText:: ; TODO marcelnote - new
	text_start

	para "This pass lets you"
	line "board the ferry"
	cont "from VERMILION to"
	cont "MANDARIN ISLAND."

	para "You should find"
	line "DR.JABARA there."
	done

_MrFujisHouseMrFujiBeCarefulText:: ; TODO marcelnote - new
	text "MR.FUJI: DR.JABARA"
	line "might have the"
	cont "answers you seek,"
	cont "but be careful."

	para "Although he is a"
	line "gifted scientist,"
	cont "his methods can"
	cont "be questionable."
	done
