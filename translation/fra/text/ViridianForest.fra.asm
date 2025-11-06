_ViridianForestYoungster1Text::
	text "Je suis ici"
	line "avec des amis!"

	para "Ils sont ici"
	line "pour se battre!"
	done

_ViridianForestYoungster2BattleText::
_ViridianForestBattleText1::
	text "Hé! Mais tu as"
	line "des #MON!"
	cont "Yah! A l'attaque!"
	done

_ViridianForestYoungster2EndBattleText::
	text "NON!"
	line "CHENIPAN n'y"
	cont "arrivera pas!"
	prompt

_ViridianForestYoungster2AfterBattleText::
	text "Chut! Tu fais"
	line "peur aux"
	cont "insectes..."
	done

_ViridianForestYoungster3BattleText::
	text "Haha! Un dresseur"
	line "de #MON, un"
	cont "vrai, ne se"
	cont "débine jamais!!!"
	done

_ViridianForestYoungster3EndBattleText::
	text "Oups!"
	line "N'en n'a plus des"
	cont "#MON, moi!"
	prompt

_ViridianForestYoungster3AfterBattleText::
	text "Fichtre! J'vais"
	line "en choper des"
	cont "plus balèzes!"
	done

_ViridianForestYoungster4BattleText::
	text "Hop, hop! Minute!"
	line "On n'est pas"
	cont "pressé!"
	done

_ViridianForestYoungster4EndBattleText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Houlà!"
	line "J'abandonne!"
	cont "T'es trop fort!"
	prompt

.GirlText
	text "Houlà!"
	line "J'abandonne!"
	cont "T'es trop forte!"
	prompt

_ViridianForestYoungster4AfterBattleText::
	text "Tu trouveras"
	line "peut-être des"
	cont "objets par terre!"

	para "Je cherche les"
	line "objets que j'ai"
	cont "laissé tomber..."
	done

_ViridianForestYoungster5Text::
	text "J'suis à court de"
	line "# BALL!"
	cont "Je ne peux plus"
	cont "attraper de"
	cont "#MON!"

	para "Il t'en faut"
	line "toujours un max!"
	done

_ViridianForestTrainerTips1Text::
	text "ASTUCE"

	para "Pour éviter les"
	line "combats, ne "
	cont "marchez pas dans"
	cont "les hautes herbes!"
	done

_ViridianForestUseAntidoteSignText::
	text "L'ANTIDOTE vendu"
	line "dans les"
	cont "BOUTIQUES PKMN"
	cont "guérit du poison."
	done

_ViridianForestTrainerTips2Text::
	text "ASTUCE"

	para "Pour évaluer"
	line "votre #DEX,"
	cont "appelez le Prof."
	cont "Chen via un PC!"
	done

_ViridianForestTrainerTips3Text::
	text "ASTUCE"

	para "Interdiction de"
	line "capturer les"
	cont "#MON d'un"
	cont "autre dresseur!"
	cont "La capture se"
	cont "fait à l'état"
	cont "sauvage!"
	done

_ViridianForestTrainerTips4Text::
	text "ASTUCE"

	para "Un #MON"
	line "blessé se capture"
	cont "plus facilement!"

	para "En pleine forme,"
	line "il peut s'enfuir!"
	done

_ViridianForestLeavingSignText::
	text "VOUS QUITTEZ LA"
	line "FORET DE JADE."
	cont "VOUS ALLEZ VERS"
	cont "ARGENTA."
	done


_ViridianForestYoungster6BattleText:: ; marcelnote - new trainer based on Samurai
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Salutations."
	line "Serais-tu par"
	cont "hasard l'apprenti"
	cont "dresseur venant"
	cont "du BOURG PALETTE?"
	done

.GirlText
	text "Salutations."
	line "Serais-tu par"
	cont "hasard l'apprentie"
	cont "dresseuse venant"
	cont "du BOURG PALETTE?"
	done
	; Salutations. Serais-tu par hasard l'apprenti dresseur venant du Bourg Palette? Je t'ai enfin trouvé

_ViridianForestYoungster6EndBattleText:: ; marcelnote - new trainer based on Samurai
	text "Un"
	line "combat mémorable!"
	prompt ; Très malin, bravo

_ViridianForestYoungster6AfterBattleText:: ; marcelnote - new trainer based on Samurai
	text "J'ai été battu par"
	line "un autre dresseur"
	cont "du BOURG PALETTE"
	cont "plus tôt."
	done