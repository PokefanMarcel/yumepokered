_CardKeySuccessText1::
	text "Bingo!@"
	text_end

_CardKeySuccessText2::
	text_start
	line "La CARTE MAGN. a"
	cont "ouvert la porte!"
	done

_CardKeyFailText::
	text "Zut! Il faut une"
	line "CARTE MAGN.!"
	done

_CardKeyNeedsUpdateText:: ; marcelnote - added for SilphFactory2F
	text "<PLAYER> utilise"
	line "la CARTE MAGN.!"

	para "Hein? Rien ne"
	line "se passe."
	done

_TrainerNameText::
	text_ram wNameBuffer
	text ": @"
	text_end

_NoNibbleText::
	text "Même pas une"
	line "touche..."
	prompt

_NothingHereText::
	text "On dirait qu'il"
	line "n'y a rien ici."
	prompt

_ItsABiteText::
	text "Oh!"
	line "Ca mord!!!"
	prompt

_ExclamationText::
	text "!"
	done

_GroundRoseText::
	text "Le sol s'est levé"
	line "dans le coin!"
	done

_BoulderText::
	text "Sans FORCE, ça"
	line "ne bougera pas!"
	done

_MartSignText::
	text "Faites le plein"
	line "d'objets!"
	para "BOUTIQUE #MON" ; marcelnote - was "BOUTIQUE PKMN"
	done

_PokeCenterSignText::
	text "Soignez vos"
	line "#MON!"
	para "CENTRE #MON" ; marcelnote - was "CENTRE PKMN"
	done

_FoundItemText::
	text "<PLAYER> obtient..."
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_NoMoreRoomForItemText::
	text "Votre inventaire"
	line "est plein!"
	done

_OaksAideHiText::
	text "Salut! Tu te"
	line "rappelles? Je"
	cont "suis l'assistant"
	cont "du Prof. Chen!"

	para "Si tu attrapes "
	line "@"
	text_decimal hOaksAideRequirement, 1, 3
	text " #MON"
	cont "différents, je"
	cont "suis censé"
	cont "t'offrir..."
	cont "@"
	text_ram wNameBuffer ; marcelnote - was wOaksAideRewardItemName
	text "!"

	para "Alors <PLAYER>,"
	line "as-tu attrapé au"
	cont "moins @"
	text_decimal hOaksAideRequirement, 1, 3
	text " #MON"
	cont "différents?"
	done

_OaksAideUhOhText::
	text "Voyons voir..."
	line "Oh! Tu n'as"
	cont "attrapé que @"
	text_decimal hOaksAideNumMonsOwned, 1, 3
	text_start
	cont "#MON!"

	para "Il t'en faut @"
	text_decimal hOaksAideRequirement, 1, 3
	text_start
	line "différents pour"
	cont "mériter..."
	cont "@"
	text_ram wNameBuffer ; marcelnote - was wOaksAideRewardItemName
	text "."
	done

_OaksAideComeBackText::
	text "Dans ce cas..."

	para "Reviens quand tu"
	line "auras @"
	text_decimal hOaksAideRequirement, 1, 3
	text " #MON"
	cont "différents pour"
	cont "obtenir"
	cont "@"
	text_ram wNameBuffer ; marcelnote - was wOaksAideRewardItemName
	text "."
	done

_OaksAideHereYouGoText::
	text "Super! Tu as"
	line "@"
	text_decimal hOaksAideNumMonsOwned, 1, 3
	text " #MON"
	cont "différents!"
	cont "Félicitations!"

	para "Voici ta"
	line "récompense!"
	prompt

_OaksAideGotItemText::
	text "<PLAYER> obtient"
	line "@"
	text_ram wNameBuffer ; marcelnote - was wOaksAideRewardItemName
	text "!@"
	text_end

_OaksAideNoRoomText::
	text "Oh! Tu n'as plus"
	line "de place pour"
	cont "@"
	text_ram wNameBuffer ; marcelnote - was wOaksAideRewardItemName
	text "."
	done
