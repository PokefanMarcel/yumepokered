; marcelnote - new location
_CinnabarVolcanoB1FScientistBattleText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Le passage est"
	line "bloqué."
	cont "Tu perds ton"
	cont "temps, gamin!"
	done

.GirlText
	text "Le passage est"
	line "bloqué."
	cont "Tu perds ton"
	cont "temps, gamine!"
	done

_CinnabarVolcanoB1FScientistEndBattleText::
	text "Imp-"
	line "ossible!"
	prompt

_CinnabarVolcanoB1FScientistAfterBattleText::
	text "Personne n'a encore"
	line "trouvé comment"
	cont "monter là-haut."
	done

_CinnabarVolcanoB1FHikerBattleText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Enfin, un adver-"
	line "saire de taille"
	cont "pour mes #MON!"
	done

.GirlText
	text "Enfin, une adver-"
	line "saire de taille"
	cont "pour mes #MON!"
	done

_CinnabarVolcanoB1FHikerEndBattleText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "T'es"
	line "pas un rigolo!"
	prompt

.GirlText
	text "T'es"
	line "pas une rigolote!"
	prompt

_CinnabarVolcanoB1FHikerAfterBattleText::
	text "AUGUSTE vient"
	line "souvent ici"
	cont "pour s'entraîner."
	done

_CinnabarVolcanoB1FCooltrainerFBattleText::
	text "Mes #MON feu"
	line "sont dans leur"
	cont "élément ici! Ils"
	cont "brûlent d'envie"
	cont "de se battre!"
	done

_CinnabarVolcanoB1FCooltrainerFEndBattleText::
	text "Ouh!"
	line "Cramée!"
	prompt

_CinnabarVolcanoB1FCooltrainerFAfterBattleText::
	text "Des #MON rares"
	line "vivent ici"
	cont "dans le volcan."
	done

_CinnabarVolcano1FCooltrainerMBattleText::
	text "Pourquoi j'ai amené"
	line "des #MON de"
	cont "type plante"
	cont "dans un volcan?"
	done

_CinnabarVolcano1FCooltrainerMEndBattleText::
	text "!!"
	line "J'suis rôti!"
	prompt

_CinnabarVolcano1FCooltrainerMAfterBattleText::
	text "J'veux déguerpir"
	line "d'ici! Mais ma"
	cont "copine est encore"
	cont "au sous-sol."
	done

_CinnabarVolcano1FBurglarBattleText::
	text "Si je mets la main"
	line "sur un #MON"
	cont "d'enfer, à moi une"
	cont "place à l'ARENE"
	cont "de CRAMOIS'ILE!"
	done

_CinnabarVolcano1FBurglarEndBattleText::
	text "Fiiou!"
	prompt

_CinnabarVolcano1FBurglarAfterBattleText::
	text "Par là, ça sent"
	line "l'impasse."
	done

_CinnabarVolcano1FGentlemanBattleText::
	text "Je n'ai jamais vu"
	line "pareil endroit."
	done

_CinnabarVolcano1FGentlemanEndBattleText::
	text "Excel-"
	line "lente technique!"
	prompt

_CinnabarVolcano1FGentlemanAfterBattleText::
	text "Visiter un volcan,"
	line "quelle idée!"
	cont "Que vont-ils"
	cont "encore inventer?"
	done

_CinnabarVolcano1FBeautyBattleText::
	text "J'ai nagé du BOURG"
	line "PALETTE jusqu'à"
	cont "CRAMOIS'ILE."
	cont "Cette chaleur,"
	cont "c'est mon spa"
	cont "après l'effort!"
	done

_CinnabarVolcano1FBeautyEndBattleText::
	text "Pff... Tu"
	line "casses l'ambiance!"
	prompt

_CinnabarVolcano1FBeautyAfterBattleText::
	text "Un petit bain"
	line "de chaleur,"
	cont "ça revigore."
	cont "Mais ne reste pas"
	cont "trop longtemps!"
	done

_CinnabarVolcanoB1FLavaSignText::
	text "Attention, magma!"
	line "Baignade"
	cont "déconseillée."
	done

_CinnabarVolcano1FBurnHealSignText::
	text "ASTUCE"

	para "Ca chauffe?"
	line "Faites le plein"
	cont "d'ANTI-BRULE!"
	done

_CinnabarVolcano1FLanceCameInHasteText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Ah, <PLAYER>!"
	line "Heureux de te"
	cont "voir ici."

	para "J'ai accouru"
	line "en apprenant qu'un"
	cont "#MON sauvage"
	cont "semait le chaos"
	cont "à CRAMOIS'ILE."

	para "En tant que membre"
	line "du CONSEIL des 4,"
	cont "il est de mon de-"
	cont "voir de protéger"
	cont "cette région."

	para "J'ai pisté le"
	line "#MON jusqu'ici,"
	cont "mais il s'est"
	cont "enfui plus loin"
	cont "dans le volcan."

	para "Ton aide me"
	line "serait précieuse,"
	cont "champion."
	done

.GirlText
	text "Ah, <PLAYER>!"
	line "Heureux de te"
	cont "voir ici."

	para "J'ai accouru"
	line "en apprenant qu'un"
	cont "#MON sauvage"
	cont "semait le chaos"
	cont "à CRAMOIS'ILE."

	para "En tant que membre"
	line "du CONSEIL des 4,"
	cont "il est de mon de-"
	cont "voir de protéger"
	cont "cette région."

	para "J'ai pisté le"
	line "#MON jusqu'ici,"
	cont "mais il s'est"
	cont "enfui plus loin"
	cont "dans le volcan."

	para "Ton aide me"
	line "serait précieuse,"
	cont "championne."
	done

_CinnabarVolcanoB1FLanceTogetherText::
	text "<PLAYER>!"

	para "Faisons ça"
	line "ensemble!"
	done

_CinnabarVolcanoB1FLancePokeBallText::
	text "PETER: Ca y est!"
	line "# BALL!"
	done

_CinnabarVolcanoB1FCharizardCaughtText::
	text "..."

	para "..."

	para "PETER a attrapé"
	line "DRACAUFEU!"
	done

_CinnabarVolcanoB1FLanceGreatJobText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Beau travail,"
	line "<PLAYER>."

	para "Ce DRACAUFEU était"
	line "coriace, mais nos"
	cont "forces ont été"
	cont "supérieures."

	para "Je veillerai"
	line "à ce qu'il reçoive"
	cont "un entraînement"
	cont "digne de ce nom."

	para "A notre prochaine"
	line "rencontre,"
	cont "champion!"
	done

.GirlText
	text "Beau travail,"
	line "<PLAYER>."

	para "Ce DRACAUFEU était"
	line "coriace, mais nos"
	cont "forces ont été"
	cont "supérieures."

	para "Je veillerai"
	line "à ce qu'il reçoive"
	cont "un entraînement"
	cont "digne de ce nom."

	para "A notre prochaine"
	line "rencontre,"
	cont "championne!"
	done

_CinnabarVolcanoB1FCharizardText:: ; marcelnote - postgame Lance
	text "Rraaahh!"
	done
