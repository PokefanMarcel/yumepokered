Route10WildMons:
	def_grass_wildmons 15 ; encounter rate
	db 16, VOLTORB
	db 16, MAGNEMITE ; marcelnote - was 16, SPEAROW
	db 16, SPEAROW ; marcelnote - was 14, VOLTORB
	db 14, VOLTORB
	db 14, MAGNEMITE
IF DEF(_RED)
	;db 11, EKANS
	;db 13, SPEAROW
	db 15, EKANS
	db 17, EKANS ; marcelnote - was 17, VOLTORB
	db 17, SPEAROW
	db 15, SANDSHREW ; marcelnote - was 13, EKANS
	db 17, SANDSHREW ; marcelnote - was 17, EKANS
ENDC
IF (DEF(_BLUE) || DEF(_GREEN)) ; marcelnote: Green has same encounters as Blue for now
	;db 11, SANDSHREW
	;db 13, SPEAROW
	db 15, SANDSHREW
	db 17, SANDSHREW ; marcelnote - was 17, VOLTORB
	db 17, SPEAROW
	db 15, EKANS ; marcelnote - was 13, SANDSHREW
	db 17, EKANS ; marcelnote - was 17, SANDSHREW
ENDC
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
