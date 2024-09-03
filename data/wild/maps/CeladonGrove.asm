; marcelnote - new location
CeladonGroveWildMons:
	def_grass_wildmons 10 ; encounter rate
IF DEF(_RED)
	db 20, ODDISH
	db 19, TANGELA
	db 22, ODDISH
	db 20, BELLSPROUT
	db 23, GLOOM
	db 20, BULBASAUR
	db 19, EXEGGCUTE
	db 21, EXEGGCUTE
	db 23, WEEPINBELL
ENDC
IF (DEF(_BLUE) || DEF(_GREEN)) ; marcelnote: Green has same encounters as Blue for now
	db 20, BELLSPROUT
	db 19, TANGELA
	db 22, BELLSPROUT
	db 20, ODDISH
	db 23, WEEPINBELL
	db 20, BULBASAUR
	db 19, EXEGGCUTE
	db 21, EXEGGCUTE
	db 23, GLOOM
ENDC
	db 24, IVYSAUR
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
