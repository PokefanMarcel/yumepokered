; marcelnote - imported file from pokeyellow to deal with Special Moves
; Yellow entry format:
;	db trainerclass, trainerid
;	repeat { db partymon location, partymon move, move id }
;	db 0

; TO DO: rematches for Gym Leaders, other special trainers
; e.g. Otoshi (Marowak), Anthony (Hitmonchan), Melvin (Exeggcute), Giselle (Academy)

; marcelnote - lots of modifications below
SpecialTrainerMoves:
	db YOUNGSTER, 14  ; based on A.J.
	; Sandshrew
	db 1, 4, FISSURE
	db 0

	db BROCK, 1
	; Geodude
	db 1, 3, ROCK_THROW
	; Onix
	db 2, 3, BIND
	db 2, 4, BIDE
	db 0

	db MISTY, 1
	; Starmie
	db 3, 1, SWIFT
	db 3, 4, BUBBLEBEAM
	db 0

	db LT_SURGE, 1
	; Voltorb
	db 1, 4, THUNDERSHOCK
	; Pikachu
	db 2, 4, THUNDERSHOCK
	; Raichu
	db 3, 2, THUNDERBOLT
	db 3, 3, MEGA_PUNCH
	db 3, 4, GROWL
	db 0

	db ERIKA, 1
	; Victrebell
	db 1, 2, RAZOR_LEAF
	; Tangela
	db 2, 1, MEGA_DRAIN
	db 2, 3, STUN_SPORE
	; Vileplume
	db 3, 4, PETAL_DANCE
	db 0

	db KOGA, 1
	; Weezing
	db 1, 2, TOXIC
	db 1, 3, EXPLOSION
	; Golbat
	db 2, 3, HYPER_FANG
	; Muk
	db 3, 1, SLUDGE
	db 3, 2, TOXIC
	; Venomoth
	db 4, 1, RAZOR_WIND
	db 4, 2, DOUBLE_TEAM
	db 4, 4, TOXIC
	db 0

	db SABRINA, 1
	; Kadabra
	db 1, 2, PSYWAVE
	; Mr. Mime
	db 2, 1, SUBSTITUTE
	db 2, 2, LIGHT_SCREEN
	db 2, 4, MIMIC
	; Butterfree
	db 3, 1, SLEEP_POWDER
	db 3, 2, PSYCHIC_M
	db 3, 4, PSYWAVE
	; Alakazam
	db 4, 1, REFLECT
	db 4, 2, PSYWAVE
	db 0

	db BLAINE, 1
	; Growlithe
	; no change
	; Flareon
	; nothing
	; Rapidash
	; nothing
	; Magmar
	db 4, 2, FIRE_BLAST
	; Arcanine
	db 5, 1, REFLECT
	db 5, 2, DOUBLE_EDGE
	db 5, 4, FIRE_BLAST
	db 0

	db GIOVANNI, 3
	; Dugtrio
	db 1, 1, FISSURE
	; Nidoqueen
	db 2, 1, BODY_SLAM
	db 2, 2, ICE_BEAM
	db 2, 3, THUNDERBOLT
	; Persian
	db 3, 4, DOUBLE_TEAM
	; Nidoking
	db 4, 2, THUNDER
	; Rhydon
	db 5, 1, FIRE_BLAST
	db 5, 2, SURF
	db 5, 4, EARTHQUAKE
	db 0

	db LORELEI, 1  ; first battle
	; Dewgong
	db 1, 1, REST
	db 1, 2, SURF
	; Cloyster
	db 2, 1, BLIZZARD
	; Slowbro
	db 3, 1, BLIZZARD
	db 3, 2, SURF
	; Jynx
	db 4, 1, LOVELY_KISS
	db 4, 3, PSYCHIC_M
	; Lapras
	db 5, 2, BODY_SLAM
	db 0

	db LORELEI, 2  ; rematches
	; Dewgong
	db 1, 1, REST
	db 1, 2, SURF
	db 1, 4, BLIZZARD
	; Jynx
	db 2, 1, LOVELY_KISS
	db 2, 2, BLIZZARD
	db 2, 3, PSYCHIC_M
	db 2, 4, NO_MOVE
	; Vaporeon
	db 3, 1, BLIZZARD
	db 3, 2, SURF
	db 3, 3, ICE_BEAM
	; Cloyster
	db 4, 1, TOXIC
	db 4, 3, BLIZZARD
	; Clefable
	db 5, 1, BLIZZARD
	; PSYCHIC_M?
	; Lapras
	db 6, 2, THUNDERBOLT
	db 6, 3, SURF
	db 0

	db BRUNO, 1  ; first battle
	; Onix
	db 1, 4, DIG
	; Hitmonchan
	; nothing
	; Hitmonlee
	db 3, 1, MEDITATE
	db 3, 2, FOCUS_ENERGY
	; Onix
	db 4, 4, EARTHQUAKE
	; Machamp
	db 5, 2, ROCK_SLIDE
	db 5, 4, EARTHQUAKE
	db 0

	db BRUNO, 2  ; rematches
	; Hitmonchan
	db 1, 1, SUBMISSION
	; Onix
	db 2, 2, EARTHQUAKE
	; Hitmonlee
	db 3, 1, MEDITATE
	db 3, 2, FOCUS_ENERGY
	; Poliwrath
	db 4, 1, ICE_BEAM
	; Golem
	; nothing
	; Machamp
	db 6, 2, ROCK_SLIDE
	db 6, 3, EARTHQUAKE
	db 6, 4, FOCUS_ENERGY
	db 0

	db AGATHA, 1  ; first battle
	; Gengar
	db 1, 4, CONFUSE_RAY
	; Golbat
	db 2, 1, CONFUSE_RAY
	db 2, 3, TOXIC
	db 2, 4, HEX
	; Haunter
	db 3, 1, CONFUSE_RAY
	db 3, 2, MEGA_DRAIN
	db 3, 4, TOXIC
	; Arbok
	db 4, 2, WRAP
	db 4, 4, GLARE
	; Gengar
	db 5, 2, PSYCHIC_M
	db 5, 4, TOXIC
	db 0

	db AGATHA, 2  ; rematches
	; Haunter
	db 1, 1, CONFUSE_RAY
	db 1, 2, MEGA_DRAIN
	db 1, 4, TOXIC
	; Golbat
	db 2, 1, CONFUSE_RAY
	db 2, 3, TOXIC
	db 2, 4, HEX
	; Marowak
	db 3, 1, HEX
	db 3, 3, DOUBLE_TEAM
	; Arbok
	db 4, 2, WRAP
	db 4, 4, GLARE
	; Ninetales
	db 5, 1, HEX
	db 5, 2, FIRE_BLAST
	db 5, 3, WILL_O_WISP
	; Gengar
	db 6, 1, PSYCHIC_M
	db 6, 2, THUNDERBOLT
	db 6, 4, TOXIC
	db 0

	db LANCE, 1  ; first battle
	; Gyarados
	; nothing
	; Dragonair
	db 2, 1, THUNDERBOLT
	db 2, 3, THUNDER_WAVE
	; Dragonair
	db 3, 1, ICE_BEAM
	db 3, 3, BUBBLEBEAM
	; Aerodactyl
	db 4, 2, WING_ATTACK
	; Dragonite
	db 5, 2, FIRE_BLAST
	db 5, 3, THUNDER
	db 0

	db LANCE, 2  ; rematches
	; Dragonite
	db 1, 2, ICE_BEAM
	db 1, 3, THUNDERBOLT
	; Gyarados
	db 2, 1, EARTHQUAKE
	db 2, 3, THUNDERBOLT
	; Kangaskhan
	db 3, 2, HYPER_BEAM
	db 3, 4, ROCK_SLIDE
	; Charizard
	db 4, 1, HYPER_BEAM
	db 4, 2, FIRE_BLAST
	db 4, 4, EARTHQUAKE
	; Aerodactyl
	db 5, 1, FIRE_BLAST
	db 5, 2, SKY_ATTACK
	; Dragonite
	db 6, 2, FIRE_BLAST
	db 6, 3, THUNDER
	db 0

	db RIVAL3, 1  ; first battle
	; Pidgeot
	db 1, 1, DOUBLE_EDGE
	db 1, 2, DOUBLE_TEAM
	db 1, 3, WING_ATTACK
	; Alakazam
	db 2, 1, KINESIS
	; Rhydon
	db 3, 1, SURF
	; Arcanine
	db 4, 1, FIRE_BLAST
	db 4, 2, DOUBLE_EDGE
	; Exeggutor
	db 5, 2, PSYCHIC_M
	; Blastoise
	db 6, 1, EARTHQUAKE
	db 6, 3, BLIZZARD
	db 0

	db RIVAL3, 2  ; first battle
	; Pidgeot
	db 1, 1, DOUBLE_EDGE
	db 1, 2, DOUBLE_TEAM
	db 1, 3, WING_ATTACK
	; Alakazam
	db 2, 1, KINESIS
	; Rhydon
	db 3, 1, SURF
	; Gyarados
	; nothing
	; Arcanine
	db 5, 1, FIRE_BLAST
	db 5, 2, DOUBLE_EDGE
	; Venusaur
	db 6, 4, GROWTH
	db 0

	db RIVAL3, 3  ; first battle
	; Pidgeot
	db 1, 1, DOUBLE_EDGE
	db 1, 2, DOUBLE_TEAM
	db 1, 3, WING_ATTACK
	; Alakazam
	db 2, 1, KINESIS
	; Rhydon
	db 3, 1, SURF
	; Exeggutor
	db 4, 2, PSYCHIC_M
	; Gyarados
	; nothing
	; Charizard
	db 6, 2, FIRE_BLAST
	db 0

	db RIVAL3, 4  ; rematches
	; Pidgeot
	db 1, 1, DOUBLE_EDGE
	db 1, 2, DOUBLE_TEAM
	db 1, 3, WING_ATTACK
	; Alakazam
	db 2, 1, THUNDER_WAVE
	; Rhydon
	db 3, 1, FIRE_BLAST
	db 3, 3, THUNDER
	; Arcanine
	db 4, 1, FIRE_BLAST
	db 4, 2, HYPER_BEAM
	; Exeggutor
	db 5, 1, REFLECT
	db 5, 2, PSYCHIC_M
	; Blastoise
	db 6, 1, EARTHQUAKE
	db 6, 2, HYPER_BEAM
	db 6, 3, BLIZZARD
	db 0

	db RIVAL3, 5  ; rematches
	; Pidgeot
	db 1, 1, DOUBLE_EDGE
	db 1, 2, DOUBLE_TEAM
	db 1, 3, WING_ATTACK
	; Alakazam
	db 2, 1, THUNDER_WAVE
	; Rhydon
	db 3, 1, FIRE_BLAST
	db 3, 3, THUNDER
	; Gyarados
	db 4, 1, EARTHQUAKE
	; Arcanine
	db 5, 1, FIRE_BLAST
	db 5, 2, HYPER_BEAM
	; Venusaur
	db 6, 1, RAZOR_LEAF
	db 6, 3, HYPER_BEAM
	db 6, 4, CUT
	db 0

	db RIVAL3, 6  ; rematches
	; Pidgeot
	db 1, 1, DOUBLE_EDGE
	db 1, 2, DOUBLE_TEAM
	db 1, 3, WING_ATTACK
	; Alakazam
	db 2, 1, THUNDER_WAVE
	; Rhydon
	db 3, 1, FIRE_BLAST
	db 3, 3, THUNDER
	; Exeggutor
	db 4, 1, REFLECT
	db 4, 2, PSYCHIC_M
	; Gyarados
	db 5, 1, EARTHQUAKE
	; Charizard
	db 6, 1, HYPER_BEAM
	db 6, 2, FIRE_BLAST
	db 6, 3, EARTHQUAKE
	db 0

	db PSYCHIC_TR, 5  ; postgame Will
	; Slowbro
	db 1, 1, EARTHQUAKE
	db 1, 2, SURF
	; Mr. Mime
	db 2, 2, PSYCHIC_M
	; Jynx
	db 3, 1, PSYCHIC_M
	db 3, 2, LOVELY_KISS
	; Hypno
	db 4, 1, TOXIC
	db 4, 2, HEX
	db 4, 3, BODY_SLAM
	; Exeggutor
	db 5, 2, PSYCHIC_M
	db 5, 3, MEGA_DRAIN
	db 0

	db PROF_OAK, 1
	; Tauros
	db 1, 1, HYPER_BEAM
	db 1, 3, EARTHQUAKE
	; Electrode
	db 2, 2, THUNDER_WAVE
	; Kingler
	db 3, 2, BLIZZARD
	db 3, 4, BODY_SLAM
	; Rapidash
	db 4, 2, FIRE_BLAST
	; Venusaur
	db 5, 1, RAZOR_LEAF
	db 5, 3, HYPER_BEAM
	db 5, 4, CUT
	; Nidoking
	db 6, 1, SURF
	db 6, 2, HYPER_BEAM
	db 6, 3, BLIZZARD
	db 0

	db PROF_OAK, 2
	; Tauros
	db 1, 1, HYPER_BEAM
	db 1, 3, EARTHQUAKE
	; Electrode
	db 2, 2, THUNDER_WAVE
	; Victreebel
	db 3, 3, TOXIC
	; Kingler
	db 4, 2, BLIZZARD
	db 4, 4, BODY_SLAM
	; Charizard
	db 5, 1, HYPER_BEAM
	db 5, 2, FIRE_BLAST
	db 5, 3, EARTHQUAKE
	; Nidoking
	db 6, 1, ICE_BEAM
	db 6, 2, HYPER_BEAM
	db 6, 3, THUNDER
	db 0

	db PROF_OAK, 3
	; Tauros
	db 1, 1, HYPER_BEAM
	db 1, 3, EARTHQUAKE
	; Electrode
	db 2, 2, THUNDER_WAVE
	; Rapidash
	db 3, 2, FIRE_BLAST
	; Victreebel
	db 4, 3, TOXIC
	; Blastoise
	db 5, 1, EARTHQUAKE
	db 5, 2, HYPER_BEAM
	db 5, 3, BLIZZARD
	; Nidoking
	db 6, 1, THUNDERBOLT
	db 6, 2, HYPER_BEAM
	db 6, 3, FIRE_BLAST
	db 0

	db -1 ; end
