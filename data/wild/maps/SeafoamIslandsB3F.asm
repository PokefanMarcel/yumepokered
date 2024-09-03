SeafoamIslandsB3FWildMons:
	def_grass_wildmons 10 ; encounter rate
    ; marcelnote - old encounters
;IF DEF(_RED)
;	db 31, SLOWPOKE
;	db 31, SEEL
;	db 33, SLOWPOKE
;	db 33, SEEL
;	db 29, HORSEA
;	db 31, SHELLDER
;	db 31, HORSEA
;	db 29, SHELLDER
;	db 39, SEADRA
;ENDC
;IF (DEF(_BLUE) || DEF(_GREEN)) ; marcelnote: Green has same encounters as Blue for now
;	db 31, PSYDUCK
;	db 31, SEEL
;	db 33, PSYDUCK
;	db 33, SEEL
;	db 29, KRABBY
;	db 31, STARYU
;	db 31, KRABBY
;	db 29, STARYU
;	db 39, KINGLER
;ENDC
;	db 37, DEWGONG
	; marcelnote - new encounters
    db 31, SLOWPOKE
    db 31, PSYDUCK
    db 29, KRABBY
    db 33, SLOWPOKE
    db 33, PSYDUCK
    db 31, SQUIRTLE
    db 28, JYNX
    db 31, KRABBY
    db 39, KINGLER
    db 35, WARTORTLE
    end_grass_wildmons

	def_water_wildmons 10 ; encounter rate ; marcelnote - was 0
	db 31, SHELLDER
	db 31, STARYU
	db 31, SEEL
	db 33, SEEL
	db 29, HORSEA
	db 31, SQUIRTLE
	db 29, SHELLDER
	db 29, STARYU
	db 39, SEADRA
	db 37, DEWGONG
	end_water_wildmons
