; marcelnote - new location
_PokemonAcademy1FReceptionistText::
	text "Bienvenue à"
	line "l'ACADEMIE"
	cont "#MON!"

	para "Vous pouvez"
	line "parcourir la"
	cont "bibliothèque au"
	cont "rez-de-chaussée."

	para "Les salles de"
	line "classe sont"
	cont "à l'étage."
	done

_PokemonAcademy1FCooltrainerFText::
	text "J'étudie les"
	line "avantages entre"
	cont "les différents"
	cont "types de #MON."

	para "Tu savais que"
	line "les attaques de"
	cont "type spectre sont"
	cont "fortes contre"
	cont "les #MON psy?"

	para "Et les attaques"
	line "insecte sont"
	cont "faibles contre"
	cont "les #MON de"
	cont "type poison."
	done

_PokemonAcademy1FYoungsterText::
	text "Je fais des"
	line "recherches sur"
	cont "l'attaque"
	cont "SOUPLESSE."

	para "Je croyais que"
	line "c'était une"
	cont "attaque de type"
	cont "normal, mais mon"
	cont "prof dit qu'elle"
	cont "est de type"
	cont "dragon!"
	done

_PokemonAcademy1FSignText::
	text "ACADEMIE #MON"
	line "RDC: BIBLIOTHEQUE"
	done

_PokemonAcademy2FTeacherTakeTestText::
	text "Bienvenue dans la"
	line "classe débutants."

	para "Ici, on étudie"
	line "les principes"
	cont "élémentaires des"
	cont "#MON et de"
	cont "leurs aptitudes."

	para "Si tu veux,"
	line "je peux tester"
	cont "tes connaissances"
	cont "avec quelques"
	cont "questions."

	para "Es-tu prêt pour"
	line "le test?"
	done

_PokemonAcademy2FTeacherQuestion1Text::
	text "Très bien!"
	line "Alors allons-y."

	para "Question 1:"
	line "Les attaques"
	cont "glace sont très"
	cont "efficaces contre"
	cont "les #MON feu."
	done

_PokemonAcademy2FTeacherQuestion2Text::
	text "Correct!"

	para "Question 2:"
	line "Un SPECIAL élevé"
	cont "réduit les dégâts"
	cont "infligés par"
	cont "TONNERRE."
	done

_PokemonAcademy2FTeacherQuestion3Text::
	text "Correct!"

	para "Question 3:"
	line "MUR LUMIERE"
	cont "disparaît quand"
	cont "le #MON qui"
	cont "l'a lancé"
	cont "est rappelé."
	done

_PokemonAcademy2FTeacherQuestion4Text::
	text "Correct!"

	para "Question 4:"
	line "La stat d'ATTAQUE"
	cont "augmente les"
	cont "dégâts infligés"
	cont "par PISTOLET A O."
	done

_PokemonAcademy2FTeacherQuestion5Text::
	text "Correct!"

	para "Dernière question:"
	line "l'attaque HATE"
	cont "augmente le taux"
	cont "de coup critique"
	cont "d'un #MON."
	done

_PokemonAcademy2FTeacherWrongAnswerText::
	text "Mauvaise réponse!"
	line "Dommage."
	prompt

_PokemonAcademy2FTeacherWellDoneText::
	text "Bravo, tu as"
	line "réussi le test"
	cont "pour débutants!"

	para "Maintenant que tu"
	line "maîtrises les"
	cont "bases, tu devrais"
	cont "essayer la"
	cont "classe avancée"
	cont "à l'étage."
	done

_PokemonAcademy2FComeBackWhenReadyText::
	text "Pas de problème,"
	line "reviens quand"
	cont "tu seras prêt."
	done

_PokemonAcademy2FBrunetteGirlText::
	text "Je révise les"
	line "différences entre"
	cont "types PHYSIQUES"
	cont "et SPECIAUX."

	para "J'me rappelle"
	line "jamais où ranger"
	cont "le type dragon!"
	done

_PokemonAcademy2FPhysicalSpecialIntroText::
	text "Vous consultez les"
	line "notes de cours!"

	para "TYPES PHYSIQUES"
	line "ET SPECIAUX."
	prompt

_PokemonAcademy2FPhysicalSpecialTypesText::
	text "Chacun des types"
	line "#MON est"
	cont "soit PHYSIQUE,"
	cont "soit SPECIAL."

	para "Types PHYSIQUES:"
    line "NORMAL, INSECTE,"
    cont "POISON, VOL,"
    cont "SOL, COMBAT,"
    cont "ROCHE, et DRAGON."

	para "Types SPECIAUX:"
    line "FEU, EAU, PLANTE,"
    cont "ELECTRIK, GLACE,"
    cont "PSY, et SPECTRE."
    prompt

_PokemonAcademy2FPhysicalTypesText::
	text "Quand un #MON"
	line "lance une attaque"
	cont "PHYSIQUE, c'est"
	cont "sa stat d'ATTAQUE"
	cont "qui détermine les"
	cont "dégâts infligés"
	cont "à l'adversaire."

	para "Mais la stat de"
	line "DEFENSE de"
	cont "l'adversaire joue"
	cont "aussi un rôle."

	para "Plus l'ATTAQUE est"
	line "haute, plus ça"
	cont "frappe fort, mais"
	cont "une bonne DEFENSE"
	cont "amortit les"
	cont "coups!"
	prompt

_PokemonAcademy2FSpecialTypesText::
	text "Les attaques de"
	line "type SPECIAL ne"
	cont "fonctionnent pas"
	cont "tout à fait comme"
	cont "les PHYSIQUES!"

	para "Dans ce cas,"
	line "ces sont les"
	cont "stats de SPECIAL"
	cont "du #MON et de"
	cont "son adversaire"
	cont "qui déterminent"
	cont "les dégâts"
	cont "infligés."

	para "Plus le SPECIAL"
	line "est haut, plus"
	cont "les attaques sont"
	cont "fortes, et mieux"
	cont "on encaisse!@"
	text_waitbutton
	text_end

_PokemonAcademy2FYoungsterText::
	text "Mon grand frère"
	line "dit que l'attaque"
	cont "PUISSANCE ne sert"
	cont "à rien."

	para "Mais j'crois qu'il"
	line "est juste nul en"
	cont "combat #MON!"
	done

_PokemonAcademy2FCriticalHitsIntroText:: ; should also add that crits ignore stat changes, maybe advanced class?
	text "Vous consultez les"
	line "notes de cours!"

	para "COUPS CRITIQUES." ; CRITICAL HITS BASICS?
	prompt

_PokemonAcademy2FCriticalSpeedText::
	text "Les chances de"
	line "coup critique"
	cont "dépendent de la"
	cont "VITESSE naturelle"
	cont "de chaque espèce"
	cont "de #MON."

	para "Plus une espèce"
	line "est rapide, plus"
	cont "ses chances de"
	cont "coup critique"
	cont "sont élevées."
	cont "Sois rapide!"
	prompt

_PokemonAcademy2FIncreaseCritText::
	text "Utiliser l'attaque"
	line "PUISSANCE en"
	cont "combat augmentera"
	cont "tes chances de"
	cont "lancer un coup"
	cont "critique."

	para "Si ton #MON ne"
	line "connaît pas"
	cont "PUISSANCE,"
	cont "tu peux aussi"
	cont "lui donner"
	cont "du MUSCLE +!"
	prompt

_PokemonAcademy2FHighCritMovesText::
	text "Certaines attaques"
	line "comme TRANCHE ou"
	cont "TRANCH'HERBE font"
	cont "presque toujours"
	cont "un coup critique."

	para "Prends garde à"
	line "ces attaques!@"
	text_waitbutton
	text_end

_PokemonAcademy2FBeautyText::
	text "J'ai appris quatre"
	line "attaques de type"
	cont "eau à mon PTITARD"
	cont "pour profiter à"
	cont "fond du bonus de"
	cont "même type."

	para "Mais je perds sans"
	line "arrêt contre les"
	cont "#MON plante..."
	done

_PokemonAcademy2FSTABIntroText::
	text "Vous consultez les"
	line "notes de cours!"

	para "BONUS D'ATTAQUE"
	line "DE MEME TYPE."
	prompt

_PokemonAcademy2FSTABExplanationText::
	text "Quand un #MON"
	line "utilise une"
	cont "attaque de son"
	cont "propre type,"
	cont "cette attaque est"
	cont "plus puissante."

	para "Par exemple,"
	line "une attaque feu"
	cont "frappe plus fort"
	cont "quand elle est"
	cont "lancée par un"
	cont "#MON feu."

	para "Retiens bien ça"
	line "pour tes combats!@"
	text_waitbutton
	text_end

_PokemonAcademy2FSuperNerdText::
	text "Certaines attaques"
	line "modifient les"
	cont "stats d'un #MON"
	cont "en plein combat."

	para "RUGISSEMENT ou"
	line "JET DE SABLE,"
	cont "c'est facile,"
	cont "mais PROTECTION"
	cont "ou MUR LUMIERE,"
	cont "ça l'est moins!"
	done

_PokemonAcademy2FSuperNerd2Text::
	text "Deux changements"
	line "de STATUT ont un"
	cont "effet sur les"
	cont "stats d'un #MON"
	cont "en combat."

	para "Un #MON"
	line "paralysé perd"
	cont "la moitié de"
	cont "sa VITESSE, et"
	cont "un #MON brûlé"
	cont "perd la moitié"
	cont "de son ATTAQUE."
	done

_PokemonAcademy2FReflectLightScreenIntroText::
	text "Vous consultez les"
	line "notes de cours!"

	para "PROTECTION ET"
	line "MUR LUMIERE."
	prompt

_PokemonAcademy2FReflectText::
	text "Quand un #MON"
	line "lance PROTECTION,"
	cont "sa DEFENSE est"
	cont "doublée."

	para "Les attaques"
	line "PHYSIQUES comme"
	cont "CHARGE ou JET-"
	cont "PIERRES feront"
	cont "moins de dégâts!"
	prompt

_PokemonAcademy2FLightScreenText::
	text "Si il utilise"
	line "MUR LUMIERE,"
	cont "alors son SPECIAL"
	cont "est doublé face"
	cont "aux attaques"
	cont "SPECIALES."

	para "Les attaques comme"
	line "PISTOLET A O ou"
	cont "RAFALE PSY feront"
	cont "moins de dégâts!"
	prompt

_PokemonAcademy2FReflectLightScreenEndText::
	text "Attention!"
	line "Quand le #MON"
	cont "qui a lancé"
	cont "MUR LUMIERE ou"
	cont "PROTECTION est"
	cont "changé ou mis"
	cont "K.O., l'effet"
	cont "prend fin.@"
	text_waitbutton
	text_end

_PokemonAcademy2FSetDamageMovesIntroText::
	text "Vous consultez les"
	line "notes de cours!"

	para "ATTAQUES A DEGATS"
	line "FIXES."
	prompt

_PokemonAcademy2FDragonRageSonicboomText::
	text "Quelques attaques"
	line "infligent des"
	cont "dégâts sans"
	cont "prendre en compte"
	cont "les stats des"
	cont "#MON."

	para "Par exemple,"
	line "DRACO-RAGE et"
	cont "SONICBOOM ont"
	cont "toujours le même"
	cont "effet, et ceci"
	cont "peu importe la"
	cont "force du #MON"
	cont "qui les utilise."
	prompt

_PokemonAcademy2FNightShadeSeismicTossPsywaveText::
	text "Les dégâts de"
	line "FRAPPE ATLAS et"
	cont "de TENEBRES"
	cont "dépendent du"
	cont "niveau de celui"
	cont "qui les lance."

	para "Enfin, VAGUE PSY"
	line "varie aussi avec"
	cont "le niveau, mais"
	cont "ses dégâts sont"
	cont "imprévisibles."

	para "A son maximum,"
	line "elle peut faire"
	cont "jusqu'à 3 fois"
	cont "plus de dégâts"
	cont "qu'à son minimum!@"
	text_waitbutton
	text_end

_PokemonAcademy2FBlackboardDescribesText::
	text "Les avantages de"
	line "type sont écrits"
	cont "au tableau."
	prompt

_PokemonAcademy2FBlackboardWhichHeadingText::
	text "Lire à propos"
	line "de quel type?"
	done

_PokemonAcademy2FBlackboardNormalText::
	text "Très efficace:"
	line "Aucun."

	para "Pas très efficace:"
	line "ROCHE."

	para "Aucun effect:"
	line "SPECTRE."
	prompt

_PokemonAcademy2FBlackboardGrassText::
	text "Très efficace:"
	line "EAU, SOL, ROCHE."

	para "Pas très efficace:"
	line "PLANTE, FEU,"
	cont "POISON, VOL,"
	cont "INSECTE, DRAGON."
	prompt

_PokemonAcademy2FBlackboardFireText::
	text "Très efficace:"
	line "PLANTE, INSECTE,"
	cont "GLACE."

	para "Pas très efficace:"
	line "FEU, EAU, ROCHE,"
	cont "DRAGON."
	prompt

_PokemonAcademy2FBlackboardWaterText::
	text "Très efficace:"
	line "FEU, SOL, ROCHE."

	para "Pas très efficace:"
	line "EAU, PLANTE,"
	cont "DRAGON."
	prompt

_PokemonAcademy2FBlackboardElectricText::
	text "Très efficace:"
	line "EAU, VOL."

	para "Pas très efficace:"
	line "PLANTE, ELECTRIK,"
	cont "DRAGON."

	para "Aucun effect:"
	line "SOL."
	prompt

_PokemonAcademy2FBlackboardFightingText::
	text "Très efficace:"
	line "NORMAL, ROCHE,"
	cont "GLACE."

	para "Pas très efficace:"
	line "POISON, VOL,"
	cont "PSY, INSECTE."

	para "Aucun effect:"
	line "SPECTRE."
	prompt

_PokemonAcademy2FBlackboardPoisonText::
	text "Très efficace:"
	line "PLANTE, INSECTE."

	para "Pas très efficace:"
	line "POISON, SOL,"
	cont "ROCHE, SPECTRE."
	prompt

_PokemonAcademy2FBlackboardGroundText::
	text "Très efficace:"
	line "FEU, ELECTRIK,"
	cont "POISON, ROCHE."

	para "Pas très efficace:"
	line "PLANTE, INSECTE."

	para "Aucun effect:"
	line "VOL."
	prompt

_PokemonAcademy2FBlackboardFlyingText::
	text "Très efficace:"
	line "PLANTE, COMBAT,"
	cont "INSECTE."

	para "Pas très efficace:"
	line "ELECTRIK, ROCHE."
	prompt

_PokemonAcademy2FBlackboardBugText::
	text "Très efficace:"
	line "PLANTE, PSY."

	para "Pas très efficace:"
	line "FEU, COMBAT,"
	cont "POISON, VOL."
	prompt

_PokemonAcademy2FBlackboardRockText::
	text "Très efficace:"
	line "FEU, VOL,"
	cont "INSECTE, GLACE."

	para "Pas très efficace:"
	line "SOL, COMBAT."
	prompt

_PokemonAcademy2FBlackboardPsychicText::
	text "Très efficace:"
	line "COMBAT, POISON."

	para "Pas très efficace:"
	line "PSY."
	prompt

_PokemonAcademy2FBlackboardIceText::
	text "Très efficace:"
	line "PLANTE, SOL,"
	cont "VOL, DRAGON."

	para "Pas très efficace:"
	line "EAU, GLACE."
	prompt

_PokemonAcademy2FBlackboardGhostText::
	text "Très efficace:"
	line "PSY, SPECTRE."

	para "Pas très efficace:"
	line "Aucun."

	para "Aucun effect:"
	line "NORMAL."
	prompt

_PokemonAcademy2FBlackboardDragonText::
	text "Très efficace:"
	line "DRAGON."

	para "Pas très efficace:"
	line "Aucun."
	prompt

_PokemonAcademy2FSignText::
	text "1er: CLASSE"
	line "DEBUTANTS"
	done

_KeepReadingText::
	text "Continuer"
	line "à lire?"
	done
