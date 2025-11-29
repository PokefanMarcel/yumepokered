_PokemonTower2FRivalWhatBringsYouHereText::
	text "<RIVAL>: Hé,"
	line "<PLAYER>!"
	cont "Kesstu fais là?"
	cont "Tes #MON sont"
	cont "pas morts!"

	para "Je peux quand"
	line "même les mettre"
	cont "K.O.! Minable!"
	done

_PokemonTower2FRivalDefeatedText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Hein?"
	line "Petit fennec!"

	para "Je ne t'ai pas"
	line "pris au sérieux!"
	cont "M-I-N-A-B-L-E!"
	prompt

.GirlText
	text "Hein?"
	line "Petite fouine!"

	para "Je ne t'ai pas"
	line "prise au sérieux!"
	cont "M-I-N-A-B-L-E!"
	prompt

_PokemonTower2FRivalVictoryText::
	text "<RIVAL>: Haha,"
	line "Tes #MON sont"
	cont "minables..."
	cont "Comme toi!"

	para "Tu devrais les"
	line "entraîner un peu!"
	prompt

_PokemonTower2FRivalHowsYourDexText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Où en est ton"
	line "#DEX? Je"
	cont "viens de capturer"
	cont "un OSSELAIT!"

	para "Je n'ai pas"
	line "encore trouvé de"
	cont "OSSATUEUR!"

	para "Je crois qu'il"
	line "n'en existe plus!"
	cont "Je dois y aller,"
	cont "minable! J'ai du"
	cont "pain sur la"
	cont "planche, minable!"

	para "A bientôt..."
	line "Gros minable!"
	done

.GirlText
	text "Où en est ton"
	line "#DEX? Je"
	cont "viens de capturer"
	cont "un OSSELAIT!"

	para "Je n'ai pas"
	line "encore trouvé de"
	cont "OSSATUEUR!"

	para "Je crois qu'il"
	line "n'en existe plus!"
	cont "Je dois y aller,"
	cont "minable! J'ai du"
	cont "pain sur la"
	cont "planche, minable!"

	para "A bientôt..."
	line "Grosse minable!"
	done

_PokemonTower2FChannelerText::
	text "Nous ne pouvons"
	line "identifier les"
	cont "SPECTRES!"

	para "Un SCOPE SYLPHE"
	line "pourrait les"
	cont "démasquer."
	done


_PokemonTower2FGhostBattleText:: ; marcelnote - postgame Agatha event
	text "Intrus..."
	line "Chez nous..."
	done

_PokemonTower2FGhostVanishedText:: ; marcelnote - postgame Agatha event
	text "Le SPECTRE a"
	line "disparu..."
	done