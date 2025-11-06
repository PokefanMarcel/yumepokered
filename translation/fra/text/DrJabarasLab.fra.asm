; marcelnote - new map
_DrJabarasLabJabaraIntroText::
	text "DR.JABARA: Hmm?"
	line "Un dresseur? Ici?"

	para "Je n'ai pas l'temps"
	line "de bavarder avec"
	cont "des gamins niais."

	para "Ah, FUJI t'envoie?"
	line "Ce vieux raté..."
	cont "Un esprit vif,"
	cont "mais il manquait"
	cont "d'ambition."

	para "Peu importe"
	line "Nos travaux"
	cont "à CRAMOIS'ILE,"
	cont "c'est du passé."

	para "Ici, j’étudie com-"
	line "ment les #MON"
	cont "réagissent à des"
	cont "sons différents."

	para "Je sens que je"
	line "touche au but."
	cont "Si seulement je"
	cont "pouvais mettre la"
	cont "main sur une"
	cont "#FLUTE..."
	done

_DrJabarasLabHaveFluteText::
	text "Attends voir... Tu"
	line "as une #FLUTE?"

	para "Avec ça, je"
	line "pourrais enfin"
	cont "confirmer mes"
	cont "théories."

	para "Si tu m'la prêtes,"
	line "tu ne seras pas"
	cont "déçu."
	done

_DrJabarasLabRefusedText::
	text "Tss... Je vois"
	line "pourquoi FUJI"
	cont "t'aime bien."
	done

_DrJabarasLabGaveFluteText::
	text "<PLAYER> donne"
	line "la #FLUTE au"
	cont "DR.JABARA.@"
	text_end

_DrJabarasLabNeedTimeText::
	text "Mes tests vont"
	line "prendre du temps."
	cont "Reste pas dans"
	cont "mes pattes."
	done

_DrJabarasLabExperimentsOverText::
	text "Ah, te revoilà!"
	line "Mes tests sont"
	cont "un succès total!"

	para "Grâce à ta"
	line "#FLUTE, j'ai"
	cont "trouvé des sons"
	cont "qui déclenchent"
	cont "une réaction..."
	cont "Disons, anormale"
	cont "chez les #MON."

	para "Tiens, je n'en ai"
	line "plus besoin."
	prompt

_DrJabarasLabNoRoomText::
	text "Votre inventaire"
	line "est plein."
	done

_DrJabarasLabReturnedFluteText::
	text "DR.JABARA rend"
	line "la #FLUTE!@"
	text_end

_DrJabarasLabJabaraFinalText::
	text "Tu es encore là?"

	para "Soit. Tu as"
	line "mérité quelques"
	cont "explications."

	para "Créer MEWTWO fut"
	line "notre plus grand"
	cont "exploit. Mais sa"
	cont "puissance est"
	cont "vite devenue"
	cont "incontrolable."

	para "Quand il s'est"
	line "échappé, le labo"
	cont "a été dévasté. Et"
	cont "MEW en a profité"
	cont "pour filer aussi."

	para "Je suis parti de"
	line "CRAMOIS'ILE peu"
	cont "après. Personne"
	cont "n'a vu MEWTWO"
	cont "depuis."

	para "Et MEW? Il aurait"
	line "été vu près de"
	cont "CELADOPOLE, selon"
	cont "des rumeurs."

	para "Et MEW? On raconte"
	line "qu'il a été vu"
	cont "vers CELADOPOLE."

	para "Il a dû y trouver"
	line "un lieu isolé"
	cont "pour se cacher."

	para "MEW était toujours"
	line "fasciné par"
	cont "la #FLUTE du"
	cont "DR.FUJI."
	cont "Si tu en joues"
	cont "au bon endroit,"
	cont "il pourrait"
	cont "se montrer."
	done

_DrJabarasLabNotesText::
	text "C'est le travail"
	line "du DR.JABARA."

	para "Des pages entières"
	line "de chiffres sur"
	cont "MAGICARPE."
	done

_DrJabarasLabReceivedEmailText::
	text "Il y a un e-mail."

	para "..."

	para "DR.JABARA, vos"
	line "études récentes"
	cont "sur les #MON"
	cont "ont éveillé"
	cont "notre intérêt."

	para "Nous aimerions en"
	line "discuter pour..."
	cont "étendre ses"
	cont "usages."

	para "..."
	done

_DrJabarasLabEmailDraftText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "LE DR.JABARA a"
	line "écrit un e-mail."

	para "..."

	para "...ai emprunté la"
	line "#FLUTE d'un"
	cont "gamin naïf..."

	para "...isolé une"
	line "fréquence qui"
	cont "déclenche..."

	para "...usage potentiel"
	line "sur l'évolution"
	cont "des #MON..."

	para "Hein?"
	done

.GirlText
	text "LE DR.JABARA a"
	line "écrit un e-mail."

	para "..."

	para "...ai emprunté la"
	line "#FLUTE d'une"
	cont "gamine naïve..."

	para "...isolé une"
	line "fréquence qui"
	cont "déclenche..."

	para "...usage potentiel"
	line "sur l'évolution"
	cont "des #MON..."

	para "Hein?"
	done
