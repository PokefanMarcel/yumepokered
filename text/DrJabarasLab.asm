; marcelnote - new map
_DrJabarasLabJabaraIntroText::
	text "JABARA: Hmm? What's"
	line "this? A trainer?"

	para "You don't look like"
	line "you belong in"
	cont "a lab."

	para "So, FUJI sent you?"
	line "That old fool..."
	cont "A sharp mind, but"
	cont "he never dared to" ; lacking the will to
	cont "to dream big."

	para "Anyway, our work"
	line "on CINNABAR is"
	cont "behind me now."

	para "Here I study how"
	line "#MON react to"
	cont "different sound"
	cont "frequencies."

	para "I know the answer"
	line "I need is near."
	cont "If only I could"
	cont "get my hands on"
	cont "a # FLUTE..."
	done

_DrJabarasLabHaveFluteText::
	text "Wait... You have"
	line "a # FLUTE?"

	para "With it, I could"
	line "finally confirm"
	cont "my theories."

	para "Let me use it, and"
	line "I'll make it worth"
	cont "your while."
	done

_DrJabarasLabRefusedText::
	text "Hmph... No wonder"
	line "FUJI liked you."
	done

_DrJabarasLabGaveFluteText::
	text "<PLAYER> gave the"
	line "# FLUTE to"
	cont "DR.JABARA.@"
	text_end

_DrJabarasLabNeedTimeText::
	text "I'll need time to"
	line "run some tests."
	cont "Come back later."
	done

_DrJabarasLabExperimentsOverText::
	;text "Oh, it's you!"
	text "My tests were a"
	line "complete success!"

	para "Thanks to your"
	line "# FLUTE, I've"
	cont "proved that some"
	cont "frequencies can"
	cont "provoke... ah,"
	cont "unusual reactions"
	cont "in #MON."

	para "Here, you can"
	line "have it back."
	prompt

_DrJabarasLabNoRoomText::
	text "You don't have"
	line "room for this."
	done

_DrJabarasLabReturnedFluteText::
	text "DR.JABARA returned"
	line "the # FLUTE!@"
	text_end

_DrJabarasLabJabaraFinalText::
	text "You should try" ; You're still here? Ah, yes, you want info on...
	line "playing the FLUTE"
	cont "in the MANSION."
	done

_DrJabarasLabNotesText::
	text "It's DR.JABARA's"
	line "research notes."

	para "Pages filled with"
	line "complex graphs"
	cont "about MAGIKARP"
	cont "behavior."
	done

_DrJabarasLabReceivedEmailText::
	text "There's an e-mail"
	line "message here."

	para "..."

	para "DR.JABARA, your"
	line "recent studies on"
	cont "#MON behavior"
	cont "have caught our"
	cont "attention."

	para "We should discuss"
	line "ways to... expand"
	cont "its applications."

	para "..."
	done

_DrJabarasLabEmailDraftText::
	text "An e-mail draft"
	line "from DR.JABARA."

	para "..."

	para "...borrowed a"
	line "# FLUTE from"
	cont "a naive kid..."

	para "...isolated a"
	line "frequency which"
	cont "can trigger..."

	para "...potential"
	line "use for #MON"
	cont "evolution..."

	para "Huh?"
	done
