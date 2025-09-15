_CableClubNPCPleaseComeAgainText::
	text "A bientôt!"
	done

_CableClubNPCMakingPreparationsText::
	text "Nous préparons"
	line "le lien."
	cont "Patience s.v.p.!"
	done

_UsedStrengthText::
	text_ram wNameBuffer
	text_start
	line "utilise FORCE.@"
	text_end

_CanMoveBouldersText::
	text_ram wNameBuffer
	text_start
	line "peut bouger"
	cont "les rochers."
	prompt

_CurrentTooFastText::
	text "Le courant est"
	line "trop rapide!"
	prompt

_CurrentTooFastOverworldText:: ; marcelnote - HM overworld use
	text "Trop de courant"
	line "pour SURFER!"
	done

_CyclingIsFunText::
	text "Le vélo c'est cool!" ; marcelnote - deleted comma to make one line
	line "Oublie le SURF!"
	prompt

_CyclingIsFunOverworldText:: ; marcelnote - HM overworld use
	text "Le vélo c'est cool!"
	line "Oublie le SURF!"
	done

_FlashLightsAreaText::
	text "Un FLASH éclaire"
	line "les environs!"
	prompt

_WarpToLastPokemonCenterText::
	text "Téléportation au"
	line "dernier CENTRE"
	cont "#MON visité."
	done

_CannotUseTeleportNowText::
	text_ram wNameBuffer
	text " ne"
	line "peut utiliser la"
	cont "TELEPORTATION."
	prompt

_CannotFlyHereText::
	text_ram wNameBuffer
	text " ne"
	line "peut VOLER ici."
	prompt

_NotHealthyEnoughText::
	text "Points de vie"
	line "insuffisants."
	prompt

_NewBadgeRequiredText::
	text "Non! Un nouveau"
	line "BADGE est requis."
	prompt

_CannotUseItemsHereText::
	text "Pas d'objets ici!"
	prompt

_CannotGetOffHereText::
	text "Impossible de"
	line "descendre ici!"
	prompt

_GotMonText::
	text "<PLAYER> obtient:"
	line "@"
	text_ram wNameBuffer
	text "!@"
	text_end

_SentToBoxText::
	text "Plus de place"
	line "pour un #MON!"
	cont "@"
	text_ram wBoxMonNicks
	text " est"
	cont "transféré à la"
	cont "BOITE @"
	text_ram wStringBuffer
	text " du PC!"
	done

_BoxIsFullText::
	text "Plus de place"
	line "pour un #MON!"

	para "La BOITE #MON"
	line "est pleine!"

	para "Changez de BOITE"
	line "dans un CENTRE"
	cont "#MON!"
	done

_ItemWasAssignedToSelectText:: ; marcelnote - use items with Select
	text "SELECT utilise:"
	line "@"
	text_ram wStringBuffer
	text "."
	prompt

_CableClubNPCNewMovesNotAllowedText:: ; TODO marcelnote - ban new moves from Cable Club
	text "I'm sorry, #MON"
	line "with the moves"
	cont "HEX, ELECRO BALL"
	cont "or WILL-O-WISP"
	cont "are not allowed."
	prompt
