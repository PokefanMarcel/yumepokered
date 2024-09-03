Route9WildMons:
	def_grass_wildmons 15 ; encounter rate
	db 16, RATTATA
	db 16, SPEAROW
	;db 14, RATTATA
IF DEF(_RED)
	db 13, EKANS ; marcelnote - was 11
	db 13, SPEAROW
	db 15, EKANS
	db 17, EKANS ; marcelnote - was RATTATA
	db 17, SPEAROW
	db 15, SANDSHREW ; marcelnote - was 13, EKANS
	;db 17, EKANS
	db 14, BEEDRILL ; marcelnote - added
	db 14, BUTTERFREE ; marcelnote - added
ENDC
IF (DEF(_BLUE) || DEF(_GREEN)) ; marcelnote: Green has same encounters as Blue for now
	db 13, SANDSHREW ; marcelnote - was 11
	db 13, SPEAROW
	db 15, SANDSHREW
	db 17, SANDSHREW ; marcelnote - was RATTATA
	db 17, SPEAROW
	db 15, EKANS ; marcelnote - was 13, SANDSHREW
	;db 17, SANDSHREW
	db 14, BUTTERFREE ; marcelnote - added
	db 14, BEEDRILL ; marcelnote - added
ENDC
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
