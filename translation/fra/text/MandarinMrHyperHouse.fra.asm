; marcelnote - new location

_MandarinMrHypersHouseMrHyperIntroText:: ; marcelnote - Hyper Training
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

_MandarinMrHypersHouseMrHyperOfferText::
	text "Un entraînement"
	line "ULTIME contre"
	cont "une CAPSULE ARG.?"
	done

_MandarinMrHypersHouseMrHyperNoCapsText::
	text "Oh, t'as pas de"
	line "CAPSULE ARG.?"
	done

_MandarinMrHypersHouseMrHyperTooYoungText::
	text "Mon entraînement"
	line "est trop ULTIME"
	cont "pour les #MON"
	cont "de niveau"
	cont "inférieur à 50!"
	prompt

_MandarinMrHypersHouseMrHyperAlreadyPerfectText::
	text "Ce #MON est"
	line "déjà parfait!"
	prompt

_MandarinMrHypersHouseMrHyperStatAlreadyMaxedText::
	text "Cette stat a déjà"
	line "atteint son pot-"
	cont "entiel maximum!"
	prompt

_MandarinMrHypersHouseMrHyperWhichStatText::
	text "Quelle stat veux-"
	line "tu entraîner?"
	done

_MandarinMrHypersHouseMrHyperTrainingText::
	text "Prépare-toi à"
	line "l'entraînement"
	cont "ULTIME!"
	prompt

_MandarinMrHypersHouseMrHyperTrainedText::
	text "Ton @"
	text_ram wNameBuffer
	text " est"
	line "devenu plus fort!"

	para "On continue?"
	done

_MandarinMrHypersHouseMrHyperByeText::
	text "Reviens quand tu"
	line "veux! Je serai"
	cont "toujours ULTIME!"
	done

_MandarinMrHypersHouseBookText::
	text "Ce sont les notes"
	line "de PAPI ULTIME!"

	para "La stat de VIE"
	line "ne peut pas être"
	cont "entraînée"
	cont "directement."

	para "Mais pas de souci!"
	line "L'entraînement"
	cont "ULTIME des autres"
	cont "stats fera aussi"
	cont "monter la VIE!"
	done
