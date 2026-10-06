BuySellQuitText:
	db   "BUY"
	next "SELL"
	next "QUIT@"

UseTossText:
	db   "USE"
	next "TOSS@"

UseSlctText: ; marcelnote - use items with SELECT
	db   "USE"
	next "SLCT@"

MoneyText:
	db "MONEY@"

FloorText: ; marcelnote - new for elevator current floor
	db "FLOOR@"

BattleMenuText:
	db   "FIGHT <PK><MN>"
	next "ITEM  RUN@"

SafariZoneBattleMenuText:
	db   "BALL×       BAIT"
	next "THROW ROCK  RUN@"

SwitchStatsCancelText:
	db   "SWITCH"
	next "STATS"
	next "CANCEL@"

MomDaisyCancelText: ; marcelnote - new for pay phones
	db   "MOM"
	next "DAISY"
	next "CANCEL@"
