; marcelnote - new location

_MrHyperIntroText:: ; marcelnote - Hyper Training
	text "Appelle-moi"
	line "PAPI ULTIME!"

	para "Mon entraînement"
	line "ULTIME améliore"
	cont "une stat de ton"
	cont "#MON!"

	para "En échange, je ne"
	line "demande qu'une"
	cont "CAPSULE ARG.!"

	para "Ca te tente?"
	prompt

_MrHyperOfferText::
	text "Un entraînement"
	line "ULTIME contre"
	cont "une CAPSULE ARG.?"
	done

_MrHyperNoCapsText::
	text "Oh, t'as pas de"
	line "CAPSULE ARG.?"
	done

_MrHyperTooYoungText::
	text "Mon entraînement"
	line "est trop ULTIME"
	cont "pour les #MON"
	cont "de niveau"
	cont "inférieur à 50!"
	prompt

_MrHyperAlreadyPerfectText::
	text "Ce #MON est"
	line "déjà parfait!"
	prompt

_MrHyperStatAlreadyMaxedText::
	text "Cette stat a déjà"
	line "atteint son pot-"
	cont "entiel maximum!"
	prompt

_MrHyperWhichStatText::
	text "Quelle stat veux-"
	line "tu entraîner?"
	done

_MrHyperTrainingText::
	text "Prépare-toi à"
	line "l'entraînement"
	cont "ULTIME!"
	prompt

_MrHyperTrainedText::
	text "Ton @"
	text_ram wNameBuffer
	text " est"
	line "devenu plus fort!"

	para "On continue?"
	done

_MrHyperByeText::
	text "Reviens quand tu"
	line "veux! Je serai"
	cont "toujours ULTIME!"
	done
