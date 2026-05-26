_PokemonTower7FMrFujiRescueText::
	text "SR. FUJI: ¿Qué?"
	line "¿Has venido a"
	cont "salvarme?"

	para "¡Gracias! Pero"
	line "estoy aquí por mi"
	cont "propia voluntad."

	para "Vine a calmar el"
	line "espíritu de la"
	cont "madre de CUBONE."

	para "Creo que el"
	line "espíritu de"
	cont "MAROWAK partió"
	cont "al más allá."

	para "¡Agradezco tu"
	line "noble interés!"

	para "Acompáñame a mi"
	line "casa, a la CASA"
	cont "#MON que"
	cont "hay al pie de"
	cont "esta torre."
	done

_PokemonTower7FRocket1BattleText::
	text "¿Qué quieres?"
	line "¿Qué haces aquí?"
	done

_PokemonTower7FRocket1EndBattleText::
	text_start
	line "¡Me rindo!"
	prompt

_PokemonTower7FRocket1AfterBattleText::
	text "¡Voy a olvidar"
	line "todo esto!"
	done

_PokemonTower7FRocket2BattleText::
	text "Este viejo hombre"
	line "vino quejándose"
	cont "de que estábamos"
	cont "haciendo daño a"
	cont "débiles #MON."

	para "¡Estamos hablando"
	line "de esto como"
	cont "adultos!"
	done

_PokemonTower7FRocket2EndBattleText::
	text "¡Por"
	line "favor! ¡No más!"
	prompt

_PokemonTower7FRocket2AfterBattleText::
	text "¡Los #MON"
	line "sólo sirven para"
	cont "ganar dinero!"

	para "¡No te metas en"
	line "nuestros asuntos!"
	done

_PokemonTower7FRocket3BattleText::
	text "¡No vas a salvar"
	line "a nadie, niño!"
	done

_PokemonTower7FRocket3EndBattleText::
	text_start
	line "¡No luches contra"
	cont "nosotros, el"
	cont "TEAM ROCKET!"
	prompt

_PokemonTower7FRocket3AfterBattleText::
	text "¡No te saldrás"
	line "con la tuya así"
	cont "como así!"
	done

_PokemonTower7FChannelerIntroText::   ; marcelnote - added 7FChanneler
	text "The spiritual"
	line "energies which"
	cont "converge here"
	cont "let me commune"
	cont "with the GHOSTs."
	done

; TODO - Spanish translation
_PokemonTower7FChannelerHarnessPowerText::   ; marcelnote - added 7FChanneler
	text "Hmm... Your"
	line "@"
	text_ram wStringBuffer
	text " seems"
	cont "drawn to this"
	cont "energy."

	para "Shall I help it"
	line "harness its power?"
	done

; TODO - Spanish translation
_PokemonTower7FChannelerIncantationsText::   ; marcelnote - added 7FChanneler
	text "The CHANNELER"
	line "whispers strange"
	cont "incantations"
	cont "over @"
	text_ram wStringBuffer
	text "."
	done

; TODO - Spanish translation
_PokemonTower7FChannelerDotsText::    ; marcelnote - added 7FChanneler
	text "..."
	line "..."
	prompt
