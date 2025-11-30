_SaffronGymSabrinaText::
	text "J'avais prédit"
	line "ton arrivée!"

	para "J'ai des pouvoirs"
	line "psychiques depuis"
	cont "l'enfance."

	para "J'ai appris à"
	line "plier des"
	cont "cuillères par la"
	cont "force de mon"
	cont "esprit. C'est pas"
	cont "super utile, mais"
	cont "ça en jette!"

	para "Je n'aime pas les"
	line "combats, mais si"
	cont "tu insistes, je"
	cont "vais te montrer"
	cont "mes pouvoirs!"
	done

_SaffronGymSabrinaReceivedMarshBadgeText::
	text "Ha!"
	line "Je suis surprise!"
	cont "Tu as gagné."

	para "C'est vrai, je"
	line "n'ai pas fait de"
	cont "mon mieux! Tu"
	cont "mérites ta"
	cont "victoire!"

	para "Tu gagnes le"
	line "BADGE MARAIS!@"
	text_end

_SaffronGymSabrinaPostBattleAdviceText::
	text "Tout le monde est"
	line "un peu médium!"
	cont "Il faut juste"
	cont "travailler ses"
	cont "dons!"
	done

_SaffronGymSabrinaMarshBadgeInfoText::
	text "Avec le BADGE"
	line "MARAIS, les"
	cont "#MON de niveau"
	cont "70 t'obéiront!"

	para "Les #MON plus"
	line "puissants seront"
	cont "incontrôlables"
	cont "lors des combats!"

	para "Fais en sorte que"
	line "tes #MON ne"
	cont "dépassent pas"
	cont "cette limite!"

	para "Tiens! Prends ça"
	line "aussi!"
	done

_SaffronGymSabrinaReceivedTM46Text::
	text "<PLAYER> obtient:"
	line "CT46!@"
	text_end

_TM46ExplanationText::
	text_start

	para "CT46 : VAGUE PSY!"
	line "Une onde"
	cont "d'énergie psy"
	cont "dévastatrice!"
	done

_SaffronGymSabrinaTM46NoRoomText::
	text "Ton inventaire"
	line "est plein!"
	done

_SaffronGymGuideChampInMakingText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Salut! Graine de"
	line "champion!"

	para "Les #MON de"
	line "MORGANE utilisent"
	cont "les pouvoirs de"
	cont "l'esprit!"

	para "Les #MON du"
	line "type combat sont"
	cont "désavantagés!"

	para "Ils deviennent"
	line "dingues avant de"
	cont "pouvoir porter"
	cont "un coup!"
	done

.GirlText
	text "Salut! Graine de"
	line "championne!"

	para "Les #MON de"
	line "MORGANE utilisent"
	cont "les pouvoirs de"
	cont "l'esprit!"

	para "Les #MON du"
	line "type combat sont"
	cont "désavantagés!"

	para "Ils deviennent"
	line "dingues avant de"
	cont "pouvoir porter"
	cont "un coup!"
	done

_SaffronGymGuideBeatSabrinaText::
	text "Pouvoirs psy?"
	line "Hmmm..."

	para "Si j'en avais, je"
	line "gagnerais!"
	done

_SaffronGymChanneler1BattleText::
	text "MORGANE est une"
	line "petite parvenue!"
	cont "Mais je l'aime"
	cont "bien!"
	done

_SaffronGymChanneler1EndBattleText::
	text "Rhhâ!"
	line "J'suis nulle!"
	prompt

_SaffronGymChanneler1AfterBattleText::
	text "Dans une baston,"
	line "ce qui est"
	cont "important, c'est"
	cont "la volonté de"
	cont "gagner!"

	para "Si tu veux gagner"
	line "face à MORGANE,"
	cont "concentre-toi sur"
	cont "la victoire!"
	done

_SaffronGymYoungster1BattleText::
	text "Nos pouvoirs"
	line "occultes te font"
	cont "peur?"
	done

_SaffronGymYoungster1EndBattleText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Nyan!"
	line "T'as pas l'air"
	cont "effrayé!"
	prompt

.GirlText
	text "Nyan!"
	line "T'as pas l'air"
	cont "effrayée!"
	prompt

_SaffronGymYoungster1AfterBattleText::
	text "Les #MON psy"
	line "craignent les"
	cont "insectes et les"
	cont "fantômes!"
	done

_SaffronGymChanneler2BattleText::
	text "L'aura du maître"
	line "déteint sur ses"
	cont "#MON."

	para "Tes #MON sont"
	line "forts, non?"
	done

_SaffronGymChanneler2EndBattleText::
	text "Argh!"
	line "Je l'savais!"
	prompt

_SaffronGymChanneler2AfterBattleText::
	text "Les attaques de"
	line "mes #MON ne"
	cont "sont pas assez"
	cont "fortes!"
	done

_SaffronGymYoungster2BattleText::
	text "La puissance sans"
	line "maîtrise n'est"
	cont "rien!"
	done

_SaffronGymYoungster2EndBattleText::
	text "Huh!"
	line "J'appelle pas ça"
	cont "rien!"
	prompt

_SaffronGymYoungster2AfterBattleText::
	text "MORGANE a"
	line "pulvérisé le"
	cont "grand MAITRE de"
	cont "KARATE!"
	done

_SaffronGymChanneler3BattleText::
	text "Toi...Moi..."
	line "Nos #MON..."
	cont "FIGHT!"
	done

_SaffronGymChanneler3EndBattleText::
	text "Puff!"
	line "J'ai perdu!"
	prompt

_SaffronGymChanneler3AfterBattleText::
	text "J'avais prévu ce"
	line "qui s'est passé."
	done

_SaffronGymYoungster3BattleText::
	text "MORGANE est jeune"
	line "mais elle est"
	cont "aussi notre"
	cont "CHAMPIONNE!" ; marcelnote - was CHAMPION

	para "Tu vas en baver"
	line "comme un russe"
	cont "avant de"
	cont "l'atteindre!"
	done

_SaffronGymYoungster3EndBattleText::
	text "Oups!"
	line "J'ai rien capté!"
	prompt

_SaffronGymYoungster3AfterBattleText::
	text "Il y avait deux"
	line "ARENES #MON à"
	cont "SAFRANIA."

	para "Le DOJO KARATE a"
	line "perdu son titre"
	cont "le jour où nous"
	cont "l'avons"
	cont "pulvérisé!"
	done

_SaffronGymYoungster4BattleText::
	text "La CHAMPIONNE de" ; marcelnote - was Le CHAMPION
	line "l'ARENE #MON"
	cont "de SAFRANIA est"
	cont "une médium psy!"

	para "Tu veux voir"
	line "MORGANE, hein?"
	cont "Je lis tes"
	cont "pensées... "
	cont "Vilain crapaud!"
	done

_SaffronGymYoungster4EndBattleText::
	text "Arrrgh!"
	prompt

_SaffronGymYoungster4AfterBattleText::
	text "J'ai lu dans ton"
	line "esprit! C'est pas"
	cont "très bien rangé"
	cont "là d'dans!"
	done


_SaffronGymWillWelcomeText:: ; marcelnote - postgame Will
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Quel honneur de"
	line "recevoir ici le"
	cont "champion de la"
	cont "LIGUE #MON!"

	para "Je suis CLEMENT,"
	line "le meilleur élève"
	cont "de MORGANE!"

	para "Tu tombes à pic."
	line "ALDO du CONSEIL"
	cont "des 4 arrive"
	cont "bientôt afin"
	cont "de me tester."

	para "Quoi? Tu veux dire"
	line "qu'ALDO t'a envoyé"
	cont "à sa place?"

	para "Très bien! Alors,"
	line "permets-moi de te"
	cont "montrer ce que"
	cont "j'ai appris."
	done

.GirlText
	text "Quel honneur de"
	line "recevoir ici la"
	cont "championne de la"
	cont "LIGUE #MON!"

	para "Je suis CLEMENT,"
	line "le meilleur élève"
	cont "de MORGANE!"

	para "Tu tombes à pic."
	line "ALDO du CONSEIL"
	cont "des 4 arrive"
	cont "bientôt afin"
	cont "de me tester."

	para "Quoi? Tu veux dire"
	line "qu'ALDO t'a envoyé"
	cont "à sa place?"

	para "Très bien! Alors,"
	line "permets-moi de te"
	cont "montrer ce que"
	cont "j'ai appris."
	done

_SaffronGymWillDefeatedText:: ; marcelnote - postgame Will
	text "Epatant!"
	line "J'ai encore"
	cont "beaucoup"
	cont "à apprendre!"
	prompt

_SaffronGymWillPostBattleText:: ; marcelnote - postgame Will
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Merci pour ce"
	line "combat mémorable,"
	cont "champion!"

	para "Mon propre voyage"
	line "ne fait que."
	cont "commencer."

	para "Je vais parcourir"
	line "le monde pour"
	cont "percer le mystère"
	cont "des #MON psy!"
	done

.GirlText
	text "Merci pour ce"
	line "combat mémorable,"
	cont "championne!"

	para "Mon propre voyage"
	line "ne fait que."
	cont "commencer."

	para "Je vais parcourir"
	line "le monde pour"
	cont "percer le mystère"
	cont "des #MON psy!"
	done

_SaffronGymBrunoArrivesText:: ; marcelnote - postgame Bruno
	text "ALDO: CLEMENT!"
	line "<PLAYER>!"
	done

_SaffronGymBrunoInspiringText:: ; marcelnote - postgame Bruno
	text "ALDO: Quel"
	line "sacré combat!"

	para "CLEMENT, ta"
	line "stratégie était"
	cont "carrée, précise."
	cont "Rien à redire!"

	para "Contre le"
	line "CHAMPION de la"
	cont "LIGUE #MON,"
	cont "c'est du lourd!"

	para "Et toi,"
	line "<PLAYER>, tu"
	cont "m'épates encore."

	para "Tous les deux,"
	line "poussez la barre"
	cont "toujours plus"
	cont "haut!"

	para "Continuez à vous"
	line "entraîner dur, et"
	cont "on se reverra!"
	done

_SaffronGymSabrinaRematchPreBattleText:: ; marcelnote - Sabrina rematch
	text "Ravie de te"
	line "revoir, <PLAYER>."

	para "Que dirais-tu d'une"
	line "revanche amicale?"

	para "Cette fois,"
	line "je ne te ferai"
	cont "pas de cadeau."
	done

_SaffronGymSabrinaRematchRefusedBattleText:: ; marcelnote - Sabrina rematch
	text "Très bien. Reviens"
	line "quand tu veux."
	done

_SaffronGymSabrinaRematchAcceptBattleText:: ; marcelnote - Sabrina rematch
	text "J'avais prédit"
	line "notre combat."
	cont "Voyons ensemble"
	cont "qui va l'emporter."
	done

_SaffronGymSabrinaRematchDefeatedText:: ; marcelnote - Sabrina rematch
	text "Plus rien"
	line "de surprenant."
	prompt

_SaffronGymAfterRematchText:: ; marcelnote - Sabrina rematch
	text "Ta soif d'aventure"
	line "m'inspire."

	para "Refaisons ça"
	line "bientôt!"
	done


; Dialogues de Morgane rematch LGPE :

; Perdre contre toi, ça m'a ouvert les yeux. J'en avais bien besoin, crois-moi.
; C'est pour cela que j'aimerais t'affronter à nouveau.
; Mais cette fois, je ne me reposerai pas uniquement sur mes pouvoirs psychiques. Je vais tout donner !

; Je pressens que je ne reverrai pas de Dreseur de ta trempe avant plusieurs années...

; Tu sais, quand je perds contre toi, cela ne me prend plus de court comme avant.
; Maintenant, cela me motive à me surpasser et à devenir comme toi, forte et libre !
