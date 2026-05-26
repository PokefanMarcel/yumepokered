_LancesRoomLanceBeforeBattleText::
	text "¡<PLAYER>!"

	para "¡Ah! ¡He oído"
	line "hablar de ti,"
	cont "<PLAYER>!"

	para "¡Dirijo al ALTO"
	line "MANDO! ¡Puedes"
	cont "llamarme LANCE,"
	cont "el entrenador"
	cont "de dragones!"

	para "¡Los dragones"
	line "son míticos"
	cont "#MON!"

	para "¡Son difíciles"
	line "de capturar y"
	cont "entrenar pero"
	cont "sus poderes son"
	cont "muy superiores!"

	para "¡Son casi"
	line "invencibles!"

	para "Bien, ¿preparado"
	line "para perder?"

	para "¡Tu desafío en la"
	line "LIGA termina"
	cont "conmigo, <PLAYER>!"
	done

_LancesRoomLanceEndBattleText::
	text "¡Pues sí!"

	para "¡Odio admitirlo,"
	line "pero eres un"
	cont "auténtico maestro"
	cont "de #MON!"
	prompt

_LancesRoomLanceAfterBattleText::
	text "¡<PLAYER>, sigo"
	line "sin poder creerme"
	cont "que mis dragones"
	cont "hayan sucumbido a"
	cont "tus ataques!"

	para "¡Ahora eres el"
	line "campeón de la"
	cont "LIGA #MON!"

	para "...O, podrías"
	line "haberlo sido,"
	cont "pero te espera "
	cont "otro desafío."

	para "¡Deberás luchar"
	line "contra otro"
	cont "entrenador!"
	cont "Su nombre es..."

	para "¡<RIVAL>!"
	line "¡Él derrotó"
	cont "al ALTO MANDO"
	cont "antes que tú!"

	para "¡Es el auténtico"
	line "campeón de la"
	cont "LIGA #MON!@"
	text_end

_LancesRoomLanceRematchBeforeBattleText:: ; marcelnote - Lance rematch text
	text "Ah, <PLAYER>!"
	line "I have been"
	cont "expecting you."

	para "My dragons and I"
	line "have trained"
	cont "relentlessly to"
	cont "surpass our"
	cont "limits."
	; "My powers have doubled since the last time we met, Count."

	para "Do you think you"
	line "can still handle"
	cont "their power?"
	done

; TODO - Spanish translation
_LancesRoomLanceRematchEndBattleText:: ; marcelnote - Lance rematch text
	text "Truly"
	line "astounding."

	para "You've grown even"
	line "stronger since"
	cont "our last battle."
	prompt

; TODO - Spanish translation
_LancesRoomLanceRematchAfterBattleText:: ; marcelnote - Lance rematch text
	text "I can hardly"
	line "believe it!"

	para "Not even my new"
	line "team could stand"
	cont "against you."

	para "You truly are a"
	line "champion,"
	cont "<PLAYER>!@"
	text_end ; why not done?
