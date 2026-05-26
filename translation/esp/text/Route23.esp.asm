_Route23YouDontHaveTheBadgeYetText::
	text "¡Sólo podrás"
	line "entrar aquí si"
	cont "tienes la"
	cont "@"
	text_ram wNameBuffer
	text "!"

	para "¡Aún no tienes la"
	line "@"
	text_ram wNameBuffer
	text "!"

	para "¡Debes tenerla"
	line "para acceder a la"
	cont "LIGA #MON!@"
	text_end

_Route23OhThatIsTheBadgeText::
	text "¡Sólo podrás"
	line "entrar aquí si"
	cont "tienes la"
	cont "@"
	text_ram wNameBuffer
	text "!"

	para "¡Oh! ¡Ésa es la"
	line "@"
	text_ram wNameBuffer
	text "!@"
	text_end

_Route23GoRightAheadText::
	text_start

	para "¡Muy bien!"
	line "¡Puedes pasar!"
	done

_Route23VictoryRoadGateSignText::
	text "PUERTA VICTORIA"
	line "- LIGA #MON"
	done
