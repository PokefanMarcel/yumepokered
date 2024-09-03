SeafoamIslandsB1FWildMons:
	def_grass_wildmons 10 ; encounter rate
	; marcelnote - old encounters
;IF DEF(_RED)
;	db 30, STARYU
;	db 30, HORSEA
;	db 32, SHELLDER
;	db 32, HORSEA
;	db 28, SLOWPOKE
;	db 30, SEEL
;	db 30, SLOWPOKE
;	db 28, SEEL
;	db 38, DEWGONG
;	db 37, SEADRA
;ENDC
;IF (DEF(_BLUE) || DEF(_GREEN)) ; marcelnote: Green has same encounters as Blue for now
;	db 30, SHELLDER
;	db 30, KRABBY
;	db 32, STARYU
;	db 32, KRABBY
;	db 28, PSYDUCK
;	db 30, SEEL
;	db 30, PSYDUCK
;	db 28, SEEL
;	db 38, DEWGONG
;	db 37, KINGLER
;ENDC
	; marcelnote - new encounters
	db 30, SLOWPOKE
	db 30, PSYDUCK
	db 30, KRABBY
	db 32, SLOWPOKE
	db 32, PSYDUCK
	db 29, SQUIRTLE
	db 32, KRABBY
IF DEF(_RED)
    db 37, SLOWBRO
ENDC
IF (DEF(_BLUE) || DEF(_GREEN)) ; marcelnote: Green has same encounters as Blue for now
    db 37, GOLDUCK
ENDC
	db 37, KINGLER
	db 33, WARTORTLE
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
