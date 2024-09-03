Route7WildMons:
	def_grass_wildmons 15 ; encounter rate
	db 19, PIDGEY
IF DEF(_RED)
	db 19, ODDISH
	db 18, MANKEY    ; marcelnote -  was 17
	db 18, GROWLITHE ; marcelnote - was 22, ODDISH
	db 22, PIDGEY
	db 19, MANKEY ; marcelnote -  was 18
	db 22, ODDISH ; marcelnote - was 18, GROWLITHE
	db 20, GROWLITHE
	db 20, VULPIX ; marcelnote - was 19, MANKEY
	db 20, MANKEY
ENDC
IF (DEF(_BLUE) || DEF(_GREEN)) ; marcelnote: Green has same encounters as Blue for now
	db 19, BELLSPROUT
	db 18, MEOWTH ; marcelnote -  was 17
	db 18, GROWLITHE ; marcelnote - was 22, BELLSPROUT
	db 22, PIDGEY
	db 19, MEOWTH ; marcelnote -  was 18
	db 22, BELLSPROUT ; marcelnote - was 18, VULPIX
	db 20, VULPIX
	db 20, GROWLITHE ; marcelnote - was 19, MEOWTH
	db 20, MEOWTH
ENDC
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
