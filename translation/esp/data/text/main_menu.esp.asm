; marcelnote - moved from engine/menus/main_menu.asm
ContinueText:
	db "CONTINUAR"
	next ""
	; fallthrough

NewGameText:
	db   "JUEGO NUEVO"
	next "OPCIONES@"

CableClubOptionsText:
	db   "CENT. CAMBIO"
	next "COLISEO"
	next "SALIR@"

SaveScreenInfoText:
	db   "JUGAD."
	next "MEDALLAS    "
	next "#DEX    "
	next "TIEMPO@"

