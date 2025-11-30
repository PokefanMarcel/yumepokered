_ChampionsRoomRivalIntroText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
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

.GirlText
	text "<RIVAL>:"
	line "Bonjour minable."

	para "Je t'attends"
	line "depuis une bonne"
	cont "plombe, <PLAYER>!"

	para "Ton devoir en"
	line "tant que rivale"
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
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
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

.GirlText
	text "Hahaha!"
	line "J'ai gagné!"
	cont "Nya na nana na!"

	para "J'suis trop fort!"
	line "T'es trop nulle!"

	para "Comment t'as fait"
	line "pour arriver"
	cont "jusqu'ici?"

	para "Minable!"
	line "T'entends?"
	cont "Minable!"
	prompt

_ChampionsRoomRivalAfterBattleText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
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

.GirlText
	text "Qu...Comm...Hein?"
	line "Moi? Pourquoi?"
	cont "WHAAAAAAAAAAA!"

	para "J'ai entraîné mes"
	line "#MON à la"
	cont "perfection..."

	para "Et zut alors!"
	line "Tu es la nouvelle"
	cont "championne"
	cont "#MON!"

	para "Alors ça..."
	line "Ca me la coupe."
	done


_ChampionsRoomRivalRematchIntroText:: ; marcelnote - new text for rematches
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "<RIVAL>: Yo,"
	line "<PLAYER>!"

	para "J'attendais l'heure"
	line "de ma revanche."

	para "A force d'affronter"
	line "les meilleurs,"
	cont "mon équipe est"
	cont "parée contre"
	cont "toute stratégie."

	para "Tu crois encore"
	line "être à la hauteur"
	line "du titre de"
	cont "CHAMPION?"

	para "Mon retour va"
	line "être épique!"
	done

.GirlText
	text "<RIVAL>: Yo,"
	line "<PLAYER>!"

	para "J'attendais l'heure"
	line "de ma revanche."

	para "A force d'affronter"
	line "les meilleurs,"
	cont "mon équipe est"
	cont "parée contre"
	cont "toute stratégie."

	para "Tu crois encore"
	line "être à la hauteur"
	line "du titre de"
	cont "CHAMPIONNE?"

	para "Mon retour va"
	line "être épique!"
	done

_RivalRematchDefeatedText:: ; marcelnote - new text for rematches
	text "NON!"
	line "Tu gagnes encore?"
	cont "Mais comment?"
	prompt

_RivalRematchVictoryText:: ; marcelnote - new text for rematches
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Hahaha!"

	para "J'ai gagné,"
	line "j'ai gagné!"
	cont "Tu restes un"
	cont "minable malgré"
	cont "tout, minable!"
	prompt

.GirlText
	text "Hahaha!"

	para "J'ai gagné,"
	line "j'ai gagné!"
	cont "Tu restes une"
	cont "minable malgré"
	cont "tout, minable!"
	prompt

_ChampionsRoomRivalRematchAfterBattleText:: ; marcelnote - new text for rematches
	text "Je commence à"
	line "comprendre ce que"
	cont "disait pépé."

	para "Ce lien que tu"
	line "partages avec tes"
	cont "tes #MON,"
	cont "<PLAYER>..."
	cont "C'est vraiment"
	cont "quelque chose"
	cont "de spécial."

	para "Allez, suis-moi."
	done

_ChampionsRoomOakText::
	text "CHEN: <PLAYER>!"
	done

_ChampionsRoomOakCongratulatesPlayerText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
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

.GirlText
	text "CHEN: Tu as gagné!"
	line "Félicitations!"
	cont "Tu es la nouvelle"
	cont "championne de la"
	cont "LIGUE #MON!"

	para "Tu as tant changé"
	line "depuis ton départ"
	cont "avec @"
	text_ram wNameBuffer
	text "!"

	para "<PLAYER>, tu"
	line "es grande"
	line "maintenant!"
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


; Dialogues de Blue rematch LGPE :

; Salut, <PLAYER>. La forme ?
; Depuis que je suis devenu le Champion de l'Arène de Jadielle, c'est la folie !
; On est débordés, je te raconte pas.
; Et sinon, t'en dis quoi, du design ? Tu trouves pas que ça me colle des airs de boss final ?
; Perso, j'ai bien envie de refaire toute la déco.
; Tu m'diras, même si la déco est pourrie, ça ne change rien au fait que je suis le meilleur !
; T'en veux la preuve ? Alors c'est parti !

; Non, mais redescends, t'es pas le seul Dresseur à Kanto, quoi.

; Tu sais quoi ? J'aime avoir des adversaires à ma hauteur, alors t'as intérêt à repasser !
