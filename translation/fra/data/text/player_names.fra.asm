IF DEF(_RED)
	DefaultNamesPlayer:
		db "NOM:"
		next "RED"
		next "SACHA"
		next "PAUL"
		db   "@"

	DefaultNamesRival:
		db "NOM:"
		next "BLUE"
		next "REGIS"
		next "JEAN"
		db   "@"

ELIF DEF(_BLUE)
	DefaultNamesPlayer:
		db "NOM:"
		next "BLUE"
		next "REGIS"
		next "JEAN"
		db   "@"

	DefaultNamesRival:
		db "NOM:"
		next "RED"
		next "SACHA"
		next "PAUL"
		db   "@"

ELIF DEF(_GREEN) ; PureRGBnote: GREENBUILD: default names specific to pokemon green
	DefaultNamesPlayer:
		db   "NOM:"
		next "GREEN"
		next "SACHA"
		next "PAUL"
		db   "@"

	DefaultNamesRival:
		db   "NOM:"
		next "BLUE"
		next "GARY"
		next "GABE"
		db   "@"

ENDC

DefaultNamesPlayerF: ; marcelnote - add female player
 	db   "NOM:"
 	next "GREEN"
	next "FLORA"
	next "AMANDA"
	db   "@"
