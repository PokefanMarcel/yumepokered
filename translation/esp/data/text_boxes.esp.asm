BuySellQuitText:
	db   "COMPRAR"
	next "VENDER"
	next "¡ADIÓS!@"

UseTossText:
	db   "USAR"
	next "TIRAR@"

UseSlctText: ; marcelnote - use items with SELECT
	db   "USAR"
	next "SLCT@"

MoneyText:
	db "DIN.@"

FloorText: ; marcelnote - new for elevator current floor
	db "PLANTA@"

BattleMenuText:
	db   "LUCHA <PK><MN>"
	next "OBJ.  ESC@"

SafariZoneBattleMenuText:
	db   "BALL×       CEBO"
	next "LANZA ROCA  CORRE@"

SwitchStatsCancelText:
	db   "CAMBIO"
	next "ESTAD."
	next "SALIR@"

MomDaisyCancelText: ; marcelnote - new for pay phones
	db   "MAMÁ"
	next "DALIA"
	next "SALIR@"
