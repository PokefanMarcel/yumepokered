; marcelnote - merged RedsHouse floors and added YellowsHouse
_RedsHouse1FMomWakeUpText::
	text "MAMÁ: Bien."
	line "Todos los niños"
	cont "se van de casa"
	cont "algún día."
	cont "¡Así es la vida!"

	para "Nuestro vecino,"
	line "el PROF. OAK,"
	cont "quería verte."
	done

_RedsHouse1FMomYouShouldRestText::
	text "MAMÁ: ¡<PLAYER>!"
	line "Deberías tomarte"
	cont "un descanso."
	prompt

_RedsHouse1FMomLookingGreatText::
	text "MAMÁ: ¡Muy bien!"
	line "¡Tú y tus"
	cont "#MON estáis"
	cont "en plena forma!"
	cont "¡Cuídate!"
	done

_RedsHouse1FMomShortOnMoneyText:: ; marcelnote - Mom gives money to prevent softlocks
	text "MOM: Oh, <PLAYER>!"
	line "Aren't you short"
	cont "on money?"

	para "Here, take this."
	line "Don't spend it"
	cont "all at once,"
	cont "okay?"
	prompt

; TODO - Spanish translation
_RedsHouse1FMomGotMoneyText:: ; marcelnote - Mom gives money to prevent softlocks
	text "<PLAYER> received"
	line "¥500 from MOM!"
	done

_RedsHouse1FTVStandByMeMovieText::
	text "¡Hay una película"
	line "en la TV! 4 niños"
	cont "caminan por las"
	cont "vías del tren."

	para "¡Debería irme!"
	done

_RedsHouse1FTVWizardOfOzMovieText:: ; marcelnote - FRLG text option for girl
	text "There's a movie"
	line "on TV. A girl"
	cont "is walking up"
	cont "a brick road."

	para "I better go too."
	done

_RedsHouse1FTVWrongSideText::
	text "¡Ay! Me equivoqué"
	line "de lado."
	done
_RedsHouse1FPhoneText:: ; marcelnote - new for pay phones
	text "It's the phone."

	para "I should call MOM"
	line "when I can."
	done

; TODO - Spanish translation
_RedsHouse2FSNESText:: ; marcelnote - moved from hidden_objects
	text "<PLAYER> is"
	line "playing the SNES!"

	para "...Okay!" ; marcelnote - added paragraph break
	line "It's time to go!"
	done

; TODO - Spanish translation
_YellowsHouse1FDadUnpackingText:: ; marcelnote - new for Yellow's house
	text "Sorry about the"
	line "mess, we're"
	cont "still unpacking."

	para "Please stop by"
	line "again later,"
	cont "I'll make tea!"
	done

; TODO - Spanish translation
_YellowsHouse1FDadJustMissedHerText:: ; marcelnote - new for Yellow's house
	text "Oh, you just"
	line "missed her!"

	para "My daughter ran"
	line "off to get her"
	cont "first #MON"
	cont "from PROF.OAK."

	para "The excitment"
	line "kept her up all"
	cont "night, so she"
	cont "overslept!"
	done

; TODO - Spanish translation
_YellowsHouse1FDadJustRunIntoHerText:: ; marcelnote - new for Yellow's house
	text "My daughter is"
	line "always looking"
	cont "for adventure!"

	para "I'm sure you'll"
	line "run into her"
	cont "before long."
	done

; TODO - Spanish translation
_YellowsHouse1FDadYellowIsBackText:: ; marcelnote - new for Yellow's house
	text "It's wonderful to"
	line "have YELLOW home"
	cont "again!"

	para "Seeing the kind-"
	line "ness that guides"
	cont "you both, it"
	cont "warms my heart."

	para "I've made some tea!"
	line "Please, stay here"
	cont "a little while."
	done

; TODO - Spanish translation
_YellowsHouse1FTVText:: ; marcelnote - new for Yellow's house
	text "It's not even"
	line "plugged in yet."
	done

; TODO - Spanish translation
_YellowsHouse2FAsleepText:: ; marcelnote - new for Yellow's house
	text "This kid is"
	line "fast asleep."

	para "Better not"
	line "wake them up."
	done

; TODO - Spanish translation
_YellowsHouse2FYellowText:: ; marcelnote - new for Yellow's house
	text "Oh, <PLAYER>!"
	line "I came back home"
	cont "to spend some"
	cont "time with dad."

	para "I thought he might"
	line "like a little"
	cont "company, and"
	cont "honestly..."
	cont "I missed him too!"
	done

; TODO - Spanish translation
_YellowsHouse2FGameboyText:: ; marcelnote - new for Yellow's house
	text "It's a GAME BOY!"
	line "...But the"
	cont "battery's dead."
	done

; TODO - Spanish translation
_YellowsHouse2FTVText:: ; marcelnote - new for Yellow's house
	text "It looks like"
	line "the TV has been"
	cont "on all night."
	done

; TODO - Spanish translation
_UnpackedBoxText:: ; marcelnote - new for Yellow's house
	text "A moving box"
	line "full of stuff."
	done
