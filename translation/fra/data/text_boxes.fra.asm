BuySellQuitText:
	db   "ACHETER"
	next "VENDRE"
	next "SALUT!@"

UseTossText:
	db   "UTIL."
	next "JETER@"

UseSlctText: ; marcelnote - use items with SELECT
	db   "UTIL."
	next "SLCT@"

MoneyText:
	db "ARG.@"

FloorText: ; marcelnote - new for elevator current floor
	db "ETAGE@"

BattleMenuText:
	db   "ATTAQ <PK><MN>"
	next "OBJET FUITE@"

SafariZoneBattleMenuText:
	db   "BALL×      APPAT"
	next "CAILLOU    FUITE@"

SwitchStatsCancelText:
	db   "ORDRE"
	next "STATS"
	next "RETOUR@"

MomDaisyCancelText: ; marcelnote - new for pay phones
	db   "MAMAN"
	next "NINA"
	next "RETOUR@"
