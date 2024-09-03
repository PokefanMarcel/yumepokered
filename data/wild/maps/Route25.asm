Route25WildMons:
	def_grass_wildmons 15 ; encounter rate
IF DEF(_RED)
	db  8, WEEDLE
	db 12, ODDISH  ; marcelnote - was 9, KAKUNA
	db 13, PIDGEY
	db  9, KAKUNA  ; marcelnote - was 12, ODDISH
	db 14, ODDISH  ; marcelnote - was 13
	db 12, ABRA
	;db 14, ODDISH ; marcelnote - removed
	db 10, ABRA
	db  9, METAPOD ; marcelnote - was 7
	db  8, CATERPIE
ENDC
IF (DEF(_BLUE) || DEF(_GREEN)) ; marcelnote: Green has same encounters as Blue for now
	db  8, CATERPIE
	db 12, BELLSPROUT  ; marcelnote - was 9, METAPOD
	db 13, PIDGEY
	db  9, METAPOD     ; marcelnote - was 12, BELLSPROUT
	db 14, BELLSPROUT  ; marcelnote - was 13
	db 12, ABRA
	;db 14, BELLSPROUT ; marcelnote - removed
	db 10, ABRA
	db  9, KAKUNA      ; marcelnote - was 7
	db  8, WEEDLE
ENDC
	db  8, CHARMANDER ; marcelnote - added
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
