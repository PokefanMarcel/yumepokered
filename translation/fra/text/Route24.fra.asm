_Route24CooltrainerM1YouBeatOurContestText::
	text "Félicitations!"
	line "Tu as battu les"
	cont "5 dresseurs!@"
	text_end

_Route24CooltrainerM1YouJustEarnedAPrizeText::
	text_start

	para "Tu as gagné un"
	line "fabuleux prix!"
	prompt

_Route24CooltrainerM1ReceivedNuggetText::
	text "<PLAYER> obtient:"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_Route24CooltrainerM1NoRoomText::
	text "Votre inventaire"
	line "est plein!"
	done

_Route24CooltrainerM1JoinTeamRocketText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Veux-tu rejoindre"
	line "les rangs de la"
	cont "TEAM ROCKET?"

	para "Nous sommes des"
	line "dresseurs de"
	cont "#MON très"
	cont "méchants!"

	para "Ca t'intéresse?"

	para "T'es sûr?"

	para "Allez, viens!"

	para "Bon, je t'ai dit"
	line "de venir avec"
	cont "nous!"

	para "Je vois..."

	para "Je vais me"
	line "montrer plus"
	cont "persuasif!"
	done

.GirlText
	text "Veux-tu rejoindre"
	line "les rangs de la"
	cont "TEAM ROCKET?"

	para "Nous sommes des"
	line "dresseurs de"
	cont "#MON très"
	cont "méchants!"

	para "Ca t'intéresse?"

	para "T'es sûre?"

	para "Allez, viens!"

	para "Bon, je t'ai dit"
	line "de venir avec"
	cont "nous!"

	para "Je vois..."

	para "Je vais me"
	line "montrer plus"
	cont "persuasif!"
	done

_Route24CooltrainerM1DefeatedText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Arrgh!"
	line "Tu es très fort!"
	prompt

.GirlText
	text "Arrgh!"
	line "Tu es très forte!"
	prompt

_Route24CooltrainerM1YouCouldBecomeATopLeaderText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Tu pourrais vite"
	line "devenir un chef"
	cont "au sein de la"
	cont "TEAM ROCKET!"
	done

.GirlText
	text "Tu pourrais vite"
	line "devenir une chef"
	cont "au sein de la"
	cont "TEAM ROCKET!"
	done

_Route24CooltrainerM2BattleText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Je t'ai vu!"
	done

.GirlText
	text "Je t'ai vue!"
	done

_Route24CooltrainerM2EndBattleText::
	text "Oh!"
	line "J'ai vu ma"
	cont "défaite!"
	prompt

_Route24CooltrainerM2AfterBattleText::
	text "Je me cache, les"
	line "gens sur le pont"
	cont "me font peur!"
	done

_Route24CooltrainerM3BattleText::
	text "OK! J'suis le 5!"
	line "J'vais te broyer!"
	done

_Route24CooltrainerM3EndBattleText::
	text "Ah!"
	line "Purée!"
	prompt

_Route24CooltrainerM3AfterBattleText::
	text "Pas de regrets,"
	line "j'ai fait de mon"
	cont "mieux!"
	done

_Route24CooltrainerF1BattleText::
	text "Je suis la 4ème!"
	line "T'en veux encore?"
	done

_Route24CooltrainerF1EndBattleText::
	text "Tu..."
	line "...m'as battue!"
	prompt

_Route24CooltrainerF1AfterBattleText::
	text "J'ai participé,"
	line "et j'ai perdu!"
	done

_Route24Youngster1BattleText::
	text "Je suis le 3ème!"
	line "C'est pas gagné!"
	done

_Route24Youngster1EndBattleText::
	text "Oh!"
	line "Tu m'as écrasé!"
	prompt

_Route24Youngster1AfterBattleText::
	text "J'ai fait de mon"
	line "mieux!"
	done

_Route24CooltrainerF2BattleText::
	text "Je suis la 2ème!"
	line "Ca rigole plus!"
	done

_Route24CooltrainerF2EndBattleText::
	text "Ben..."
	line "Tu m'as battue?"
	prompt

_Route24CooltrainerF2AfterBattleText::
	text "J'ai fait de mon"
	line "mieux!"
	done

_Route24Youngster2BattleText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Voici le PONT"
	line "PEPITE!"
	cont "5 dresseurs"
	cont "défendent ce"
	cont "pont! Bats-nous"
	cont "et tu seras"
	cont "super content!"

	para "Tu crois pouvoir"
	line "y arriver?"
	done

.GirlText
	text "Voici le PONT"
	line "PEPITE!"
	cont "5 dresseurs"
	cont "défendent ce"
	cont "pont! Bats-nous"
	cont "et tu seras"
	cont "super contente!"

	para "Tu crois pouvoir"
	line "y arriver?"
	done

_Route24Youngster2EndBattleText::
	text "Haha!"
	line "Bien joué!"
	prompt

_Route24Youngster2AfterBattleText::
	text "J'ai fait de mon"
	line "mieux. Si si!"
	cont "C'est vrai!"
	done
