Route8WildMons:
	def_grass_wildmons 15 ; encounter rate
	db 18, PIDGEY
IF DEF(_RED)
	db 18, MANKEY
	db 17, EKANS
	db 16, GROWLITHE
	db 20, PIDGEOTTO ; marcelnote - was PIDGEY
	db 20, MANKEY
	db 19, EKANS
	db 17, GROWLITHE
	db 16, VULPIX ; marcelnote - was 15, GROWLITHE
	db 18, GROWLITHE
ENDC
IF (DEF(_BLUE) || DEF(_GREEN)) ; marcelnote: Green has same encounters as Blue for now
	db 18, MEOWTH
	db 17, SANDSHREW
	db 16, GROWLITHE ; marcelnote - was VULPIX
	db 20, PIDGEOTTO ; marcelnote - was PIDGEY
	db 20, MEOWTH
	db 19, SANDSHREW
	db 17, VULPIX
	db 16, VULPIX ; marcelnote - was 15, VULPIX
	db 18, VULPIX
ENDC
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
