; marcelnote - imported file from pokeyellow to deal with Special Moves
; Yellow entry format:
;	db trainerclass, trainerid
;	repeat { db partymon location, partymon move, move id }
;	db 0 ; marcelnote - changed terminator 0 to $ff to avoid bugs with NO_MOVE (=0) entries

; TO DO: other special trainers
; e.g. Otoshi (Marowak), Anthony (Hitmonchan), Melvin (Exeggcute), Giselle (Academy)

SpecialTrainerMoves:
	db YOUNGSTER, 14  ; based on A.J.
	; Sandshrew
	db 1, 4, FISSURE
	db $ff

	db BROCK, 1
	; Geodude
	db 1, 3, ROCK_THROW
	; Onix
	db 2, 3, BIND
	db 2, 4, BIDE
	db $ff

	db BROCK, 2  ; rematch
	; Aerodactyl - FLY, ROCK_SLIDE, SCREECH, HYPER_BEAM
	db 1, 1, FLY
	; Rhydon - DOUBLE_EDGE, ROCK_SLIDE, HORN_DRILL, EARTHQUAKE
	db 2, 1, DOUBLE_EDGE
	; Omastar - BLIZZARD, TOXIC, CLAMP, SURF
	db 3, 1, BLIZZARD
	db 3, 2, TOXIC
	db 3, 4, SURF
	; Golem - FOCUS_ENERGY, ROCK_SLIDE, EARTHQUAKE, EXPLOSION
	; no change
	; Kabutops - SLASH, SWORDS_DANCE, ROCK_SLIDE, HYDRO_PUMP
	; no change
	; Onix - BIND, FISSURE, ROCK_SLIDE, AGILITY
	db 6, 2, FISSURE
	db $ff

	db MISTY, 1
	; Goldeen
	db 2, 1, PECK
	db 2, 2, WATER_GUN
	; Starmie
	db 3, 1, SWIFT
	db 3, 3, BUBBLEBEAM
	db $ff

	db MISTY, 2  ; rematch
	; Seaking
	db 1, 1, AGILITY
	db 1, 4, NO_MOVE
	; Golduck
	db 2, 1, HYPER_BEAM
	db 2, 2, PSYCHIC_M
	; Dragonair
	db 3, 1, SURF
	db 3, 3, BLIZZARD
	; Seadra
	db 4, 3, SMOKESCREEN
	; Dewgong
	db 5, 1, REST
	db 5, 2, DOUBLE_EDGE
	db 5, 4, SURF
	; Starmie
	db 6, 1, PSYCHIC_M
	db 6, 2, RECOVER
	db 6, 4, SURF
	db $ff

	db LT_SURGE, 1
	; Voltorb
	db 1, 4, THUNDERSHOCK
	; Pikachu
	db 2, 4, THUNDERSHOCK
	; Raichu
	db 3, 2, THUNDERBOLT
	db 3, 3, BODY_SLAM ; if too strong, MEGA_PUNCH
	db 3, 4, GROWL
	db $ff

	db LT_SURGE, 2  ; rematch
	; Magneton
	db 1, 1, THUNDER_WAVE
	db 1, 2, REFLECT
	; Electabuzz
	db 2, 1, THUNDERBOLT
	db 2, 2, PSYCHIC_M
	; Porygon
	db 3, 1, THUNDERBOLT
	db 3, 2, ICE_BEAM
	; Electrode
	db 4, 2, THUNDER_WAVE
	; Jolteon
	db 5, 2, REFLECT
	db 5, 3, THUNDERBOLT
	; Raichu
	db 6, 2, THUNDER_WAVE
	db 6, 4, SURF
	db $ff

	db ERIKA, 1
	; Victrebell
	db 1, 2, RAZOR_LEAF
	; Tangela
	db 2, 1, MEGA_DRAIN
	db 2, 3, STUN_SPORE
	; Vileplume
	db 3, 1, MEGA_DRAIN
	db 3, 4, PETAL_DANCE
	db $ff

	db ERIKA, 2  ; rematch
	; Victreebel
	db 1, 3, TOXIC
	; Parasect
	db 2, 1, MEGA_DRAIN
	db 2, 4, CUT
	; Exeggutor
	db 3, 1, SUBSTITUTE
	db 3, 2, PSYCHIC_M
	db 3, 3, MEGA_DRAIN
	; Tangela
	db 4, 2, BIND
	db 4, 3, MEGA_DRAIN
	; Venusaur
	db 5, 3, ACID
	db 5, 4, LEECH_SEED
	; Vileplume
	db 6, 2, SLEEP_POWDER
	db $ff

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
	db $ff

	db KOGA, 2  ; rematch
	; Weezing
	db 1, 1, TOXIC
	db 1, 3, FIRE_BLAST
	; Golbat
	db 2, 1, MEGA_DRAIN
	db 2, 2, HEX
	db 2, 3, TOXIC
	; Muk
	db 3, 4, BIND
	; Pinsir - TOXIC, PIN_MISSILE, SUBMISSION, SWORDS_DANCE
	db 4, 1, TOXIC
	; Tentacruel
	db 5, 2, TOXIC
	db 5, 3, REFLECT
	; Venomoth
	db 6, 1, RAZOR_WIND
	db 6, 2, DOUBLE_TEAM
	db $ff

	db SABRINA, 1
	; Kadabra - DISABLE, PSYWAVE, RECOVER, PSYCHIC_M
	db 1, 2, PSYWAVE
	; Mr. Mime -  SUBSTITUTE, LIGHT_SCREEN, PSYBEAM, MIMIC
	db 2, 1, SUBSTITUTE
	db 2, 2, LIGHT_SCREEN
	db 2, 4, MIMIC
	; Butterfree - SLEEP_POWDER, PSYCHIC_M, RAZOR_WIND, PSYWAVE
	db 3, 1, SLEEP_POWDER
	db 3, 2, PSYCHIC_M
	db 3, 4, PSYWAVE
	; Alakazam - REFLECT, PSYWAVE, RECOVER, PSYCHIC_M
	db 4, 1, REFLECT
	db 4, 2, PSYWAVE
	db $ff

	db SABRINA, 2  ; rematch
	; Kadabra
	db 1, 1, THUNDER_WAVE
	; Wigglytuff
	db 2, 1, PSYCHIC_M
	db 2, 2, ICE_BEAM
	; Mr. Mime
	db 3, 1, LIGHT_SCREEN
	db 3, 2, PSYCHIC_M
	; Gengar
	db 4, 1, CONFUSE_RAY
	db 4, 2, PSYCHIC_M
	db 4, 4, THUNDERBOLT
	; Butterfree
	db 5, 1, MEGA_DRAIN
	db 5, 2, PSYCHIC_M
	db 5, 4, SLEEP_POWDER
	; Alakazam
	db 6, 1, HYPER_BEAM
	db $ff

	db BLAINE, 1
	; Growlithe
	; no change
	; Flareon
	; no change
	; Rapidash
	; no change
	; Magmar
	db 4, 2, FIRE_BLAST
	; Arcanine
	db 5, 1, REFLECT
	db 5, 2, DOUBLE_EDGE
	db 5, 4, FIRE_BLAST
	db $ff

	db BLAINE, 2  ; rematch
	; Flareon
	db 1, 2, REFLECT
	db 1, 3, DOUBLE_EDGE
	; Ninetales
	db 2, 1, WILL_O_WISP
	db 2, 2, FIRE_BLAST
	; Rapidash
	db 3, 1, FIRE_BLAST
	db 3, 2, DOUBLE_EDGE
	; Gyarados
	db 4, 1, FIRE_BLAST
	db 4, 2, THUNDERBOLT
	db 4, 3, SURF
	; Magmar
	db 5, 1, SMOKESCREEN
	db 5, 3, PSYCHIC_M
	; Arcanine
	db 6, 1, SOLARBEAM
	db 6, 2, DOUBLE_EDGE
	db 6, 4, FIRE_BLAST
	db $ff

	db GIOVANNI, 1  ; Rocket hideout battle
	; Onix
	db 1, 2, TAKE_DOWN
	db 1, 3, SCREECH
	; Rhyhorn
	db 2, 3, TAKE_DOWN
	; Kangaskhan
	; no change
	; Persian
	db 4, 2, BUBBLEBEAM
	db $ff

	db GIOVANNI, 2  ; Silph Co battle
	; Nidorino
	db 1, 3, TAKE_DOWN
	db 1, 4, BUBBLEBEAM
	; Rhyhorn
	db 2, 1, STOMP
	db 2, 2, DIG
	; Kangaskhan
	db 3, 1, SUBMISSION
	db 3, 2, THUNDERBOLT
	; Nidoqueen
	db 4, 1, THUNDERBOLT
	db 4, 3, TOXIC
	db 4, 4, DIG
	; Persian
	db 5, 1, BUBBLEBEAM
	db 5, 2, THUNDERBOLT
	db 5, 3, DOUBLE_TEAM
	db $ff

	db GIOVANNI, 3  ; gym battle
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
	db $ff

	db LORELEI, 1  ; first battle
	; Dewgong - REST, SURF, ICE_BEAM, HYDRO_PUMP
	db 1, 1, REST
	db 1, 2, SURF
	; Cloyster - BLIZZARD, SPIKE_CANNON, CLAMP, ICE_BEAM
	db 2, 1, BLIZZARD
	; Slowbro - ICE_BEAM, SURF, AMNESIA, PSYCHIC_M
	db 3, 1, ICE_BEAM
	db 3, 2, SURF
	; Jynx - LOVELY_KISS, BODY_SLAM, PSYCHIC_M, BLIZZARD
	db 4, 1, LOVELY_KISS
	db 4, 3, PSYCHIC_M
	; Lapras - CONFUSE_RAY, BODY_SLAM, HYDRO_PUMP, BLIZZARD
	db 5, 2, BODY_SLAM
	db $ff

	db LORELEI, 2  ; rematches
	; Dewgong - REST, SURF, ICE_BEAM, BLIZZARD
	db 1, 1, REST
	db 1, 2, SURF
	db 1, 4, BLIZZARD
	; Jynx - LOVELY_KISS, BLIZZARD, PSYCHIC_M
	db 2, 1, LOVELY_KISS
	db 2, 2, BLIZZARD
	db 2, 3, PSYCHIC_M
	db 2, 4, NO_MOVE
	; Vaporeon - BLIZZARD, SURF, ICE_BEAM, HYDRO_PUMP
	db 3, 1, BLIZZARD
	db 3, 2, SURF
	db 3, 3, ICE_BEAM
	; Cloyster - TOXIC, CLAMP, BLIZZARD, HYDRO_PUMP
	db 4, 1, TOXIC
	db 4, 3, BLIZZARD
	; Clefable - BLIZZARD, BODY_SLAM, LIGHT_SCREEN, LOVELY_KISS	; PSYCHIC_M?
	db 5, 1, BLIZZARD
	; Lapras - CONFUSE_RAY, THUNDERBOLT, SURF, BLIZZARD
	db 6, 2, THUNDERBOLT
	db 6, 3, SURF
	db $ff

	db BRUNO, 1  ; first battle
	; Onix - BIND, SLAM, ROCK_SLIDE, DIG
	db 1, 4, DIG
	; Hitmonchan - ICE_PUNCH, THUNDERPUNCH, DIZZY_PUNCH, COUNTER
	; no change
	; Hitmonlee - MEDITATE, FOCUS_ENERGY, HI_JUMP_KICK, MEGA_KICK
	db 3, 1, MEDITATE
	db 3, 2, FOCUS_ENERGY
	; Onix - BIND, SLAM, ROCK_SLIDE, EARTHQUAKE
	db 4, 4, EARTHQUAKE
	; Machamp - KARATE_CHOP, ROCK_SLIDE, THRASH, EARTHQUAKE
	db 5, 2, ROCK_SLIDE
	db 5, 4, EARTHQUAKE
	db $ff

	db BRUNO, 2  ; rematches
	; Hitmonchan - SUBMISSION, THUNDERPUNCH, DIZZY_PUNCH, COUNTER
	db 1, 1, SUBMISSION
	; Onix - BIND, EARTHQUAKE, ROCK_SLIDE, AGILITY
	db 2, 2, EARTHQUAKE
	; Hitmonlee - MEDITATE, FOCUS_ENERGY, HI_JUMP_KICK, MEGA_KICK
	db 3, 1, MEDITATE
	db 3, 2, FOCUS_ENERGY
	; Poliwrath - ICE_BEAM, BODY_SLAM, KARATE_CHOP, HYDRO_PUMP
	db 4, 1, ICE_BEAM
	; Golem - FOCUS_ENERGY, ROCK_SLIDE, EARTHQUAKE, EXPLOSION
	; no change
	; Machamp - KARATE_CHOP, ROCK_SLIDE, EARTHQUAKE, FOCUS_ENERGY
	db 6, 2, ROCK_SLIDE
	db 6, 3, EARTHQUAKE
	db 6, 4, FOCUS_ENERGY
	db $ff

	db AGATHA, 1  ; first battle
	; Gengar - HYPNOSIS, DREAM_EATER, HEX, CONFUSE_RAY
	db 1, 4, CONFUSE_RAY
	; Golbat - CONFUSE_RAY, ACID, TOXIC, HEX
	db 2, 1, CONFUSE_RAY
	db 2, 3, TOXIC
	db 2, 4, HEX
	; Haunter - CONFUSE_RAY, MEGA_DRAIN, HEX, TOXIC
	db 3, 1, CONFUSE_RAY
	db 3, 2, MEGA_DRAIN
	db 3, 4, TOXIC
	; Arbok - ACID, WRAP, HYPER_FANG, GLARE
	db 4, 2, WRAP
	db 4, 4, GLARE
	; Gengar - HYPNOSIS, PSYCHIC_M, HEX, TOXIC
	db 5, 2, PSYCHIC_M
	db 5, 4, TOXIC
	db $ff

	db AGATHA, 2  ; rematches
	; Haunter - CONFUSE_RAY, MEGA_DRAIN, HEX, TOXIC
	db 1, 1, CONFUSE_RAY
	db 1, 2, MEGA_DRAIN
	db 1, 4, TOXIC
	; Golbat - CONFUSE_RAY, ACID, TOXIC, HEX
	db 2, 1, CONFUSE_RAY
	db 2, 3, TOXIC
	db 2, 4, HEX
	; Marowak - HEX, BODY_SLAM, DOUBLE_TEAM, BONEMERANG
	db 3, 1, HEX
	db 3, 2, BODY_SLAM
	db 3, 3, DOUBLE_TEAM
	; Arbok - ACID, WRAP, HYPER_FANG, GLARE
	db 4, 2, WRAP
	db 4, 4, GLARE
	; Ninetales - HEX, FIRE_BLAST, WILL_O_WISP, FIRE_SPIN
	db 5, 1, HEX
	db 5, 2, FIRE_BLAST
	db 5, 3, WILL_O_WISP
	; Gengar - PSYCHIC_M, THUNDERBOLT, HEX, TOXIC
	db 6, 1, PSYCHIC_M
	db 6, 2, THUNDERBOLT
	db 6, 4, TOXIC
	db $ff

	db LANCE, 1  ; first battle
	; Gyarados - THRASH, HYDRO_PUMP, SLAM, HYPER_BEAM
	; no change
	; Dragonair - THUNDERBOLT, SLAM, THUNDER_WAVE, HYPER_BEAM
	db 2, 1, THUNDERBOLT
	db 2, 3, THUNDER_WAVE
	; Dragonair - ICE_BEAM, SLAM, BUBBLEBEAM, HYPER_BEAM
	db 3, 1, ICE_BEAM
	db 3, 3, BUBBLEBEAM
	; Aerodactyl - WING_ATTACK, ROCK_SLIDE, SCREECH, HYPER_BEAM
	db 4, 1, WING_ATTACK
	; Dragonite - SLAM, FIRE_BLAST, THUNDER, HYPER_BEAM
	db 5, 2, FIRE_BLAST
	db 5, 3, THUNDER
	db $ff

	db LANCE, 2  ; rematches
	; Dragonite - SLAM, ICE_BEAM, THUNDERBOLT, HYPER_BEAM
	db 1, 2, ICE_BEAM
	db 1, 3, THUNDERBOLT
	; Gyarados - EARTHQUAKE, HYDRO_PUMP, THUNDERBOLT, HYPER_BEAM
	db 2, 1, EARTHQUAKE
	db 2, 3, THUNDERBOLT
	; Kangaskhan - DIZZY_PUNCH, HYPER_BEAM, SLAM, ROCK_SLIDE
	db 3, 2, HYPER_BEAM
	db 3, 4, ROCK_SLIDE
	; Charizard - HYPER_BEAM, FIRE_BLAST, SLAM, EARTHQUAKE
	db 4, 1, HYPER_BEAM
	db 4, 2, FIRE_BLAST
	db 4, 4, EARTHQUAKE
	; Aerodactyl - FIRE_BLAST, ROCK_SLIDE, SKY_ATTACK, HYPER_BEAM
	db 5, 1, FIRE_BLAST
	db 5, 3, SKY_ATTACK
	; Dragonite - SLAM, FIRE_BLAST, THUNDER, HYPER_BEAM
	db 6, 2, FIRE_BLAST
	db 6, 3, THUNDER
	db $ff

	db RIVAL3, 1  ; first battle
	; Pidgeot - DOUBLE_EDGE, DOUBLE_TEAM, WING_ATTACK, SKY_ATTACK
	db 1, 1, DOUBLE_EDGE
	db 1, 2, DOUBLE_TEAM
	db 1, 3, WING_ATTACK
	; Alakazam - KINESIS, RECOVER, PSYCHIC_M, REFLECT
	db 2, 1, KINESIS
	; Rhydon - SURF, ROCK_SLIDE, HORN_DRILL, EARTHQUAKE
	db 3, 1, SURF
	; Arcanine - FIRE_BLAST, DOUBLE_EDGE, AGILITY, FLAMETHROWER
	db 4, 1, FIRE_BLAST
	db 4, 2, DOUBLE_EDGE
	; Exeggutor - EGG_BOMB, PSYCHIC_M, SOLARBEAM, SLEEP_POWDER
	db 5, 2, PSYCHIC_M
	; Blastoise - EARTHQUAKE, THRASH, BLIZZARD, HYDRO_PUMP
	db 6, 1, EARTHQUAKE
	db 6, 3, BLIZZARD
	db $ff

	db RIVAL3, 2  ; first battle
	; Pidgeot - DOUBLE_EDGE, DOUBLE_TEAM, WING_ATTACK, SKY_ATTACK
	db 1, 1, DOUBLE_EDGE
	db 1, 2, DOUBLE_TEAM
	db 1, 3, WING_ATTACK
	; Alakazam - KINESIS, RECOVER, PSYCHIC_M, REFLECT
	db 2, 1, KINESIS
	; Rhydon - SURF, ROCK_SLIDE, HORN_DRILL, EARTHQUAKE
	db 3, 1, SURF
	; Gyarados -
	; no change
	; Arcanine - FIRE_BLAST, DOUBLE_EDGE, AGILITY, FLAMETHROWER
	db 5, 1, FIRE_BLAST
	db 5, 2, DOUBLE_EDGE
	; Venusaur -
	db 6, 4, GROWTH
	db $ff

	db RIVAL3, 3  ; first battle
	; Pidgeot - DOUBLE_EDGE, DOUBLE_TEAM, WING_ATTACK, SKY_ATTACK
	db 1, 1, DOUBLE_EDGE
	db 1, 2, DOUBLE_TEAM
	db 1, 3, WING_ATTACK
	; Alakazam - KINESIS, RECOVER, PSYCHIC_M, REFLECT
	db 2, 1, KINESIS
	; Rhydon - SURF, ROCK_SLIDE, HORN_DRILL, EARTHQUAKE
	db 3, 1, SURF
	; Exeggutor - EGG_BOMB, PSYCHIC_M, SOLARBEAM, SLEEP_POWDER
	db 4, 2, PSYCHIC_M
	; Gyarados -
	; no change
	; Charizard -
	db 6, 2, FIRE_BLAST
	db $ff

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
	db $ff

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
	db $ff

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
	db $ff

	db WILL, 1  ; postgame Will
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
	db $ff

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
	db $ff

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
	db $ff

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
	db $ff

	db YELLOW, 1
	; Dodrio - JUMP_KICK, DRILL_PECK, DOUBLE_TEAM, MEGA_KICK
	db 1, 2, DRILL_PECK
	db 1, 3, DOUBLE_TEAM
	; Chansey - SOFTBOILED, MINIMIZE, PSYCHIC_M, DOUBLE_EDGE
	db 2, 1, SOFTBOILED
	db 2, 2, MINIMIZE
	db 2, 3, PSYCHIC_M
	; Butterfree - MEGA_DRAIN, PSYCHIC_M, RAZOR_WIND, SLEEP_POWDER
	db 3, 1, MEGA_DRAIN
	db 3, 2, PSYCHIC_M
	db 3, 4, SLEEP_POWDER
	; Omastar - TOXIC, ROCK_SLIDE, CLAMP, SURF
	db 4, 1, TOXIC
	db 4, 2, ROCK_SLIDE
	db 4, 4, SURF
	; Ninetales - WILL_O_WISP, CONFUSE_RAY, HEX, FIRE_SPIN
	db 5, 1, WILL_O_WISP
	db 5, 2, CONFUSE_RAY
	db 5, 3, HEX
	; Pikachu - THUNDERBOLT, SURF, THUNDER, THUNDER_WAVE
	db 6, 2, SURF
	db 6, 4, THUNDER_WAVE
	db $ff

	db -1 ; end
