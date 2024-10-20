; marcelnote - new for Old Rod encounters
; old rod encounters
OldRodData:
	; map, fishing group
	dbw PALLET_TOWN,         .Group2
	dbw VIRIDIAN_CITY,       .Group1
	dbw CERULEAN_CITY,       .Group3
	dbw VERMILION_CITY,      .Group4
	dbw CELADON_CITY,        .Group5
	dbw FUCHSIA_CITY,        .Group5
	dbw CINNABAR_ISLAND,     .Group4
	dbw MANDARIN_ISLAND,     .Group4 ; marcelnote - new map
	dbw ROUTE_4,             .Group3
	dbw ROUTE_6,             .Group6
	dbw ROUTE_10,            .Group4
	dbw ROUTE_11,            .Group4
	dbw ROUTE_12,            .Group4
	dbw ROUTE_13,            .Group4
	dbw ROUTE_17,            .Group4
	dbw ROUTE_18,            .Group4
	dbw ROUTE_19,            .Group4
	dbw ROUTE_20,            .Group4
	dbw ROUTE_21,            .Group4
	dbw ROUTE_22,            .Group1
	dbw ROUTE_23,            .Group6
	dbw ROUTE_24,            .Group3
	dbw ROUTE_25,            .Group4
	dbw ROUTE_28,            .Group6 ; marcelnote - new route
	dbw CERULEAN_GYM,        .Group2
	dbw VERMILION_DOCK,      .Group4
	dbw SEAFOAM_ISLANDS_B3F, .Group4
	dbw SEAFOAM_ISLANDS_B4F, .Group4
	dbw SAFARI_ZONE_EAST,    .Group6
	dbw SAFARI_ZONE_NORTH,   .Group6
	dbw SAFARI_ZONE_WEST,    .Group6
	dbw SAFARI_ZONE_CENTER,  .Group6
	dbw CERULEAN_CAVE_2F,    .Group4
	dbw CERULEAN_CAVE_B1F,   .Group4
	dbw CERULEAN_CAVE_1F,    .Group4
	dbw MT_MOON_SQUARE,      .Group3 ; marcelnote - new map
	dbw CELADON_GROVE,       .Group5 ; marcelnote - new map
	db -1 ; end

; fishing groups
; number of monsters, followed by level/monster pairs

; MAGIKARP, POLIWAG, GOLDEEN

.Group1: ; VIRIDIAN_CITY, ROUTE_22
	db 3
	db 3, GOLDEEN
	db 3, POLIWAG
	db 4, GOLDEEN

.Group2: ; PALLET_TOWN, CERULEAN_GYM
	db 2
	db 4, GOLDEEN
	db 5, GOLDEEN

.Group3: ; CERULEAN_CITY, ROUTE_4, ROUTE_24, MT_MOON_SQUARE
	db 4
	db 4, GOLDEEN
	db 5, GOLDEEN
	db 4, POLIWAG
	db 5, POLIWAG

.Group4: ; VERMILION_CITY, CINNABAR_ISLAND, MANDARIN_ISLAND, ROUTE_10, ROUTE_11, ROUTE_12,
         ; ROUTE_13, ROUTE_17, ROUTE_18, ROUTE_19, ROUTE_20, ROUTE_21, ROUTE_25, VERMILION_DOCK,
         ; SEAFOAM_ISLANDS_*, CERULEAN_CAVE_*
	db 4
	db 5, GOLDEEN
	db 7, GOLDEEN
	db 5, MAGIKARP
	db 7, MAGIKARP

.Group5: ; CELADON_CITY, FUCHSIA_CITY, CELADON_GROVE
	db 4
	db 5, POLIWAG
	db 7, POLIWAG
	db 5, MAGIKARP
	db 7, MAGIKARP

.Group6: ; ROUTE_6, ROUTE_23, ROUTE_28, SAFARI_ZONE_*
	db 6
	db 5, POLIWAG
	db 7, POLIWAG
	db 5, GOLDEEN
	db 7, GOLDEEN
	db 5, MAGIKARP
	db 7, MAGIKARP
