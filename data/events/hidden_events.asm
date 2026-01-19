HiddenEventMaps:
	db REDS_YELLOWS_HOUSES ; marcelnote - merged RedsHouse floors
;	db BLUES_AIDES_HOUSES
	db OAKS_LAB
	db VIRIDIAN_POKECENTER_MART ; marcelnote - merged Viridian Pokecenter and Mart
	db VIRIDIAN_SCHOOL_HOUSE
	db VIRIDIAN_GYM
	db PEWTER_MUSEUM ; marcelnote - merged Pewter Museum floors
	db PEWTER_GYM
	db PEWTER_POKECENTER_MART    ; marcelnote - merged Pewter Pokecenter and Mart
	db CERULEAN_POKECENTER_MART  ; marcelnote - merged Cerulean Pokecenter and Mart
	db CERULEAN_GYM
	db LAVENDER_POKECENTER_MART  ; marcelnote - merged Lavender Pokecenter and Mart
	db VERMILION_POKECENTER_MART ; marcelnote - merged Vermilion Pokecenter and Mart
	db VERMILION_GYM
	db CELADON_MANSION ; marcelnote - merged Celadon Mansion floors
	db CELADON_POKECENTER
	db CELADON_GYM
	db GAME_CORNER
;	db CELADON_HOTEL
	db FUCHSIA_POKECENTER_MART ; marcelnote - merged Fuchsia Pokecenter and Mart
	db FUCHSIA_GYM
	db CINNABAR_GYM
	db CINNABAR_POKECENTER_MART
	db SAFFRON_GYM
	db MT_MOON_POKECENTER
	db ROCK_TUNNEL_POKECENTER
	db TRADE_CENTER
	db COLOSSEUM
	db VIRIDIAN_FOREST
	db MT_MOON_B2F
;	db INDIGO_PLATEAU
	db ROUTE_25
	db ROUTE_9
	db SS_ANNE_KITCHEN
	db SS_ANNE_B1F ; marcelnote - merged SS Anne B1F and B1FRooms
	db ROCKET_HIDEOUT_B1F
	db ROCKET_HIDEOUT_B3F
	db ROCKET_HIDEOUT_B4F
	db SAFFRON_POKECENTER_MART ; marcelnote - merged Saffron Pokecenter and Mart
	db POKEMON_TOWER_5F
	db ROUTE_13
	db SAFARI_ZONE_GATE
	db SAFARI_ZONE_WEST
	db SILPH_CO_5F
	db SILPH_CO_9F
	db SILPH_CO_11F
	db COPYCATS_HOUSE ; marcelnote - merged Copycat's house floors
	db CERULEAN_CAVE_1F
	db CERULEAN_CAVE_B1F
	db POWER_PLANT
	db SEAFOAM_ISLANDS_B2F
	db SEAFOAM_ISLANDS_B3F
	db SEAFOAM_ISLANDS_B4F
	db POKEMON_MANSION_1F
	db POKEMON_MANSION_2F
	db POKEMON_MANSION_3F
	db POKEMON_MANSION_B1F
	db ROUTE_23
	db VICTORY_ROAD_2F
	db BILLS_HOUSE
	db VIRIDIAN_CITY
;	db SAFARI_ZONE_WEST_REST_HOUSE ; marcelnote - inaccessible Hidden objects
;	db SAFARI_ZONE_EAST_REST_HOUSE
;	db SAFARI_ZONE_NORTH_REST_HOUSE
	db ROUTE_11_GATE ; marcelnote - binoculars now hidden objects
	db ROUTE_12_GATE ; marcelnote - binoculars now hidden objects
	db ROUTE_15_GATE ; marcelnote - merged ROUTE_15_GATE floors
	db ROUTE_16_GATE ; marcelnote - binoculars now hidden objects
	db ROUTE_18_GATE ; marcelnote - binoculars now hidden objects
	db ROUTE_22_GATE ; marcelnote - binoculars now hidden objects
	db MR_FUJIS_HOUSE
	db CELADON_MANSION_ROOF_HOUSE
	db FIGHTING_DOJO
	db ROUTE_10
	db INDIGO_PLATEAU_LOBBY
	db CINNABAR_LAB ; marcelnote - merged Cinnabar Lab maps
	db BIKE_SHOP
	db ROUTE_11
	db ROUTE_12
	db ROUTE_17
	db UNDERGROUND_PATH_NORTH_SOUTH
	db UNDERGROUND_PATH_WEST_EAST
	db CELADON_CITY
	db VERMILION_CITY
	db CERULEAN_CITY
	db ROUTE_4
	db DAYCARE                   ; marcelnote - new
	db CELADON_MART_1F2F3F       ; marcelnote - new
	db CINNABAR_VOLCANO_2F       ; marcelnote - new
	db POKEMON_ACADEMY_3F4F      ; marcelnote - new
	db MANDARIN_POKECENTER_MART  ; marcelnote - new
	db MANDARIN_SURF_SHOP        ; marcelnote - new
	db SILPH_FACTORY_1F          ; marcelnote - new
	db SILPH_FACTORY_2F          ; marcelnote - new
	db MT_SILVER_1F              ; marcelnote - new
	db MT_SILVER_2F              ; marcelnote - new
	db BATTLE_HALL               ; marcelnote - new
	db -1 ; end

HiddenEventPointers:
; each of these pointers is for the corresponding map in HiddenObjectMaps
	dw RedsYellowsHousesHiddenEvents ; marcelnote - merged RedsHouse floors, added YellowsHouse
;	dw BluesAidesHousesHiddenEvents ; marcelnote - hidden objects were redundant
	dw OaksLabHiddenEvents
	dw ViridianPokecenterMartHiddenEvents ; marcelnote - merged Viridian Pokecenter and Mart
	dw ViridianSchoolHiddenEvents
	dw ViridianGymHiddenEvents
	dw PewterMuseumHiddenEvents ; marcelnote - merged Pewter Museum floors - to change in bg objects like on 2F?
	dw PewterGymHiddenEvents
	dw PewterPokecenterMartHiddenEvents    ; marcelnote - merged Pewter Pokecenter and Mart
	dw CeruleanPokecenterMartHiddenEvents  ; marcelnote - merged Cerulean Pokecenter and Mart
	dw CeruleanGymHiddenEvents
	dw LavenderPokecenterMartHiddenEvents  ; marcelnote - merged Lavender Pokecenter and Mart
	dw VermilionPokecenterMartHiddenEvents ; marcelnote - merged Vermilion Pokecenter and Mart
	dw VermilionGymHiddenEvents
	dw CeladonMansionHiddenEvents ; marcelnote - merged Celadon Mansion floors, added 4F
	dw CeladonPokecenterHiddenEvents
	dw CeladonGymHiddenEvents
	dw GameCornerHiddenEvents
;	dw CeladonHotelHiddenEvents
	dw FuchsiaPokecenterMartHiddenEvents ; marcelnote - merged Fuchsia Pokecenter and Mart
	dw FuchsiaGymHiddenEvents
	dw CinnabarGymHiddenEvents
	dw CinnabarPokecenterMartHiddenEvents ; marcelnote - merged Cinnabar Pokecenter and Mart
	dw SaffronGymHiddenEvents
	dw MtMoonPokecenterHiddenEvents
	dw RockTunnelPokecenterHiddenEvents
	dw TradeCenterHiddenEvents
	dw ColosseumHiddenEvents
	dw ViridianForestHiddenEvents
	dw MtMoonB2FHiddenEvents
;	dw IndigoPlateauHiddenEvents
	dw Route25HiddenEvents
	dw Route9HiddenEvents
	dw SSAnneKitchenHiddenEvents
	dw SSAnneB1FHiddenEvents ; marcelnote - merged SS Anne B1F and B1FRooms
	dw RocketHideoutB1FHiddenEvents
	dw RocketHideoutB3FHiddenEvents
	dw RocketHideoutB4FHiddenEvents
	dw SaffronPokecenterHiddenEvents
	dw PokemonTower5FHiddenEvents
	dw Route13HiddenEvents
	dw SafariZoneEntranceHiddenEvents
	dw SafariZoneWestHiddenEvents
	dw SilphCo5FHiddenEvents
	dw SilphCo9FHiddenEvents
	dw SilphCo11FHiddenEvents
	dw CopycatsHouseHiddenEvents ; marcelnote - merged Copycat's house floors
	dw CeruleanCave1FHiddenEvents
	dw CeruleanCaveB1FHiddenEvents
	dw PowerPlantHiddenEvents
	dw SeafoamIslandsB2FHiddenEvents
	dw SeafoamIslandsB3FHiddenEvents
	dw SeafoamIslandsB4FHiddenEvents
	dw PokemonMansion1FHiddenEvents
	dw PokemonMansion2FHiddenEvents
	dw PokemonMansion3FHiddenEvents
	dw PokemonMansionB1FHiddenEvents
	dw Route23HiddenEvents
	dw VictoryRoad2FHiddenEvents
	dw BillsHouseHiddenEvents
	dw ViridianCityHiddenEvents
;	dw SafariZoneRestHouse2HiddenEvents ; marcelnote - inaccessible Hidden objects
;	dw SafariZoneRestHouse3HiddenEvents
;	dw SafariZoneRestHouse4HiddenEvents
	dw Route11GateHiddenEvents ; marcelnote - new, binoculars now hidden objects
	dw Route12GateHiddenEvents ; marcelnote - new, binoculars now hidden objects
	dw Route15GateHiddenEvents
	dw Route16GateHiddenEvents ; marcelnote - new, binoculars now hidden objects
	dw Route18GateHiddenEvents ; marcelnote - new, binoculars now hidden objects
	dw Route22GateHiddenEvents ; marcelnote - new, binoculars now hidden objects
	dw MrFujisHouseHiddenEvents
	dw CeladonMansionRoofHouseHiddenEvents
	dw FightingDojoHiddenEvents
	dw Route10HiddenEvents
	dw IndigoPlateauLobbyHiddenEvents
	dw CinnabarLabHiddenEvents ; marcelnote - merged Cinnabar Lab maps
	dw BikeShopHiddenEvents
	dw Route11HiddenEvents
	dw Route12HiddenEvents
	dw Route17HiddenEvents
	dw UndergroundPathNsHiddenEvents
	dw UndergroundPathWeHiddenEvents
	dw CeladonCityHiddenEvents
	dw VermilionCityHiddenEvents
	dw CeruleanCityHiddenEvents
	dw Route4HiddenEvents
	dw DaycareHiddenEvents                ; marcelnote - new
	dw CeladonMart1F2F3FHiddenEvents      ; marcelnote - new
	dw CinnabarVolcano2FHiddenEvents      ; marcelnote - new
	dw PokemonAcademy3F4FHiddenEvents     ; marcelnote - new
	dw MandarinPokecenterMartHiddenEvents ; marcelnote - new
	dw MandarinSurfShopHiddenEvents       ; marcelnote - new
	dw SilphFactory1FHiddenEvents         ; marcelnote - new
	dw SilphFactory2FHiddenEvents         ; marcelnote - new
	dw MtSilver1FHiddenEvents             ; marcelnote - new
	dw MtSilver2FHiddenEvents             ; marcelnote - new
	dw BattleHallHiddenEvents             ; marcelnote - new

MACRO hidden_event
	db \2 ; y coord
	db \1 ; x coord
	db \3 ; function argument
	dba \4 ; event function
ENDM

MACRO hidden_text_predef
	db \2 ; y coord
	db \1 ; x coord
	db_tx_pre \3 ; text id
	dba \4 ; event function
ENDM

; Some hidden objects use SPRITE_FACING_* values,
; but these do not actually prevent the player
; from interacting with them in any direction.
DEF ANY_FACING EQU $d0

TradeCenterHiddenEvents:
	hidden_event  5,  4, ANY_FACING, CableClubRightGameboy
	hidden_event  4,  4, ANY_FACING, CableClubLeftGameboy
	db -1 ; end

ColosseumHiddenEvents:
	hidden_event  5,  4, ANY_FACING, CableClubRightGameboy
	hidden_event  4,  4, ANY_FACING, CableClubLeftGameboy
	db -1 ; end

; marcelnote - merged all these labels, removed PrintBenchGuyText
ViridianPokecenterMartHiddenEvents:
PewterPokecenterMartHiddenEvents:
CeruleanPokecenterMartHiddenEvents:
LavenderPokecenterMartHiddenEvents:
VermilionPokecenterMartHiddenEvents:
CeladonPokecenterHiddenEvents:
SaffronPokecenterHiddenEvents:
FuchsiaPokecenterMartHiddenEvents:
CinnabarPokecenterMartHiddenEvents:
MandarinPokecenterMartHiddenEvents:  ; marcelnote - new
MtMoonPokecenterHiddenEvents:
RockTunnelPokecenterHiddenEvents:
	hidden_event  5,  2,  $0, OpenPokemonCenterPC
	db -1 ; end

IndigoPlateauLobbyHiddenEvents:
	hidden_event  9,  6,  $0, OpenPokemonCenterPC ; marcelnote - modified map
	db -1 ; end

RedsYellowsHousesHiddenEvents: ; marcelnote - merged RedsHouse floors
	hidden_event 14,  1,  $0, OpenRedsPC
	db -1 ; end

;BluesAidesHousesHiddenEvents: ; marcelnote - bookcase text is already handled by bookshelf_tile_ids
;	hidden_event  0,  1,  $0, PrintBookcaseText
;	hidden_event  1,  1,  $0, PrintBookcaseText
;	hidden_event  7,  1,  $0, PrintBookcaseText
;	db -1 ; end

OaksLabHiddenEvents:
	hidden_event  4,  0,  $0, DisplayOakLabLeftPoster
	hidden_event  5,  0,  $0, DisplayOakLabRightPoster
	hidden_event  0,  1,  $0, DisplayOakLabEmailText
	hidden_event  1,  1,  $0, DisplayOakLabEmailText
	db -1 ; end


ViridianSchoolHiddenEvents:
	hidden_text_predef  3,  4, ViridianSchoolNotebook, PrintNotebookText
	hidden_text_predef  3,  0, ViridianSchoolBlackboard, PrintBlackboardLinkCableText
	db -1 ; end

ViridianGymHiddenEvents:
	hidden_event 15, 15,  $0, GymStatues
	hidden_event 18, 15,  $0, GymStatues
	db -1 ; end

PewterMuseumHiddenEvents: ; marcelnote - merged Pewter Museum floors
	hidden_event  2, 15,  $0, AerodactylFossil
	hidden_event  2, 18,  $0, KabutopsFossil
	db -1 ; end

PewterGymHiddenEvents:
	hidden_event  3, 10,  $0, GymStatues
	hidden_event  6, 10,  $0, GymStatues
	db -1 ; end

CeruleanGymHiddenEvents:
	hidden_event  3, 11,  $0, GymStatues
	hidden_event  6, 11,  $0, GymStatues
	db -1 ; end

VermilionGymHiddenEvents:
	hidden_event  3, 14,  $0, GymStatues
	hidden_event  6, 14,  $0, GymStatues
	hidden_event  6,  1,  $0, PrintTrashText
	; third param: [wGymTrashCanIndex]
	hidden_event  1,  7,  0, GymTrashScript
	hidden_event  1,  9,  1, GymTrashScript
	hidden_event  1, 11,  2, GymTrashScript
	hidden_event  3,  7,  3, GymTrashScript
	hidden_event  3,  9,  4, GymTrashScript
	hidden_event  3, 11,  5, GymTrashScript
	hidden_event  5,  7,  6, GymTrashScript
	hidden_event  5,  9,  7, GymTrashScript
	hidden_event  5, 11,  8, GymTrashScript
	hidden_event  7,  7,  9, GymTrashScript
	hidden_event  7,  9, 10, GymTrashScript
	hidden_event  7, 11, 11, GymTrashScript
	hidden_event  9,  7, 12, GymTrashScript
	hidden_event  9,  9, 13, GymTrashScript
	hidden_event  9, 11, 14, GymTrashScript
	db -1 ; end

CeladonMansionHiddenEvents:
	hidden_event  0, 39,  $0, OpenPokemonCenterPC ; marcelnote - merged Celadon Mansion floors
	db -1 ; end

CeladonGymHiddenEvents:
	hidden_event  3, 15,  $0, GymStatues
	hidden_event  6, 15,  $0, GymStatues
	db -1 ; end

GameCornerHiddenEvents: ; marcelnote - adjusted for new map size, changed arguments to $0
	hidden_event 18, 11,                 $0, StartSlotMachine
	hidden_event 18, 10,                 $0, StartSlotMachine
	hidden_event 18,  9,                 $0, StartSlotMachine
	hidden_event 18,  8,                 $0, StartSlotMachine
	hidden_event 18,  7,                 $0, StartSlotMachine
	hidden_event 18,  6, SLOTS_SOMEONESKEYS, StartSlotMachine
	hidden_event 13,  6,                 $0, StartSlotMachine
	hidden_event 13,  7,                 $0, StartSlotMachine
	hidden_event 13,  8,   SLOTS_OUTTOLUNCH, StartSlotMachine
	hidden_event 13,  9,                 $0, StartSlotMachine
	hidden_event 13, 10,                 $0, StartSlotMachine
	hidden_event 13, 11,                 $0, StartSlotMachine
	hidden_event 12, 11,                 $0, StartSlotMachine
	hidden_event 12, 10,                 $0, StartSlotMachine
	hidden_event 12,  9,                 $0, StartSlotMachine
	hidden_event 12,  8,                 $0, StartSlotMachine
	hidden_event 12,  7,                 $0, StartSlotMachine
	hidden_event 12,  6,                 $0, StartSlotMachine
	hidden_event  7,  6,                 $0, StartSlotMachine
	hidden_event  7,  7,                 $0, StartSlotMachine
	hidden_event  7,  8,                 $0, StartSlotMachine
	hidden_event  7,  9,                 $0, StartSlotMachine
	hidden_event  7, 10,                 $0, StartSlotMachine
	hidden_event  7, 11,                 $0, StartSlotMachine
	hidden_event  6, 11,                 $0, StartSlotMachine
	hidden_event  6, 10,                 $0, StartSlotMachine
	hidden_event  6,  9,                 $0, StartSlotMachine
	hidden_event  6,  8,   SLOTS_OUTOFORDER, StartSlotMachine
	hidden_event  6,  7,                 $0, StartSlotMachine
	hidden_event  6,  6,                 $0, StartSlotMachine
	hidden_event  1,  6,                 $0, StartSlotMachine
	hidden_event  1,  7,                 $0, StartSlotMachine
	hidden_event  1,  8,                 $0, StartSlotMachine
	hidden_event  1,  9,                 $0, StartSlotMachine
	hidden_event  1, 10,                 $0, StartSlotMachine
	hidden_event  1, 11,                 $0, StartSlotMachine

	; marcelnote - see also data/events/hidden_coins.asm
	hidden_event  0,  4, COIN+10, HiddenCoins
	hidden_event  1, 12, COIN+10, HiddenCoins
	hidden_event  3,  7, COIN+20, HiddenCoins
	hidden_event  3, 10, COIN+10, HiddenCoins
	hidden_event  4,  8, COIN+10, HiddenCoins
	hidden_event  9,  8, COIN+20, HiddenCoins
	hidden_event  9, 11, COIN+10, HiddenCoins
	hidden_event 16, 10, COIN+10, HiddenCoins
	hidden_event 10, 12, COIN+10, HiddenCoins
	hidden_event 11,  3, COIN+40, HiddenCoins
	hidden_event 15,  4, COIN+100, HiddenCoins
	hidden_event 12, 11, COIN+10, HiddenCoins
	db -1 ; end

FuchsiaGymHiddenEvents:
	hidden_event  3, 15,  $0, GymStatues
	hidden_event  6, 15,  $0, GymStatues
	db -1 ; end

CinnabarGymHiddenEvents: ; marcelnote - quiz questions 2-6 were reindexed as 3-7
	hidden_event 17, 13,  $0, GymStatues
	; third param: ([hGymGateAnswer] << 4) | [hGymGateIndex]
	hidden_event 15,  7, (FALSE << 4) | 1, PrintCinnabarQuiz
	hidden_event 15,  1, (FALSE << 4) | 2, PrintCinnabarQuiz ; marcelnote - new quiz question
	hidden_event 10,  1, (TRUE  << 4) | 3, PrintCinnabarQuiz
	hidden_event  9,  7, (TRUE  << 4) | 4, PrintCinnabarQuiz
	hidden_event  9, 13, (TRUE  << 4) | 5, PrintCinnabarQuiz
	hidden_event  1, 13, (FALSE << 4) | 6, PrintCinnabarQuiz
	hidden_event  1,  7, (TRUE  << 4) | 7, PrintCinnabarQuiz
	db -1 ; end

SaffronGymHiddenEvents:
	hidden_event  9, 15,  $0, GymStatues
	db -1 ; end

ViridianForestHiddenEvents:
	hidden_event  1, 18, POTION, HiddenItems
	hidden_event 16, 42, ANTIDOTE, HiddenItems
	db -1 ; end

MtMoonB2FHiddenEvents:
	hidden_event 18, 12, MOON_STONE, HiddenItems
	hidden_event 33,  9, ETHER, HiddenItems
	db -1 ; end

;IndigoPlateauHiddenEvents: ; marcelnote - removed
;	hidden_event  8, 13,  $0, PrintIndigoPlateauHQText ; inaccessible
;	hidden_event 11, 13,  $0, PrintIndigoPlateauHQText ; inaccessible
;	db -1 ; end

Route25HiddenEvents:
	hidden_event 38,  3, ETHER, HiddenItems
	hidden_event 10,  1, ELIXIR, HiddenItems
	db -1 ; end

Route9HiddenEvents:
	hidden_event 14,  7, ETHER, HiddenItems
	db -1 ; end

SSAnneKitchenHiddenEvents:
	hidden_event 13,  5, $0, PrintTrashText
	hidden_event 13,  7, $0, PrintTrashText
	hidden_event 13,  9, GREAT_BALL, HiddenItems
	db -1 ; end

SSAnneB1FHiddenEvents:
	hidden_event 37,  1, HYPER_POTION, HiddenItems ; marcelnote - merged SS Anne B1F and B1FRooms
	db -1 ; end

Route10HiddenEvents:
	hidden_event  9, 17, SUPER_POTION, HiddenItems
	hidden_event 16, 53, MAX_ETHER, HiddenItems
	db -1 ; end

RocketHideoutB1FHiddenEvents:
	hidden_event 21, 15, PP_UP, HiddenItems
	db -1 ; end

RocketHideoutB3FHiddenEvents:
	hidden_event 27, 17, NUGGET, HiddenItems
	db -1 ; end

RocketHideoutB4FHiddenEvents:
	hidden_event 25,  1, SUPER_POTION, HiddenItems
	db -1 ; end

PokemonTower5FHiddenEvents:
	hidden_event  4, 12, ELIXIR, HiddenItems
	db -1 ; end

Route13HiddenEvents:
	hidden_event  1, 14, PP_UP, HiddenItems
	hidden_event 16, 13, CALCIUM, HiddenItems
	db -1 ; end

SafariZoneEntranceHiddenEvents:
	hidden_event 10,  1, NUGGET, HiddenItems ; inaccessible
	db -1 ; end

SafariZoneWestHiddenEvents:
	hidden_event  6,  5, REVIVE, HiddenItems
	db -1 ; end

SilphCo5FHiddenEvents:
	hidden_event 12,  3, ELIXIR, HiddenItems
	db -1 ; end

SilphCo9FHiddenEvents:
	hidden_event  2, 15, MAX_POTION, HiddenItems
	db -1 ; end

SilphCo11FHiddenEvents:
	hidden_event 10, 12,  $0, OpenPokemonCenterPC
	db -1 ; end

CopycatsHouseHiddenEvents: ; marcelnote - merged Copycat's house floors
	hidden_event 15,  1, NUGGET, HiddenItems
	db -1 ; end

CeruleanCave1FHiddenEvents:
	hidden_event 14, 11, RARE_CANDY, HiddenItems
	db -1 ; end

CeruleanCaveB1FHiddenEvents:
	hidden_event 27,  3, ULTRA_BALL, HiddenItems
	db -1 ; end

PowerPlantHiddenEvents: ; put 1 item here if adding new Electrode
	hidden_event 17, 16, MAX_ELIXIR, HiddenItems
	hidden_event 12,  1, PP_UP, HiddenItems
	db -1 ; end

SeafoamIslandsB2FHiddenEvents:
	hidden_event 15, 15, NUGGET, HiddenItems
	db -1 ; end

SeafoamIslandsB3FHiddenEvents:
	hidden_event  9, 16, MAX_ELIXIR, HiddenItems
	db -1 ; end

SeafoamIslandsB4FHiddenEvents:
	hidden_event 25, 17, ULTRA_BALL, HiddenItems
	db -1 ; end

PokemonMansion1FHiddenEvents:
	hidden_event  8, 16, MOON_STONE, HiddenItems
	hidden_event  2,  5, $0, PokemonMansion1FScript_Switches
	db -1 ; end

PokemonMansion2FHiddenEvents:
	hidden_event  2, 11, $0, PokemonMansion2FScript_Switches
	db -1 ; end

PokemonMansion3FHiddenEvents:
	hidden_event  1,  9, MAX_REVIVE, HiddenItems
	hidden_event 10,  5, $0, PokemonMansion3FScript_Switches
	db -1 ; end

PokemonMansionB1FHiddenEvents:
	hidden_event  1,  9, RARE_CANDY, HiddenItems
	hidden_event 20,  3, $0, PokemonMansionB1FScript_Switches
	hidden_event 18, 25, $0, PokemonMansionB1FScript_Switches
	db -1 ; end

Route23HiddenEvents:
	hidden_event  9, 44, FULL_RESTORE, HiddenItems
	hidden_event 19, 70, ULTRA_BALL, HiddenItems
	hidden_event  8, 90, MAX_ETHER, HiddenItems
	db -1 ; end

VictoryRoad2FHiddenEvents:
	hidden_event  5,  2, ULTRA_BALL, HiddenItems
	hidden_event 26,  7, FULL_RESTORE, HiddenItems
	db -1 ; end

BillsHouseHiddenEvents:
	hidden_event  1,  4,  $0, BillsHousePC
	db -1 ; end

ViridianCityHiddenEvents:
	hidden_event 14,  4, POTION, HiddenItems
	db -1 ; end

Route11GateHiddenEvents: ; marcelnote - new, binoculars now hidden objects
	hidden_event  1, 16,  $0, Route11GateLeftBinoculars
	hidden_event  6, 16,  $0, Route11GateRightBinoculars
	db -1 ; end

Route12GateHiddenEvents: ; marcelnote - new, binoculars now hidden objects
	hidden_event 15,  2,  $0, Route12GateLeftBinoculars
	hidden_event 20,  2,  $0, Route12GateRightBinoculars
	db -1 ; end

Route15GateHiddenEvents: ; marcelnote - merged Route15Gate floors, binoculars now hidden objects
	hidden_event  1, 16,  $0, Route15GateLeftBinoculars
	hidden_event  6, 16,  $0, Route15GateRightBinoculars
	db -1 ; end

Route16GateHiddenEvents: ; marcelnote - new, binoculars now hidden objects
	hidden_event  1, 20,  $0, Route16GateLeftBinoculars
	hidden_event  6, 20,  $0, Route16GateRightBinoculars
	db -1 ; end

Route18GateHiddenEvents: ; marcelnote - new, binoculars now hidden objects
	hidden_event  1, 16,  $0, Route18GateLeftBinoculars
	hidden_event  6, 16,  $0, Route18GateRightBinoculars
	db -1 ; end

Route22GateHiddenEvents: ; marcelnote - new, binoculars now hidden objects
	hidden_event 26,  2,  $0, Route22GateLeftBinoculars
	hidden_event 28,  2,  $0, Route22GateRightBinoculars
	db -1 ; end

MrFujisHouseHiddenEvents:
	hidden_event  0,  1,  $0, PrintMagazinesText
	hidden_event  1,  1,  $0, PrintMagazinesText
	hidden_event  7,  1,  $0, PrintMagazinesText
	db -1 ; end

CeladonMansionRoofHouseHiddenEvents:
	hidden_text_predef  3,  0, LinkCableHelp, PrintBlackboardLinkCableText
	hidden_text_predef  4,  0, LinkCableHelp, PrintBlackboardLinkCableText
	hidden_text_predef  3,  4, TMNotebook, PrintNotebookText
	db -1 ; end

FightingDojoHiddenEvents:
	hidden_event  3,  9,  $0, PrintFightingDojoText
	hidden_event  6,  9,  $0, PrintFightingDojoText
	hidden_event  4,  0,  $0, PrintFightingDojoText2
	hidden_event  5,  0,  $0, PrintFightingDojoText3
	db -1 ; end

CinnabarLabHiddenEvents: ; marcelnote - merged Cinnabar Lab maps
	hidden_event 52,  4,  $0, OpenPokemonCenterPC
	hidden_event 54,  4,  $0, OpenPokemonCenterPC
	db -1 ; end

BikeShopHiddenEvents:
	hidden_event  1,  0,  $0, PrintNewBikeText
	hidden_event  2,  1,  $0, PrintNewBikeText
	hidden_event  1,  2,  $0, PrintNewBikeText
	hidden_event  3,  2,  $0, PrintNewBikeText
	hidden_event  0,  4,  $0, PrintNewBikeText
	hidden_event  1,  5,  $0, PrintNewBikeText
	db -1 ; end

Route11HiddenEvents:
	hidden_event 48,  5, ESCAPE_ROPE, HiddenItems
	db -1 ; end

Route12HiddenEvents:
	hidden_event  2, 63, HYPER_POTION, HiddenItems
	db -1 ; end

Route17HiddenEvents:
	hidden_event 15,  14, RARE_CANDY, HiddenItems
	hidden_event  8,  45, FULL_RESTORE, HiddenItems
	hidden_event 17,  72, PP_UP, HiddenItems
	hidden_event  4,  91, MAX_REVIVE, HiddenItems
	hidden_event  8, 121, MAX_ELIXIR, HiddenItems
	db -1 ; end

UndergroundPathNsHiddenEvents:
	hidden_event  3,  4, FULL_RESTORE, HiddenItems
	hidden_event  4, 34, X_SPECIAL, HiddenItems
	db -1 ; end

UndergroundPathWeHiddenEvents:
	hidden_event 12,  2, NUGGET, HiddenItems
	hidden_event 21,  5, ELIXIR, HiddenItems
	db -1 ; end

CeladonCityHiddenEvents:
	hidden_event 48, 15, PP_UP, HiddenItems
	db -1 ; end

VermilionCityHiddenEvents:
	hidden_event 14, 11, MAX_ETHER, HiddenItems
	db -1 ; end

CeruleanCityHiddenEvents:
	hidden_event 15,  8, RARE_CANDY, HiddenItems
	db -1 ; end

Route4HiddenEvents:
	hidden_event 40,  3, GREAT_BALL, HiddenItems
	db -1 ; end

DaycareHiddenEvents:  ; marcelnote - new
	hidden_event  7,  1,  $0, OpenPokemonCenterPC
	db -1 ; end

CeladonMart1F2F3FHiddenEvents:  ; marcelnote - new
	hidden_event  3,  4,  $0, PrintCeladonMart3FRPGText
	hidden_event  6,  4,  $0, PrintCeladonMart3FSportsGameText
	hidden_event  3,  6,  $0, PrintCeladonMart3FPuzzleGameText
	hidden_event  6,  6,  $0, PrintCeladonMart3FFightingGameText
	db -1 ; end

CinnabarVolcano2FHiddenEvents:  ; marcelnote - new
	hidden_event 23,  5, MAX_ELIXIR, HiddenItems
	db -1 ; end

PokemonAcademy3F4FHiddenEvents:  ; marcelnote - new
	hidden_event 24,  0,  $0, OpenPokemonCenterPC
	db -1 ; end

MandarinSurfShopHiddenEvents:  ; marcelnote - new
	hidden_event  1,  4,  $0, PrintNewSurfboardText
	hidden_event  3,  1,  $0, PrintNewSurfboardText
	hidden_event  1,  3,  $0, PrintNewSurfboardText
	hidden_event  1,  5,  $0, PrintNewSurfboardText
	hidden_event  7,  4,  $0, PrintNewSurfboardText
	db -1 ; end

SilphFactory1FHiddenEvents:  ; marcelnote - new
	hidden_event 10,  4, MAX_ETHER, HiddenItems
	hidden_event 12, 14, MAX_ELIXIR, HiddenItems
	db -1 ; end

SilphFactory2FHiddenEvents:  ; marcelnote - new
	hidden_event 28, 14, PP_UP, HiddenItems
	db -1 ; end

MtSilver1FHiddenEvents:  ; marcelnote - new
	hidden_event 19, 13, ULTRA_BALL, HiddenItems
	hidden_event 18, 23, DIRE_HIT, HiddenItems
	db -1 ; end

MtSilver2FHiddenEvents:  ; marcelnote - new
	hidden_event 14, 29, MAX_POTION, HiddenItems
	db -1 ; end

BattleHallHiddenEvents:  ; marcelnote - new
	hidden_event 11,  4,  $0, OpenPokemonCenterPC
	db -1 ; end
