_ViridianGymGiovanniPreBattleText::
	text "Fwahaha! Te voici"
	line "dans mon repaire!"

	para "Je voulais"
	line "reformer la TEAM"
	cont "ROCKET ici!"

	para "Mais tu as encore"
	line "tout fait rater!"
	cont "Je suis furieux"
	cont "et ça sent pas"
	cont "bon pour toi!"

	para "Une fois de plus"
	line "tu oses me"
	cont "défier, moi, le"
	cont "grand GIOVANNI!"
	cont "Mais aujourd'hui,"
	cont "tu vas déguster!"
	done

_ViridianGymGiovanniReceivedEarthBadgeText::
	text "Ah!"
	line "Voilà ce que"
	cont "j'appelle du"
	cont "combat! Tu as"
	cont "gagné! En"
	cont "récompense voici"
	cont "le BADGE TERRE!@"
	text_end

_ViridianGymGiovanniPostBattleAdviceText::
	text "OK, j'ai perdu!"
	line "Je ne suis pas"
	cont "digne d'être le"
	cont "chef de la TEAM"
	cont "ROCKET! Ainsi,"
	cont "son existence"
	cont "s'achève avec ma"
	cont "défaite!"

	para "Je vais me"
	line "retirer, loin, en"
	cont "ermite, pour"
	cont "étudier les"
	cont "#MON!"

	para "Un jour, nos"
	line "chemins se"
	cont "croiseront à"
	cont "nouveau! Adieu!@"
	text_end

_ViridianGymGiovanniEarthBadgeInfoText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Grâce au BADGE"
	line "TERRE tous les"
	cont "#MON obéiront"
	cont "à tes ordres!"

	para "Il est le"
	line "témoignage de ta"
	cont "grande maîtrise"
	cont "des #MON!"

	para "Tu pourras ainsi"
	line "accéder à la"
	cont "LIGUE #MON!"

	para "C'est un cadeau"
	line "que je te fais."
	cont "Va maintenant,"
	cont "et deviens le"
	cont "plus grand des"
	cont "dresseurs!"
	done

.GirlText
	text "Grâce au BADGE"
	line "TERRE tous les"
	cont "#MON obéiront"
	cont "à tes ordres!"

	para "Il est le"
	line "témoignage de ta"
	cont "grande maîtrise"
	cont "des #MON!"

	para "Tu pourras ainsi"
	line "accéder à la"
	cont "LIGUE #MON!"

	para "C'est un cadeau"
	line "que je te fais."
	cont "Va maintenant,"
	cont "et deviens la"
	cont "plus grande des"
	cont "dresseuses!"
	done

_ViridianGymGiovanniReceivedTM27Text::
	text "<PLAYER> reçoit"
	line "CT27!@"
	text_end

_ViridianGymGiovanniTM27ExplanationText::
	text_start

	para "CT27: ABIME!"
	line "Cette attaque"
	cont "peut mettre hors"
	cont "combat un #MON"
	cont "en un seul coup!"

	para "Je l'ai inventée"
	line "il y a bien"
	cont "longtemps..."
	done

_ViridianGymGiovanniTM27NoRoomText::
	text "Votre inventaire"
	line "est plein!"
	done

_ViridianGymCooltrainerM1BattleText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Hé! Tu dois être"
	line "crevé, non? "
	done

.GirlText
	text "Hé! Tu dois être"
	line "crevée, non? "
	done

_ViridianGymCooltrainerM1EndBattleText::
	text "Ha!"
	line "J'suis essoufflé!"
	prompt

_ViridianGymCooltrainerM1AfterBattleText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Il faut que tu"
	line "sois fort pour te"
	cont "mesurer au..."
	cont "CHAMPION!"
	done

.GirlText
	text "Il faut que tu"
	line "sois forte pour"
	cont "te mesurer au..."
	cont "CHAMPION!"
	done

_ViridianGymBlackbelt1BattleText::
	text "Groaar!"
	line "Colère! Viens"
	cont "te battre!"
	done

_ViridianGymBlackbelt1EndBattleText::
	text "Rargh!"
	prompt

_ViridianGymBlackbelt1AfterBattleText::
	text "Grouargh!"
	done

_ViridianGymRocker1BattleText::
	text "Avec mes #MON"
	line "je fais de la"
	cont "jolie musique!"
	done

_ViridianGymRocker1EndBattleText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Tu es"
	line "très fort!"
	prompt

.GirlText
	text "Tu es"
	line "très forte!"
	prompt

_ViridianGymRocker1AfterBattleText::
	text "Sais-tu qui est"
	line "notre CHAMPION?"
	done

_ViridianGymBlackbelt2BattleText::
	text "Le Karaté est"
	line "l'art martial"
	cont "ultime!"
	done

_ViridianGymBlackbelt2EndBattleText::
	text "Yaha!"
	prompt

_ViridianGymBlackbelt2AfterBattleText::
	text "Mes #MON sont"
	line "des karatékas..."
	done

_ViridianGymCooltrainerM2BattleText::
	text "Je vais t'écraser"
	line "avec style et"
	cont "élégance!"
	done

_ViridianGymCooltrainerM2EndBattleText::
	text "..."
	line "Tout perdu!"
	prompt

_ViridianGymCooltrainerM2AfterBattleText::
	text "Le CHAMPION va"
	line "me taper dessus!"
	done

_ViridianGymBlackbelt3BattleText::
	text "J'suis le ROI du"
	line "KARATE! Ton"
	cont "destin repose"
	cont "entre mes mains!"
	done

_ViridianGymBlackbelt3EndBattleText::
	text "Yaah!"
	prompt

_ViridianGymBlackbelt3AfterBattleText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "La LIGUE #MON?"
	line "Toi? Hahahahah!!!"
	cont "T'es un rigolo!"
	done

.GirlText
	text "La LIGUE #MON?"
	line "Toi? Hahahahah!!!"
	cont "T'es marrante!"
	done

_ViridianGymRocker2BattleText::
	text "Tes #MON vont"
	line "se courber sous"
	cont "mes coups de"
	cont "fouet!"
	done

_ViridianGymRocker2EndBattleText::
	text "Aïee!"
	prompt

_ViridianGymRocker2AfterBattleText::
	text "Attends! Je ne"
	line "faisais pas"
	cont "attention!"
	done

_ViridianGymCooltrainerM3BattleText::
	text "L'ARENE de"
	line "JADIELLE était"
	cont "fermée depuis"
	cont "longtemps, mais"
	cont "le CHAMPION est"
	cont "enfin revenu!"
	done

_ViridianGymCooltrainerM3EndBattleText::
	text "!!!"
	line "Défaite!"
	prompt

_ViridianGymCooltrainerM3AfterBattleText::
	text "Tu ne pourras"
	line "accéder à la"
	cont "LIGUE #MON"
	cont "seulement en"
	cont "battant notre"
	cont "CHAMPION!"
	done

_ViridianGymGuidePreBattleText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Salut! Champion"
	line "en herbe!"

	para "Même moi, je ne"
	line "sais pas qui est"
	cont "le CHAMPION de"
	cont "JADIELLE!"

	para "Le combat qui"
	line "t'attend sera le"
	cont "plus dur de tous!"

	para "Le dresseur de"
	line "cette ARENE aime"
	cont "les #MON du"
	cont "type SOL!"
	done

.GirlText
	text "Salut! Championne"
	line "en herbe!"

	para "Même moi, je ne"
	line "sais pas qui est"
	cont "le CHAMPION de"
	cont "JADIELLE!"

	para "Le combat qui"
	line "t'attend sera le"
	cont "plus dur de tous!"

	para "Le dresseur de"
	line "cette ARENE aime"
	cont "les #MON du"
	cont "type SOL!"
	done

_ViridianGymGuidePostBattleText::
	text "Quoi?! C'était"
	line "GIOVANNI le"
	cont "CHAMPION?"
	cont "Ben ça alors!"
	done






