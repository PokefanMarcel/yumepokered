ViridianForestWildMons:
	def_grass_wildmons 8 ; encounter rate
IF DEF(_RED)
	db  4, WEEDLE
	db  5, KAKUNA
	db  3, WEEDLE
	db  5, WEEDLE
	db  3, CATERPIE ; marcelnote - was 4, KAKUNA
	db  6, KAKUNA
	db  5, METAPOD ; marcelnote - increased from lvl 4
ENDC
IF (DEF(_BLUE) || DEF(_GREEN)) ; marcelnote: Green has same encounters as Blue for now
	db  4, CATERPIE
	db  5, METAPOD
	db  3, CATERPIE
	db  5, CATERPIE
	db  3, WEEDLE ; marcelnote - was 4, METAPOD
	db  6, METAPOD
	db  5, KAKUNA ; marcelnote - increased from lvl 4
ENDC
	db  4, PARAS ; marcelnote - added
	db  3, PIKACHU
	db  5, PIKACHU
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
