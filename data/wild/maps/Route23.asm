Route23WildMons:
	def_grass_wildmons 10 ; encounter rate
; marcelnote - old encounters
;IF DEF(_RED)
;	db 26, EKANS
;ENDC
;IF (DEF(_BLUE) || DEF(_GREEN)) ; marcelnote: Green has same encounters as Blue for now
;	db 26, SANDSHREW
;ENDC
;	db 33, DITTO
;	db 26, SPEAROW
;	db 38, FEAROW
;	db 38, DITTO
;	db 38, FEAROW
;IF DEF(_RED)
;	db 41, ARBOK
;ENDC
;IF (DEF(_BLUE) || DEF(_GREEN)) ; marcelnote: Green has same encounters as Blue for now
;	db 41, SANDSLASH
;ENDC
;	db 43, DITTO
;	db 41, FEAROW
;	db 43, FEAROW
; marcelnote - new encounters
IF DEF(_RED)
	db 36, NIDORINO
	db 38, DITTO
	db 37, PRIMEAPE
	db 36, NIDORINA
	db 37, PERSIAN
	db 38, FEAROW
	db 41, ARBOK
	db 43, DITTO
	db 41, FEAROW
	db 43, FEAROW
ENDC
IF (DEF(_BLUE) || DEF(_GREEN)) ; marcelnote: Green has same encounters as Blue for now
	db 36, NIDORINA
	db 38, DITTO
	db 37, PERSIAN
	db 36, NIDORINO
	db 37, PRIMEAPE
	db 38, FEAROW
	db 41, SANDSLASH
	db 43, DITTO
	db 41, FEAROW
	db 43, FEAROW
ENDC
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
