SilphCo2FSilphWorkerFPleaseTakeThisText::
	text "Au secours!"
	line "A l'aide!"

	para "Quoi? Tu n'es pas"
	line "de la TEAM?"
	cont "Tant mieux!"
	cont "Tiens prends ça!"
	prompt

_SilphCo2FSilphWorkerFReceivedTM36Text::
	text "<PLAYER> obtient"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_SilphCo2FSilphWorkerFTM36ExplanationText::
	text "Voici la CT36:"
	line "DESTRUCTION!"

	para "C'est une attaque"
	line "très puissante!"
	cont "Mais elle mettra"
	cont "K.O. le #MON"
	cont "qui l'utilise!!!"
	done

_SilphCo2FSilphWorkerFTM36NoRoomText::
	text "Plus de place"
	line "pour cet objet!!!"
	done

_SilphCo2FScientist1BattleText::
	text "A l'aide! Je suis"
	line "un employé de la"
	cont "SYLPHE SARL!"
	done

_SilphCo2FScientist1EndBattleText::
	text "???"
	line "Comment t'as su"
	cont "que j'étais de"
	cont "La TEAM ROCKET?"
	prompt

_SilphCo2FScientist1AfterBattleText::
	text "Je travaille pour"
	line "la SYLPHE SARL et"
	cont "la TEAM ROCKET!"
	done

_SilphCo2FScientist2BattleText::
	text "Hophop! Zone"
	line "privée, dégage!"
	done

_SilphCo2FScientist2EndBattleText::
	text "OK."
	line "J'suis battu!"
	prompt

_SilphCo2FScientist2AfterBattleText::
	text "Trouve la"
	line "sortie du"
	cont "Labyrinthe!"
	done

_SilphCo2FRocket1BattleText::
	text "Hé! Pas de"
	line "mioches ici!"
	done

_SilphCo2FRocket1EndBattleText::
	text "La vache!"
	line "Balèze le p'tit!"
	prompt

_SilphCo2FRocket1AfterBattleText::
	text "Les dalles en"
	line "forme de diamant"
	cont "sont des"
	cont "téléporteurs!"

	para "C'est de la super"
	line "technologie!"
	done

_SilphCo2FRocket2BattleText::
	text "Hé, p'tite tête!"
	line "Qu'est-ce tu"
	cont "fais là?"
	done

_SilphCo2FRocket2EndBattleText::
	text "Oups,"
	line "j'ai perdu!"
	prompt

_SilphCo2FRocket2AfterBattleText::
	text "La SYLPHE SARL et"
	line "la TEAM ROCKET"
	cont "vont fusionner!"
	done
