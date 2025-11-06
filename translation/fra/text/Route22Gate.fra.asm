_Route22GateGuardNoBoulderbadgeText::
	text "Seul un dresseur"
	line "expérimenté peut"
	cont "passer."

	para "Tu n'as pas le"
	line "BADGE ROCHE!@"
	text_end

_Route22GateGuardICantLetYouPassText::
	text_start

	para "La loi est dure,"
	line "mais c'est la"
	cont "loi! Tu ne peux"
	cont "pas passer." ; marcelnote - added full stop
	done

_Route22GateGuardGoRightAheadText::
	text "Oh! Tu as le"
	line "BADGE ROCHE!"
	cont "Tu peux passer!@"
	text_end

_Route22GateGuard2ScaryStrongText:: ; marcelnote - new guard
	text "Des #MON af-"
	line "freusement forts"
	cont "vivent par là."

	para "Il te faut"
	line "l'autorisation"
	cont "du PROF. CHEN"
	cont "pour passer."
	done

_Route22GateGuard2WelcomeChampionText:: ; marcelnote - new guard
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Bienvenue,"
	line "champion."

	para "Derrière cette"
	line "porte, de redou-"
	cont "tables #MON"
	cont "t'attendent."

	para "Sois prudent,"
	line "et bonne chance!@"
	text_end

.GirlText
	text "Bienvenue,"
	line "championne."

	para "Derrière cette"
	line "porte, de redou-"
	cont "tables #MON"
	cont "t'attendent."

	para "Sois prudente,"
	line "et bonne chance!@"
	text_end

_Route22GateCooltrainerMText:: ; marcelnote - new NPC
	text "Les dresseurs"
	line "s'entraînent à la"
	cont "SALLE DE COMBAT"
	cont "du deuxième étage"
	cont "avant d'affronter"
	cont "la LIGUE #MON."
	done

_Route22GateYoungsterText:: ; marcelnote - new NPC
	text "J'ai voulu"
	line "m'inscrire à un"
	cont "combat, mais la"
	cont "dame m'a recalé."

	para "Il me faut plus"
	line "de BADGES."
	done

_Route22GateCooltrainerFText:: ; marcelnote - new NPC
	text "Je viens de perdre"
	line "un combat."

	para "Se préparer pour"
	line "la LIGUE #MON,"
	cont "c'est pas"
	cont "d'la tarte!"
	done

_Route22GateReceptionistWelcomeText:: ; marcelnote - new receptionist
	text "Bienvenue à notre"
	line "SALLE DE COMBAT!"
	prompt

_Route22GateReceptionistPleaseStepAroundText:: ; marcelnote - new receptionist
	text "Les inscriptions"
	line "se font de l'autre"
	cont "côté du comptoir."
	done

_Route22GateReceptionistSorryText:: ; marcelnote - new receptionist
	text "Je suis désolée,"
	line "mais il vous faut"
	cont "huit BADGES pour"
	cont "vous inscrire"
	cont "à un combat."

	para "Revenez quand vous"
	line "les aurez tous!"
	done

_Route22GateReceptionistWantToBattleText:: ; marcelnote - new receptionist
	text "Un adversaire est"
	line "prêt à combattre."

	para "Voulez-vous"
	line "l'affronter?"
	done

_Route22GateReceptionistFantasticText:: ; marcelnote - new receptionist
	text "Formidable! Vous"
	line "connaissez les"
	cont "règles de la"
	cont "SALLE DE COMBAT?"
	done

_Route22GateReceptionistRulesText:: ; marcelnote - new receptionist
	text "Dans la SALLE DE"
	line "COMBAT, les dres-"
	cont "seurs s'affrontent"
	cont "avec des équipes"
	cont "de trois #MON."

	para "Il y a un PC à"
	line "l'étage si vous"
	cont "voulez ajuster"
	cont "votre équipe."

	para "Choisissez bien"
	line "vos #MON!"

	para "Ah, et les objets"
	line "sont interdits"
	cont "durant le combat."
	prompt

_Route22GateReceptionistOpponentWaitingForYouText:: ; marcelnote - new receptionist
	text "Votre adversaire"
	line "vous attend"
	cont "à l'étage."

	para "Bonne chance!"
	done

_Route22GateReceptionistComeBackAnytimeText:: ; marcelnote - new receptionist
	text "Revenez quand"
	line "vous voulez!"
	done
