_CeladonMartRoofLittleGirlImThirstyText::
	text "¡Tengo sed!"
	line "¡Me gustaría"
	cont "beber algo!"
	done

_CeladonMartRoofLittleGirlGiveHerADrinkText::
	text "¡Tengo sed!"
	line "¡Me gustaría"
	cont "beber algo!"

	para "¿Le das algo"
	line "de beber?"
	done

_CeladonMartRoofLittleGirlYayFreshWaterText::
	text "¡Yay!"

	para "¡AGUA!"

	para "¡Gracias!"

	para "¡Tómala,"
	line "toda tuya!@"
	text_end

_CeladonMartRoofLittleGirlTM13ExplanationText::
	text_start

	para "¡@"
	text_ram wStringBuffer
	text_start
	line "contiene el"
	cont "RAYO HIELO!"

	para "¡Éste puede helar"
	line "al enemigo, a"
	cont "veces!@"
	text_end

_CeladonMartRoofLittleGirlYaySodaPopText::
	text "¡Genial!"

	para "¡Un REFRESCO!"

	para "¡Gracias!"

	para "¡Tómala,"
	line "toda tuya!@"
	text_end

_CeladonMartRoofLittleGirlTM48ExplanationText::
	text_start

	para "¡@"
	text_ram wStringBuffer
	text " incluye"
	line "la AVALANCHA!"

	para "Este ataque puede"
	line "atizar al enemigo"
	cont "algunas veces...@"
	text_end

_CeladonMartRoofLittleGirlYayLemonadeText::
	text "¡Genial!"

	para "¡LIMONADA!"

	para "¡Gracias!"

	para "¡Tómala,"
	line "toda tuya!@"
	text_end

_CeladonMartRoofLittleGirlTM49ExplanationText::
	text_start

	para "¡La MT49 contiene"
	line "el TRI-ATAQUE!@"
	text_end

_CeladonMartRoofLittleGirlReceivedTMText:: ; marcelnote - now common to all 3 TMs
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_CeladonMartRoofLittleGirlNoRoomText::
	text "¡No tienes sitio"
	line "para esto!@"
	text_end

_CeladonMartRoofLittleGirlImNotThirstyText::
	text "¡No, gracias!"
	line "¡No estoy tan"
	cont "sedienta!@"
	text_end

_CeladonMartRoofSuperNerdText::
	text "Mi hermana es"
	line "entrenadora,"
	cont "¡de verdad!"

	para "¡Pero es tan"
	line "infantil que"
	cont "me vuelve loco!"
	done

_CeladonMartRoofCurrentFloorSignText::
	text "ÚLTIMO PISO:"
	line "DISTRIBUIDORES"
	done

_VendingMachineText1::
	text "¡Un distribuidor!"
	line "¡A ver el menú!"
	prompt

_VendingMachineText4::
	text "¡Uups, no tengo"
	line "bastante dinero!"
	done

_VendingMachineText5::
	text "¡Salió"
	line "@"
	text_ram wStringBuffer
	text "!"
	done

_VendingMachineText6::
	text "¡No tienes sitio"
	line "para más cosas!"
	done

_VendingMachineText7::
	text "¡No tengo sed!"
	done
_VendingMachineWrongSideText:: ; marcelnote - new
	text "Wrong side!"
	done
