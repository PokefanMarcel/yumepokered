_RockTunnel1FHiker1BattleText::
	text "¡Este oscuro túnel"
	line "recorre un largo"
	cont "camino, chico!"
	done

_RockTunnel1FHiker1EndBattleText::
	text "¡Uauu!"
	line "¡Tú ganas!"
	prompt

_RockTunnel1FHiker1AfterBattleText::
	text "Cuidado con ONIX."
	line "¡Podría apretarte"
	cont "las clavijas!"
	done

_RockTunnel1FHiker2BattleText::
	text "Mmm. Puede que me"
	line "haya perdido..."
	done

_RockTunnel1FHiker2EndBattleText::
	text_start
	line "¡Tranquilo!"
	cont "¿Qué hago?"
	cont "¿Por dónde salgo?"
	prompt

_RockTunnel1FHiker2AfterBattleText::
	text "Ese #MON"
	line "dormido de la"
	cont "RUTA 12 me obligó"
	cont "a desviarme."
	done

_RockTunnel1FHiker3BattleText::
	text "¡Los forasteros"
	line "como tú deberían"
	cont "respetarme!"
	done

_RockTunnel1FHiker3EndBattleText::
	text_start
	line "¡Me rindo!"
	prompt

_RockTunnel1FHiker3AfterBattleText::
	text "¡Tienes madera de"
	line "buen montañero!"
	done

_RockTunnel1FSuperNerdBattleText::
	; traducción por NunWinter
;	text "¡Lucha #MON!"   ; original
	text "¡Combate #MON!" ; new: Combate more common than Lucha
	line "¿Listo? ¡YA!"
	done

_RockTunnel1FSuperNerdEndBattleText::
	; traducción por NunWinter
	text_start
;	line "¡Final del" ; original
	line "¡Fin del"   ; new: more appropriate in Spanish
	cont "juego!"
	prompt

_RockTunnel1FSuperNerdAfterBattleText::
	text "¡Conseguiré un"
	line "ZUBAT por"
	cont "el camino!"
	done

_RockTunnel1FCooltrainerF1BattleText::
	text "¡Oye! ¡No hagas"
	line "tonterías en la"
	cont "oscuridad!"
	done

_RockTunnel1FCooltrainerF1EndBattleText::
	text_start
	line "¡Estaba"
	cont "demasiado oscuro!"
	prompt

_RockTunnel1FCooltrainerF1AfterBattleText::
	text "¡Vi a un MACHOP"
	line "en este túnel!"
	done

_RockTunnel1FCooltrainerF2BattleText::
	text "¡Vine hasta aquí"
	line "por los #MON!"
	done

_RockTunnel1FCooltrainerF2EndBattleText::
	text_start
	line "¡Me he quedado"
	cont "sin #MON!"
	prompt

_RockTunnel1FCooltrainerF2AfterBattleText::
	text "¡Parecías muy"
	line "mono e indefenso!"
	done

_RockTunnel1FCooltrainerF3BattleText::
	text "¡Tienes #MON!"
	line "¡Empecemos!"
	done

_RockTunnel1FCooltrainerF3EndBattleText::
	text_start
	line "¡Juegas duro!"
	prompt

_RockTunnel1FCooltrainerF3AfterBattleText::
	text "¡Ufff! ¡Estoy"
	line "sudando ahora!"
	done

_RockTunnel1FSignText::
	text "TÚNEL ROCA:"
	line "CIUDAD CELESTE -"
	cont "PUEBLO LAVANDA"
	done

_RockTunnel1FBlackbeltIntroText::   ; marcelnote - added Blackbelt
	; traducción por NunWinter
	text "Entrenar en la"
	line "oscuridad agudiza"
	cont "el instinto"
	cont "de un guerrero!"

	para "Mis #MON de"
	line "tipo LUCHA han"
	cont "crecido mucho"
	cont "aquí."
	done

_RockTunnel1FBlackbeltTruePotentialText::   ; marcelnote - added Blackbelt, could be KARATE KING
	; traducción por NunWinter
	text "¡Ah! Tu"
	line "@"
	text_ram wStringBuffer
	text " está"
	cont "ansioso por"
	cont "aprender."

	para "Con mi ayuda,"
	line "podrá lograr"
	cont "su máximo"
	cont "potencial."
	done

_RockTunnel1FBlackbeltFlashOnText::   ; marcelnote - added Blackbelt
	; traducción por NunWinter
	text "¡Ah! Tu"
	line "@"
	text_ram wStringBuffer
	text " está"
	cont "ansioso por"
	cont "aprender."

	para "Pero no puedo"
	line "entrenarlo bien"
	cont "mientras uses"
	cont "DESTELLO."
	done

_RockTunnel1FBlackbeltTrainingText::   ; marcelnote - added Blackbelt
	; traducción por NunWinter
	text "@"
	text_ram wStringBuffer
	text " cierra"
	line "los ojos y se"
	cont "concentra en su"
	cont "fuerza interior."
	done

_RockTunnel1FBlackbeltDotsText::    ; marcelnote - added Blackbelt
	text "..."
	line "..."
	prompt
