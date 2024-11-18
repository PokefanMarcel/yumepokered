; marcelnote - revamped Super Rod encounters
; super rod encounters
SuperRodData:
	; map, fishing group
	dbw PALLET_TOWN,         .Group1
	dbw VIRIDIAN_CITY,       .Group2
	dbw CERULEAN_CITY,       .Group2
	dbw VERMILION_CITY,      .Group1
	dbw CELADON_CITY,        .Group3
	dbw FUCHSIA_CITY,        .Group2
	dbw CINNABAR_ISLAND,     .Group1
	dbw MANDARIN_ISLAND,     .Group12 ; marcelnote - new map
	dbw ROUTE_4,             .Group2
	dbw ROUTE_6,             .Group4
	dbw ROUTE_10,            .Group5
	dbw ROUTE_11,            .Group1
	dbw ROUTE_12,            .Group1
	dbw ROUTE_13,            .Group1
	dbw ROUTE_17,            .Group1
	dbw ROUTE_18,            .Group1
	dbw ROUTE_19,            .Group1
	dbw ROUTE_20,            .Group1
	dbw ROUTE_21,            .Group1
	dbw ROUTE_22,            .Group2
	dbw ROUTE_23,            .Group6
	dbw ROUTE_24,            .Group2
	dbw ROUTE_25,            .Group7
	dbw ROUTE_28,            .Group8 ; marcelnote - new route
	dbw ORANGE_ROUTE_1,      .Group1 ; marcelnote - new route
	dbw CERULEAN_GYM,        .Group9
	dbw VERMILION_DOCK,      .Group1
	dbw SEAFOAM_ISLANDS_B3F, .Group10
	dbw SEAFOAM_ISLANDS_B4F, .Group10
	dbw SAFARI_ZONE_EAST,    .Group11
	dbw SAFARI_ZONE_NORTH,   .Group11
	dbw SAFARI_ZONE_WEST,    .Group11
	dbw SAFARI_ZONE_CENTER,  .Group11
	dbw CERULEAN_CAVE_2F,    .Group6
	dbw CERULEAN_CAVE_B1F,   .Group6
	dbw CERULEAN_CAVE_1F,    .Group6
	dbw MT_MOON_SQUARE,      .Group2 ; marcelnote - new map
	dbw CELADON_GROVE,       .Group3 ; marcelnote - new map
	dbw MT_SILVER_2F,        .Group13 ; marcelnote - new map
	db -1 ; end

; fishing groups
; number of monsters, followed by level/monster pairs

; MAGIKARP, POLIWAG, GOLDEEN and evolutions
; KRABBY, HORSEA, PSYDUCK, SLOWPOKE, TENTACOOL and evolutions
; SHELLDER, STARYU
; special: SQUIRTLE, WARTORTLE, DRATINI, GRIMER, MUK

.Group1: ; PALLET_TOWN, VERMILION_CITY, CINNABAR_ISLAND,
         ; ROUTE_11, ROUTE_12, ROUTE_13, ROUTE_17, ROUTE_18, ROUTE_19, ROUTE_20, ROUTE_21,
         ; VERMILION_DOCK
	db 8
	db 27, KRABBY
	db 27, HORSEA
	db 25, STARYU
	db 27, STARYU
	db 25, SHELLDER
	db 27, SHELLDER
	db 25, TENTACOOL
	db 25, MAGIKARP

.Group2: ; VIRIDIAN_CITY, CERULEAN_CITY, FUCHSIA_CITY,
         ; ROUTE_4, ROUTE_22, ROUTE_24, MT_MOON_SQUARE
	db 6
	db 27, POLIWAG
	db 25, POLIWHIRL
	db 27, GOLDEEN
	db 25, SEAKING
	db 25, PSYDUCK
	db 25, MAGIKARP

.Group3: ; CELADON_CITY, CELADON_GROVE
	db 7
	db 25, POLIWHIRL
	db 27, POLIWHIRL
	db 25, PSYDUCK
	db 27, PSYDUCK
	db 25, SLOWPOKE
	db 27, SLOWPOKE
	db 27, KRABBY

.Group4: ; ROUTE_6
	db 5
	db 25, KRABBY
	db 27, KRABBY
	db 25, PSYDUCK
	db 27, PSYDUCK
	db 23, SQUIRTLE

.Group5: ; ROUTE_10
	db 6
	db 27, GOLDEEN
	db 25, SEAKING
	db 25, KRABBY
	db 27, KRABBY
	db 23, SLOWPOKE
	db 25, SLOWPOKE

.Group6: ; ROUTE_23, CERULEAN_CAVE_*
	db 5
	db 37, POLIWHIRL
	db 34, SLOWBRO
	db 36, KINGLER
	db 36, SEADRA
	db 34, GOLDUCK

.Group7: ; ROUTE_25
	db 8
	db 27, GOLDEEN
	db 25, SEAKING
	db 25, KRABBY
	db 27, KRABBY
	db 25, PSYDUCK
	db 27, PSYDUCK
	db 23, DRATINI
	db 25, MAGIKARP

.Group8: ; ROUTE_28
	db 6
	db 38, DRATINI
	db 43, STARMIE
	db 43, CLOYSTER
	db 47, SLOWBRO
	db 49, GOLDUCK
	db 50, GYARADOS

.Group9: ; CERULEAN_GYM
	db 4
	db 27, GOLDEEN
	db 25, SEAKING
	db 25, HORSEA
	db 25, PSYDUCK

.Group10: ; SEAFOAM_ISLANDS_*
	db 8
	db 32, STARYU
	db 34, STARYU
	db 32, SHELLDER
	db 34, SHELLDER
	db 40, SEADRA
	db 40, KINGLER
	db 38, DEWGONG
	db 35, WARTORTLE

.Group11: ; SAFARI_ZONE_*
	db 4
	db 23, DRATINI
	db 25, KRABBY
	db 25, PSYDUCK
	db 25, SLOWPOKE

.Group12: ; MANDARIN_ISLAND
	db 4
	db 25, TENTACOOL
	db 25, GRIMER
	db 27, GRIMER
	db 31, MUK

.Group13: ; MT_SILVER_2F
	db 7
	db 51, KABUTOPS
	db 51, OMASTAR
	db 54, KABUTOPS
	db 54, OMASTAR
	db 57, SEAKING
	db 56, GOLDUCK
	db 56, SLOWBRO
