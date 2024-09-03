Route5WildMons:
	def_grass_wildmons 15 ; encounter rate
IF DEF(_RED)
	db 13, ODDISH
	db 13, PIDGEY
	db 15, PIDGEY
	db 13, BELLSPROUT ; marcelnote - was 10, MANKEY
	db 12, MANKEY
	db 16, ODDISH ; marcelnote - was 15
	db 14, MEOWTH ; marcelnote - was 16, ODDISH
	db 14, VENONAT ; marcelnote - was 16, PIDGEY
	db 14, MANKEY
	db 16, MANKEY
ENDC
IF (DEF(_BLUE) || DEF(_GREEN)) ; marcelnote: Green has same encounters as Blue for now
	db 13, BELLSPROUT
	db 13, PIDGEY
	db 15, PIDGEY
	db 13, ODDISH ; marcelnote - was 10, MEOWTH
	db 12, MEOWTH
	db 16, BELLSPROUT ; marcelnote - was 15
	db 14, MANKEY ; marcelnote - was 16, BELLSPROUT
	db 14, VENONAT ; marcelnote - was 16, PIDGEY
	db 14, MEOWTH
	db 16, MEOWTH
ENDC
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
