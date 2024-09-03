Route4WildMons:
	def_grass_wildmons 20 ; encounter rate
	db 10, RATTATA
	db 10, SPEAROW
	;db  8, RATTATA ; marcelnote - removed this
IF DEF(_RED)
	db  8, EKANS ; marcelnote - was 6
	db  8, SPEAROW
	db 10, EKANS
	db 12, RATTATA
	db 12, SPEAROW
	db  8, SANDSHREW ; marcelnote - was EKANS
	db 12, EKANS
ENDC
IF (DEF(_BLUE) || DEF(_GREEN)) ; marcelnote: Green has same encounters as Blue for now
	db  8, SANDSHREW ; marcelnote - was 6
	db  8, SPEAROW
	db 10, SANDSHREW
	db 12, RATTATA
	db 12, SPEAROW
	db  8, EKANS ; marcelnote - was SANDSHREW
	db 12, SANDSHREW
ENDC
	db  8, BULBASAUR
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
