Route14WildMons:
	def_grass_wildmons 15 ; encounter rate
IF DEF(_RED)
	db 24, ODDISH
	db 24, GRIMER ; marcelnote - was 26, PIDGEY
	db 23, DITTO
	db 24, VENONAT
	;db 22, ODDISH ; marcelnote - removed
	db 26, VENONAT
	db 26, ODDISH
	db 30, GLOOM
ENDC
IF (DEF(_BLUE) || DEF(_GREEN)) ; marcelnote: Green has same encounters as Blue for now
	db 24, BELLSPROUT
	db 24, GRIMER ; marcelnote - was 26, PIDGEY
	db 23, DITTO
	db 24, VENONAT
	;db 22, BELLSPROUT ; marcelnote - removed
	db 26, VENONAT
	db 26, BELLSPROUT
	db 30, WEEPINBELL
ENDC
	db 28, PIDGEOTTO
	db 26, GRIMER ; marcelnote - added
	db 30, PIDGEOTTO
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
