NoYesMenuText:
	db   "NON"
	next "OUI@"

YesNoMenuText:
	db   "OUI"
	next "NON@"

BoyGirlMenuText: ; marcelnote - add female player
	db   "GARCON"
	next "FILLE@"

;SouthEastMenuText: ; marcelnote - unused
;	db   "SOUTH"
;	next "EAST@"

;NorthEastMenuText: ; marcelnote - unused
;	db   "NORTH"
;	next "EAST@"

TradeCancelMenuText:
	db   "ECHANGE"
	next "RETOUR@"

HealCancelMenuText:
	db   "SOIN"
	next "RETOUR@"
