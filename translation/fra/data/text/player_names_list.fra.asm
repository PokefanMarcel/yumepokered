IF DEF(_RED)
	DefaultNamesPlayerList:
		db "NOM:@"
		db "RED@"
		db "SACHA@"
		db "PAUL@"

	DefaultNamesRivalList:
		db "NOM:@"
		db "BLUE@"
		db "REGIS@"
		db "JEAN@"
ELIF DEF(_BLUE)
	DefaultNamesPlayerList:
		db "NOM:@"
		db "BLUE@"
		db "REGIS@"
		db "JEAN@"

	DefaultNamesRivalList:
		db "NOM:@"
		db "RED@"
		db "SACHA@"
		db "PAUL@"
ELIF DEF(_GREEN) ; PureRGBnote: GREENBUILD: default names specific to pokemon green
	DefaultNamesPlayerList:
		db "NOM:@"
		db "GREEN@"
		db "SACHA@"
		db "PAUL@"

	DefaultNamesRivalList:
		db "NOM:@"
		db "BLUE@"
		db "REGIS@"
		db "JEAN@"
ENDC

DefaultNamesPlayerListF: ; marcelnote - add female player
 	db "NOM:@"
 	db "GREEN@"
 	db "FLORA@"
  db "AMANDA@"
