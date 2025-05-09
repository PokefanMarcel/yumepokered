_ItemUseText001::
	text "<PLAYER> used@"
	text_end

_ItemUseText002::
	text_ram wStringBuffer
	text "!"
	done

_GotOnBicycleText1::
	text "<PLAYER> got on the@"
	text_end

_GotOnBicycleText2::
	text_ram wStringBuffer
	text "!"
	prompt

;_GotOnSurfboardText:: ; marcelnote - for SURFBOARD
;	text "SURFBOARD!"
;	prompt

_GotOffBicycleText1::
	text "<PLAYER> got off@"
	text_end

_GotOffBicycleText2::
	text "the @"
	text_ram wStringBuffer
	text "."
	prompt

_ThrewAwayItemText::
	text "Threw away"
	line "@"
	text_ram wNameBuffer
	text "."
	prompt

_IsItOKToTossItemText::
	text "Is it OK to toss"
	line "@"
	text_ram wStringBuffer
	text "?"
	prompt

_TooImportantToTossText::
	text "That's too impor-"
	line "tant to toss!"
	prompt

_AlreadyKnowsText::
	text_ram wNameBuffer
	text " knows"
	line "@"
	text_ram wStringBuffer
	text "!"
	prompt

_ConnectCableText::
	text "Okay, connect the"
	line "cable like so!"
	prompt

_TradedForText::
	text "<PLAYER> traded"
	line "@"
	text_ram wInGameTradeGiveMonName
	text " for"
	cont "@"
	text_ram wInGameTradeReceiveMonName
	text "!@"
	text_end

_WannaTrade1Text::
	text "I'm looking for"
	line "@"
	text_ram wInGameTradeGiveMonName
	text "! Wanna"
	cont "trade one for"
	cont "@"
	text_ram wInGameTradeReceiveMonName
	text "? "
	done

_NoTrade1Text::
	text "Awww!"
	line "Oh well..."
	done

_WrongMon1Text::
	text "What? That's not"
	line "@"
	text_ram wInGameTradeGiveMonName
	text "!"

	para "If you get one,"
	line "come back here!"
	done

_Thanks1Text::
	text "Hey thanks!"
	done

_AfterTrade1Text::
	text "Isn't my old"
	line "@"
	text_ram wInGameTradeReceiveMonName
	text " great?"
	done

_WannaTrade2Text::
	text "Hello there! Do"
	line "you want to trade"
	cont "your @"
	text_ram wInGameTradeGiveMonName
	text_start
	cont "for @"
	text_ram wInGameTradeReceiveMonName
	text "?"
	done

_NoTrade2Text::
	text "Well, if you"
	line "don't want to..."
	done

_WrongMon2Text::
	text "Hmmm? This isn't"
	line "@"
	text_ram wInGameTradeGiveMonName
	text "."

	para "Think of me when"
	line "you get one."
	done

_Thanks2Text::
	text "Thanks!"
	done

_AfterTrade2Text:: ; marcelnote - dialogue changed to that of pokeyellow since RAICHU cannot evolve
;	text "The @"
;	text_ram wInGameTradeGiveMonName
;	text " you"
;	line "traded to me"
;
;	para "went and evolved!"
;	done
	text "Hello there! Your"
	line "old @"
	text_ram wInGameTradeGiveMonName
	text " is"
	cont "magnificent!"
	done

_WannaTrade3Text::
	text "Hi! Do you have"
	line "@"
	text_ram wInGameTradeGiveMonName
	text "?"

	para "Want to trade it"
	line "for @"
	text_ram wInGameTradeReceiveMonName
	text "?"
	done

_NoTrade3Text::
	text "That's too bad."
	done

_WrongMon3Text::
	text "...This is no"
	line "@"
	text_ram wInGameTradeGiveMonName
	text "."

	para "If you get one,"
	line "trade it with me!"
	done

_Thanks3Text::
	text "Thanks pal!"
	done

_AfterTrade3Text::
	text "How is my old"
	line "@"
	text_ram wInGameTradeReceiveMonName
	text "?"

	para "My @"
	text_ram wInGameTradeGiveMonName
	text " is"
	line "doing great!"
	done

_NothingToCutText::
	text "There isn't"
	line "anything to CUT!"
	prompt

_UsedCutText::
	text_ram wNameBuffer
	text " hacked"
	line "away with CUT!"
	prompt

_MonCouldSurfText::
	text "A #MON could"
	line "SURF here."
	done

_WantToSurfText::
	text "The water is calm."
	line "Want to SURF?"
	done

_TreeCanBeCutText::
	text "This tree can"
	line "be CUT."
	done

_WantToCutText::
	text "Want to CUT this"
	line "tree?"
	done

_UsedFlashText::
	text_ram wNameBuffer
	text " lights"
	line "the area!"
	prompt

_WantToStrengthText::
	text "Want to use"
	line "STRENGTH?"
	done

_TeachFieldMoveText:: ; marcelnote - for temporary field moves, adapted from shinpokered
	;text "Teach it for use"
	;line "outside battle?"
	text "Teach as a SKILL"
	line "outside battle?"
	done

_AlreadyKnowsFieldMoveText:: ; marcelnote - for temporary field moves, adapted from shinpokered
	;text "This #MON knows"
	;line "an outside-battle"
	;cont "move already!"
	text "This #MON knows"
	line "a SKILL already!"

	para "To teach it a new"
	line "one, store it in"
	cont "the PC first."
	prompt
