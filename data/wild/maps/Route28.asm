; marcelnote - new location
Route28WildMons:
	def_grass_wildmons 15 ; encounter rate
	db 46, RAPIDASH   ; 19.9%
	db 46, DODRIO     ; 19.9%
	db 48, RHYDON     ; 15.2%
	db 47, VENUSAUR   ;  9.8%
	db 47, CHARIZARD  ;  9.8%
	db 47, BLASTOISE  ;  9.8%
IF DEF(_RED)
	db 48, VILEPLUME  ;  5.1%
ENDC
IF (DEF(_BLUE) || DEF(_GREEN)) ; marcelnote - Green has same encounters as Blue for now
	db 48, VICTREEBEL ;  5.1%
ENDC
	db 49, RAICHU     ;  5.1%
	db 42, LICKITUNG  ;  4.3%
	db 45, SNORLAX    ;  1.2%
	end_grass_wildmons

	def_water_wildmons 15 ; encounter rate
	db 45, GOLDUCK
	db 45, POLIWHIRL
	db 45, SLOWBRO
	db 47, GOLDUCK
	db 47, POLIWHIRL
	db 38, DRATINI
	db 47, POLIWRATH
	db 48, GYARADOS
	db 42, DRAGONAIR
	db 45, DRAGONAIR
	end_water_wildmons
