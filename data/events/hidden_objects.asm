HiddenObjectMaps:
	db REDS_YELLOWS_HOUSES ; marcelnote - merged RedsHouse floors
	;db BLUES_AIDES_HOUSES
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
	db CELADON_HOTEL
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
	db INDIGO_PLATEAU
	db ROUTE_25
	db ROUTE_9
	db SS_ANNE_KITCHEN
	db SS_ANNE_B1F_ROOMS
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
	;db SAFARI_ZONE_WEST_REST_HOUSE ; marcelnote - inaccessible Hidden objects
	;db SAFARI_ZONE_EAST_REST_HOUSE
	;db SAFARI_ZONE_NORTH_REST_HOUSE
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
	db CINNABAR_VOLCANO_2F       ; marcelnote - new
	db POKEMON_ACADEMY_3F4F      ; marcelnote - new
	db MANDARIN_POKECENTER_MART  ; marcelnote - new
	db MANDARIN_SURF_SHOP        ; marcelnote - new
	db SILPH_FACTORY_1F          ; marcelnote - new
	db SILPH_FACTORY_2F          ; marcelnote - new
	db MT_SILVER_1F              ; marcelnote - new
	db MT_SILVER_2F              ; marcelnote - new
	db -1 ; end

HiddenObjectPointers:
; each of these pointers is for the corresponding map in HiddenObjectMaps
	dw RedsYellowsHousesHiddenObjects ; marcelnote - merged RedsHouse floors, added YellowsHouse
	;dw BluesAidesHousesHiddenObjects ; marcelnote - hidden objects were redundant
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
	dw CeladonHotelHiddenObjects
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
	dw IndigoPlateauHiddenObjects
	dw Route25HiddenObjects
	dw Route9HiddenObjects
	dw SSAnneKitchenHiddenObjects
	dw SSAnneB1FRoomsHiddenObjects
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
	;dw SafariZoneRestHouse2HiddenObjects ; marcelnote - inaccessible Hidden objects
	;dw SafariZoneRestHouse3HiddenObjects
	;dw SafariZoneRestHouse4HiddenObjects
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
	dw CinnabarVolcano2FHiddenObjects      ; marcelnote - new
	dw PokemonAcademy3F4FHiddenObjects     ; marcelnote - new
	dw MandarinPokecenterMartHiddenObjects ; marcelnote - new
	dw MandarinSurfShopHiddenObjects       ; marcelnote - new
	dw SilphFactory1FHiddenObjects         ; marcelnote - new
	dw SilphFactory2FHiddenObjects         ; marcelnote - new
	dw MtSilver1FHiddenObjects             ; marcelnote - new
	dw MtSilver2FHiddenObjects             ; marcelnote - new

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

RedsYellowsHousesHiddenObjects: ; marcelnote - merged RedsHouse floors
	hidden_object 14,  1, SPRITE_FACING_UP, OpenRedsPC
	db -1 ; end

;BluesAidesHousesHiddenObjects: ; marcelnote - bookcase text is already handled by bookshelf_tile_ids
;	hidden_object  0,  1, SPRITE_FACING_UP, PrintBookcaseText
;	hidden_object  1,  1, SPRITE_FACING_UP, PrintBookcaseText
;	hidden_object  7,  1, SPRITE_FACING_UP, PrintBookcaseText
;	db -1 ; end

OaksLabHiddenObjects:
	hidden_object  4,  0, SPRITE_FACING_UP, DisplayOakLabLeftPoster
	hidden_object  5,  0, SPRITE_FACING_UP, DisplayOakLabRightPoster
	hidden_object  0,  1, SPRITE_FACING_UP, DisplayOakLabEmailText
	hidden_object  1,  1, SPRITE_FACING_UP, DisplayOakLabEmailText
	db -1 ; end

ViridianPokecenterMartHiddenObjects:
	hidden_object  0,  4, SPRITE_FACING_LEFT, PrintBenchGuyText
	hidden_object 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

ViridianSchoolHiddenObjects:
	hidden_text_predef  3,  4, ViridianSchoolNotebook, PrintNotebookText
	hidden_text_predef  3,  0, ViridianSchoolBlackboard, PrintBlackboardLinkCableText
	db -1 ; end

ViridianGymHiddenObjects:
	hidden_object 15, 15, SPRITE_FACING_UP, GymStatues
	hidden_object 18, 15, SPRITE_FACING_UP, GymStatues
	db -1 ; end

PewterMuseumHiddenObjects: ; marcelnote - merged Pewter Museum floors
	hidden_object  2, 15, SPRITE_FACING_UP, AerodactylFossil
	hidden_object  2, 18, SPRITE_FACING_UP, KabutopsFossil
	db -1 ; end

PewterGymHiddenObjects:
	hidden_object  3, 10, SPRITE_FACING_UP, GymStatues
	hidden_object  6, 10, SPRITE_FACING_UP, GymStatues
	db -1 ; end

PewterPokecenterMartHiddenObjects: ; marcelnote - merged Pewter Pokecenter and Mart
	hidden_object  0,  4, SPRITE_FACING_LEFT, PrintBenchGuyText
	hidden_object 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

CeruleanPokecenterMartHiddenObjects: ; marcelnote - merged Cerulean Pokecenter and Mart
	hidden_object  0,  4, SPRITE_FACING_LEFT, PrintBenchGuyText
	hidden_object 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

CeruleanGymHiddenObjects:
	hidden_object  3, 11, SPRITE_FACING_UP, GymStatues
	hidden_object  6, 11, SPRITE_FACING_UP, GymStatues
	db -1 ; end

LavenderPokecenterMartHiddenObjects:
	hidden_object  0,  4, SPRITE_FACING_LEFT, PrintBenchGuyText
	hidden_object 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

VermilionPokecenterMartHiddenObjects: ; marcelnote - merged Vermilion Pokecenter and Mart
	hidden_object 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	hidden_object  0,  4, SPRITE_FACING_UP, PrintBenchGuyText
	db -1 ; end

VermilionGymHiddenObjects:
	hidden_object  3, 14, SPRITE_FACING_UP, GymStatues
	hidden_object  6, 14, SPRITE_FACING_UP, GymStatues
	hidden_object  6,  1, SPRITE_FACING_DOWN, PrintTrashText
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
	hidden_object  0, 39, SPRITE_FACING_UP, OpenPokemonCenterPC ; marcelnote - merged Celadon Mansion floors
	db -1 ; end

CeladonPokecenterHiddenObjects:
	hidden_object  0,  4, SPRITE_FACING_LEFT, PrintBenchGuyText
	hidden_object 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

CeladonGymHiddenObjects:
	hidden_object  3, 15, SPRITE_FACING_UP, GymStatues
	hidden_object  6, 15, SPRITE_FACING_UP, GymStatues
	db -1 ; end

GameCornerHiddenObjects:
	hidden_object 18, 15, ANY_FACING, StartSlotMachine
	hidden_object 18, 14, ANY_FACING, StartSlotMachine
	hidden_object 18, 13, ANY_FACING, StartSlotMachine
	hidden_object 18, 12, ANY_FACING, StartSlotMachine
	hidden_object 18, 11, ANY_FACING, StartSlotMachine
	hidden_object 18, 10, SLOTS_SOMEONESKEYS, StartSlotMachine
	hidden_object 13, 10, ANY_FACING, StartSlotMachine
	hidden_object 13, 11, ANY_FACING, StartSlotMachine
	hidden_object 13, 12, SLOTS_OUTTOLUNCH, StartSlotMachine
	hidden_object 13, 13, ANY_FACING, StartSlotMachine
	hidden_object 13, 14, ANY_FACING, StartSlotMachine
	hidden_object 13, 15, ANY_FACING, StartSlotMachine
	hidden_object 12, 15, ANY_FACING, StartSlotMachine
	hidden_object 12, 14, ANY_FACING, StartSlotMachine
	hidden_object 12, 13, ANY_FACING, StartSlotMachine
	hidden_object 12, 12, ANY_FACING, StartSlotMachine
	hidden_object 12, 11, ANY_FACING, StartSlotMachine
	hidden_object 12, 10, ANY_FACING, StartSlotMachine
	hidden_object  7, 10, ANY_FACING, StartSlotMachine
	hidden_object  7, 11, ANY_FACING, StartSlotMachine
	hidden_object  7, 12, ANY_FACING, StartSlotMachine
	hidden_object  7, 13, ANY_FACING, StartSlotMachine
	hidden_object  7, 14, ANY_FACING, StartSlotMachine
	hidden_object  7, 15, ANY_FACING, StartSlotMachine
	hidden_object  6, 15, ANY_FACING, StartSlotMachine
	hidden_object  6, 14, ANY_FACING, StartSlotMachine
	hidden_object  6, 13, ANY_FACING, StartSlotMachine
	hidden_object  6, 12, SLOTS_OUTOFORDER, StartSlotMachine
	hidden_object  6, 11, ANY_FACING, StartSlotMachine
	hidden_object  6, 10, ANY_FACING, StartSlotMachine
	hidden_object  1, 10, ANY_FACING, StartSlotMachine
	hidden_object  1, 11, ANY_FACING, StartSlotMachine
	hidden_object  1, 12, ANY_FACING, StartSlotMachine
	hidden_object  1, 13, ANY_FACING, StartSlotMachine
	hidden_object  1, 14, ANY_FACING, StartSlotMachine
	hidden_object  1, 15, ANY_FACING, StartSlotMachine
	hidden_object  0,  8, COIN+10, HiddenCoins
	hidden_object  1, 16, COIN+10, HiddenCoins
	hidden_object  3, 11, COIN+20, HiddenCoins
	hidden_object  3, 14, COIN+10, HiddenCoins
	hidden_object  4, 12, COIN+10, HiddenCoins
	hidden_object  9, 12, COIN+20, HiddenCoins
	hidden_object  9, 15, COIN+10, HiddenCoins
	hidden_object 16, 14, COIN+10, HiddenCoins
	hidden_object 10, 16, COIN+10, HiddenCoins
	hidden_object 11,  7, COIN+40, HiddenCoins
	hidden_object 15,  8, COIN+100, HiddenCoins
	hidden_object 12, 15, COIN+10, HiddenCoins
	db -1 ; end

CeladonHotelHiddenObjects:
	;hidden_object 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC ; marcelnote - removed invisible PC
	hidden_object  0,  4, SPRITE_FACING_LEFT, PrintBenchGuyText
	db -1 ; end

FuchsiaPokecenterMartHiddenObjects: ; marcelnote - merged Fuchsia Pokecenter and Mart
	hidden_object 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	hidden_object  0,  4, SPRITE_FACING_UP, PrintBenchGuyText
	db -1 ; end

FuchsiaGymHiddenObjects:
	hidden_object  3, 15, SPRITE_FACING_UP, GymStatues
	hidden_object  6, 15, SPRITE_FACING_UP, GymStatues
	db -1 ; end

CinnabarGymHiddenObjects: ; marcelnote - quiz questions 2-6 were reindexed as 3-7
	hidden_object 17, 13, SPRITE_FACING_UP, GymStatues
	; third param: ([hGymGateAnswer] << 4) | [hGymGateIndex]
	hidden_object 15,  7, (FALSE << 4) | 1, PrintCinnabarQuiz
	hidden_object 15,  1, (FALSE << 4) | 2, PrintCinnabarQuiz ; marcelnote - new quiz question
	hidden_object 10,  1, (TRUE  << 4) | 3, PrintCinnabarQuiz
	hidden_object  9,  7, (TRUE  << 4) | 4, PrintCinnabarQuiz
	hidden_object  9, 13, (TRUE  << 4) | 5, PrintCinnabarQuiz
	hidden_object  1, 13, (FALSE << 4) | 6, PrintCinnabarQuiz
	hidden_object  1,  7, (TRUE  << 4) | 7, PrintCinnabarQuiz
	db -1 ; end

CinnabarPokecenterMartHiddenObjects: ; marcelnote - merged Cinnabar Pokecenter and Mart
	hidden_object  0,  4, SPRITE_FACING_UP, PrintBenchGuyText
	hidden_object 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

SaffronGymHiddenObjects:
	hidden_object  9, 15, SPRITE_FACING_UP, GymStatues
	db -1 ; end

MtMoonPokecenterHiddenObjects:
	hidden_object  0,  4, SPRITE_FACING_LEFT, PrintBenchGuyText
	hidden_object 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

RockTunnelPokecenterHiddenObjects:
	hidden_object  0,  4, SPRITE_FACING_LEFT, PrintBenchGuyText
	hidden_object 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

ViridianForestHiddenObjects:
	hidden_object  1, 18, POTION, HiddenItems
	hidden_object 16, 42, ANTIDOTE, HiddenItems
	db -1 ; end

MtMoonB2FHiddenObjects:
	hidden_object 18, 12, MOON_STONE, HiddenItems
	hidden_object 33,  9, ETHER, HiddenItems
	db -1 ; end

IndigoPlateauHiddenObjects:
	hidden_object  8, 13, $ff, PrintIndigoPlateauHQText ; inaccessible
	hidden_object 11, 13, SPRITE_FACING_DOWN, PrintIndigoPlateauHQText ; inaccessible
	db -1 ; end

Route25HiddenObjects:
	hidden_object 38,  3, ETHER, HiddenItems
	hidden_object 10,  1, ELIXIR, HiddenItems
	db -1 ; end

Route9HiddenObjects:
	hidden_object 14,  7, ETHER, HiddenItems
	db -1 ; end

SSAnneKitchenHiddenObjects:
	hidden_object 13,  5, SPRITE_FACING_DOWN, PrintTrashText
	hidden_object 13,  7, SPRITE_FACING_DOWN, PrintTrashText
	hidden_object 13,  9, GREAT_BALL, HiddenItems
	db -1 ; end

SSAnneB1FRoomsHiddenObjects:
	hidden_object  3,  1, HYPER_POTION, HiddenItems
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

SaffronPokecenterHiddenObjects:
	hidden_object  0,  4, SPRITE_FACING_UP, PrintBenchGuyText
	hidden_object 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
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
	hidden_object 10, 12, SPRITE_FACING_UP, OpenPokemonCenterPC
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

PowerPlantHiddenObjects:
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
	hidden_object  2,  5, SPRITE_FACING_UP, PokemonMansion1FScript_Switches
	db -1 ; end

PokemonMansion2FHiddenObjects:
	hidden_object  2, 11, SPRITE_FACING_UP, PokemonMansion2FScript_Switches
	db -1 ; end

PokemonMansion3FHiddenObjects:
	hidden_object  1,  9, MAX_REVIVE, HiddenItems
	hidden_object 10,  5, SPRITE_FACING_UP, PokemonMansion3FScript_Switches
	db -1 ; end

PokemonMansionB1FHiddenObjects:
	hidden_object  1,  9, RARE_CANDY, HiddenItems
	hidden_object 20,  3, SPRITE_FACING_UP, PokemonMansionB1FScript_Switches
	hidden_object 18, 25, SPRITE_FACING_UP, PokemonMansionB1FScript_Switches
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
	hidden_object  1,  4, SPRITE_FACING_UP, BillsHousePC
	db -1 ; end

ViridianCityHiddenObjects:
	hidden_object 14,  4, POTION, HiddenItems
	db -1 ; end

;SafariZoneRestHouse2HiddenObjects: ; marcelnote - inaccessible Hidden objects
;	hidden_object  0,  4, SPRITE_FACING_LEFT, PrintBenchGuyText
;	hidden_object 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
;	db -1 ; end

;SafariZoneRestHouse3HiddenObjects:
;	hidden_object  0,  4, SPRITE_FACING_LEFT, PrintBenchGuyText
;	hidden_object 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
;	db -1 ; end

;SafariZoneRestHouse4HiddenObjects:
;	hidden_object  0,  4, SPRITE_FACING_LEFT, PrintBenchGuyText
;	hidden_object 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
;	db -1 ; end

Route11GateHiddenObjects: ; marcelnote - new, binoculars now hidden objects
	hidden_object  1, 16, SPRITE_FACING_UP, Route11GateLeftBinoculars
	hidden_object  6, 16, SPRITE_FACING_UP, Route11GateRightBinoculars
	db -1 ; end

Route12GateHiddenObjects: ; marcelnote - new, binoculars now hidden objects
	hidden_object 15,  2, SPRITE_FACING_UP, Route12GateLeftBinoculars
	hidden_object 20,  2, SPRITE_FACING_UP, Route12GateRightBinoculars
	db -1 ; end

Route15GateHiddenObjects: ; marcelnote - merged Route15Gate floors, binoculars now hidden objects
	hidden_object  1, 16, SPRITE_FACING_UP, Route15GateLeftBinoculars
	hidden_object  6, 16, SPRITE_FACING_UP, Route15GateRightBinoculars
	db -1 ; end

Route16GateHiddenObjects: ; marcelnote - new, binoculars now hidden objects
	hidden_object  1, 20, SPRITE_FACING_UP, Route16GateLeftBinoculars
	hidden_object  6, 20, SPRITE_FACING_UP, Route16GateRightBinoculars
	db -1 ; end

Route18GateHiddenObjects: ; marcelnote - new, binoculars now hidden objects
	hidden_object  1, 16, SPRITE_FACING_UP, Route18GateLeftBinoculars
	hidden_object  6, 16, SPRITE_FACING_UP, Route18GateRightBinoculars
	db -1 ; end

Route22GateHiddenObjects: ; marcelnote - new, binoculars now hidden objects
	hidden_object 26,  2, SPRITE_FACING_UP, Route22GateLeftBinoculars
	hidden_object 28,  2, SPRITE_FACING_UP, Route22GateRightBinoculars
	db -1 ; end

MrFujisHouseHiddenObjects:
	hidden_object  0,  1, SPRITE_FACING_DOWN, PrintMagazinesText
	hidden_object  1,  1, SPRITE_FACING_DOWN, PrintMagazinesText
	hidden_object  7,  1, SPRITE_FACING_DOWN, PrintMagazinesText
	db -1 ; end

CeladonMansionRoofHouseHiddenObjects:
	hidden_text_predef  3,  0, LinkCableHelp, PrintBlackboardLinkCableText
	hidden_text_predef  4,  0, LinkCableHelp, PrintBlackboardLinkCableText
	hidden_text_predef  3,  4, TMNotebook, PrintNotebookText
	db -1 ; end

FightingDojoHiddenObjects:
	hidden_object  3,  9, SPRITE_FACING_UP, PrintFightingDojoText
	hidden_object  6,  9, SPRITE_FACING_UP, PrintFightingDojoText
	hidden_object  4,  0, SPRITE_FACING_UP, PrintFightingDojoText2
	hidden_object  5,  0, SPRITE_FACING_UP, PrintFightingDojoText3
	db -1 ; end

IndigoPlateauLobbyHiddenObjects:
	hidden_object 15,  7, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

CinnabarLabHiddenObjects: ; marcelnote - merged Cinnabar Lab maps
	hidden_object 52,  4, SPRITE_FACING_UP, OpenPokemonCenterPC
	hidden_object 54,  4, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

BikeShopHiddenObjects:
	hidden_object  1,  0, ANY_FACING, PrintNewBikeText
	hidden_object  2,  1, ANY_FACING, PrintNewBikeText
	hidden_object  1,  2, ANY_FACING, PrintNewBikeText
	hidden_object  3,  2, ANY_FACING, PrintNewBikeText
	hidden_object  0,  4, ANY_FACING, PrintNewBikeText
	hidden_object  1,  5, ANY_FACING, PrintNewBikeText
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

CinnabarVolcano2FHiddenObjects:  ; marcelnote - new
	hidden_object 23,  5, MAX_ELIXIR, HiddenItems
	db -1 ; end

PokemonAcademy3F4FHiddenObjects:  ; marcelnote - new
	hidden_object 24,  0, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

MandarinPokecenterMartHiddenObjects:  ; marcelnote - new
	hidden_object  0,  4, SPRITE_FACING_UP, PrintBenchGuyText
	hidden_object 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

MandarinSurfShopHiddenObjects:  ; marcelnote - new
	hidden_object  1,  4, ANY_FACING, PrintNewSurfboardText
	hidden_object  3,  1, ANY_FACING, PrintNewSurfboardText
	hidden_object  1,  3, ANY_FACING, PrintNewSurfboardText
	hidden_object  1,  5, ANY_FACING, PrintNewSurfboardText
	hidden_object  7,  4, ANY_FACING, PrintNewSurfboardText
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

MtSilver2FHiddenObjects:  ; marcelnote - new
	hidden_object 14, 29, MAX_POTION, HiddenItems
	db -1 ; end