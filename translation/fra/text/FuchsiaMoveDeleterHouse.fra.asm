; marcelnote - new location
_MoveDeleterGreetingText::
	text "Euh..."
	line "Ah oui, je suis"
	cont "l'EFFACEUR DE"
	cont "CAPACITES."

	para "Je peux faire"
	line "oublier leurs"
	cont "attaques à tes"
	cont "#MON."

	para "Tu veux que je"
	line "fasse oublier"
	cont "une attaque?"
	done

_MoveDeleterSaidYesText::
	text "Quel #MON?"
	prompt

_MoveDeleterWhichMoveText::
	text "Oublier quelle"
	line "attaque?"
	done

_MoveDeleterConfirmText::
	text "Oh, oublier"
	line "@"
	text_ram wStringBuffer
	text "?"
	prompt

_MoveDeleterForgotText::
	text "@"
	text_ram wStringBuffer
	text " a"
	line "été oublié!"
	prompt

_MoveDeleterByeText::
	text "Non? Reviens"
	line "quand tu veux."
	done

_MoveDeleterOneMoveText::
	text "Ce #MON ne"
	line "connait qu'une"
	cont "seule attaque."
	done


_MoveReminderGreetingText::
	text "Bien le bonjour!"
	line "Je suis la"
	cont "MAITRESSE DES"
	cont "CAPACITES."

	para "J'aide les #MON"
	line "à se souvenir des"
	cont "attaques qu'ils"
	cont "ont oubliées."

	para "C'est ¥1000 la"
	line "leçon. Ca te va?"
	done

_MoveReminderSaidYesText::
	text "Quel #MON?"
	prompt

_MoveReminderNotEnoughMoneyText::
	text "Attends..."

	para "Tu n'as pas assez"
	line "d'argent!"
	done

_MoveReminderWhichMoveText::
	text "Se rappeler de"
	line "quelle attaque?"
	done

_MoveReminderByeText::
	text "Si tes #MON ont"
	line "besoin de se"
	cont "rappeler d'une"
	cont "attaque, reviens"
	cont "me voir!"
	done

_MoveReminderNoMovesText::
	text "Ce #MON n'a"
	line "oublié aucune"
	cont "attaque."
	done
