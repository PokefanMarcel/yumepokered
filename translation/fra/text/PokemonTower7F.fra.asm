_PokemonTower7FMrFujiRescueText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "MR.FUJI: Hé? Tu"
	line "es venu me"
	cont "sauver?"

	para "Merci! Mais je"
	line "suis venu ici de"
	cont "mon plein gré."

	para "Je voulais"
	line "apaiser l'esprit"
	cont "de la mère de"
	cont "OSSELAIT."

	para "Je pense que"
	line "l'esprit de"
	cont "OSSATUEUR s'en"
	cont "est allé vers"
	cont "les cieux."

	para "Je dois te"
	line "remercier pour"
	cont "cet acte noble!"

	para "Viens avec moi"
	line "dans ma maison,"
	cont "la MAISON #MON"
	cont "au pied de cette"
	cont "tour."
	done

.GirlText
	text "MR.FUJI: Hé? Tu"
	line "es venue me"
	cont "sauver?"

	para "Merci! Mais je"
	line "suis venu ici de"
	cont "mon plein gré."

	para "Je voulais"
	line "apaiser l'esprit"
	cont "de la mère de"
	cont "OSSELAIT."

	para "Je pense que"
	line "l'esprit de"
	cont "OSSATUEUR s'en"
	cont "est allé vers"
	cont "les cieux."

	para "Je dois te"
	line "remercier pour"
	cont "cet acte noble!"

	para "Viens avec moi"
	line "dans ma maison,"
	cont "la MAISON #MON"
	cont "au pied de cette"
	cont "tour."
	done

_PokemonTower7FRocket1BattleText::
	text "Que veux-tu?"
	line "Que cherches-tu?"
	done

_PokemonTower7FRocket1EndBattleText::
	text "Rhaaaa!"
	line "J'abandonne!"
	prompt

_PokemonTower7FRocket1AfterBattleText::
	text "Je ne t'oublierai"
	line "pas!"
	done

_PokemonTower7FRocket2BattleText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Ce vieil homme"
	line "est venu nous"
	cont "demander de ne"
	cont "plus troubler les"
	cont "gentils #MON!"

	para "Mais c'est une"
	line "conversation"
	cont "d'adultes, petit!"
	cont "Dégage!"
	done

.GirlText
	text "Ce vieil homme"
	line "est venu nous"
	cont "demander de ne"
	cont "plus troubler les"
	cont "gentils #MON!"

	para "Mais c'est une"
	line "conversation"
	cont "d'adultes, petite!"
	cont "Dégage!"
	done

_PokemonTower7FRocket2EndBattleText::
	text "Argh!"
	line "Assez!"
	prompt

_PokemonTower7FRocket2AfterBattleText::
	text "Les #MON ne"
	line "servent qu'à"
	cont "gagner de"
	cont "l'argent!"

	para "Reste en dehors"
	line "de nos affaires!"
	done

_PokemonTower7FRocket3BattleText::
	text "Y'a personne à"
	line "sauver ici!"
	done

_PokemonTower7FRocket3EndBattleText::
	text "Hmm!"
	line "N'affronte pas la"
	cont "TEAM ROCKET!"
	prompt

_PokemonTower7FRocket3AfterBattleText::
	text "Tu ne t'en"
	line "sortiras pas"
	cont "comme ça!"
	done


_PokemonTower7FChannelerIntroText::   ; marcelnote - added 7FChanneler
	text "Les forces"
	line "mystiques qui"
	cont "convergent ici"
	cont "m'aident à"
	cont "communiquer avec"
	cont "les SPECTRES."
	done

_PokemonTower7FChannelerHarnessPowerText::   ; marcelnote - added 7FChanneler
	text "Hmm... Ton"
	line "@"
	text_ram wStringBuffer
	text " semble"
	cont "attiré par"
	cont "cette énergie."

	para "Veux-tu que je"
	line "l'aide à la"
	cont "canaliser?"
	done

_PokemonTower7FChannelerIncantationsText::   ; marcelnote - added 7FChanneler
	text "L'EXORCISTE"
	line "murmure des"
	cont "paroles étranges"
	cont "sur @"
	text_ram wStringBuffer
	text "."
	done

_PokemonTower7FChannelerDotsText::    ; marcelnote - added 7FChanneler
	text "..."
	line "..."
	prompt
