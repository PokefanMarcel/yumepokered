; Ordered Town Map locations.
; FALSE entries only appear upon opening the map, they are skipped while scrolling.

MACRO town_map_location
	const \1
	db \5 ; selectable while scrolling
	dn \3, \2 ; coordinates
	dw \4 ; name pointer
ENDM

TownMapLocations:
	const_def
	; constant, x, y, name, selectable while scrolling
	town_map_location TOWNMAP_PALLET_TOWN,                    3, 11, PalletTownName,          TRUE
	town_map_location TOWNMAP_ROUTE_1,                        3, 10, Route1Name,              TRUE
	town_map_location TOWNMAP_VIRIDIAN_CITY,                  3,  8, ViridianCityName,        TRUE
	town_map_location TOWNMAP_ROUTE_2,                        3,  6, Route2Name,              TRUE
	town_map_location TOWNMAP_VIRIDIAN_FOREST_NORTH_GATE,     3,  4, Route2Name,              FALSE
	town_map_location TOWNMAP_VIRIDIAN_FOREST,                3,  5, ViridianForestName,      TRUE
	town_map_location TOWNMAP_PEWTER_CITY,                    3,  3, PewterCityName,          TRUE
	town_map_location TOWNMAP_ROUTE_3,                        5,  3, Route3Name,              TRUE
	town_map_location TOWNMAP_CELADON_GROVE_NORTH_GATE,       6,  3, Route3Name,              FALSE
	town_map_location TOWNMAP_MT_MOON,                        7,  2, MountMoonName,           TRUE
	town_map_location TOWNMAP_MT_MOON_SQUARE,                 7,  2, MtMoonSquareName,        FALSE
	town_map_location TOWNMAP_ROUTE_4,                        8,  2, Route4Name,              TRUE
	town_map_location TOWNMAP_MT_MOON_POKECENTER,             6,  2, Route4Name,              FALSE
	town_map_location TOWNMAP_CERULEAN_CITY,                 10,  2, CeruleanCityName,        TRUE
	town_map_location TOWNMAP_CERULEAN_CAVE,                  9,  1, CeruleanCaveName,        FALSE
	town_map_location TOWNMAP_ROUTE_24,                      10,  1, Route24Name,             TRUE
	town_map_location TOWNMAP_ROUTE_25,                      11,  0, Route25Name,             TRUE
	town_map_location TOWNMAP_BILLS_HOUSE,                   12,  0, SeaCottageName,          TRUE
	town_map_location TOWNMAP_ROUTE_5,                       10,  3, Route5Name,              TRUE
	town_map_location TOWNMAP_DAYCARE,                       10,  4, Route5Name,              FALSE
	town_map_location TOWNMAP_ROUTE_6,                       10,  7, Route6Name,              TRUE
	town_map_location TOWNMAP_VERMILION_CITY,                10,  9, VermilionCityName,       TRUE
	town_map_location TOWNMAP_SS_ANNE,                        9, 10, SSAnneName,              TRUE
	town_map_location TOWNMAP_DIGLETTS_CAVE,                 11,  8, DiglettsCaveName,        TRUE
	town_map_location TOWNMAP_DIGLETTS_CAVE_ROUTE_2,          4,  4, DiglettsCaveName,        FALSE
	town_map_location TOWNMAP_ROUTE_9,                       12,  2, Route9Name,              TRUE
	town_map_location TOWNMAP_ROUTE_10,                      14,  2, Route10Name,             TRUE
	town_map_location TOWNMAP_ROCK_TUNNEL,                   14,  3, RockTunnelName,          TRUE
	town_map_location TOWNMAP_POWER_PLANT,                   15,  3, PowerPlantName,          TRUE
	town_map_location TOWNMAP_LAVENDER_TOWN,                 14,  5, LavenderTownName,        TRUE
	town_map_location TOWNMAP_POKEMON_TOWER,                 15,  5, PokemonTowerName,        TRUE
	town_map_location TOWNMAP_ROUTE_8,                       12,  5, Route8Name,              TRUE
	town_map_location TOWNMAP_ROUTE_7,                        8,  5, Route7Name,              TRUE
	town_map_location TOWNMAP_CELADON_CITY,                   7,  5, CeladonCityName,         TRUE
	town_map_location TOWNMAP_ROCKET_HIDEOUT,                 7,  5, RocketHQName,            FALSE
	town_map_location TOWNMAP_CELADON_GROVE,                  7,  4, CeladonGroveName,        TRUE
	town_map_location TOWNMAP_SAFFRON_CITY,                  10,  5, SaffronCityName,         TRUE
	town_map_location TOWNMAP_UNDERGROUND_PATH,              10,  5, UndergroundPathName,     FALSE
	town_map_location TOWNMAP_POKEMON_ACADEMY,               10,  5, PokemonAcademyName,      FALSE
	town_map_location TOWNMAP_SILPH_CO,                      10,  5, SilphCoName,             FALSE
	town_map_location TOWNMAP_ROUTE_11,                      12,  9, Route11Name,             TRUE
	town_map_location TOWNMAP_ROUTE_11_GATE,                 13,  9, Route11Name,             FALSE
	town_map_location TOWNMAP_ROUTE_12,                      14,  9, Route12Name,             TRUE
	town_map_location TOWNMAP_ROUTE_12_GATE,                 14,  7, Route12Name,             FALSE
	town_map_location TOWNMAP_ROUTE_12_FISHING_GUIDE_HOUSE,  14, 10, Route12Name,             FALSE
	town_map_location TOWNMAP_ROUTE_13,                      13, 11, Route13Name,             TRUE
	town_map_location TOWNMAP_ROUTE_14,                      12, 12, Route14Name,             TRUE
	town_map_location TOWNMAP_ROUTE_15,                      11, 13, Route15Name,             TRUE
	town_map_location TOWNMAP_ROUTE_15_GATE,                 10, 13, Route15Name,             FALSE
	town_map_location TOWNMAP_ROUTE_16,                       6,  5, Route16Name,             TRUE
	town_map_location TOWNMAP_ROUTE_16_FLY_HOUSE,             5,  5, Route16Name,             FALSE
	town_map_location TOWNMAP_ROUTE_17,                       5,  8, Route17Name,             TRUE
	town_map_location TOWNMAP_ROUTE_18,                       7, 13, Route18Name,             TRUE
	town_map_location TOWNMAP_FUCHSIA_CITY,                   9, 13, FuchsiaCityName,         TRUE
	town_map_location TOWNMAP_SAFARI_ZONE,                    9, 12, SafariZoneName,          TRUE
	town_map_location TOWNMAP_ROUTE_19,                       8, 15, Route19Name,             TRUE
	town_map_location TOWNMAP_SEAFOAM_ISLANDS,                6, 15, SeafoamIslandsName,      TRUE
	town_map_location TOWNMAP_ROUTE_20,                       5, 15, Route20Name,             TRUE
	town_map_location TOWNMAP_CINNABAR_ISLAND,                3, 15, CinnabarIslandName,      TRUE
	town_map_location TOWNMAP_POKEMON_MANSION,                3, 15, PokemonMansionName,      FALSE
	town_map_location TOWNMAP_CINNABAR_VOLCANO,               2, 15, CinnabarVolcanoName,     TRUE
	town_map_location TOWNMAP_ROUTE_21,                       3, 13, Route21Name,             TRUE
	town_map_location TOWNMAP_MANDARIN_ISLAND,               15, 15, MandarinIslandName,      TRUE
	town_map_location TOWNMAP_CITRUS_FERRY,                  12, 15, CitrusFerryName,         FALSE
	town_map_location TOWNMAP_SILPH_FACTORY,                 15, 15, SilphFactoryName,        FALSE
	town_map_location TOWNMAP_ROUTE_22,                       2,  8, Route22Name,             TRUE
	town_map_location TOWNMAP_ROUTE_22_GATE,                  1,  7, Route22Name,             FALSE
	town_map_location TOWNMAP_ROUTE_23,                       1,  6, Route23Name,             TRUE
	town_map_location TOWNMAP_ROUTE_28,                       0,  7, Route28Name,             FALSE
	town_map_location TOWNMAP_MT_SILVER,                      0,  7, MtSilverName,            FALSE
	town_map_location TOWNMAP_VICTORY_ROAD,                   1,  4, VictoryRoadName,         TRUE
	town_map_location TOWNMAP_INDIGO_PLATEAU,                 1,  2, IndigoPlateauName,       TRUE
	town_map_location TOWNMAP_POKEMON_LEAGUE,                 1,  2, PokemonLeagueName,       FALSE
TownMapLocationsEnd:
DEF NUM_TOWN_MAP_LOCATIONS EQU const_value
