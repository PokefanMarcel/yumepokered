IF DEF(_RED)

	DefaultNamesPlayer:
		db "NUEVO N."
		next "ROJO"
		next "ASH"
		next "JAIME"
		db   "@"

	DefaultNamesRival:
		db "NUEVO N."
		next "AZUL"
		next "GARY"
		next "JUAN"
		db   "@"

ELIF DEF(_BLUE)

	DefaultNamesPlayer:
		db "NUEVO N."
		next "AZUL"
		next "GARY"
		next "JUAN"
		db   "@"

	DefaultNamesRival:
		db "NUEVO N."
		next "ROJO"
		next "ASH"
		next "JAIME"
		db   "@"

ELIF DEF(_GREEN) ; PureRGBnote: GREENBUILD: default names specific to pokemon green

	DefaultNamesPlayer:
		db   "NUEVO N."
		next "VERDE"
		next "ASH"
		next "JAIME"
		db   "@"

	DefaultNamesRival:
		db   "NUEVO N."
		next "AZUL"
		next "GARY"
		next "GABE"
		db   "@"

ENDC

; TODO - Spanish translation
DefaultNamesPlayerF: ; marcelnote - add female player
	db   "NEW NAME"
	next "GREEN"
	next "LEAF"
	next "AMANDA"
	db   "@"
