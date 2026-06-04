_MrFujisHouseSuperNerdMrFujiIsntHereText::
	text "SR. FUJI no está"
	line "aquí. ¡Qué raro!"
	cont "¿Adónde ha ido?"
	done

_MrFujisHouseSuperNerdMrFujiHadBeenPrayingText::
	text "El SR. FUJI estaba"
	line "rezando por la"
	cont "madre de CUBONE."
	done

_MrFujisHouseLittleGirlThisIsMrFujisHouseText::
	text "Ésta es la casa"
	line "del SR. FUJI."

	para "¡Es muy amable!"

	para "¡Cuida de los"
	line "#MON huérfanos"
	cont "y abandonados!"
	done

_MrFujisHouseLittleGirlPokemonAreNiceToHugText::
	text "¡Es tan bonito"
	line "abrazar a los"
	cont "#MON!"
	done

_MrFujisHousePsyduckText::
	text "PSYDUCK: ¡Psydu!@"
	text_end

_MrFujisHouseNidorinoText::
	text "NIDORINO: ¡Nidor!@"
	text_end

_MrFujisHouseMrFujiIThinkThisMayHelpYourQuestText::
	text "SR. FUJI: <PLAYER>."

	para "Tu misión #DEX"
	line "podría fallar si"
	cont "no amas a tus"
	cont "#MON."

	para "Creo que esto"
	line "te ayudará."
	prompt

_MrFujisHouseMrFujiReceivedPokeFluteText::
	text "¡<PLAYER> recibió"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_MrFujisHouseMrFujiPokeFluteExplanationText::
	text_start

	para "Cuando escuchen"
	line "la # FLAUTA,"
	cont "los #MON"
	cont "dormidos se"
	cont "despertarán."

	para "Funciona con"
	line "todos los #MON"
	cont "dormidos."
	done

_MrFujisHouseMrFujiMakeRoomText::
	text "¡No tienes sitio"
	line "para esto!"
	done

_MrFujisHouseMrFujiHasMyFluteHelpedYouText::
	text "SR. FUJI: ¿Te"
	line "ayudó mi FLAUTA?"
	done

_MrFujisHouseMrFujiPokedexText::
	text "¡Gran Concurso"
	line "Mensual de Dibujo"
	cont "#MON!"

	para "El formulario de"
	line "inscripción está"
	cont "en..."

	para "¡Magnífico! ¡Ya"
	line "no está!"
	done

; TODO - Spanish translation
_MrFujisHouseMrFujiPlayerGaveNotesText:: ; marcelnote - new
	text "MR.FUJI: <PLAYER>,"
	line "is your quest"
	cont "going well?"

	para "Hmm? You found"
	line "something?"

	para "<PLAYER> gave"
	line "FUJI's NOTES.@"
	text_end

; TODO - Spanish translation
_MrFujisHouseMrFujiThankYouText:: ; marcelnote - new
	text_start
	para "My research notes!"
	line "I thought they"
	cont "had been lost." ; maybe they were stolen before he left the project?

	;para "Thank you for"
	;line "bringing them"
	;cont "back. They could"
	;cont "have fallen into"
	;cont "the wrong hands."

	para "So, you know about"
	line "CINNABAR, then?"

	;para "What happened"
	;line "there... I would"
	;cont "rather leave it"
	;cont "in the past."

	para "I do not have the" ; FUJI left before MEWTWO escaped
	line "answers you seek,"
	cont "but I know some-"
	cont "one who might."

	para "DR.JABARA was part"
	line "of the research"
	cont "team on CINNABAR."

	para "Now he works on"
	line "MANDARIN ISLAND."

	para "Here, take this."
	line "You will need it."
	prompt

; TODO - Spanish translation
_MrFujisHouseMrFujiTakeThisText:: ; marcelnote - new
	text "Here, take this."
	line "You will need it."
	prompt

_MrFujisHouseMrFujiReceivedCitrusPassText:: ; marcelnote - new
	text "¡<PLAYER> recibió"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

; TODO - Spanish translation
_MrFujisHouseMrFujiCitrusPassExplanationText:: ; marcelnote - new
	text_start

	para "This pass lets you"
	line "board the ferry"
	cont "from VERMILION to"
	cont "MANDARIN ISLAND."

	para "You should find"
	line "DR.JABARA there."
	done

; TODO - Spanish translation
_MrFujisHouseMrFujiBeCarefulText:: ; marcelnote - new
	text "MR.FUJI: DR.JABARA"
	line "might have the"
	cont "answers you seek,"
	cont "but be careful."

	para "Although he is a"
	line "gifted scientist,"
	cont "his methods can"
	cont "be questionable."
	done
