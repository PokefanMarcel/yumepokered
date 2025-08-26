.NoYesMenu:
	db   "NON"
	next "OUI@"

.YesNoMenu:
	db   "OUI"
	next "NON@"

.BoyGirlMenu: ; marcelnote - add female player
	db   "GARCON"
	next "FILLE@"

.SouthEastMenu:
	db   "SOUTH"
	next "EAST@"

.NorthEastMenu:
	db   "NORTH"
	next "EAST@"

.TradeCancelMenu
	db   "ECHANGE"
	next "RETOUR@"

.HealCancelMenu
	db   "SOIN"
	next "RETOUR@"
