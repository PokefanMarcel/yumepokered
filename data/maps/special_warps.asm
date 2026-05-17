; marcelnote - refactored warp engine
MACRO special_warp
	db \1
	event_displacement \1_WIDTH, \2, \3
	db ((\3) & $01) ; sub-block Y
	db ((\2) & $01) ; sub-block X
ENDM

; Hole/drop destinations that do not use normal map warp events.
; The source scripts set wDungeonWarpID, then the special-warp engine loads
; the matching destination here.
DungeonWarpData:
	table_width 7
	special_warp SEAFOAM_ISLANDS_B1F,    18,  7 ; DUNGEON_WARP_SEAFOAM_1F_LEFT
	special_warp SEAFOAM_ISLANDS_B1F,    23,  7 ; DUNGEON_WARP_SEAFOAM_1F_RIGHT
	special_warp SEAFOAM_ISLANDS_B2F,    19,  7 ; DUNGEON_WARP_SEAFOAM_B1F_LEFT
	special_warp SEAFOAM_ISLANDS_B2F,    22,  7 ; DUNGEON_WARP_SEAFOAM_B1F_RIGHT
	special_warp SEAFOAM_ISLANDS_B3F,    18,  7 ; DUNGEON_WARP_SEAFOAM_B2F_LEFT
	special_warp SEAFOAM_ISLANDS_B3F,    19,  7 ; DUNGEON_WARP_SEAFOAM_B2F_RIGHT
	special_warp SEAFOAM_ISLANDS_B4F,     4, 14 ; DUNGEON_WARP_SEAFOAM_B3F_LEFT
	special_warp SEAFOAM_ISLANDS_B4F,     5, 14 ; DUNGEON_WARP_SEAFOAM_B3F_RIGHT
	special_warp VICTORY_ROAD_2F,        22, 16 ; DUNGEON_WARP_VICTORY_ROAD_3F
	special_warp POKEMON_MANSION_1F,     16, 14 ; DUNGEON_WARP_POKEMON_MANSION_3F_LEFT
	special_warp POKEMON_MANSION_1F,     16, 14 ; DUNGEON_WARP_POKEMON_MANSION_3F_MIDDLE
	special_warp POKEMON_MANSION_2F,     18, 14 ; DUNGEON_WARP_POKEMON_MANSION_3F_RIGHT
	special_warp CINNABAR_VOLCANO_1FB1F, 21, 32 ; DUNGEON_WARP_CINNABAR_VOLCANO_1F
	assert_table_length NUM_DUNGEON_WARPS

; Landing points used by Fly, Teleport, Escape Rope, blackouts, and Go Home.
TravelWarpData:
	special_warp PALLET_TOWN,      5,  6
	special_warp VIRIDIAN_CITY,   23, 26
	special_warp PEWTER_CITY,     13, 26
	special_warp CERULEAN_CITY,   19, 18
	special_warp LAVENDER_TOWN,    3,  6
	special_warp VERMILION_CITY,  11,  4
	special_warp CELADON_CITY,    41, 10
	special_warp FUCHSIA_CITY,    19, 28
	special_warp CINNABAR_ISLAND, 19, 12 ; marcelnote - modified to accommodate Cinnabar Volcano
	special_warp INDIGO_PLATEAU,   9,  6
	special_warp SAFFRON_CITY,     9, 30
	special_warp MANDARIN_ISLAND, 23,  6 ; marcelnote - new location
	special_warp ROUTE_4,         11,  6
	special_warp ROUTE_10,        11, 20

MACRO tileset_warp
	special_warp \1, \2, \3
	db \4
ENDM

; Special warps whose destination tileset isn't OVERWORLD.
NewGameWarp:
	tileset_warp REDS_YELLOWS_HOUSES, 17, 6, BIG_HOUSE ; marcelnote - merged RedsHouse floors, added YellowsHouse
TradeCenterPlayerWarp:
	tileset_warp TRADE_CENTER,  3, 4, CLUB
TradeCenterFriendWarp:
	tileset_warp TRADE_CENTER,  6, 4, CLUB
ColosseumPlayerWarp:
	tileset_warp COLOSSEUM,     3, 4, CLUB
ColosseumFriendWarp:
	tileset_warp COLOSSEUM,     6, 4, CLUB
