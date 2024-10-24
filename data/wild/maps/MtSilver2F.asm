; marcelnote - new location
MtSilver2FWildMons:
	def_grass_wildmons 10 ; encounter rate
	db 55, GOLEM
	db 58, ONIX
	db 54, MACHOKE
IF DEF(_RED)
	db 55, NIDOKING
	db 57, MACHOKE
	db 54, POLIWRATH
	db 58, GOLEM
	db 57, NIDOKING
	db 55, NIDOQUEEN
ENDC
IF DEF(_BLUE) || DEF(_GREEN)
	db 55, NIDOQUEEN
	db 57, MACHOKE
	db 54, POLIWRATH
	db 58, GOLEM
	db 57, NIDOQUEEN
	db 55, NIDOKING
ENDC
	db 53, AERODACTYL
	end_grass_wildmons

	def_water_wildmons 15 ; encounter rate
	db 56, SEAKING
	db 55, GOLDUCK
	db 55, SLOWBRO
	db 55, POLIWRATH
	db 49, KABUTOPS
	db 49, OMASTAR
	db 52, KABUTOPS
	db 52, OMASTAR
	db 59, SEAKING
	db 54, LAPRAS
	end_water_wildmons