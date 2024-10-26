Route2WildMons:
	def_grass_wildmons 25 ; encounter rate
	db  3, RATTATA
	;db  3, PIDGEY ; marcelnote - removed
	db  4, PIDGEY
	db  4, RATTATA
	db  5, PIDGEY
	db  3, PARAS ; marcelnote - added
IF DEF(_RED)
	db  3, WEEDLE
	db  4, PARAS ; marcelnote - was 2, RATTATA
	db  5, RATTATA
	db  4, WEEDLE
	db  5, WEEDLE
ENDC
IF (DEF(_BLUE) || DEF(_GREEN)) ; marcelnote: Green has same encounters as Blue for now
	db  3, CATERPIE
	db  4, PARAS ; marcelnote - was 2, RATTATA
	db  5, RATTATA
	db  4, CATERPIE
	db  5, CATERPIE
ENDC
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
