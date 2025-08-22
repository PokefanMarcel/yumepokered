_ChampionsRoomRivalIntroText::
	text "<RIVAL>:"
	line "Bonjour minable."

	para "Je t'attends"
	line "depuis une bonne"
	cont "plombe, <PLAYER>!"

	para "Ton devoir en"
	line "tant que rival"
	cont "est d'entraîner"
	cont "mes #MON."

	para "En améliorant mon"
	line "#DEX, j'ai"
	cont "recherché les"
	cont "#MON sur-"
	cont "puissants!"

	para "J'ai ainsi créé"
	line "l'équipe ultime,"
	cont "efficace contre"
	cont "tous les types de"
	cont "#MON!"

	para "Ca t'épate, hein?"

	para "Je suis le"
	line "champion #MON!"

	para "Tu sais c'que ça"
	line "veut dire?"

	para "Ecoute ça,"
	line "minable!"

	para "Je suis le"
	line "dresseur le plus"
	cont "puissant du"
	cont "monde! Yaaa!"
	done

_RivalDefeatedText::
	text "NOoOoON!"
	line "IMPOSSIBLE!!!"
	cont "Mon équipe de"
	cont "rêve est fichue!"

	para "Après en avoir"
	line "tant bavé je me"
	cont "fais battre?"
	cont "Et par toi?"

	para "Ma gloire... "
	line "Où qu'elle est?"
	cont "C'est pas juste!"
	prompt

_RivalVictoryText::
	text "Hahaha!"
	line "J'ai gagné!"
	cont "Nya na nana na!"

	para "J'suis trop fort!"
	line "T'es trop nul!"

	para "Comment t'as fait"
	line "pour arriver"
	cont "jusqu'ici?"

	para "Minable!"
	line "T'entends?"
	cont "Minable!"
	prompt

_ChampionsRoomRivalAfterBattleText::
	text "Qu...Comm...Hein?"
	line "Moi? Pourquoi?"
	cont "WHAAAAAAAAAAA!"

	para "J'ai entraîné mes"
	line "#MON à la"
	cont "perfection..."

	para "Et zut alors!"
	line "Tu es le nouveau"
	cont "champion #MON!"

	para "Alors ça..."
	line "Ca me la coupe."
	done


_ChampionsRoomRivalRematchIntroText:: ; TODO marcelnote - new text for rematches
	text "<RIVAL>: Hey,"
	line "<PLAYER>!"

	para "I've looked forward"
	line "to our rematch."

	para "After facing"
	line "challengers here,"
	cont "my team is now"
	cont "prepared for"
	cont "any strategy."

	para "Think you still"
	line "have what it"
	cont "takes to be"
	cont "champion?"

	para "My comeback will"
	line "be epic!"
	done

	;para "Back for another"
	;line "challenge, huh?"

	;para "I'm warning you,"
	;line "my #MON have"
	;cont "become a lot"
	;cont "stronger since"
	;cont "our last battle."

	;para "Let's see if you"
	;line "still have what"
	;cont "it takes!"

_RivalRematchDefeatedText:: ; TODO marcelnote - new text for rematches
	text "No!"
	line "How can you win"
	cont "again?"

	para "I trained my"
	line "#MON to"
	cont "perfection..."
	prompt

_RivalRematchVictoryText:: ; TODO marcelnote - new text for rematches
	text "Hahaha!"

	para "I won, I won!"
	line "Looks like"
	cont "I finally got the"
	cont "better of you,"
	cont "<PLAYER>!"
	prompt

_ChampionsRoomRivalRematchAfterBattleText:: ; TODO marcelnote - new text for rematches
	text "I'm starting to"
	line "understand what"
	cont "gramps meant."

	para "The bond you"
	line "share with"
	cont "your #MON,"
	cont "<PLAYER>..."
	cont "It's something"
	cont "special."

	para "Come on,"
	line "follow me."
	done

_ChampionsRoomOakText::
	text "CHEN: <PLAYER>!"
	done

_ChampionsRoomOakCongratulatesPlayerText::
	text "CHEN: Tu as gagné!"
	line "Félicitations!"
	cont "Tu es le nouveau"
	cont "champion de la"
	cont "LIGUE #MON!"

	para "Tu as tant changé"
	line "depuis ton départ"
	cont "avec @"
	text_ram wNameBuffer
	text "!"

	para "<PLAYER>, tu es"
	line "grand maintenant!"
	done

_ChampionsRoomOakDisappointedWithRivalText::
	text "CHEN: <RIVAL>!"
	line "Je suis... déçu!"

	para "Apprenant que tu"
	line "avais vaincu le"
	cont "CONSEIL des 4, je"
	cont "suis venu en"
	cont "vitesse!"

	para "Mais le temps"
	line "d'arriver jusqu'"
	cont "ici, tu avais"
	cont "déjà perdu..."
	cont "C'est dingue!"

	para "<RIVAL>! As-tu"
	line "compris pourquoi"
	cont "ton équipe s'est"
	cont "fait moucher?"

	para "Tu as oublié de"
	line "traiter tes"
	cont "#MON avec"
	cont "amour!"

	para "Et oui mon p'tit"
	line "bonhomme."
	cont "C'est comme ça et"
	cont "pis c'est tout!"
	done

_ChampionsRoomOakComeWithMeText::
	text "CHEN: <PLAYER>!"

	para "Cette victoire..."
	line "Tu ne la dois pas"
	cont "entièrement à tes"
	cont "qualités!"

	para "Tu as tant baigné"
	line "d'amour tes chers"
	cont "petits #MON!"

	para "Et ça... "
	line "C'est bien. "
	cont "<PLAYER>!"
	cont "Suis-moi!"
	done
