NoYesMenuText:
	db   "NO"
	next "YES@"

YesNoMenuText:
	db   "YES"
	next "NO@"

BoyGirlMenuText: ; marcelnote - add female player
	db   "BOY"
	next "GIRL@"

;SouthEastMenuText:
;	db   "SOUTH"
;	next "EAST@"

;NorthEastMenuText:
;	db   "NORTH"
;	next "EAST@"

TradeCancelMenuText:
	db   "TRADE"
	next "CANCEL@"

HealCancelMenuText:
	db   "HEAL"
	next "CANCEL@"
