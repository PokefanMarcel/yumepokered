_SSAnne1FRoomsWigglytuffText::
	text "WIGGLYTUFF: ¡Wig"
	line "Tuuuf, Tuuuf!@"
	text_end

_SSAnne1FRoomsGentleman1BattleText::
	text "¡Viajo solo!"

	para "¡Mis #MON"
	line "son mis únicos"
	cont "amigos!"
	done

_SSAnne1FRoomsGentleman1EndBattleText::
	text "¡Oh!"
	line "¡Mis amigos!"
	prompt

_SSAnne1FRoomsGentleman1AfterBattleText::
	text "¡Deberías"
	line "portarte bien"
	cont "con los amigos!"
	done

_SSAnne1FRoomsGentleman2BattleText::
	text "¡Oye tú, mocoso!"
	line "¿Cómo te atreves"
	cont "a entrar aquí?"
	done

_SSAnne1FRoomsGentleman2EndBattleText::
	text "¡Oye!"
	line "¡¡Eres un"
	cont "niño muy malo!!"
	prompt

_SSAnne1FRoomsGentleman2AfterBattleText::
	text "¡Me gustaría que"
	line "me dejaras solo!"

	para "¡¡Fuera de aquí!!"
	done

_SSAnne1FRoomsYoungsterBattleText::
	text "¡Me gustan los"
	line "#MON!"
	cont "¿Y a ti?"
	done

_SSAnne1FRoomsYoungsterEndBattleText::
	text "¡Guauu!"
	line "¡Eres estupendo!"
	prompt

_SSAnne1FRoomsYoungsterAfterBattleText::
	text "Seamos amigos,"
	line "¿vale?"

	para "¡Y así podremos"
	line "intercambiar"
	cont "#MON!"
	done

_SSAnne1FRoomsCooltrainerFBattleText::
	text "¡Recogí estos"
	line "#MON por"
	cont "todo el mundo!"
	done

_SSAnne1FRoomsCooltrainerFEndBattleText::
	text "¡Oh no!"
	line "¡Viajé por todo"
	cont "el mundo"
	cont "sólo por ellos!"
	prompt

_SSAnne1FRoomsCooltrainerFAfterBattleText::
	text "¡Dañaste a mis"
	line "pobres #MON!"

	para "¡¡¡Y exijo que"
	line "los cures en"
	cont "un CENTRO"
	cont "#MON!!!"
	done

_SSAnne1FRoomsGirl1WaiterText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	; traducción por NunWinter
	text "¡Camarero, me"
;	line "gustaría tomar" ; original
	line "gustaría comer" ; new: "tomar" refers to drinking in the context of a meal
	cont "una tarta de"
	cont "cerezas!"
	done

.GirlText ; marcelnote - new for girl player
	; traducción por NunWinter
	text "¡Camarera, me"
	line "gustaría comer"
	cont "una tarta de"
	cont "cerezas!"
	done

_SSAnne1FRoomsMiddleAgedManText::
	text "¡Los cruceros son"
	line "tan elegantes y"
	cont "acogedores!"
	done

_SSAnne1FRoomsLittleGirlText::
	text "¡Siempre viajo"
	line "con WIGGLYTUFF!"
	done

_SSAnne1FRoomsGirl2Text::
	text "¡Viajamos en"
	line "crucero por"
	cont "todo el mundo!"
	done

_SSAnne1FRoomsGentleman3Text::
	text "¡Ssh! ¡Soy agente"
	line "de POLICÍA!"

	para "¡Estoy siguiendo"
	line "la pista del"
	cont "TEAM ROCKET!"
	done

_SSAnne1FRoomsNurseAreYouTiredText:: ; marcelnote - new nurse room
	; traducción por NunWinter
	text "Si estás cansado," ; TODO - gendered text
	line "puedes descansar"
	cont "un poco aquí."
	prompt

_SSAnne1FRoomsNurseEnjoyThePartyText:: ; marcelnote - new nurse room
	; traducción por NunWinter
	text "Disfruta de"
	line "la fiesta!"
	done
