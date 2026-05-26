IF DEF(_RED)
	DefaultNamesPlayerList:
		db "NUEVO N.@"
		db "ROJO@"
		db "ASH@"
		db "JAIME@"

	DefaultNamesRivalList:
		db "NUEVO N.@"
		db "AZUL@"
		db "GARY@"
		db "JUAN@"
ELIF DEF(_BLUE)
	DefaultNamesPlayerList:
		db "NUEVO N.@"
		db "AZUL@"
		db "GARY@"
		db "JUAN@"

	DefaultNamesRivalList:
		db "NUEVO N.@"
		db "ROJO@"
		db "ASH@"
		db "JAIME@"
ELIF DEF(_GREEN) ; PureRGBnote: GREENBUILD: default names specific to pokemon green
	DefaultNamesPlayerList:
		db "NUEVO N.@"
		db "VERDE@"
		db "ASH@"
		db "JAIME@"

	DefaultNamesRivalList:
		db "NUEVO N.@"
		db "AZUL@"
		db "GARY@"
		db "GABE@"
ENDC

; TODO - Spanish translation
DefaultNamesPlayerListF: ; marcelnote - add female player
	db "NEW NAME@"
	db "GREEN@"
	db "LEAF@"
	db "AMANDA@"
