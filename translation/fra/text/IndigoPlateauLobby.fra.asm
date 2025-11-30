_IndigoPlateauLobbyGymGuideChampInMakingText:: ; marcelnote - modified label
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

	para "Tu vas devoir"
	line "affronter le"
	cont "CONSEIL des 4"
	cont "dans l'ordre pour"
	cont "triompher de la"
	cont "LIGUE #MON."

	para "Si tu perds,"
	line "d'abord tu auras"
	cont "honte, et ensuite"
	cont "tu devras tout"
	cont "recommencer!"
	cont "Alors fais bien"
	cont "attention et..."
	cont "Ecrase-les!"
	done

.GirlText
	text "Salut! Championne"
	line "en herbe!"

	para "Tu vas devoir"
	line "affronter le"
	cont "CONSEIL des 4"
	cont "dans l'ordre pour"
	cont "triompher de la"
	cont "LIGUE #MON."

	para "Si tu perds,"
	line "d'abord tu auras"
	cont "honte, et ensuite"
	cont "tu devras tout"
	cont "recommencer!"
	cont "Alors fais bien"
	cont "attention et..."
	cont "Ecrase-les!"
	done

_IndigoPlateauLobbyGymGuideTrueChampText:: ; marcelnote - new after becoming champ
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Salut! Te voilà,"
	line "champion!"
	cont "J'savais que t'en"
	cont "étais capable!"

	para "Alors, tu vises"
	line "quoi maintenant?"
	done

.GirlText
	text "Salut! Te voilà,"
	line "championne!"
	cont "J'savais que t'en"
	cont "étais capable!"

	para "Alors, tu vises"
	line "quoi maintenant?"
	done

_IndigoPlateauLobbyCooltrainerFBeforeChampionText:: ; marcelnote - modified label
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "A partir d'ici,"
	line "tu affronteras"
	cont "les quatre"
	cont "membres du...."
	cont "CONSEIL des 4!"

	para "Remporte la"
	line "victoire et une"
	cont "porte s'ouvrira"
	cont "vers le prochain"
	cont "dresseur. Bonne"
	cont "chance, petit!"
	done

.GirlText
	text "A partir d'ici,"
	line "tu affronteras"
	cont "les quatre"
	cont "membres du...."
	cont "CONSEIL des 4!"

	para "Remporte la"
	line "victoire et une"
	cont "porte s'ouvrira"
	cont "vers le prochain"
	cont "dresseur. Bonne"
	cont "chance, petite!"
	done

_IndigoPlateauLobbyCooltrainerFEliteFourAwayText:: ; marcelnote - new text
	text "Les dresseurs du"
	line "CONSEIL des 4"
	cont "sont absents."

	para "Tu pourras les"
	line "défier de nouveau"
	cont "à leur retour."
	done

_IndigoPlateauLobbyCooltrainerFAfterChampionText:: ; marcelnote - new text
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Bienvenue,"
	line "champion!"
	cont "Le CONSEIL des 4"
	cont "est prêt pour"
	cont "une revanche!"
	done

.GirlText
	text "Bienvenue,"
	line "championne!"
	cont "Le CONSEIL des 4"
	cont "est prêt pour"
	cont "une revanche!"
	done

_IndigoPlateauLobbyRivalText:: ; marcelnote - new text
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

	para "Prêt à prendre"
	line "ta place de"
	cont "CHAMPION de la"
	cont "LIGUE #MON?"

	para "Hein?"
	line "..."
	cont "Comment ça, non?"

	para "Mais le CHAMPION"
	line "doit affronter"
	cont "quiconque défie"
	cont "la LIGUE #MON!"

	para "Vraiment? Moi?"
	line "OK, <PLAYER>."
	cont "Si tu insistes,"
	cont "je m'en occuperai"
	cont "pour l'instant."

	para "En affrontant les"
	line "meilleurs je"
	cont "deviendrai plus"
	cont "fort, et dès que"
	cont "tu reviendras..."

	para "Je te reprendrai"
	line "mon titre!"

	para "A plus tard"
	line "dans la salle"
	cont "du CHAMPION,"
	cont "<PLAYER>!"
	done

.GirlText
	text "<RIVAL>: Yo,"
	line "<PLAYER>!"

	para "Prête à prendre"
	line "ta place de"
	cont "CHAMPIONNE de la"
	cont "LIGUE #MON?"

	para "Hein?"
	line "..."
	cont "Comment ça, non?"

	para "Mais la CHAMPIONNE"
	line "doit affronter"
	cont "quiconque défie"
	cont "la LIGUE #MON!"

	para "Vraiment? Moi?"
	line "OK, <PLAYER>."
	cont "Si tu insistes,"
	cont "je m'en occuperai"
	cont "pour l'instant."

	para "En affrontant les"
	line "meilleurs je"
	cont "deviendrai plus"
	cont "fort, et dès que"
	cont "tu reviendras..."

	para "Je te reprendrai"
	line "mon titre!"

	para "A plus tard"
	line "dans la salle"
	cont "du CHAMPION,"
	cont "<PLAYER>!"
	done
