; marcelnote - new location

_MrHyperIntroText::
	text "Call me MR.HYPER!"

	para "A session of my"
	line "HYPER TRAINING"
	cont "boosts one stat"
	cont "of a #MON!"

	para "All I ask in"
	line "exchange is"
	cont "a BOTTLE CAP!"

	para "How about it?"
	prompt

_MrHyperOfferText::
	text "Want me to HYPER"
	line "TRAIN a #MON"
	cont "for a BOTTLE CAP?"
	done

_MrHyperNoCapsText::
	text "No BOTTLE CAP?"
	line "Not even one?"
	done

_MrHyperTooYoungText::
	text "Only #MON above"
	line "L50 can handle"
	cont "HYPER TRAINING!"
	prompt

_MrHyperAlreadyPerfectText::
	text "This #MON is"
	line "already perfect!"
	prompt

_MrHyperStatAlreadyMaxedText::
	text "That stat is"
	line "already at its"
	cont "full potential!"
	prompt

_MrHyperWhichStatText::
	text "Which stat should"
	line "I train?"
	done

_MrHyperTrainingText::
	text "Get ready for some"
	line "HYPER TRAINING!"
	prompt

_MrHyperTrainedText::
	text "@"
	text_ram wNameBuffer
	text " grew"
	line "even stronger!"

	para "Train some more?"
	done

_MrHyperByeText::
	text "Come back anytime!"
	line "I'll be HYPER!"
	done
