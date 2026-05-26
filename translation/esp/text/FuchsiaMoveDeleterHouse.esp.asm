; marcelnote - new location
; TODO - Spanish translation
_MoveDeleterGreetingText::
	text "Um..."
	line "Oh yes, I'm the"
	cont "MOVE DELETER."

	para "I can make #MON"
	line "forget moves."

	para "Shall I make a"
	line "#MON forget?"
	done

; TODO - Spanish translation
_MoveDeleterWhichMoveText::
	text "Which move should"
	line "it forget, then?"
	done

; TODO - Spanish translation
_MoveDeleterConfirmText::
	text "Oh, make it forget"
	line "@"
	text_ram wStringBuffer
	text "?"
	done

; TODO - Spanish translation
_MoveDeleterForgotText::
	text "@"
	text_ram wStringBuffer
	text " was"
	line "forgotten!"
	done

; TODO - Spanish translation
_MoveDeleterByeText::
	text "No? Come visit me"
	line "again."
	done

; TODO - Spanish translation
_MoveDeleterOneMoveText::
	text "That #MON"
	line "knows only one"
	cont "move."
	prompt


; TODO - Spanish translation
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

; TODO - Spanish translation
_MoveReminderSaidYesText::
	text "Which #MON"
	line "should I teach?"
	prompt

; TODO - Spanish translation
_MoveReminderNotEnoughMoneyText::
	text "Hmmm..."

	para "You don't have"
	line "enough money!"
	done

; TODO - Spanish translation
_MoveReminderWhichMoveText::
	text "Which move should"
	line "it learn?"
	done

; TODO - Spanish translation
_MoveReminderByeText::
	text "If any of your"
	line "#MON needs to"
	cont "remember a move,"
	cont "come visit me!"
	done

; TODO - Spanish translation
_MoveReminderNoMovesText::
	text "This #MON"
	line "hasn't forgotten"
	cont "any moves."
	prompt
