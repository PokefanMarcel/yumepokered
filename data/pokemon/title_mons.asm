TitleMons:
; mons on the title screen are randomly chosen from here
; marcelnote - could change those to show Mons exclusive to a given version?
; Exclusive to Red: Ekans, Oddish, Mankey, Growlithe, Scyther, Electabuzz
; semi exclusive: Weedle, Nidoran_m, Psyduck/Slowpoke, Horsea/Staryu?
; Exclusive to Green/Blue: Sandshrew, Bellsprout, Mankey, Vulpix, Pinsir, Magmar
; semi exclusive: Caterpie, Nidoran_f, Psyduck/Slowpoke, Horsea/Staryu?
IF DEF(_RED)
	db STARTER1
	db STARTER2
	db STARTER3
	db WEEDLE
	db NIDORAN_M
	db SCYTHER
	db PIKACHU
	db CLEFAIRY
	db RHYDON
	db ABRA
	db GASTLY
	db DITTO
	db PIDGEOTTO
	db ONIX
	db PONYTA
	db MAGIKARP
ENDC
IF DEF(_BLUE)
	db STARTER2
	db STARTER1
	db STARTER3
	db MANKEY
	db HITMONLEE
	db VULPIX
	db CHANSEY
	db AERODACTYL
	db JOLTEON
	db SNORLAX
	db GLOOM
	db POLIWAG
	db DODUO
	db PORYGON
	db GENGAR
	db RAICHU
ENDC
IF DEF(_GREEN) ; PureRGBnote: GREENBUILD: the pokemon that appear on the start screen on green version.
	db STARTER3
	db STARTER1
	db STARTER2
	db DIGLETT
	db FEAROW
	db GRIMER
	db KINGLER
	db ZUBAT
	db CATERPIE
	db EEVEE
	db VOLTORB
	db STARYU
	db NIDOKING
	db SCYTHER
	db HAUNTER
	db EXEGGCUTE
ENDC
