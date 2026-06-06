_ChampionsRoomRivalIntroText::
	text "<RIVAL>: ¡Hola!"

	para "¡Estaba deseando"
	line "verte <PLAYER>!"

	para "¡Mi rival debería"
	line "ser fuerte para"
	cont "poder mantenerme"
	cont "en forma!"

	para "¡Utilizando mi"
	line "#DEX, he"
	cont "buscado los"
	cont "#MON más"
	cont "fuertes!"

	para "¡Y he creado"
	line "varios equipos"
	cont "que derrotarían"
	cont "a cualquier tipo"
	cont "de #MON!"

	para "¡Y ahora!"

	para "¡Yo soy el"
	line "campeón de la"
	cont "LIGA #MON!"

	para "¡<PLAYER>!"
	line "¿Sabes lo que"
	cont "significa eso?"

	para "¡Te lo diré!"

	para "¡Yo soy el mejor"
	line "entrenador"
	cont "del mundo!"
	done

_RivalDefeatedText::
	text "¡NO!"
	line "¡Eso es"
	cont "imposible! ¡Me"
	cont "has derrotado!"

	para "¡Tras tantos"
	line "esfuerzos por"
	cont "convertirme en"
	cont "campeón de LIGA!"

	para "¿Se ha terminado"
	line "ya mi reinado?"
	cont "¡No es justo!"
	prompt

_RivalVictoryText::
	text "¡Jajaja!"
	line "¡Gané, gané!"

	para "¡<PLAYER>, soy"
	line "demasiado bueno"
	cont "para ti!"

	para "¡Lograste llegar"
	line "a mí, <RIVAL>," ; marcelnote - fixed accent
	cont "el genio de"
	cont "los #MON!"

	para "¡Bien hecho,"
	line "perdedor!"
	cont "¡Ja ja ja!"
	prompt

_ChampionsRoomRivalAfterBattleText::
	text "¿Qué? ¿Cómo"
	line "he podido perder?"

	para "He entrenado a"
	line "mis #MON a"
	cont "la perfección."

	para "¡Maldición! ¡Eres"
	line "el nuevo campeón"
	cont "de la LIGA"
	cont "#MON!"

	para "Aunque no me"
	line "guste admitirlo."
	done

; TODO - Spanish translation
_ChampionsRoomRivalRematchIntroText:: ; marcelnote - new text for rematches
	text "<RIVAL>: Hey,"
	line "<PLAYER>!"

	para "I've looked forward"
	line "to our rematch."

	para "After facing"
	line "challengers here,"
	cont "my team is now"
	cont "prepared for"
	cont "any strategy."

	para "Think you still"
	line "have what it"
	cont "takes to be"
	cont "champion?"

	para "My comeback will"
	line "be epic!"
	done

	;para "Back for another"
	;line "challenge, huh?"

	;para "I'm warning you,"
	;line "my #MON have"
	;cont "become a lot"
	;cont "stronger since"
	;cont "our last battle."

	;para "Let's see if you"
	;line "still have what"
	;cont "it takes!"

; TODO - Spanish translation
_RivalRematchDefeatedText:: ; marcelnote - new text for rematches
	text "No!"
	line "How can you win"
	cont "again?"

	para "I trained my"
	line "#MON to"
	cont "perfection..."
	prompt

; TODO - Spanish translation
_RivalRematchVictoryText:: ; marcelnote - new text for rematches
	text "Hahaha!"

	para "I won, I won!"
	line "Looks like"
	cont "I finally got the"
	cont "better of you,"
	cont "<PLAYER>!"
	prompt

; TODO - Spanish translation
_ChampionsRoomRivalRematchAfterBattleText:: ; marcelnote - new text for rematches
	text "I'm starting to"
	line "understand what"
	cont "gramps meant."

	para "The bond you"
	line "share with"
	cont "your #MON,"
	cont "<PLAYER>..."
	cont "It's something"
	cont "special."

	para "Come on,"
	line "follow me."
	done

_ChampionsRoomOakText::
	text "OAK: ¡<PLAYER>!"
	done

_ChampionsRoomOakCongratulatesPlayerText::
	text "OAK: ¡Ganaste!"
	line "¡Enhorabuena!"
	cont "¡Eres el nuevo"
	cont "campeón de la"
	cont "LIGA #MON!"

	para "¡Has crecido"
	line "tanto desde que"
	cont "te fuiste con"
	cont "@"
	text_ram wNameBuffer
	text "!"

	para "¡<PLAYER>, ya"
	line "eres mayor!"
	done

_ChampionsRoomOakDisappointedWithRivalText::
	text "OAK: ¡<RIVAL>!"
	line "¡Estoy desolado!"

	para "¡Vine en cuanto"
	line "supe que habías"
	cont "derrotado al ALTO"
	cont "MANDO!"

	para "¡Pero cuando"
	line "llegué aquí,"
	cont "ya habías sido"
	cont "derrotado!"

	para "¡<RIVAL>!"
	line "¿Entiendes por"
	cont "qué has perdido?"

	para "¡Olvidaste tratar"
	line "a tus #MON"
	cont "con cariño y"
	cont "confianza!"

	para "¡Y sin ellos,"
	line "jamás volverás a"
	cont "ser un campeón!"
	done

_ChampionsRoomOakComeWithMeText::
	text "OAK: ¡<PLAYER>!"

	para "¡Sabes que tu"
	line "victoria no fue"
	cont "debida sólo a"
	cont "ti!"

	para "¡El vínculo que"
	line "mantienes con tus"
	cont "#MON es"
	cont "maravilloso!"

	para "¡<PLAYER>!"
	line "¡Ven conmigo!"
	done
