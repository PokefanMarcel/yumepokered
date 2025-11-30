_MtSilver3FYellowBattleText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Oh! <PLAYER>,"
	line "n'est-ce pas?"

	para "Ravie de te"
	line "recontrer enfin."
	cont "Je suis YELLOW."

	para "J'ai aussi commencé"
	line "mon voyage au"
	cont "BOURG PALETTE,"
	cont "peu après <RIVAL>"
	cont "et toi."

	para "J'ai beaucoup"
	line "entendu parler"
	cont "de tes exploits!"

	para "Vaincre la TEAM"
	line "ROCKET, devenir"
	cont "le CHAMPION..."

	para "Tu as placé la"
	line "barre bien haut"
	cont "pour nous tous!"

	para "Mais un dresseur"
	line "ne se résume pas"
	cont "à sa seule force."

	para "Notre aventure,"
	line "notre vraie"
	cont "victoire, c'est"
	cont "le lien qui nous"
	cont "unit à nos"
	cont "#MON."

	para "Alors montre-moi,"
	line "<PLAYER>."

	para "Après t'être battu"
	line "sans répit, après"
	cont "avoir tout fait"
	cont "pour être"
	cont "vainqueur..."

	para "Aujourd'hui, es-tu"
	line "enfin le meilleur"
	cont "dresseur?"
	done

.GirlText
	text "Oh! <PLAYER>,"
	line "n'est-ce pas?"

	para "Ravie de te"
	line "recontrer enfin."
	cont "Je suis YELLOW."

	para "J'ai aussi commencé"
	line "mon voyage au"
	cont "BOURG PALETTE,"
	cont "peu après <RIVAL>"
	cont "et toi."

	para "J'ai beaucoup"
	line "entendu parler"
	cont "de tes exploits!"

	para "Vaincre la TEAM"
	line "ROCKET, devenir"
	cont "la CHAMPIONNE..."

	para "Tu as placé la"
	line "barre bien haut"
	cont "pour nous tous!"

	para "Mais une dresseuse"
	line "ne se résume pas"
	cont "à sa seule force."

	para "Notre aventure,"
	line "notre vraie"
	cont "victoire, c'est"
	cont "le lien qui nous"
	cont "unit à nos"
	cont "#MON."

	para "Alors montre-moi,"
	line "<PLAYER>."

	para "Après t'être battue"
	line "sans répit, après"
	cont "avoir tout fait"
	cont "pour être"
	cont "vainqueur..."

	para "Aujourd'hui, es-tu"
	line "enfin le meilleur"
	cont "dresseur?"
	done

_MtSilver3FYellowDefeatedText::
	text "Tes"
	line "#MON et toi..."

	para "Ensemble, rien"
	line "ne vous arrêtera."

	para "Votre amitié"
	line "triomphera"
	cont "toujours."
	prompt

_MtSilver3FYellowPostBattleText:: ; TODO
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Un tel voyage"
	line "d'apprentissage,"
	cont "ça demande du"
	cont "courage."

	para "Mais je vois que"
	line "pour accomplir"
	cont "ton destin, tu es"
	cont "déterminé."

	para "Du haut de cette"
	line "montagne, tu peux"
	cont "contempler le"
	cont "chemin déjà"
	cont "parcouru... Et"
	cont "les aventures"
	cont "qui t'attendent"
	cont "encore."

	para "Alors, <PLAYER>..."

	para "Parcours la terre"
	line "entière."

	para "Cherche les"
	line "#MON et"
	cont "leurs mystères."

	para "Et quand viendra"
	line "le dernier des"
	cont "combats, tous"
	cont "ensemble, tes"
	cont "amis seront là."
	done

.GirlText
	text "Un tel voyage"
	line "d'apprentissage,"
	cont "ça demande du"
	cont "courage."

	para "Mais je vois que"
	line "pour accomplir"
	cont "ton destin, tu es"
	cont "déterminée."

	para "Du haut de cette"
	line "montagne, tu peux"
	cont "contempler le"
	cont "chemin déjà"
	cont "parcouru... Et"
	cont "les aventures"
	cont "qui t'attendent"
	cont "encore."

	para "Alors, <PLAYER>..."

	para "Parcours la terre"
	line "entière."

	para "Cherche les"
	line "#MON et"
	cont "leurs mystères."

	para "Et quand viendra"
	line "le dernier des"
	cont "combats, tous"
	cont "ensemble, tes"
	cont "amis seront là."
	done



;Un jour je serai le meilleur Dresseur
;Je me battrai sans répit
;Je ferai tout pour être vainqueur
;Et gagner les défis
;Je parcourrai la terre entière
;Traquant avec espoir
;Les Pokémon et leurs mystères
;Le secret de leurs pouvoirs

;REFRAIN :

;Pokémon ! Attrapez-les tous
;[C'est notre histoire]
;Ensemble pour la victoire !
;Pokémon !
;Rien ne nous arrêtera
;Notre amitié triomphera !
;Pokémon ! Attrapez-les tous
;[Même à notre âge]
;Un voyage d'apprentissage
;Ça demande du courage
;Pokémon !
;Attrapez-les tous, attrapez-les tous !
;Pokémon !
;[Yeah !]

;Rien ni personne sur mon chemin
;Ne pourra me briser
;Car pour accomplir mon destin
;Je suis déterminé
;Quand il faudra passer à l'action
;Mes amis seront là
;Et tous ensemble nous gagnerons
;Le dernier des combats !

;REFRAIN

;Attrapez-les tous...

;Attrapez-les tous !

;Attrapez-les tous !
;[Yeah !]

;REFRAIN