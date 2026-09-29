; TODO - Spanish translation, full file

; marcelnote - new location from pokeyellow
_SummerBeachHouseSurfinDudeWhoaText::
;	text "Whoa!"
;
;	para "Your PIKACHU knows"
;	line "how to SURF! So,"
;	cont "I'm not alone..."
;
;	para "Great! You earned"
;	line "the right to SURF"
;	cont "with the DUDE!"
;
;	para "Give it a go?"
	text "Espera... ¡Tu"
	line "@"
	text_ram wNameBuffer
	text " sabe"
	cont "hacer SURF!"

	para "Así que no soy"
	line "el único..."
	cont "¡Muy bien!"

	para "Solo por ti,"
	line "prepararé una"
	cont "sesión especial"
	cont "de SURF."

	para "¿Qué me dices?"
	done

_SummerBeachHouseSurfinDudeComeAnytimeText::
	text "¡Ven a hacer SURF"
	line "cuando quieras,"
	cont "colega!"
	done

_SummerBeachHouseSurfinDudeFoundBottleCapText:: ; marcelnote - new for Bottle caps
	text "¡Vaya! ¡Tu"
	line "@"
	text_ram wNameBuffer
	text_start
	cont "encontró algo"
	cont "en la playa!"
	prompt

_SummerBeachHouseReceivedBottleCapText:: ; marcelnote - new for Bottle caps
	text "¡<PLAYER> recibió"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_SummerBeachHouseBagFullText:: ; marcelnote - new for Bottle caps
	text "No puedes llevar"
	line "más objetos."
	done

_SummerBeachHouseSurfinDudeWannaGoSurfText::
	text "¿Quieres hacer"
	line "SURF?"
	done

_SummerBeachHouseSurfinDudeDogsBurgersText::
	text "¡Perritos y" ; marcelnote - ramen and yakisoba in Japanese
	line "hamburguesas"
	cont "de oferta hoy!"
	done

_SummerBeachHousePikachuText::
	text "PIKACHU: ¡Pikaa!" ; marcelnote - added "!"
	done

_SummerBeachHousePoster30YearsOfWavesText::
	text "¡30 años de olas!"
	line "MAESTRO SURF"
	done

_SummerBeachHousePosterScribblesText::
	;text "SURFIN' DUDE's"
	;line "scribbles..."

	;para "When I shoot the"
	;line "tube, the tunes"
	;cont "hit the groove!"
	text "Garabatos del"
	line "MAESTRO SURF..."

	para "¡Acelera, y la"
	line "música también"
	cont "sube! ¡Genial!"
	done

_SummerBeachHousePosterSeaUnitesAllText::
	;text "The sea unites"
	;line "all in surfdom!"

	; marcelnote - from Japanese: The sea is pure romance!
	text "¡El mar es el"
	line "horizonte"
	cont "del alma!"
	done

_SummerBeachHousePosterSurfingTip1Text::
	text "¡CONSEJO SURF 1!"

;	para "After flips, line"
;	line "the board up with"
;	cont "a wave for a cool"
;	cont "effect!"

	; marcelnote - from Japanese: After a spin, land your board flat on the water for a stylish finish!
	para "Tras un giro,"
	line "aterriza la tabla"
	cont "plana en el agua"
	cont "para acabar con"
	cont "estilo."
	done

_SummerBeachHousePosterSurfingTip2Text::
	text "¡CONSEJO SURF 2!"

;	para "Pulling flips in"
;	line "a jump is totally"
;	cont "rad!"

	; marcelnote - from Japanese: Spin repeatedly during a jump—it looks super cool!
	para "Haz giros durante"
	line "los saltos. ¡Queda"
	cont "superguay!"
	done

_SummerBeachHouseSomeMachineText::
	text "Es algún tipo"
	line "de máquina..."
	done

;_SummerBeachHousePrinterText2::
;	text "SUMMER BEACH HOUSE"
;	line "PRINTER, it says.@"
;	text_end

;_SummerBeachHousePrinterText3::
;	text "The Hi-Score is"
;	line "shown."

;	para "Check it out?@"
;	text_end

_SummerBeachHousePrinterCheckItOutText::
	text "Dice: IMPRESORA"
	line "DE CASA PLAYA."

	para "Muestra el récord."

	para "¿Mirarlo?@"
	text_end

;_SummerBeachHousePrinterText5::
;	text "Done checking!@"
;	text_end

;_SummerBeachHousePrinterText6::
;	text "Couldn't show it!@"
;	text_end

_SummerBeachHousePokemonSurfboardText::
	text "¡Es una tabla SURF"
	line "del tamaño de"
	cont "PIKACHU!"
	done
