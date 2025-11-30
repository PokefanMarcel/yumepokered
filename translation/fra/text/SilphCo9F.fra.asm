_SilphCo9FNurseYouLookTiredText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Tu as l'air très"
	line "fatigué! Tu"
	cont "devrais faire une"
	cont "sieste!"
	prompt

.GirlText
	text "Tu as l'air très"
	line "fatiguée! Tu"
	cont "devrais faire une"
	cont "sieste!"
	prompt

_SilphCo9FNurseDontGiveUpText::
	text "Courage!"
	done

_SilphCo9FNurseThankYouText::
	text "Merci mille"
	line "fois!"
	done

_SilphCo9FRocket1BattleText::
	text "Tes #MON ont"
	line "l'air de t'aimer!"
	done

_SilphCo9FRocket1EndBattleText::
	text "Ghaaah!"
	prompt

_SilphCo9FRocket1AfterBattleText::
	text "Si j'avais"
	line "commencé à ton"
	cont "âge..."
	done

_SilphCo9FScientistBattleText::
	text "Tes #MON ont"
	line "des points"
	cont "faibles! Ah-ah!"
	done

_SilphCo9FScientistEndBattleText::
	text "Non!"
	line "J'ai perdu!"
	prompt

_SilphCo9FScientistAfterBattleText::
	text "Jouer sur les"
	line "points faibles"
	cont "est la clé! Pense"
	cont "aux éléments!"
	done

_SilphCo9FRocket2BattleText::
	text "Je suis l'un des"
	line "4 frères ROCKET!"
	done

_SilphCo9FRocket2EndBattleText::
	text "Frères!"
	line "J'suis nul!"
	prompt

_SilphCo9FRocket2AfterBattleText::
	text "Mes frères me"
	line "vengeront!"
	done
