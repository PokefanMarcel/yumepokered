Route13WildMons:
	def_grass_wildmons 20 ; encounter rate
IF DEF(_RED)
	db 26, ODDISH     ; marcelnote - was 24, ODDISH
	db 25, PIDGEOTTO  ; marcelnote - was 25, PIDGEY
	db 27, PIDGEOTTO  ; marcelnote - was 27, PIDGEY
	db 24, VENONAT
	db 28, GLOOM      ; marcelnote - was 22, ODDISH
	db 26, VENONAT
	db 30, GLOOM      ; marcelnote - was 26, ODDISH
	db 25, DITTO
	db 24, SCYTHER    ; marcelnote - was 28, GLOOM
	db 24, PINSIR     ; marcelnote - was 30, GLOOM
ENDC
IF (DEF(_BLUE) || DEF(_GREEN)) ; marcelnote: Green has same encounters as Blue for now
	db 26, BELLSPROUT ; marcelnote - was 24, BELLSPROUT
	db 25, PIDGEOTTO  ; marcelnote - was 25, PIDGEY
	db 27, PIDGEOTTO  ; marcelnote - was 27, PIDGEY
	db 24, VENONAT
	db 28, WEEPINBELL ; marcelnote - was 22, BELLSPROUT
	db 26, VENONAT
	db 30, WEEPINBELL ; marcelnote - was 26, BELLSPROUT
	db 25, DITTO
	db 24, PINSIR     ; marcelnote - was 28, WEEPINBELL
	db 24, SCYTHER    ; marcelnote - was 30, WEEPINBELL
ENDC
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
