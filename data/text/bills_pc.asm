; marcelnote - moved from engine/pokemon/bills_pc.asm
BillsPCMenuText:
	db   "WITHDRAW <PKMN>"
	next "DEPOSIT <PKMN>"
	next "RELEASE <PKMN>"
	next "CHANGE BOX"
	next "SEE YA!"
	db "@"

BoxNoPCText:
	db "BOX No.@"

SomeonesPCText:   db "SOMEONE's PC@"
BillsPCText:      db "BILL's PC@"
PlayersPCText:    db "'s PC@"
OaksPCText:       db "PROF.OAK's PC@"
PKMNLeaguePCText: db "<PKMN>LEAGUE@"
LogOffPCText:     db "LOG OFF@"

DepositPCText:  db "DEPOSIT@"
WithdrawPCText: db "WITHDRAW@"
StatsCancelPCText:
	db   "STATS"
	next "CANCEL@"
