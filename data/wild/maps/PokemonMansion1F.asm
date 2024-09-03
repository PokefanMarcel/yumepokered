PokemonMansion1FWildMons:
	def_grass_wildmons 10 ; encounter rate
IF DEF(_RED)
	db 32, KOFFING
	db 30, KOFFING
	db 34, VULPIX    ; marcelnote - was 34, PONYTA
	db 32, DITTO     ; marcelnote - was 30, PONYTA
	db 34, GROWLITHE
	db 30, DITTO     ; marcelnote - was 32, PONYTA
	db 30, GRIMER
	db 32, VULPIX    ; marcelnote - was 28, PONYTA
	db 37, WEEZING
	db 39, MUK
ENDC
IF (DEF(_BLUE) || DEF(_GREEN)) ; marcelnote: Green has same encounters as Blue for now
	db 32, GRIMER
	db 30, GRIMER
	db 34, GROWLITHE ; marcelnote - was 34, PONYTA
	db 32, DITTO     ; marcelnote - was 30, PONYTA
	db 34, VULPIX
	db 30, DITTO     ; marcelnote - was 32, PONYTA
	db 30, KOFFING
	db 32, GROWLITHE ; marcelnote - was 28, PONYTA
	db 37, MUK
	db 39, WEEZING
ENDC
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
