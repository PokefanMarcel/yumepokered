DiplomaText:
	db DIPLOMA_TEXTBOX_BULLET, "Diplôme", DIPLOMA_TEXTBOX_BULLET, "@"

DiplomaPlayer:
	db "Joueur@"

DiplomaEmptyText:
	db "@"

DiplomaCongrats:
	db   "Fabuleux! Ce"
	next "diplôme certifie"
	next "la perfection de"
	next "votre POKéDEX.@" ; marcelnote - changed from "PokéDex" and added full stop
