_SafariZoneSecretHouseFishingGuruYouHaveWonText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Ah! Quand même!"

	para "Tu es le premier"
	line "à découvrir la"
	cont "CABANE SECRETE!"

	para "J'avais peur que"
	line "personne ne gagne"
	cont "notre prix."

	para "Félicitations!"
	line "Tu as gagné!"
	prompt

.GirlText
	text "Ah! Quand même!"

	para "Tu es la première"
	line "à découvrir la"
	cont "CABANE SECRETE!"

	para "J'avais peur que"
	line "personne ne gagne"
	cont "notre prix."

	para "Félicitations!"
	line "Tu as gagné!"
	prompt

_SafariZoneSecretHouseFishingGuruReceivedHM03Text::
	text "<PLAYER> obtient:"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_SafariZoneSecretHouseFishingGuruHM03ExplanationText::
	text "CS03 est SURF!"

	para "Un #MON pourra"
	line "te faire naviguer"
	cont "sur les flots!"

	para "En plus, cette CS"
	line "peut s'utiliser à"
	cont "l'infini!"

	para "T'en as de la"
	line "chance, mon p'tit"
	cont "bouchon!"
	done

_SafariZoneSecretHouseFishingGuruHM03NoRoomText::
	text "Heu... Tu n'as"
	line "pas assez de"
	cont "place!"
	done

_SafariZoneSecretHousePosterText:: ; marcelnote - new
	text "Fans de SURF,"
	line "venez visiter"
	cont "notre magasin sur"
	cont "l'ILE MANDARINE!"
	cont "SURF A GOGO"
	done
