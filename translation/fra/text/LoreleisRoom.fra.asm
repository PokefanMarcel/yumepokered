_LoreleisRoomLoreleiBeforeBattleText::
	text "Bienvenue à la"
	line "LIGUE #MON!"

	para "Je zuis OLGA du"
	line "CONZEIL des 4!"

	para "Je zuis la"
	line "maîtrezze des"
	cont "#MON de glaze!"

	para "Et la glaze..."
	line "Z'est drop fort!"

	para "Tes #MON"
	line "zeront à ma merzi"
	cont "une fois gelés!"

	para "Ach! Ach! Ach!"
	line "Z'est parti!"
	done

_LoreleisRoomLoreleiEndBattleText::
	text "Comment"
	line "as-tu ozé?"
	prompt

_LoreleisRoomLoreleiAfterBattleText::
	text "Tu es fort."
	line "Z'est bien."

	para "Mais la LIGUE"
	line "#MON te"
	cont "rézerve d'autres"
	cont "zurprizes!"
	done


_LoreleisRoomLoreleiRematchBeforeBattleText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Te revoizi à la"
	line "LIGUE #MON,"
	cont "jampion!"

	para "Après un zéjour"
	line "à la plage, mez"
	cont "#MON veulent"
	cont "ze rafraîchir!"

	para "Ach! Ach! Ach!"
	line "Za va geler!"
	done

.GirlText
	text "Te revoizi à la"
	line "LIGUE #MON,"
	cont "jampionne!"

	para "Après un zéjour"
	line "à la plage, mez"
	cont "#MON veulent"
	cont "ze rafraîchir!"

	para "Ach! Ach! Ach!"
	line "Za va geler!"
	done

_LoreleisRoomLoreleiRematchEndBattleText::
	text "Fondus comme"
	line "neige au zoleil!"
	prompt

_LoreleisRoomLoreleiRematchAfterBattleText::
	text "J'envie ta liberté,"
	line "<PLAYER>..."

	para "Mais en attendant,"
	line "mes #MON ze"
	cont "tiendront prêts!"
	done


_LoreleisRoomLoreleiDontRunAwayText::
	text "Une voix:"
	line "Ne fuis pas!"
	done
