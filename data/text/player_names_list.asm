IF DEF(_RED)

DefaultNamesPlayerList:
	db "NEW NAME@"
	db "RED@"
	db "ASH@"
	db "JACK@"

DefaultNamesRivalList:
	db "NEW NAME@"
	db "BLUE@"
	db "GARY@"
	db "JOHN@"

ELIF DEF(_BLUE)

DefaultNamesPlayerList:
	db "NEW NAME@"
	db "BLUE@"
	db "GARY@"
	db "JOHN@"

DefaultNamesRivalList:
	db "NEW NAME@"
	db "RED@"
	db "ASH@"
	db "JACK@"

ELIF DEF(_GREEN) ; PureRGBnote: GREENBUILD: default names specific to pokemon green

DefaultNamesPlayerList:
	db "NEW NAME@"
	db "GREEN@"
	db "ASH@"
	db "MIKE@"

DefaultNamesRivalList:
	db "NEW NAME@"
	db "BLUE@"
	db "GARY@"
	db "GABE@"

ENDC

DefaultNamesPlayerListF: ; marcelnote - add female player
 	db "NEW NAME@"
 	db "GREEN@"
 	db "LEAF@"
   	db "AMANDA@"
