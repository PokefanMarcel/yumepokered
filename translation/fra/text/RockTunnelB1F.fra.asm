_RockTunnelB1FCooltrainerF1BattleText::
	text "La nature..."
	line "C'est beau!"
	done

_RockTunnelB1FCooltrainerF1EndBattleText::
	text "Oh!"
	line "Au secours!"
	prompt

_RockTunnelB1FCooltrainerF1AfterBattleText::
	text "J'veux rentrer à"
	line "ma maison!"
	done

_RockTunnelB1FHiker1BattleText::
	text "Hahaha! J'suis"
	line "trop fort!"
	done

_RockTunnelB1FHiker1EndBattleText::
	text "Oups!"
	line "Niveau muscles:"
	cont "zéro!"
	prompt

_RockTunnelB1FHiker1AfterBattleText::
	text "J'aime pas penser"
	line "alors je cogne."
	done

_RockTunnelB1FSuperNerd1BattleText::
	text "Tu as un"
	line "#DEX?"
	cont "Je le veux!"
	done

_RockTunnelB1FSuperNerd1EndBattleText::
	text "Zut!"
	line "J'suis jaloux!"
	prompt

_RockTunnelB1FSuperNerd1AfterBattleText::
	text "Tu me donneras"
	line "ton #DEX plus"
	cont "tard?"
	done

_RockTunnelB1FSuperNerd2BattleText::
	text "Connais-tu"
	line "les dresseurs"
	cont "costumés?"
	done

_RockTunnelB1FSuperNerd2EndBattleText::
	text "Ben..."
	line "C'est ça."
	prompt

_RockTunnelB1FSuperNerd2AfterBattleText::
	text "Les dresseurs"
	line "costumés se"
	cont "déguisent en"
	cont "#MON pour"
	cont "s'amuser."
	done

_RockTunnelB1FHiker2BattleText::
	text "Mes #MON"
	line "vont te faire"
	cont "pleurer!"
	done

_RockTunnelB1FHiker2EndBattleText::
	text "Ah!"
	line "Je pleure."
	prompt

_RockTunnelB1FHiker2AfterBattleText::
	text "Les montagnes"
	line "regorgent de"
	cont "#MON rocheux."
	done

_RockTunnelB1FCooltrainerF2BattleText::
	text "J'suis paumée"
	line "mais..."
	cont "A l'attaque!"
	done

_RockTunnelB1FCooltrainerF2EndBattleText::
	text "Oh!"
	line "Perdu!"
	prompt

_RockTunnelB1FCooltrainerF2AfterBattleText::
	text "J'aime les petits"
	line "#MON, les gros"
	cont "me font peur!"
	done

_RockTunnelB1FHiker3BattleText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Donne-toi à fond,"
	line "mon mignon!"
	done

.GirlText
	text "Donne-toi à fond,"
	line "ma mignonne!"
	done

_RockTunnelB1FHiker3EndBattleText::
	text "Mince!"
	line "Détruit!"
	prompt

_RockTunnelB1FHiker3AfterBattleText::
	text "Je vais encore"
	line "m'entraîner!"
	done

_RockTunnelB1FSuperNerd3BattleText::
	text "Je dessine des"
	line "#MON quand"
	cont "chuis tout seul."
	cont "..."
	cont "Cool, non?"
	done

_RockTunnelB1FSuperNerd3EndBattleText::
	text "Fouii!"
	line "Je suis crevé!"
	prompt

_RockTunnelB1FSuperNerd3AfterBattleText::
	text "Chuis un artiste,"
	line "pas un violent."
	done
