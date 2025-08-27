_ItemUseText001::
	text "<PLAYER> utilise:@"
	text_end

_ItemUseText002::
	text_ram wStringBuffer
	text "!"
	done

_GotOnBicycleText1::
	text "<PLAYER> monte sur@"
	text_end

_GotOnBicycleText2::
	text_ram wStringBuffer
	text "!"
	prompt

_GotOffBicycleText1::
	text "<PLAYER> range@"
	text_end

_GotOffBicycleText2::
	text "la @"
	text_ram wStringBuffer
	text "."
	prompt

_ThrewAwayItemText::
	text "Adieu,"
	line "@"
	text_ram wNameBuffer
	text "!"
	prompt

_IsItOKToTossItemText::
	text "Jeter:"
	line "@"
	text_ram wStringBuffer
	text ", OK?"
	prompt

_TooImportantToTossText::
	text "T'es pas bien!"
	line "C'est beaucoup"
	cont "trop important!"
	prompt

_AlreadyKnowsText::
	text_ram wNameBuffer
	text_start
	line "connaît déjà"
	cont "@"
	text_ram wStringBuffer
	text "!"
	prompt

_ConnectCableText::
	text "OK! Branche le"
	line "câble comme ça!"
	prompt

_TradedForText::
	text "<PLAYER> échange"
	line "@"
	text_ram wInGameTradeGiveMonName
	text " contre"
	cont "@"
	text_ram wInGameTradeReceiveMonName
	text "!@"
	text_end

_WannaTrade1Text::
	text "Je cherche un"
	line "@"
	text_ram wInGameTradeGiveMonName
	text_start

	para "contre un"
	line "@"
	text_ram wInGameTradeReceiveMonName
	text ", OK?"
	done

_NoTrade1Text::
	text "Bon...."
	line "Tant pis..."
	done

_WrongMon1Text::
	text "Mais c'est pas un"
	line "@"
	text_ram wInGameTradeGiveMonName
	text "!"

	para "Reviens m'en"
	line "apporter un!"
	done

_Thanks1Text::
	text "Merciiii!"
	done

_AfterTrade1Text::
	text "Il est cool mon"
	line "@"
	text_ram wInGameTradeReceiveMonName
	text ", hein?"
	done

_WannaTrade2Text::
	text "Bien le bonjour!"
	line "Veux-tu échanger:"

	para "@"
	text_ram wInGameTradeGiveMonName
	text " contre"
	line "@"
	text_ram wInGameTradeReceiveMonName
	text ", OK?"
	done

_NoTrade2Text::
	text "Mmmm..."
	line "Pas glop..."
	done

_WrongMon2Text::
	text "Heu? C'est pas un"
	line "@"
	text_ram wInGameTradeGiveMonName
	text "."

	para "Essaie pas de"
	line "m'arnaquer."
	done

_Thanks2Text::
	text "Merci merci!"
	done

_AfterTrade2Text::
	text "Ton @"
	text_ram wInGameTradeGiveMonName
	text_start
	line "a évolué pendant"

	para "l'échange!"
	done

_WannaTrade3Text::
	text "Salut! T'as un"
	line "@"
	text_ram wInGameTradeGiveMonName
	text "?"

	para "Contre un joli"
	line "@"
	text_ram wInGameTradeReceiveMonName
	text ", OK?"
	done

_NoTrade3Text::
	text "Dommage."
	done

_WrongMon3Text::
	text "...C'est pas un"
	line "@"
	text_ram wInGameTradeGiveMonName
	text "."

	para "Reviens me voir"
	line "avec un vrai!"
	done

_Thanks3Text::
	text "Merci l'ami!"
	done

_AfterTrade3Text::
	text "Il est bien mon"
	line "@"
	text_ram wInGameTradeReceiveMonName
	text ", hein?"

	para "Mon @"
	text_ram wInGameTradeGiveMonName
	text_start
	line "est terrible!"
	done

_NothingToCutText::
	text "Il n'y a rien à"
	line "COUPER!"
	prompt

_UsedCutText::
	text_ram wNameBuffer
	text " a tout"
	line "coupé! Trop fort!"
	prompt


_TeachFieldMoveText:: ; TODO marcelnote - for temporary field moves, adapted from shinpokered
	;text "Teach it for use"
	;line "outside battle?"
	text "Teach as a SKILL"
	line "outside battle?"
	done

_AlreadyKnowsFieldMoveText:: ; TODO marcelnote - for temporary field moves, adapted from shinpokered
	;text "This #MON knows"
	;line "an outside-battle"
	;cont "move already!"
	text "This #MON knows"
	line "a SKILL already!"

	para "To teach it a new"
	line "one, store it in"
	cont "the PC first."
	prompt


_WantToSurfText:: ; TODO
	text "The water is calm."
	line "Want to SURF?"
	done

_WantToCutText:: ; TODO
	text "Want to CUT this"
	line "tree?"
	done

_UsedFlashText:: ; TODO
	text_ram wNameBuffer
	text " lights"
	line "the area!"
	prompt

_MonCouldSurfText:: ; TODO
	text "A #MON could"
	line "SURF here."
	done

_TreeCanBeCutText:: ; TODO
	text "This tree can"
	line "be CUT."
	done

_WantToStrengthText:: ; TODO
	text "Want to use"
	line "STRENGTH?"
	done