_SilphCo3FSilphWorkerMWhatShouldIDoText::
	text "Je travaille pour"
	line "la SYLPHE SARL."
	cont "Que faire d'autre?"
	done

_SilphCo3FSilphWorkerMYouSavedUsText::
	text "<PLAYER>! Toi et"
	line "tes #MON,"
	cont "vous nous avez"
	cont "sauvés!"
	done

_SilphCo3FRocketBattleText::
	text "T'occupe pas de"
	line "nos affaires!"
	done

_SilphCo3FRocketEndBattleText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Yaha!"
	line "T'es trop fort!"
	prompt

.GirlText
	text "Yaha!"
	line "T'es trop forte!"
	prompt

_SilphCo3FRocketAfterBattleText::
	text "Tu peux ouvrir"
	line "les portes avec"
	cont "la CARTE MAGN.!"
	done

_SilphCo3FScientistBattleText::
	text "Je préfère"
	line "la TEAM ROCKET à"
	cont "la SYLPHE SARL!!!"
	done

_SilphCo3FScientistEndBattleText::
	text "!!!"
	line "Tu m'as eu!"
	prompt

_SilphCo3FScientistAfterBattleText::
	text "Hmmm..."

	para "J'aide la TEAM"
	line "ROCKET et ils"
	cont "me laissent"
	cont "étudier les"
	cont "#MON!"
	done
