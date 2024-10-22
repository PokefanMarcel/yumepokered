; marcelnote - new location
_MoveDeleterGreetingText::
	text "Um..."
	line "Oh yes, I'm the"
	cont "MOVE DELETER."

	para "I can make #MON"
	line "forget moves."

	para "Shall I make a"
	line "#MON forget?"
	done

_MoveDeleterSaidYesText::
	text "Which #MON?"
	prompt

_MoveDeleterWhichMoveText::
	text "Which move should"
	line "it forget, then?"
	done

_MoveDeleterConfirmText::
	text "Oh, make it forget"
	line "@"
	text_ram wStringBuffer
	text "?"
	prompt

_MoveDeleterForgotText::
	text "@"
	text_ram wStringBuffer
	text " was"
	line "forgotten!"
	prompt

_MoveDeleterByeText::
	text "No? Come visit me"
	line "again."
	done

_MoveDeleterOneMoveText::
	text "That #MON"
	line "knows only one"
	cont "move."
	done


_MoveReminderGreetingText::
	text "Hello dear. People"
	line "call me the"
	cont "MOVE REMINDER."

	para "I teach #MON to"
	line "remember moves"
	cont "they forgot."

	para "¥1000 per lesson."
	line "How about it?"
	done

_MoveReminderSaidYesText::
	text "Which #MON"
	line "should I teach?"
	prompt

_MoveReminderNotEnoughMoneyText::
	text "Hmmm..."

	para "You don't have"
	line "enough money!"
	done

_MoveReminderWhichMoveText::
	text "Which move should"
	line "it learn?"
	done

_MoveReminderByeText::
	text "If any of your"
	line "#MON needs to"
	cont "remember a move,"
	cont "come visit me!"
	done

_MoveReminderNoMovesText::
	text "This #MON"
	line "hasn't forgotten"
	cont "any moves."
	done
