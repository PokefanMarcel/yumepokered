; marcelnote - revamped Good Rod encounters
; good rod encounters
GoodRodData:
	; map, fishing group
	dbw PALLET_TOWN,         .Group3
	dbw VIRIDIAN_CITY,       .Group1
	dbw CERULEAN_CITY,       .Group1
	dbw VERMILION_CITY,      .Group3
	dbw CELADON_CITY,        .Group6
	dbw FUCHSIA_CITY,        .Group1
	dbw CINNABAR_ISLAND,     .Group4
	dbw MANDARIN_ISLAND,     .Group11 ; marcelnote - new map
	dbw ROUTE_4,             .Group1
	dbw ROUTE_6,             .Group5
	dbw ROUTE_10,            .Group7
	dbw ROUTE_11,            .Group3
	dbw ROUTE_12,            .Group4
	dbw ROUTE_13,            .Group4
	dbw ROUTE_17,            .Group4
	dbw ROUTE_18,            .Group4
	dbw ROUTE_19,            .Group4
	dbw ROUTE_20,            .Group4
	dbw ROUTE_21,            .Group4
	dbw ROUTE_22,            .Group1
	dbw ROUTE_23,            .Group6
	dbw ROUTE_24,            .Group1
	dbw ROUTE_25,            .Group8
	dbw ROUTE_28,            .Group9 ; marcelnote - new route
	dbw CERULEAN_GYM,        .Group2
	dbw VERMILION_DOCK,      .Group3
	dbw SEAFOAM_ISLANDS_B3F, .Group10
	dbw SEAFOAM_ISLANDS_B4F, .Group10
	dbw SAFARI_ZONE_EAST,    .Group9
	dbw SAFARI_ZONE_NORTH,   .Group9
	dbw SAFARI_ZONE_WEST,    .Group9
	dbw SAFARI_ZONE_CENTER,  .Group9
	dbw CERULEAN_CAVE_2F,    .Group6
	dbw CERULEAN_CAVE_B1F,   .Group6
	dbw CERULEAN_CAVE_1F,    .Group6
	dbw MT_MOON_SQUARE,      .Group1 ; marcelnote - new map
	dbw CELADON_GROVE,       .Group6 ; marcelnote - new map
	db -1 ; end

; fishing groups
; number of monsters, followed by level/monster pairs

; MAGIKARP, POLIWAG, GOLDEEN
; KRABBY, HORSEA, PSYDUCK, SLOWPOKE, TENTACOOL
; special: SQUIRTLE, DRATINI, GRIMER

.Group1: ; VIRIDIAN_CITY, CERULEAN_CITY, FUCHSIA_CITY,
         ; ROUTE_4, ROUTE_22, ROUTE_24, MT_MOON_SQUARE
	db 8
	db 15, PSYDUCK
	db 15, POLIWAG
	db 17, POLIWAG
	db 13, GOLDEEN
	db 15, GOLDEEN
	db 17, GOLDEEN
	db 13, MAGIKARP
	db 15, MAGIKARP

.Group2: ; CERULEAN_GYM
	db 4
	db 13, GOLDEEN
	db 15, GOLDEEN
	db 13, HORSEA
	db 13, PSYDUCK

.Group3: ; PALLET_TOWN, VERMILION_CITY, ROUTE_11, VERMILION_DOCK
	db 6
	db 13, MAGIKARP
	db 15, MAGIKARP
	db 15, KRABBY
	db 17, KRABBY
	db 15, HORSEA
	db 17, HORSEA

.Group4: ; CINNABAR_ISLAND, ROUTE_12, ROUTE_13, ROUTE_17, ROUTE_18, ROUTE_19, ROUTE_20, ROUTE_21
	db 8
	db 15, MAGIKARP
	db 15, GOLDEEN
	db 17, GOLDEEN
	db 15, KRABBY
	db 17, KRABBY
	db 15, HORSEA
	db 17, HORSEA
	db 15, TENTACOOL

.Group5: ; ROUTE_6
	db 7
	db 15, POLIWAG
	db 17, POLIWAG
	db 15, KRABBY
	db 17, KRABBY
	db 13, PSYDUCK
	db 15, PSYDUCK
	db 13, SQUIRTLE

.Group6: ; CELADON_CITY, CELADON_GROVE, ROUTE_23, CERULEAN_CAVE_*
	db 8
	db 15, POLIWAG
	db 17, POLIWAG
	db 15, PSYDUCK
	db 17, PSYDUCK
	db 15, SLOWPOKE
	db 17, SLOWPOKE
	db 15, MAGIKARP
	db 17, KRABBY

.Group7: ; ROUTE_10
	db 5
	db 15, GOLDEEN
	db 17, GOLDEEN
	db 13, MAGIKARP
	db 15, MAGIKARP
	db 15, SLOWPOKE

.Group8: ; ROUTE_25
	db 8
	db 13, MAGIKARP
	db 15, MAGIKARP
	db 15, GOLDEEN
	db 17, GOLDEEN
	db 15, KRABBY
	db 17, KRABBY
	db 15, PSYDUCK
	db 11, DRATINI

.Group9: ; ROUTE_28, SAFARI_ZONE_*
	db 5
	db 15, PSYDUCK
	db 17, PSYDUCK
	db 15, SLOWPOKE
	db 17, SLOWPOKE
	db 13, DRATINI

.Group10: ; SEAFOAM_ISLANDS_*
	db 7
	db 17, KRABBY
	db 17, HORSEA
	db 15, PSYDUCK
	db 17, PSYDUCK
	db 15, SLOWPOKE
	db 17, SLOWPOKE
	db 15, SQUIRTLE

.Group11: ; MANDARIN_ISLAND
	db 3
	db 15, TENTACOOL
	db 15, GRIMER
	db 17, GRIMER
