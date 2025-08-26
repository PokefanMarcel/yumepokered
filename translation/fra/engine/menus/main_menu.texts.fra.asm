ContinueText:
	db "CONTINUER"
	next ""
	; fallthrough

NewGameText:
	db   "NOUVEAU JEU"
	next "OPTIONS@"

CableClubOptionsText:
	db   "CENTRE TROC"
	next "COLISEE"
	next "RETOUR@"

SaveScreenInfoText:
	db   "JOUEUR"
	next "BADGES    "
	next "#DEX    "
	next "TEMPS@"