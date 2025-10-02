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
	line "le test ?"
	done

_PokemonAcademy2FTeacherQuestion1Text::
	text "Très bien!"
	line "Alors allons-y."

	para "Question 1:"
	line "Les attaques glace"
	cont "sont très"
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
	cont "tenter la"
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
	line "OU SPECIAUX."
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
	cont "aussi un role."

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

_PokemonAcademy2FYoungsterText:: ; TODO
	text "My older brother"
	line "complains that"
	cont "FOCUS POWER"
	cont "never works."

	para "But I think"
	line "he's just bad"
	cont "at battling!"
	done

_PokemonAcademy2FCriticalHitsIntroText:: ; should also add that crits ignore stat changes, maybe advanced class?
	text "Vous consultez les"
	line "notes de cours!"

	para "COUPS CRITIQUES." ; CRITICAL HITS BASICS?
	prompt

_PokemonAcademy2FCriticalSpeedText:: ; TODO
	text "A critical hit's"
	line "chance depends on"
	cont "the natural SPEED"
	cont "of a #MON's"
	cont "species."

	para "The faster the"
	line "#MON species,"
	cont "the higher the"
	cont "chance to land"
	cont "critical hits."
	cont "Be quick!"
	prompt

_PokemonAcademy2FIncreaseCritText:: ; TODO
	text "Using the move"
	line "FOCUS ENERGY"
	cont "in battle will"
	cont "increase your"
	cont "chance to land"
	cont "critical hits."

	para "If your #MON"
	line "does not know"
	cont "FOCUS ENERGY, you"
	cont "can also give it"
	cont "some DIRE HIT!"
	prompt

_PokemonAcademy2FHighCritMovesText:: ; TODO
	text "Some moves like"
	line "SLASH and RAZOR"
	cont "LEAF almost"
	cont "always land"
	cont "critical hits."

	para "Watch out for"
	line "those moves!@"
	text_waitbutton
	text_end

_PokemonAcademy2FBeautyText:: ; TODO
	text "I taught my"
	line "POLIWAG four"
	cont "water moves to"
	cont "make the most of"
	cont "the same-type"
	cont "attack bonus."

	para "But I keep losing"
	line "against grass"
	cont "#MON..."
	done

_PokemonAcademy2FSTABIntroText:: ; TODO
	text "Vous consultez les"
	line "notes de cours!"

	para "SAME-TYPE"
	line "ATTACK BONUS."
	prompt

_PokemonAcademy2FSTABExplanationText:: ; TODO
	text "When a #MON"
	line "uses a move"
	cont "that matches its"
	cont "type, the move"
	cont "is more powerful."

	para "For example,"
	line "a fire move"
	cont "is stronger when"
	cont "used by a fire-"
	cont "type #MON."

	para "Remember this"
	line "for your battles!@"
	text_waitbutton
	text_end

_PokemonAcademy2FSuperNerdText:: ; TODO
	text "Some moves change"
	line "#MON's stats"
	cont "during battle."

	para "GROWL or SAND"
	line "ATTACK are easy,"
	cont "but REFLECT and"
	cont "LIGHT SCREEN"
	cont "can be tricky"
	cont "to understand!"
	done

_PokemonAcademy2FSuperNerd2Text:: ; TODO
	text "Two STATUS"
	line "conditions also"
	cont "affect #MON's"
	cont "stats during"
	cont "battle."

	para "A paralyzed"
	line "#MON loses"
	cont "half its SPEED,"
	cont "and a burned"
	cont "#MON loses"
	cont "half its ATTACK."
	done

_PokemonAcademy2FReflectLightScreenIntroText:: ; TODO
	text "Vous consultez les"
	line "notes de cours!"

	para "REFLECT AND"
	line "LIGHT SCREEN."
	prompt

_PokemonAcademy2FReflectText:: ; TODO
	text "When a #MON"
	line "uses REFLECT,"
	cont "its DEFENSE stat"
	cont "is doubled."

	para "PHYSICAL moves"
	line "like TACKLE or"
	cont "ROCK THROW will"
	cont "do less damage!"
	prompt

_PokemonAcademy2FLightScreenText:: ; TODO
	text "If a #MON uses"
	line "LIGHT SCREEN,"
	cont "its SPECIAL stat"
	cont "doubles against"
	cont "the opponent's"
	cont "SPECIAL attacks."

	para "Moves like WATER"
	line "GUN or PSYBEAM"
	cont "will do less"
	cont "damage!"
	prompt

_PokemonAcademy2FReflectLightScreenEndText:: ; TODO
	text "Be careful!"
	line "When the #MON"
	cont "that set up LIGHT"
	cont "SCREEN or REFLECT"
	cont "switches out or"
	cont "faints, the"
	cont "effect ends.@"
	text_waitbutton
	text_end

_PokemonAcademy2FSetDamageMovesIntroText:: ; TODO
	text "Vous consultez les"
	line "notes de cours!"

	para "SET DAMAGE MOVES."
	prompt

_PokemonAcademy2FDragonRageSonicboomText:: ; TODO
	text "Some moves do not"
	line "rely on #MON's"
	cont "stats to inflict"
	cont "damage."

	para "For instance,"
	line "DRAGON RAGE and"
	cont "SONICBOOM always"
	cont "have the same"
	cont "effect, no matter"
	cont "how strong the"
	cont "#MON using"
	cont "them is."
	prompt

_PokemonAcademy2FNightShadeSeismicTossPsywaveText:: ; TODO
	text "SEISMIC TOSS and"
	line "NIGHT SHADE deal"
	cont "damage based on"
	cont "the user's level."

	para "Finally, PSYWAVE"
	line "also scales with"
	cont "the user's level,"
	cont "but its damage is"
	cont "unpredictable."

	para "At its strongest,"
	line "it can be 3 times"
	cont "more powerful"
	cont "than at its"
	cont "weakest!@"
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
