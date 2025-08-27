BillsPCMenuText:
	db   "RETIRER <PKMN>"
	next "STOCKER <PKMN>"
	next "RELACHER <PKMN>"
	next "CHANGER BOITE"
	next "SALUT!"
	db "@"

BoxNoPCText:
	db "BOITE@"

SomeonesPCText:   db "PC DE ???@"
BillsPCText:      db "PC DE LEO@"
PlayersPCText:    db "PC DE @"
OaksPCText:       db "PC DE CHEN@"
PKMNLeaguePCText: db "LIGUE <PKMN>@"
LogOffPCText:     db "DECONNEXION@"

DepositPCText:  db "STOCKER@"
WithdrawPCText: db "RETIRER@"
StatsCancelPCText:
	db   "STATS"
	next "RETOUR@"
