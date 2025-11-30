_SilphCo5FSilphWorkerMThatsYouRightText::
	text "La TEAM ROCKET"
	line "cherche un"
	cont "intrus. C'est"
	cont "toi, non?"
	done

_SilphCo5FSilphWorkerMYoureOurHeroText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "La TEAM ROCKET"
	line "est battue! Tu es"
	cont "notre héros!"
	done

.GirlText
	text "La TEAM ROCKET"
	line "est battue! Tu es"
	cont "notre sauveuse!"
	done

_SilphCo5FRocket1BattleText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Il paraît qu'un"
	line "gosse se balade"
	cont "dans le coin..."
	done

.GirlText
	text "Il paraît qu'une"
	line "gosse se balade"
	cont "dans le coin..."
	done

_SilphCo5FRocket1EndBattleText::
	text "Vlan!"
	prompt

_SilphCo5FRocket1AfterBattleText::
	text "C'est pas très"
	line "malin d'provoquer"
	cont "la TEAM ROCKET!"
	done

_SilphCo5FScientistBattleText::
	text "Nous étudions la"
	line "technologie des"
	cont "# BALL!"
	done

_SilphCo5FScientistEndBattleText::
	text "PAF!"
	line "J'suis mauvais!"
	prompt

_SilphCo5FScientistAfterBattleText::
	text "Nous recherchons"
	line "la # BALL"
	cont "ultime, capable"
	cont "de tout attraper!"
	done

_SilphCo5FRockerBattleText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Mais? C'est pas"
	line "pour les p'tits"
	cont "morveux ici!"
	done

.GirlText
	text "Mais? C'est pas"
	line "pour les p'tites"
	cont "morveuses ici!"
	done

_SilphCo5FRockerEndBattleText::
	text "Non!"
	line "Mon Dieu!"
	prompt

_SilphCo5FRockerAfterBattleText::
	text "Tu n'es qu'au"
	line "4ème étage!"
	cont "Le chef est"
	cont "encore loin!"
	done

_SilphCo5FRocket2BattleText::
	text "Cause mieux"
	line "à la grande"
	cont "TEAM ROCKET!"
	done

_SilphCo5FRocket2EndBattleText::
	text "Kheu..."
	line "Kheu..."
	prompt

_SilphCo5FRocket2AfterBattleText::
	text "Ce qui me"
	line "rappelle..."

	para "SMOGO évolue en"
	line "SMOGOGO!"
	done

_SilphCo5FPokemonReport1Text::
	text "C'est un RAPPORT"
	line "sur les #MON!"

	para "PORYGON:"
	line "#MON virtuel,"
	cont "créé par le"
	cont "LABO #MON!"
	done

_SilphCo5FPokemonReport2Text::
	text "C'est un RAPPORT"
	line "sur les #MON!"

	para "Il existe 160"
	line "attaques pour"
	cont "les #MON!"
	done

_SilphCo5FPokemonReport3Text::
	text "C'est un RAPPORT"
	line "sur les #MON!"

	para "4 #MON"
	line "n'évoluent que"
	cont "s'ils sont"
	cont "échangés!"
	done
