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
