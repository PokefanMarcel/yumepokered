SeafoamIslandsB2FWildMons:
	def_grass_wildmons 10 ; encounter rate
	; marcelnote - old encounters
;	db 30, SEEL
;IF DEF(_RED)
;	db 30, SLOWPOKE
;	db 32, SEEL
;	db 32, SLOWPOKE
;	db 28, HORSEA
;	db 30, STARYU
;	db 30, HORSEA
;	db 28, SHELLDER
;	db 30, GOLBAT
;	db 37, SLOWBRO
;ENDC
;IF (DEF(_BLUE) || DEF(_GREEN)) ; marcelnote: Green has same encounters as Blue for now
;	db 30, PSYDUCK
;	db 32, SEEL
;	db 32, PSYDUCK
;	db 28, KRABBY
;	db 30, SHELLDER
;	db 30, KRABBY
;	db 28, STARYU
;	db 30, GOLBAT
;	db 37, GOLDUCK
	; marcelnote - new encounters
	db 30, PSYDUCK
	db 30, SLOWPOKE
	db 30, KRABBY
	db 32, PSYDUCK
	db 32, SLOWPOKE
	db 29, SQUIRTLE
	db 37, GOLDUCK
	db 37, SLOWBRO
	db 30, GOLBAT
	db 33, WARTORTLE
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
