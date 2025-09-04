HiddenObjectMaps:
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

HiddenObjectPointers:
; each of these pointers is for the corresponding map in HiddenObjectMaps
	dw RedsYellowsHousesHiddenObjects ; marcelnote - merged RedsHouse floors, added YellowsHouse
;	dw BluesAidesHousesHiddenObjects ; marcelnote - hidden objects were redundant
	dw OaksLabHiddenObjects
	dw ViridianPokecenterMartHiddenObjects ; marcelnote - merged Viridian Pokecenter and Mart
	dw ViridianSchoolHiddenObjects
	dw ViridianGymHiddenObjects
	dw PewterMuseumHiddenObjects ; marcelnote - merged Pewter Museum floors - to change in bg objects like on 2F?
	dw PewterGymHiddenObjects
	dw PewterPokecenterMartHiddenObjects    ; marcelnote - merged Pewter Pokecenter and Mart
	dw CeruleanPokecenterMartHiddenObjects  ; marcelnote - merged Cerulean Pokecenter and Mart
	dw CeruleanGymHiddenObjects
	dw LavenderPokecenterMartHiddenObjects  ; marcelnote - merged Lavender Pokecenter and Mart
	dw VermilionPokecenterMartHiddenObjects ; marcelnote - merged Vermilion Pokecenter and Mart
	dw VermilionGymHiddenObjects
	dw CeladonMansionHiddenObjects ; marcelnote - merged Celadon Mansion floors, added 4F
	dw CeladonPokecenterHiddenObjects
	dw CeladonGymHiddenObjects
	dw GameCornerHiddenObjects
;	dw CeladonHotelHiddenObjects
	dw FuchsiaPokecenterMartHiddenObjects ; marcelnote - merged Fuchsia Pokecenter and Mart
	dw FuchsiaGymHiddenObjects
	dw CinnabarGymHiddenObjects
	dw CinnabarPokecenterMartHiddenObjects ; marcelnote - merged Cinnabar Pokecenter and Mart
	dw SaffronGymHiddenObjects
	dw MtMoonPokecenterHiddenObjects
	dw RockTunnelPokecenterHiddenObjects
	dw TradeCenterHiddenObjects
	dw ColosseumHiddenObjects
	dw ViridianForestHiddenObjects
	dw MtMoonB2FHiddenObjects
;	dw IndigoPlateauHiddenObjects
	dw Route25HiddenObjects
	dw Route9HiddenObjects
	dw SSAnneKitchenHiddenObjects
	dw SSAnneB1FHiddenObjects ; marcelnote - merged SS Anne B1F and B1FRooms
	dw RocketHideoutB1FHiddenObjects
	dw RocketHideoutB3FHiddenObjects
	dw RocketHideoutB4FHiddenObjects
	dw SaffronPokecenterHiddenObjects
	dw PokemonTower5FHiddenObjects
	dw Route13HiddenObjects
	dw SafariZoneEntranceHiddenObjects
	dw SafariZoneWestHiddenObjects
	dw SilphCo5FHiddenObjects
	dw SilphCo9FHiddenObjects
	dw SilphCo11FHiddenObjects
	dw CopycatsHouseHiddenObjects ; marcelnote - merged Copycat's house floors
	dw CeruleanCave1FHiddenObjects
	dw CeruleanCaveB1FHiddenObjects
	dw PowerPlantHiddenObjects
	dw SeafoamIslandsB2FHiddenObjects
	dw SeafoamIslandsB3FHiddenObjects
	dw SeafoamIslandsB4FHiddenObjects
	dw PokemonMansion1FHiddenObjects
	dw PokemonMansion2FHiddenObjects
	dw PokemonMansion3FHiddenObjects
	dw PokemonMansionB1FHiddenObjects
	dw Route23HiddenObjects
	dw VictoryRoad2FHiddenObjects
	dw BillsHouseHiddenObjects
	dw ViridianCityHiddenObjects
;	dw SafariZoneRestHouse2HiddenObjects ; marcelnote - inaccessible Hidden objects
;	dw SafariZoneRestHouse3HiddenObjects
;	dw SafariZoneRestHouse4HiddenObjects
	dw Route11GateHiddenObjects ; marcelnote - new, binoculars now hidden objects
	dw Route12GateHiddenObjects ; marcelnote - new, binoculars now hidden objects
	dw Route15GateHiddenObjects
	dw Route16GateHiddenObjects ; marcelnote - new, binoculars now hidden objects
	dw Route18GateHiddenObjects ; marcelnote - new, binoculars now hidden objects
	dw Route22GateHiddenObjects ; marcelnote - new, binoculars now hidden objects
	dw MrFujisHouseHiddenObjects
	dw CeladonMansionRoofHouseHiddenObjects
	dw FightingDojoHiddenObjects
	dw Route10HiddenObjects
	dw IndigoPlateauLobbyHiddenObjects
	dw CinnabarLabHiddenObjects ; marcelnote - merged Cinnabar Lab maps
	dw BikeShopHiddenObjects
	dw Route11HiddenObjects
	dw Route12HiddenObjects
	dw Route17HiddenObjects
	dw UndergroundPathNsHiddenObjects
	dw UndergroundPathWeHiddenObjects
	dw CeladonCityHiddenObjects
	dw VermilionCityHiddenObjects
	dw CeruleanCityHiddenObjects
	dw Route4HiddenObjects
	dw DaycareHiddenObjects                ; marcelnote - new
	dw CeladonMart1F2F3FHiddenObjects      ; marcelnote - new
	dw CinnabarVolcano2FHiddenObjects      ; marcelnote - new
	dw PokemonAcademy3F4FHiddenObjects     ; marcelnote - new
	dw MandarinPokecenterMartHiddenObjects ; marcelnote - new
	dw MandarinSurfShopHiddenObjects       ; marcelnote - new
	dw SilphFactory1FHiddenObjects         ; marcelnote - new
	dw SilphFactory2FHiddenObjects         ; marcelnote - new
	dw MtSilver1FHiddenObjects             ; marcelnote - new
	dw MtSilver2FHiddenObjects             ; marcelnote - new
	dw BattleHallHiddenObjects             ; marcelnote - new

MACRO hidden_object
	db \2 ; y coord
	db \1 ; x coord
	db \3 ; item id
	dba \4 ; object routine
ENDM

MACRO hidden_text_predef
	db \2 ; y coord
	db \1 ; x coord
	db_tx_pre \3 ; text id
	dba \4 ; object routine
ENDM

; Some hidden objects use SPRITE_FACING_* values,
; but these do not actually prevent the player
; from interacting with them in any direction.
DEF ANY_FACING EQU $d0

TradeCenterHiddenObjects:
	hidden_object  5,  4, ANY_FACING, CableClubRightGameboy
	hidden_object  4,  4, ANY_FACING, CableClubLeftGameboy
	db -1 ; end

ColosseumHiddenObjects:
	hidden_object  5,  4, ANY_FACING, CableClubRightGameboy
	hidden_object  4,  4, ANY_FACING, CableClubLeftGameboy
	db -1 ; end

; marcelnote - merged all these labels, removed PrintBenchGuyText
ViridianPokecenterMartHiddenObjects:
PewterPokecenterMartHiddenObjects:
CeruleanPokecenterMartHiddenObjects:
LavenderPokecenterMartHiddenObjects:
VermilionPokecenterMartHiddenObjects:
CeladonPokecenterHiddenObjects:
SaffronPokecenterHiddenObjects:
FuchsiaPokecenterMartHiddenObjects:
CinnabarPokecenterMartHiddenObjects:
MandarinPokecenterMartHiddenObjects:  ; marcelnote - new
MtMoonPokecenterHiddenObjects:
RockTunnelPokecenterHiddenObjects:
	hidden_object  5,  2,  $0, OpenPokemonCenterPC
	db -1 ; end

IndigoPlateauLobbyHiddenObjects:
	hidden_object  9,  6,  $0, OpenPokemonCenterPC ; marcelnote - modified map
	db -1 ; end

RedsYellowsHousesHiddenObjects: ; marcelnote - merged RedsHouse floors
	hidden_object 14,  1,  $0, OpenRedsPC
	db -1 ; end

;BluesAidesHousesHiddenObjects: ; marcelnote - bookcase text is already handled by bookshelf_tile_ids
;	hidden_object  0,  1,  $0, PrintBookcaseText
;	hidden_object  1,  1,  $0, PrintBookcaseText
;	hidden_object  7,  1,  $0, PrintBookcaseText
;	db -1 ; end

OaksLabHiddenObjects:
	hidden_object  4,  0,  $0, DisplayOakLabLeftPoster
	hidden_object  5,  0,  $0, DisplayOakLabRightPoster
	hidden_object  0,  1,  $0, DisplayOakLabEmailText
	hidden_object  1,  1,  $0, DisplayOakLabEmailText
	db -1 ; end


ViridianSchoolHiddenObjects:
	hidden_text_predef  3,  4, ViridianSchoolNotebook, PrintNotebookText
	hidden_text_predef  3,  0, ViridianSchoolBlackboard, PrintBlackboardLinkCableText
	db -1 ; end

ViridianGymHiddenObjects:
	hidden_object 15, 15,  $0, GymStatues
	hidden_object 18, 15,  $0, GymStatues
	db -1 ; end

PewterMuseumHiddenObjects: ; marcelnote - merged Pewter Museum floors
	hidden_object  2, 15,  $0, AerodactylFossil
	hidden_object  2, 18,  $0, KabutopsFossil
	db -1 ; end

PewterGymHiddenObjects:
	hidden_object  3, 10,  $0, GymStatues
	hidden_object  6, 10,  $0, GymStatues
	db -1 ; end

CeruleanGymHiddenObjects:
	hidden_object  3, 11,  $0, GymStatues
	hidden_object  6, 11,  $0, GymStatues
	db -1 ; end

VermilionGymHiddenObjects:
	hidden_object  3, 14,  $0, GymStatues
	hidden_object  6, 14,  $0, GymStatues
	hidden_object  6,  1,  $0, PrintTrashText
	; third param: [wGymTrashCanIndex]
	hidden_object  1,  7,  0, GymTrashScript
	hidden_object  1,  9,  1, GymTrashScript
	hidden_object  1, 11,  2, GymTrashScript
	hidden_object  3,  7,  3, GymTrashScript
	hidden_object  3,  9,  4, GymTrashScript
	hidden_object  3, 11,  5, GymTrashScript
	hidden_object  5,  7,  6, GymTrashScript
	hidden_object  5,  9,  7, GymTrashScript
	hidden_object  5, 11,  8, GymTrashScript
	hidden_object  7,  7,  9, GymTrashScript
	hidden_object  7,  9, 10, GymTrashScript
	hidden_object  7, 11, 11, GymTrashScript
	hidden_object  9,  7, 12, GymTrashScript
	hidden_object  9,  9, 13, GymTrashScript
	hidden_object  9, 11, 14, GymTrashScript
	db -1 ; end

CeladonMansionHiddenObjects:
	hidden_object  0, 39,  $0, OpenPokemonCenterPC ; marcelnote - merged Celadon Mansion floors
	db -1 ; end

CeladonGymHiddenObjects:
	hidden_object  3, 15,  $0, GymStatues
	hidden_object  6, 15,  $0, GymStatues
	db -1 ; end

GameCornerHiddenObjects: ; marcelnote - adjusted for new map size, changed arguments to $0
	hidden_object 18, 11,                 $0, StartSlotMachine
	hidden_object 18, 10,                 $0, StartSlotMachine
	hidden_object 18,  9,                 $0, StartSlotMachine
	hidden_object 18,  8,                 $0, StartSlotMachine
	hidden_object 18,  7,                 $0, StartSlotMachine
	hidden_object 18,  6, SLOTS_SOMEONESKEYS, StartSlotMachine
	hidden_object 13,  6,                 $0, StartSlotMachine
	hidden_object 13,  7,                 $0, StartSlotMachine
	hidden_object 13,  8,   SLOTS_OUTTOLUNCH, StartSlotMachine
	hidden_object 13,  9,                 $0, StartSlotMachine
	hidden_object 13, 10,                 $0, StartSlotMachine
	hidden_object 13, 11,                 $0, StartSlotMachine
	hidden_object 12, 11,                 $0, StartSlotMachine
	hidden_object 12, 10,                 $0, StartSlotMachine
	hidden_object 12,  9,                 $0, StartSlotMachine
	hidden_object 12,  8,                 $0, StartSlotMachine
	hidden_object 12,  7,                 $0, StartSlotMachine
	hidden_object 12,  6,                 $0, StartSlotMachine
	hidden_object  7,  6,                 $0, StartSlotMachine
	hidden_object  7,  7,                 $0, StartSlotMachine
	hidden_object  7,  8,                 $0, StartSlotMachine
	hidden_object  7,  9,                 $0, StartSlotMachine
	hidden_object  7, 10,                 $0, StartSlotMachine
	hidden_object  7, 11,                 $0, StartSlotMachine
	hidden_object  6, 11,                 $0, StartSlotMachine
	hidden_object  6, 10,                 $0, StartSlotMachine
	hidden_object  6,  9,                 $0, StartSlotMachine
	hidden_object  6,  8,   SLOTS_OUTOFORDER, StartSlotMachine
	hidden_object  6,  7,                 $0, StartSlotMachine
	hidden_object  6,  6,                 $0, StartSlotMachine
	hidden_object  1,  6,                 $0, StartSlotMachine
	hidden_object  1,  7,                 $0, StartSlotMachine
	hidden_object  1,  8,                 $0, StartSlotMachine
	hidden_object  1,  9,                 $0, StartSlotMachine
	hidden_object  1, 10,                 $0, StartSlotMachine
	hidden_object  1, 11,                 $0, StartSlotMachine

	; marcelnote - see also data/events/hidden_coins.asm
	hidden_object  0,  4, COIN+10, HiddenCoins
	hidden_object  1, 12, COIN+10, HiddenCoins
	hidden_object  3,  7, COIN+20, HiddenCoins
	hidden_object  3, 10, COIN+10, HiddenCoins
	hidden_object  4,  8, COIN+10, HiddenCoins
	hidden_object  9,  8, COIN+20, HiddenCoins
	hidden_object  9, 11, COIN+10, HiddenCoins
	hidden_object 16, 10, COIN+10, HiddenCoins
	hidden_object 10, 12, COIN+10, HiddenCoins
	hidden_object 11,  3, COIN+40, HiddenCoins
	hidden_object 15,  4, COIN+100, HiddenCoins
	hidden_object 12, 11, COIN+10, HiddenCoins
	db -1 ; end

FuchsiaGymHiddenObjects:
	hidden_object  3, 15,  $0, GymStatues
	hidden_object  6, 15,  $0, GymStatues
	db -1 ; end

CinnabarGymHiddenObjects: ; marcelnote - quiz questions 2-6 were reindexed as 3-7
	hidden_object 17, 13,  $0, GymStatues
	; third param: ([hGymGateAnswer] << 4) | [hGymGateIndex]
	hidden_object 15,  7, (FALSE << 4) | 1, PrintCinnabarQuiz
	hidden_object 15,  1, (FALSE << 4) | 2, PrintCinnabarQuiz ; marcelnote - new quiz question
	hidden_object 10,  1, (TRUE  << 4) | 3, PrintCinnabarQuiz
	hidden_object  9,  7, (TRUE  << 4) | 4, PrintCinnabarQuiz
	hidden_object  9, 13, (TRUE  << 4) | 5, PrintCinnabarQuiz
	hidden_object  1, 13, (FALSE << 4) | 6, PrintCinnabarQuiz
	hidden_object  1,  7, (TRUE  << 4) | 7, PrintCinnabarQuiz
	db -1 ; end

SaffronGymHiddenObjects:
	hidden_object  9, 15,  $0, GymStatues
	db -1 ; end

ViridianForestHiddenObjects:
	hidden_object  1, 18, POTION, HiddenItems
	hidden_object 16, 42, ANTIDOTE, HiddenItems
	db -1 ; end

MtMoonB2FHiddenObjects:
	hidden_object 18, 12, MOON_STONE, HiddenItems
	hidden_object 33,  9, ETHER, HiddenItems
	db -1 ; end

;IndigoPlateauHiddenObjects: ; marcelnote - removed
;	hidden_object  8, 13,  $0, PrintIndigoPlateauHQText ; inaccessible
;	hidden_object 11, 13,  $0, PrintIndigoPlateauHQText ; inaccessible
;	db -1 ; end

Route25HiddenObjects:
	hidden_object 38,  3, ETHER, HiddenItems
	hidden_object 10,  1, ELIXIR, HiddenItems
	db -1 ; end

Route9HiddenObjects:
	hidden_object 14,  7, ETHER, HiddenItems
	db -1 ; end

SSAnneKitchenHiddenObjects:
	hidden_object 13,  5, $0, PrintTrashText
	hidden_object 13,  7, $0, PrintTrashText
	hidden_object 13,  9, GREAT_BALL, HiddenItems
	db -1 ; end

SSAnneB1FHiddenObjects:
	hidden_object 37,  1, HYPER_POTION, HiddenItems ; marcelnote - merged SS Anne B1F and B1FRooms
	db -1 ; end

Route10HiddenObjects:
	hidden_object  9, 17, SUPER_POTION, HiddenItems
	hidden_object 16, 53, MAX_ETHER, HiddenItems
	db -1 ; end

RocketHideoutB1FHiddenObjects:
	hidden_object 21, 15, PP_UP, HiddenItems
	db -1 ; end

RocketHideoutB3FHiddenObjects:
	hidden_object 27, 17, NUGGET, HiddenItems
	db -1 ; end

RocketHideoutB4FHiddenObjects:
	hidden_object 25,  1, SUPER_POTION, HiddenItems
	db -1 ; end

PokemonTower5FHiddenObjects:
	hidden_object  4, 12, ELIXIR, HiddenItems
	db -1 ; end

Route13HiddenObjects:
	hidden_object  1, 14, PP_UP, HiddenItems
	hidden_object 16, 13, CALCIUM, HiddenItems
	db -1 ; end

SafariZoneEntranceHiddenObjects:
	hidden_object 10,  1, NUGGET, HiddenItems ; inaccessible
	db -1 ; end

SafariZoneWestHiddenObjects:
	hidden_object  6,  5, REVIVE, HiddenItems
	db -1 ; end

SilphCo5FHiddenObjects:
	hidden_object 12,  3, ELIXIR, HiddenItems
	db -1 ; end

SilphCo9FHiddenObjects:
	hidden_object  2, 15, MAX_POTION, HiddenItems
	db -1 ; end

SilphCo11FHiddenObjects:
	hidden_object 10, 12,  $0, OpenPokemonCenterPC
	db -1 ; end

CopycatsHouseHiddenObjects: ; marcelnote - merged Copycat's house floors
	hidden_object 15,  1, NUGGET, HiddenItems
	db -1 ; end

CeruleanCave1FHiddenObjects:
	hidden_object 14, 11, RARE_CANDY, HiddenItems
	db -1 ; end

CeruleanCaveB1FHiddenObjects:
	hidden_object 27,  3, ULTRA_BALL, HiddenItems
	db -1 ; end

PowerPlantHiddenObjects: ; put 1 item here if adding new Electrode
	hidden_object 17, 16, MAX_ELIXIR, HiddenItems
	hidden_object 12,  1, PP_UP, HiddenItems
	db -1 ; end

SeafoamIslandsB2FHiddenObjects:
	hidden_object 15, 15, NUGGET, HiddenItems
	db -1 ; end

SeafoamIslandsB3FHiddenObjects:
	hidden_object  9, 16, MAX_ELIXIR, HiddenItems
	db -1 ; end

SeafoamIslandsB4FHiddenObjects:
	hidden_object 25, 17, ULTRA_BALL, HiddenItems
	db -1 ; end

PokemonMansion1FHiddenObjects:
	hidden_object  8, 16, MOON_STONE, HiddenItems
	hidden_object  2,  5, $0, PokemonMansion1FScript_Switches
	db -1 ; end

PokemonMansion2FHiddenObjects:
	hidden_object  2, 11, $0, PokemonMansion2FScript_Switches
	db -1 ; end

PokemonMansion3FHiddenObjects:
	hidden_object  1,  9, MAX_REVIVE, HiddenItems
	hidden_object 10,  5, $0, PokemonMansion3FScript_Switches
	db -1 ; end

PokemonMansionB1FHiddenObjects:
	hidden_object  1,  9, RARE_CANDY, HiddenItems
	hidden_object 20,  3, $0, PokemonMansionB1FScript_Switches
	hidden_object 18, 25, $0, PokemonMansionB1FScript_Switches
	db -1 ; end

Route23HiddenObjects:
	hidden_object  9, 44, FULL_RESTORE, HiddenItems
	hidden_object 19, 70, ULTRA_BALL, HiddenItems
	hidden_object  8, 90, MAX_ETHER, HiddenItems
	db -1 ; end

VictoryRoad2FHiddenObjects:
	hidden_object  5,  2, ULTRA_BALL, HiddenItems
	hidden_object 26,  7, FULL_RESTORE, HiddenItems
	db -1 ; end

BillsHouseHiddenObjects:
	hidden_object  1,  4,  $0, BillsHousePC
	db -1 ; end

ViridianCityHiddenObjects:
	hidden_object 14,  4, POTION, HiddenItems
	db -1 ; end

Route11GateHiddenObjects: ; marcelnote - new, binoculars now hidden objects
	hidden_object  1, 16,  $0, Route11GateLeftBinoculars
	hidden_object  6, 16,  $0, Route11GateRightBinoculars
	db -1 ; end

Route12GateHiddenObjects: ; marcelnote - new, binoculars now hidden objects
	hidden_object 15,  2,  $0, Route12GateLeftBinoculars
	hidden_object 20,  2,  $0, Route12GateRightBinoculars
	db -1 ; end

Route15GateHiddenObjects: ; marcelnote - merged Route15Gate floors, binoculars now hidden objects
	hidden_object  1, 16,  $0, Route15GateLeftBinoculars
	hidden_object  6, 16,  $0, Route15GateRightBinoculars
	db -1 ; end

Route16GateHiddenObjects: ; marcelnote - new, binoculars now hidden objects
	hidden_object  1, 20,  $0, Route16GateLeftBinoculars
	hidden_object  6, 20,  $0, Route16GateRightBinoculars
	db -1 ; end

Route18GateHiddenObjects: ; marcelnote - new, binoculars now hidden objects
	hidden_object  1, 16,  $0, Route18GateLeftBinoculars
	hidden_object  6, 16,  $0, Route18GateRightBinoculars
	db -1 ; end

Route22GateHiddenObjects: ; marcelnote - new, binoculars now hidden objects
	hidden_object 26,  2,  $0, Route22GateLeftBinoculars
	hidden_object 28,  2,  $0, Route22GateRightBinoculars
	db -1 ; end

MrFujisHouseHiddenObjects:
	hidden_object  0,  1,  $0, PrintMagazinesText
	hidden_object  1,  1,  $0, PrintMagazinesText
	hidden_object  7,  1,  $0, PrintMagazinesText
	db -1 ; end

CeladonMansionRoofHouseHiddenObjects:
	hidden_text_predef  3,  0, LinkCableHelp, PrintBlackboardLinkCableText
	hidden_text_predef  4,  0, LinkCableHelp, PrintBlackboardLinkCableText
	hidden_text_predef  3,  4, TMNotebook, PrintNotebookText
	db -1 ; end

FightingDojoHiddenObjects:
	hidden_object  3,  9,  $0, PrintFightingDojoText
	hidden_object  6,  9,  $0, PrintFightingDojoText
	hidden_object  4,  0,  $0, PrintFightingDojoText2
	hidden_object  5,  0,  $0, PrintFightingDojoText3
	db -1 ; end

CinnabarLabHiddenObjects: ; marcelnote - merged Cinnabar Lab maps
	hidden_object 52,  4,  $0, OpenPokemonCenterPC
	hidden_object 54,  4,  $0, OpenPokemonCenterPC
	db -1 ; end

BikeShopHiddenObjects:
	hidden_object  1,  0,  $0, PrintNewBikeText
	hidden_object  2,  1,  $0, PrintNewBikeText
	hidden_object  1,  2,  $0, PrintNewBikeText
	hidden_object  3,  2,  $0, PrintNewBikeText
	hidden_object  0,  4,  $0, PrintNewBikeText
	hidden_object  1,  5,  $0, PrintNewBikeText
	db -1 ; end

Route11HiddenObjects:
	hidden_object 48,  5, ESCAPE_ROPE, HiddenItems
	db -1 ; end

Route12HiddenObjects:
	hidden_object  2, 63, HYPER_POTION, HiddenItems
	db -1 ; end

Route17HiddenObjects:
	hidden_object 15,  14, RARE_CANDY, HiddenItems
	hidden_object  8,  45, FULL_RESTORE, HiddenItems
	hidden_object 17,  72, PP_UP, HiddenItems
	hidden_object  4,  91, MAX_REVIVE, HiddenItems
	hidden_object  8, 121, MAX_ELIXIR, HiddenItems
	db -1 ; end

UndergroundPathNsHiddenObjects:
	hidden_object  3,  4, FULL_RESTORE, HiddenItems
	hidden_object  4, 34, X_SPECIAL, HiddenItems
	db -1 ; end

UndergroundPathWeHiddenObjects:
	hidden_object 12,  2, NUGGET, HiddenItems
	hidden_object 21,  5, ELIXIR, HiddenItems
	db -1 ; end

CeladonCityHiddenObjects:
	hidden_object 48, 15, PP_UP, HiddenItems
	db -1 ; end

VermilionCityHiddenObjects:
	hidden_object 14, 11, MAX_ETHER, HiddenItems
	db -1 ; end

CeruleanCityHiddenObjects:
	hidden_object 15,  8, RARE_CANDY, HiddenItems
	db -1 ; end

Route4HiddenObjects:
	hidden_object 40,  3, GREAT_BALL, HiddenItems
	db -1 ; end

DaycareHiddenObjects:  ; marcelnote - new
	hidden_object  7,  1,  $0, OpenPokemonCenterPC
	db -1 ; end

CeladonMart1F2F3FHiddenObjects:  ; marcelnote - new
	hidden_object  3,  4,  $0, PrintCeladonMart3FRPGText
	hidden_object  6,  4,  $0, PrintCeladonMart3FSportsGameText
	hidden_object  3,  6,  $0, PrintCeladonMart3FPuzzleGameText
	hidden_object  6,  6,  $0, PrintCeladonMart3FFightingGameText
	db -1 ; end

CinnabarVolcano2FHiddenObjects:  ; marcelnote - new
	hidden_object 23,  5, MAX_ELIXIR, HiddenItems
	db -1 ; end

PokemonAcademy3F4FHiddenObjects:  ; marcelnote - new
	hidden_object 24,  0,  $0, OpenPokemonCenterPC
	db -1 ; end

MandarinSurfShopHiddenObjects:  ; marcelnote - new
	hidden_object  1,  4,  $0, PrintNewSurfboardText
	hidden_object  3,  1,  $0, PrintNewSurfboardText
	hidden_object  1,  3,  $0, PrintNewSurfboardText
	hidden_object  1,  5,  $0, PrintNewSurfboardText
	hidden_object  7,  4,  $0, PrintNewSurfboardText
	db -1 ; end

SilphFactory1FHiddenObjects:  ; marcelnote - new
	hidden_object 10,  4, MAX_ETHER, HiddenItems
	hidden_object 12, 14, MAX_ELIXIR, HiddenItems
	db -1 ; end

SilphFactory2FHiddenObjects:  ; marcelnote - new
	hidden_object 28, 14, PP_UP, HiddenItems
	db -1 ; end

MtSilver1FHiddenObjects:  ; marcelnote - new
	hidden_object 19, 13, ULTRA_BALL, HiddenItems
	hidden_object 18, 23, DIRE_HIT, HiddenItems
	db -1 ; end

MtSilver2FHiddenObjects:  ; marcelnote - new
	hidden_object 14, 29, MAX_POTION, HiddenItems
	db -1 ; end

BattleHallHiddenObjects:  ; marcelnote - new
	hidden_object 11,  4,  $0, OpenPokemonCenterPC
	db -1 ; end
