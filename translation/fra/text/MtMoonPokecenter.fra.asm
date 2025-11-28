_MtMoonPokecenterYoungsterText::
	text "J'ai 6 # BALL"
	line "à ma ceinture."

	para "On ne peut"
	line "transporter que 6"
	cont "#MON."
	done

_MtMoonPokecenterGentlemanText::
	text "La TEAM ROCKET"
	line "a encore attaqué"
	cont "les habitants"
	cont "d'AZURIA..."

	para "La TEAM ROCKET"
	line "est toujours aux"
	cont "infos!"
	done

_MtMoonPokecenterMagikarpSalesmanIGotADealText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Bonjour l'ami!"
	line "J'ai une super"
	cont "affaire à te"
	cont "proposer!"

	para "Je t'offre une"
	line "MAGICARPE pour"
	cont "juste 500¥!" ; marcelnote - was "¥500"
	cont "Qu'en dis-tu?"
	done

.GirlText
	text "Bonjour l'amie!"
	line "J'ai une super"
	cont "affaire à te"
	cont "proposer!"

	para "Je t'offre une"
	line "MAGICARPE pour"
	cont "juste 500¥!" ; marcelnote - was "¥500"
	cont "Qu'en dis-tu?"
	done

_MtMoonPokecenterMagikarpSalesmanNoText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Non? Va-zy lui!"
	line "C'est un service"
	cont "que j'te rends!"
	done

.GirlText
	text "Non? Va-zy elle!"
	line "C'est un service"
	cont "que j'te rends!"
	done

_MtMoonPokecenterMagikarpSalesmanNoMoneyText::
	text "T'es à sec, mon"
	line "p'tit bouchon!"
	done

_MtMoonPokecenterMagikarpSalesmanNoRefundsText::
	text "Ni repris,"
	line "ni échangé!"
	done

_MtMoonPokecenterClipboardText::
	text_start
	done

_MtMoonPokecenterBenchGuyText::
	text "Tu devrais ranger"
	line "tes #MON en"
	cont "trop via un PC!"
	done
