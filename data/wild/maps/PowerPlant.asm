PowerPlantWildMons:
	def_grass_wildmons 10 ; encounter rate
	db 23, VOLTORB    ; marcelnote - was 21, VOLTORB
	db 23, MAGNEMITE  ; marcelnote - was 21, MAGNEMITE
	db 24, PIKACHU    ; marcelnote - was 20, PIKACHU
	db 32, ELECTRODE  ; marcelnote - was 24, PIKACHU
	db 32, MAGNETON   ; marcelnote - was 23, MAGNEMITE
	db 35, MAGNETON   ; marcelnote - was 23, VOLTORB
	db 33, RAICHU     ; marcelnote - was 32, MAGNETON
	db 33, ELECTABUZZ ; marcelnote - was 35, MAGNETON
;IF DEF(_RED)
	db 36, RAICHU     ; marcelnote - was 33, ELECTABUZZ
	db 36, ELECTABUZZ
;ENDC
;IF (DEF(_BLUE) || DEF(_GREEN)) ; marcelnote: Green has same encounters as Blue for now
;	db 33, RAICHU
;	db 36, RAICHU
;ENDC
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
