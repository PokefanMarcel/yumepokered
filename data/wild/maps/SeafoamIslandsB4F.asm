SeafoamIslandsB4FWildMons:
	def_grass_wildmons 10 ; encounter rate
    ; marcelnote - old encounters
;IF DEF(_RED)
;	db 31, HORSEA
;	db 31, SHELLDER
;	db 33, HORSEA
;	db 33, SHELLDER
;	db 29, SLOWPOKE
;	db 31, SEEL
;	db 31, SLOWPOKE
;	db 29, SEEL
;	db 39, SLOWBRO
;ENDC
;IF (DEF(_BLUE) || DEF(_GREEN)) ; marcelnote: Green has same encounters as Blue for now
;	db 31, KRABBY
;	db 31, STARYU
;	db 33, KRABBY
;	db 33, STARYU
;	db 29, PSYDUCK
;	db 31, SEEL
;	db 31, PSYDUCK
;	db 29, SEEL
;	db 39, GOLDUCK
;ENDC
;	db 32, GOLBAT
    ; marcelnote - new encounters
    db 31, KRABBY
IF DEF(_RED)
    db 29, SLOWPOKE
ENDC
IF (DEF(_BLUE) || DEF(_GREEN)) ; marcelnote: Green has same encounters as Blue for now
    db 29, PSYDUCK
ENDC
    db 33, KRABBY
IF DEF(_RED)
    db 31, PSYDUCK
ENDC
IF (DEF(_BLUE) || DEF(_GREEN)) ; marcelnote: Green has same encounters as Blue for now
    db 31, SLOWPOKE
ENDC
    db 30, JYNX
    db 31, SQUIRTLE
    db 39, GOLDUCK
    db 39, SLOWBRO
    db 34, GOLBAT
    db 35, WARTORTLE
	end_grass_wildmons

	def_water_wildmons 10 ; encounter rate ; marcelnote - was 0
    db 31, HORSEA
    db 31, SEEL
    db 33, HORSEA
    db 33, STARYU
    db 33, SHELLDER
    db 31, SQUIRTLE
    db 31, STARYU
    db 31, SHELLDER
    db 39, SEADRA
    db 37, DEWGONG
	end_water_wildmons
