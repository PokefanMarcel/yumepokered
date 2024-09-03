Route11WildMons:
	def_grass_wildmons 15 ; encounter rate
IF DEF(_RED)
	db 14, EKANS
	db 15, SPEAROW
	db 15, EKANS ; marcelnote - was 12
	db 11, DROWZEE ; marcelnote - was 9
	db 15, DROWZEE ; marcelnote - was 13, SPEAROW
	db 13, DROWZEE
	db 14, SANDSHREW ; marcelnote - was 15, EKANS
	db 17, SPEAROW
	db 14, SCYTHER ; marcelnote - was 11, DROWZEE
	db 14, PINSIR ; marcelnote - was 15, DROWZEE
ENDC
IF (DEF(_BLUE) || DEF(_GREEN)) ; marcelnote: Green has same encounters as Blue for now
	db 14, SANDSHREW
	db 15, SPEAROW
	db 15, SANDSHREW ; marcelnote - was 12
	db 11, DROWZEE ; marcelnote - was 9
	db 15, DROWZEE ; marcelnote - was 13, SPEAROW
	db 13, DROWZEE
	db 14, EKANS ; marcelnote - was 15, SANDSHREW
	db 17, SPEAROW
	db 14, PINSIR ; marcelnote - was 11, DROWZEE
	db 14, SCYTHER ; marcelnote - was 15, DROWZEE
ENDC
	;db 17, SPEAROW
	;db 11, DROWZEE
	;db 15, DROWZEE
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
