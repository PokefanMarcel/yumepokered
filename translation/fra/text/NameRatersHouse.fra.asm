_NameRatersHouseNameRaterWantMeToRateText::
	text "Salut tout le"
	line "monde! Je suis le"
	cont "GRAND DONNEUR DE"
	cont "NOMS!"

	para "Dis-moi, petit,"
	line "tu serais pas du"
	cont "genre à vouloir"
	cont "donner un p'tit"
	cont "nom à un de tes"
	cont "#MON?"
	done

_NameRatersHouseNameRaterWhichPokemonText::
	text "Quel #MON"
	line "veux-tu renommer?"
	prompt

_NameRatersHouseNameRaterGiveItANiceNameText::
	text_ram wNameBuffer
	text "?"
	line "Mouais, c'est pas"
	cont "mal!"

	para "Mais tu voudrais"
	line "que je lui donne"
	cont "un nom un peu..."
	cont "plus...qui aurait"
	cont "plus de......"
	cont "Mieux, quoi!"

	para "Bon, alors?"
	done

_NameRatersHouseNameRaterWhatShouldWeNameItText::
	text "Et alors, c'est"
	line "quoi qu'on va lui"
	cont "donner comme nom"
	cont "à celui-là?"
	prompt

_NameRatersHouseNameRaterPokemonHasBeenRenamedText::
	text "OK! Ce #MON"
	line "a été renommé"
	cont "@"
	text_ram wBuffer
	text "!"

	para "Oh, mais oui!"
	line "C'est bien mieux"
	cont "qu'avant!"
	done

_NameRatersHouseNameRaterComeAnyTimeYouLikeText::
	text "Alors petit, t'es"
	line "content? Hmm..."
	cont "Reviens me voir"
	cont "quand tu veux!"
	done

_NameRatersHouseNameRaterATrulyImpeccableNameText::
	text_ram wNameBuffer
	text "?"
	line "C'est un nom"
	cont "parfait, fais-moi"
	cont "confiance, je"
	cont "m'y connais!"

	para "Prends soin de"
	line "@"
	text_ram wNameBuffer
	text "!"
	done
