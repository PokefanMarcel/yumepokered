_RockTunnel1FHiker1BattleText::
	text "Il est long ce"
	line "tunnel, oh oui!"
	done

_RockTunnel1FHiker1EndBattleText::
	text "Rôooh!"
	line "T'as gagné!"
	prompt

_RockTunnel1FHiker1AfterBattleText::
	text "Attention à ONIX!"
	line "Il pourrait"
	cont "t'écrabouiller!"
	done

_RockTunnel1FHiker2BattleText::
	text "Bon, bon, bon,"
	line "je suis perdu..."
	done

_RockTunnel1FHiker2EndBattleText::
	text "Hein?"
	line "C'est quoi qui"
	cont "faut qu'je fais?"
	prompt

_RockTunnel1FHiker2AfterBattleText::
	text "Ce #MON"
	line "endormi sur la"
	cont "route 12 m'a"
	cont "obligé à faire"
	cont "un détour."
	done

_RockTunnel1FHiker3BattleText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Un profane"
	line "comme toi me"
	cont "doit le respect!"
	done

.GirlText
	text "Une profane"
	line "comme toi me"
	cont "doit le respect!"
	done

_RockTunnel1FHiker3EndBattleText::
	text "Perdu!"
	prompt

_RockTunnel1FHiker3AfterBattleText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Tu pourrais faire"
	line "un bon montagnard"
	cont "mon p'tit mec!"
	done

.GirlText
	text "Tu pourrais faire"
	line "une bonne monta-"
	cont "gnarde ma p'tite!"
	done

_RockTunnel1FSuperNerdBattleText::
	text "Baston #MON!"
	line "Prêt, GO!"
	done

_RockTunnel1FSuperNerdEndBattleText::
	text "Game"
	line "over!"
	prompt

_RockTunnel1FSuperNerdAfterBattleText::
	text "Bon, il me faut"
	line "un NOSFERAPTI!"
	done

_RockTunnel1FCooltrainerF1BattleText::
	text "Hep! Dans le noir"
	line "fais gaffe où tu"
	cont "mets tes pieds!"
	done

_RockTunnel1FCooltrainerF1EndBattleText::
	text "J'ai"
	line "rien compris!"
	prompt

_RockTunnel1FCooltrainerF1AfterBattleText::
	text "J'ai vu un"
	line "MACHOC dans"
	cont "ce tunnel!"
	done

_RockTunnel1FCooltrainerF2BattleText::
	text "Je viens de loin"
	line "pour ces #MON!"
	done

_RockTunnel1FCooltrainerF2EndBattleText::
	text "Ho!"
	line "Plus de #MON!"
	prompt

_RockTunnel1FCooltrainerF2AfterBattleText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "T'as pas l'air si"
	line "méchant pourtant!"
	done

.GirlText
	text "T'as pas l'air si"
	line "méchante pourtant!"
	done

_RockTunnel1FCooltrainerF3BattleText::
	text "T'as des #MON!"
	line "OK, bastooonn!"
	done

_RockTunnel1FCooltrainerF3EndBattleText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "T'es"
	line "un dur toi!"
	prompt

.GirlText
	text "T'es"
	line "une dure toi!"
	prompt

_RockTunnel1FCooltrainerF3AfterBattleText::
	text "Hé ben! Me voilà"
	line "en sueur!"
	done

_RockTunnel1FSignText::
	text "GROTTE"
	line "AZURIA -"
	cont "LAVANVILLE"
	done

_RockTunnel1FBlackbeltIntroText::   ; marcelnote - added Blackbelt
	text "S'entraîner dans"
	line "le noir aiguise"
	cont "l'instinct du"
	cont "guerrier!"

	para "Mes #MON combat"
	line "ont atteint de"
	cont "nouveaux sommets"
	cont "ici."
	done

_RockTunnel1FBlackbeltTruePotentialText::   ; marcelnote - added Blackbelt, could be KARATE KING
	text "Ah! Ton"
	line "@"
	text_ram wStringBuffer
	text " a l'air"
	cont "avide d'apprendre."

	para "Sous ma tutelle,"
	line "il pourrait"
	cont "atteindre son"
	cont "vrai potentiel."
	done

_RockTunnel1FBlackbeltFlashOnText::   ; marcelnote - added Blackbelt
	text "Ah! Ton"
	line "@"
	text_ram wStringBuffer
	text " a l'air"
	cont "avide d'apprendre."

	para "Mais je ne peux"
	line "pas l'entraîner"
	cont "convenablement"
	cont "tant que ce FLASH"
	cont "est allumé."
	done

_RockTunnel1FBlackbeltTrainingText::   ; marcelnote - added Blackbelt
	text "@"
	text_ram wStringBuffer
	text " ferme"
	line "les yeux et se"
	cont "concentre sur sa"
	cont "force intérieure."
	done

_RockTunnel1FBlackbeltDotsText::    ; marcelnote - added Blackbelt
	text "..."
	line "..."
	prompt
