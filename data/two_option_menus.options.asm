.NoYesMenu:
	db   "NO"
	next "YES@"

.YesNoMenu:
	db   "YES"
	next "NO@"

.BoyGirlMenu: ; marcelnote - add female player
	db   "BOY"
	next "GIRL@"

.SouthEastMenu:
	db   "SOUTH"
	next "EAST@"

.NorthEastMenu:
	db   "NORTH"
	next "EAST@"

.TradeCancelMenu:
	db   "TRADE"
	next "CANCEL@"

.HealCancelMenu:
	db   "HEAL"
	next "CANCEL@"