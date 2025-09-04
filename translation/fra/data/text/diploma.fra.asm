DiplomaText:
	db CIRCLE_TILE_ID, "Diplôme", CIRCLE_TILE_ID, "@"

DiplomaPlayer:
	db "Joueur@"

DiplomaEmptyText:
	db "@"

DiplomaCongrats:
	db   "Fabuleux! Ce"
	next "diplôme certifie"
	next "la perfection de"
	next "votre POKéDEX.@" ; marcelnote - changed from "PokéDex" and added full stop
