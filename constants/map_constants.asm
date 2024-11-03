MACRO map_const
	const \1
	DEF \1_WIDTH EQU \2
	DEF \1_HEIGHT EQU \3
ENDM

; marcelnote - other files which rely on map order:
; - ItemUseBall.notOldManBattle (item_effects.asm) to identify PokemonTower maps (relies on contiguous 1F-7F)
; - DungeonMaps2 (dungeon_maps.asm) uses map intervals

; map ids
; indexes for:
; - MapHeaderBanks (see data/maps/map_header_banks.asm)
; - MapHeaderPointers (see data/maps/map_header_pointers.asm)
; - MapSongBanks (see data/maps/songs.asm)
; - MapHSPointers (see data/maps/hide_show_data.asm)
; - MapSpriteSets (see data/maps/sprite_sets.asm)
; - ExternalMapEntries (see data/maps/town_map_entries.asm)
; - WildDataPointers (see data/wild/grass_water.asm)
; Each map also has associated data in maps.asm.
; Order: towns/cities, then routes, then indoor/dungeon maps
	const_def
	map_const PALLET_TOWN,                   14,  9 ; marcelnote - expanded for new houses
	map_const VIRIDIAN_CITY,                 20, 18
	map_const PEWTER_CITY,                   20, 18
	map_const CERULEAN_CITY,                 20, 18
	map_const LAVENDER_TOWN,                 10,  9
	map_const VERMILION_CITY,                20, 18
	map_const CELADON_CITY,                  25, 18
	map_const SAFFRON_CITY,                  20, 18
	map_const FUCHSIA_CITY,                  20, 18
	map_const CINNABAR_ISLAND,               14,  9 ; marcelnote - expanded for Cinnabar Volcano
	map_const MANDARIN_ISLAND,               17, 16 ; marcelnote - new map
	map_const INDIGO_PLATEAU,                10,  9
DEF NUM_CITY_MAPS EQU const_value
	map_const ROUTE_1,                       10, 18
	map_const ROUTE_2,                       10, 36
	map_const ROUTE_3,                       37,  9 ; marcelnote - expanded from x=35 for Celadon Grove
	map_const ROUTE_4,                       45,  9
	map_const ROUTE_5,                       10, 18
	map_const ROUTE_6,                       10, 18
	map_const ROUTE_7,                       10,  9
	map_const ROUTE_8,                       30,  9
	map_const ROUTE_9,                       30,  9
	map_const ROUTE_10,                      10, 36
	map_const ROUTE_11,                      30,  9
	map_const ROUTE_12,                      10, 54
	map_const ROUTE_13,                      30,  9
	map_const ROUTE_14,                      10, 27
	map_const ROUTE_15,                      30,  9
	map_const ROUTE_16,                      22, 10 ; marcelnote - expanded to solve visual bug
	map_const ROUTE_17,                      10, 72
	map_const ROUTE_18,                      25,  9
	map_const ROUTE_19,                      15, 27 ; marcelnote - adjusted for expanded Route 19
	map_const ROUTE_20,                      45,  9 ; marcelnote - adjusted for expanded Route 19
	map_const ROUTE_21,                      10, 45
	map_const ROUTE_22,                      20, 10 ; marcelnote - expanded for Route22OldRodHouse
	map_const ROUTE_23,                      10, 72
	map_const ROUTE_24,                      10, 18
	map_const ROUTE_25,                      30,  9
	map_const ROUTE_28,                      39,  9 ; marcelnote - new map
DEF FIRST_INDOOR_MAP EQU const_value
	map_const REDS_YELLOWS_HOUSES,           25,  4 ; marcelnote - merged RedsHouse floors, added YellowsHouse
	map_const BLUES_AIDES_HOUSES,            11,  4 ; marcelnote - added Aide's house
	map_const OAKS_LAB,                       5,  6
	map_const VIRIDIAN_POKECENTER,            7,  4
	map_const VIRIDIAN_MART,                  4,  4 ; to merge
	map_const VIRIDIAN_SCHOOL_HOUSE,          4,  4
	map_const VIRIDIAN_NICKNAME_HOUSE,        4,  4
	map_const VIRIDIAN_GYM,                  10,  9
	map_const VIRIDIAN_FOREST_SOUTH_GATE,     5,  4
	map_const ROUTE_2_GATE,                   5,  4
	map_const VIRIDIAN_FOREST,               17, 24
	map_const VIRIDIAN_FOREST_NORTH_GATE,     5,  4
	map_const ROUTE_2_TRADE_HOUSE,            4,  4
	map_const DIGLETTS_CAVE_ROUTE_2,          4,  4
	map_const PEWTER_POKECENTER,              7,  4
	map_const MUSEUM_1F,                     10,  4
	map_const MUSEUM_2F,                      7,  4 ; to merge ?
	map_const PEWTER_NIDORAN_HOUSE,           4,  4
	map_const PEWTER_MART,                    4,  4 ; to merge
	map_const PEWTER_SPEECH_HOUSE,            4,  4
	map_const PEWTER_GYM,                     5,  7
	map_const CELADON_GROVE_NORTH_GATE,       5,  4 ; marcelnote - new map
	map_const MT_MOON_POKECENTER,             7,  4
	map_const MT_MOON_1F,                    20, 18
	map_const MT_MOON_B1F,                   14, 14
	map_const MT_MOON_B2F,                   20, 18
	map_const MT_MOON_SQUARE,                12,  6 ; marcelnote - new map
	map_const CERULEAN_POKECENTER,            7,  4
	map_const CERULEAN_TRASHED_HOUSE,         4,  4
	map_const CERULEAN_TRADE_HOUSE,           4,  4
	map_const CERULEAN_BADGE_HOUSE,           4,  4
	map_const BIKE_SHOP,                      4,  4
	map_const CERULEAN_MART,                  4,  4 ; to merge
	map_const CERULEAN_GYM,                   5,  7
	map_const CERULEAN_CAVE_1F,              15,  9
	map_const CERULEAN_CAVE_2F,              15,  9
	map_const CERULEAN_CAVE_B1F,             15,  9
	map_const BILLS_HOUSE,                    4,  4
	map_const ROUTE_5_GATE,                  10,  3 ; marcelnote - expanded for 2nd floor
	map_const UNDERGROUND_PATH_ROUTE_5,       4,  4
	map_const DAYCARE,                        4,  4
	map_const ROUTE_6_GATE,                  10,  3 ; marcelnote - expanded for 2nd floor
	map_const UNDERGROUND_PATH_ROUTE_6,       4,  4
	map_const ROUTE_7_GATE,                   3, 10 ; marcelnote - expanded for 2nd floor
	map_const UNDERGROUND_PATH_ROUTE_7,       4,  4
	map_const ROUTE_8_GATE,                   3, 10 ; marcelnote - expanded for 2nd floor
	map_const UNDERGROUND_PATH_ROUTE_8,       4,  4
	map_const UNDERGROUND_PATH_NORTH_SOUTH,   4, 23 ; marcelnote - fixed from y=24
	map_const UNDERGROUND_PATH_WEST_EAST,    25,  4
	map_const VERMILION_POKECENTER,           7,  4
	map_const VERMILION_GOOD_ROD_HOUSE,       4,  4 ; marcelnote - Old -> Good Rod
	map_const POKEMON_FAN_CLUB,               4,  4
	map_const VERMILION_MART,                 4,  4 ; to merge
	map_const VERMILION_PIDGEY_HOUSE,         4,  4
	map_const VERMILION_TRADE_HOUSE,          4,  4
	map_const VERMILION_GYM,                  5,  9
	map_const VERMILION_DOCK,                14,  6
	map_const SS_ANNE_1F,                    20,  9
	map_const SS_ANNE_2F,                    20,  9
	map_const SS_ANNE_3F,                    10,  3
	map_const SS_ANNE_B1F,                   15,  4
	map_const SS_ANNE_BOW,                   10,  7
	map_const SS_ANNE_KITCHEN,                7,  8
	map_const SS_ANNE_CAPTAINS_ROOM,          3,  4
	map_const SS_ANNE_1F_ROOMS,              12,  8
	map_const SS_ANNE_2F_ROOMS,              12,  8
	map_const SS_ANNE_B1F_ROOMS,             12,  8
	map_const DIGLETTS_CAVE,                 20, 18
	map_const DIGLETTS_CAVE_ROUTE_11,         4,  4
	map_const ROUTE_11_GATE,                  4, 11 ; marcelnote - merged Route11Gate floors
	map_const ROCK_TUNNEL_POKECENTER,         7,  4
	map_const ROCK_TUNNEL_1F,                20, 18
	map_const ROCK_TUNNEL_B1F,               20, 18
	map_const POWER_PLANT,                   20, 18
	map_const LAVENDER_POKECENTER_MART,      14,  4 ; marcelnote - merged Lavender Pokecenter and Mart
	map_const MR_FUJIS_HOUSE,                 4,  4
	map_const NAME_RATERS_HOUSE,              4,  4
	map_const LAVENDER_CUBONE_HOUSE,          4,  4
	map_const POKEMON_TOWER_1F,              10,  9
	map_const POKEMON_TOWER_2F,              10,  9
	map_const POKEMON_TOWER_3F,              10,  9
	map_const POKEMON_TOWER_4F,              10,  9
	map_const POKEMON_TOWER_5F,              10,  9
	map_const POKEMON_TOWER_6F,              10,  9
	map_const POKEMON_TOWER_7F,              10,  9
	map_const ROUTE_12_GATE,                 11,  4 ; marcelnote - merged Route12Gate floors
	map_const ROUTE_12_FISHING_GUIDE_HOUSE,   4,  4 ; marcelnote - Super Rod -> Fishing Guide
	map_const CELADON_POKECENTER,             7,  4
	map_const CELADON_MART_1F2F3F,           10, 18 ; marcelnote - merged 1F 2F 3F
	map_const CELADON_MART_4F5F6F,           10, 18 ; marcelnote - merged 4F 5F + new 6F
	map_const CELADON_MART_ROOF,             10,  6 ; marcelnote - expanded from y=4 for building front
	map_const CELADON_MART_ELEVATOR,          2,  2
	map_const CELADON_MANSION,                4, 33 ; marcelnote - merged CeladonMansion floors, added 4F
	map_const CELADON_MANSION_ROOF,           4,  8 ; marcelnote - expanded from y=6 for building front
	map_const CELADON_MANSION_ROOF_HOUSE,     4,  4
	map_const GAME_CORNER,                   10,  9
	map_const GAME_CORNER_PRIZE_ROOM,         5,  4
	map_const CELADON_DINER,                  5,  4
	map_const CELADON_CHIEF_HOUSE,            4,  4
	map_const CELADON_HOTEL,                  7,  4
	map_const CELADON_GROVE_SOUTH_GATE,       5,  4 ; marcelnote - new map
	map_const CELADON_GYM,                    5,  9
	map_const ROCKET_HIDEOUT_B1F,            15, 14
	map_const ROCKET_HIDEOUT_B2F,            15, 14
	map_const ROCKET_HIDEOUT_B3F,            15, 14
	map_const ROCKET_HIDEOUT_B4F,            15, 12
	map_const ROCKET_HIDEOUT_ELEVATOR,        3,  4
	map_const CELADON_GROVE,                 22, 24 ; marcelnote - new map
	map_const ROUTE_15_GATE,                  4, 11 ; marcelnote - merged Route15Gate floors
	map_const ROUTE_16_GATE,                  4, 13 ; marcelnote - merged Route16Gate floors
	map_const ROUTE_16_FLY_HOUSE,             4,  4
	map_const ROUTE_18_GATE,                  4, 11 ; marcelnote - merged Route18Gate floors
	map_const SAFFRON_POKECENTER_MART,       14,  4 ; marcelnote - merged Saffron Pokecenter and Mart
	map_const COPYCATS_HOUSE_1F,              4,  4
	map_const COPYCATS_HOUSE_2F,              4,  4
	map_const FIGHTING_DOJO,                  5,  6
	map_const SAFFRON_PIDGEY_HOUSE,           4,  4
	map_const MR_PSYCHICS_HOUSE,              4,  4
	map_const SAFFRON_GYM,                   10,  9
	map_const POKEMON_ACADEMY_1F2F,          19,  6 ; marcelnote - new map
	map_const POKEMON_ACADEMY_3F4F,          19,  6 ; marcelnote - new map
	map_const SILPH_CO_1F,                   15,  9
	map_const SILPH_CO_2F,                   15,  9
	map_const SILPH_CO_3F,                   15,  9
	map_const SILPH_CO_4F,                   15,  9
	map_const SILPH_CO_5F,                   15,  9
	map_const SILPH_CO_6F,                   13,  9
	map_const SILPH_CO_7F,                   13,  9
	map_const SILPH_CO_8F,                   13,  9
	map_const SILPH_CO_9F,                   13,  9
	map_const SILPH_CO_10F,                   8,  9
	map_const SILPH_CO_11F,                   9,  9
	map_const SILPH_CO_ELEVATOR,              2,  2
	map_const FUCHSIA_POKECENTER,             7,  4
	map_const FUCHSIA_MART,                   4,  4 ; to merge
	map_const FUCHSIA_BILLS_GRANDPAS_HOUSE,   4,  4
	map_const WARDENS_HOUSE,                  5,  4
	map_const FUCHSIA_MEETING_ROOM,           7,  4
	map_const FUCHSIA_SUPER_ROD_HOUSE,        4,  4 ; marcelnote - Good -> Super Rod
	map_const FUCHSIA_MOVE_DELETER_HOUSE,     4,  4 ; marcelnote - new map
	map_const FUCHSIA_GYM,                    5,  9
	map_const SAFARI_ZONE_GATE,               4,  3
	map_const SAFARI_ZONE_EAST,              15, 13
	map_const SAFARI_ZONE_NORTH,             20, 18
	map_const SAFARI_ZONE_WEST,              15, 13
	map_const SAFARI_ZONE_CENTER,            15, 13
	map_const SAFARI_ZONE_CENTER_REST_HOUSE,  4,  4
	map_const SAFARI_ZONE_SECRET_HOUSE,       4,  4
	map_const SAFARI_ZONE_WEST_REST_HOUSE,    4,  4
	map_const SAFARI_ZONE_EAST_REST_HOUSE,    4,  4
	map_const SAFARI_ZONE_NORTH_REST_HOUSE,   4,  4
	map_const SEAFOAM_ISLANDS_1F,            15,  9
	map_const SEAFOAM_ISLANDS_B1F,           15,  9
	map_const SEAFOAM_ISLANDS_B2F,           15,  9
	map_const SEAFOAM_ISLANDS_B3F,           15,  9
	map_const SEAFOAM_ISLANDS_B4F,           15,  9
	map_const CINNABAR_POKECENTER_MART,      14,  4 ; marcelnote - merged Cinnabar Pokecenter and Mart
	map_const CINNABAR_LAB,                   9,  4 ; to merge ?
	map_const CINNABAR_LAB_TRADE_ROOM,        4,  4 ; to merge ?
	map_const CINNABAR_LAB_METRONOME_ROOM,    4,  4 ; to merge ?
	map_const CINNABAR_LAB_FOSSIL_ROOM,       4,  4 ; to merge ?
	map_const CINNABAR_GYM,                  10,  9
	map_const POKEMON_MANSION_1F,            15, 14
	map_const POKEMON_MANSION_2F,            15, 14
	map_const POKEMON_MANSION_3F,            15,  9
	map_const POKEMON_MANSION_B1F,           15, 14
	map_const CINNABAR_VOLCANO_1FB1F,        14, 18 ; marcelnote - new map
	map_const CINNABAR_VOLCANO_2F,           17, 15 ; marcelnote - new map
	map_const MANDARIN_POKECENTER_MART,      14,  4 ; marcelnote - new map
	map_const MANDARIN_SURF_SHOP,             4,  4 ; marcelnote - new map
	map_const MANDARIN_HOTEL,                33,  6 ; marcelnote - new map
	map_const MANDARIN_SILPH_CO,              4, 25 ; marcelnote - new map
	map_const SILPH_FACTORY_1F,              14, 13 ; marcelnote - new map
	map_const SILPH_FACTORY_2F,              15, 14 ; marcelnote - new map
	map_const ROUTE_22_OLD_ROD_HOUSE,         4,  4 ; marcelnote - new map
	map_const ROUTE_22_GATE,                 18,  4 ; marcelnote - expanded for 2nd floor
	map_const ROUTE_22_GATE_3F,               6,  5 ; marcelnote - new map
	map_const MT_SILVER_1F,                  12, 18 ; marcelnote - new map
	map_const MT_SILVER_2F,                  15, 22 ; marcelnote - new map
	map_const MT_SILVER_3F,                  10, 18 ; marcelnote - new map
	map_const VICTORY_ROAD_1F,               10,  9
	map_const VICTORY_ROAD_2F,               15,  9
	map_const VICTORY_ROAD_3F,               15,  9
	map_const INDIGO_PLATEAU_LOBBY,           8,  6
	map_const LORELEIS_ROOM,                  5,  6
	map_const BRUNOS_ROOM,                    5,  6
	map_const AGATHAS_ROOM,                   5,  6
	map_const LANCES_ROOM,                   13, 13
	map_const CHAMPIONS_ROOM,                 4,  4
	map_const HALL_OF_FAME,                   5,  4
	map_const TRADE_CENTER,                   5,  4
	map_const COLOSSEUM,                      5,  4
DEF NUM_MAPS EQU const_value

; marcelnote - current NUM_MAPS = 254 - 22 - 2 (last - start - extra lines) = 230

; Indoor maps, such as houses, use this as the Map ID in their exit warps
; This map ID takes the player back to the last outdoor map they were on, stored in wLastMap
DEF LAST_MAP EQU -1
