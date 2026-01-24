; toggleable objects for each map

ToggleableObjectMapPointers:
; entries correspond to map ids
	table_width 2
	dw PalletTownToggleData    ; PALLET_TOWN
	dw ViridianCityToggleData  ; VIRIDIAN_CITY
	dw PewterCityToggleData    ; PEWTER_CITY
	dw CeruleanCityToggleData  ; CERULEAN_CITY
	dw NoToggleData            ; LAVENDER_TOWN
	dw VermilionCityToggleData ; VERMILION_CITY ; marcelnote - new for Sailor who disappears
	dw NoToggleData            ; CELADON_CITY
	dw SaffronCityToggleData   ; SAFFRON_CITY
	dw NoToggleData            ; FUCHSIA_CITY
	dw NoToggleData            ; CINNABAR_ISLAND
	dw NoToggleData            ; MANDARIN_ISLAND ; marcelnote - new map
	dw NoToggleData            ; INDIGO_PLATEAU
	dw Route1ToggleData        ; ROUTE_1 ; marcelnote - added for postgame Oak battle
	dw Route2ToggleData        ; ROUTE_2
	dw NoToggleData            ; ROUTE_3
	dw Route4ToggleData        ; ROUTE_4
	dw NoToggleData            ; ROUTE_5
	dw NoToggleData            ; ROUTE_6
	dw NoToggleData            ; ROUTE_7
	dw NoToggleData            ; ROUTE_8
	dw Route9ToggleData        ; ROUTE_9
	dw NoToggleData            ; ROUTE_10
	dw NoToggleData            ; ROUTE_11
	dw Route12ToggleData       ; ROUTE_12
	dw NoToggleData            ; ROUTE_13
	dw NoToggleData            ; ROUTE_14
	dw Route15ToggleData       ; ROUTE_15
	dw Route16ToggleData       ; ROUTE_16
	dw NoToggleData            ; ROUTE_17
	dw NoToggleData            ; ROUTE_18
	dw NoToggleData            ; ROUTE_19
	dw NoToggleData            ; ROUTE_20
	dw NoToggleData            ; ROUTE_21
	dw Route22ToggleData       ; ROUTE_22
	dw NoToggleData            ; ROUTE_23
	dw Route24ToggleData       ; ROUTE_24
	dw Route25ToggleData       ; ROUTE_25
	dw NoToggleData            ; ROUTE_28 ; marcelnote - new location
	dw NoToggleData            ; ORANGE_ROUTE_1 ; marcelnote - new location
	dw RedsYellowsHousesToggleData         ; REDS_YELLOWS_HOUSES ; marcelnote - added to hide Yellow asleep
	dw BluesAidesHousesToggleData          ; BLUES_AIDES_HOUSES  ; marcelnote - merged Blue's house with new Aide's house
	dw OaksLabToggleData                   ; OAKS_LAB
	dw NoToggleData                        ; VIRIDIAN_POKECENTER_MART ; marcelnote - merged Viridian Pokecenter and Mart
	dw NoToggleData                        ; VIRIDIAN_SCHOOL_HOUSE
	dw NoToggleData                        ; VIRIDIAN_NICKNAME_HOUSE
	dw ViridianGymToggleData               ; VIRIDIAN_GYM
	dw NoToggleData                        ; VIRIDIAN_FOREST_SOUTH_GATE
	dw NoToggleData                        ; ROUTE_2_GATE
	dw ViridianForestToggleData            ; VIRIDIAN_FOREST
	dw NoToggleData                        ; VIRIDIAN_FOREST_NORTH_GATE
	dw NoToggleData                        ; ROUTE_2_TRADE_HOUSE
	dw NoToggleData                        ; DIGLETTS_CAVE_ROUTE_2
	dw NoToggleData                        ; PEWTER_POKECENTER_MART ; marcelnote - merged Pewter Pokecenter and Mart
	dw PewterMuseumToggleData              ; PEWTER_MUSEUM ; marcelnote - merged Pewter Museum floors
	dw NoToggleData                        ; PEWTER_NIDORAN_HOUSE
	dw NoToggleData                        ; PEWTER_SPEECH_HOUSE
	dw PewterGymToggleData                 ; PEWTER_GYM              ; marcelnote - Brock rematch
	dw NoToggleData                        ; CELADON_GROVE_NORTH_GATE
	dw NoToggleData                        ; MT_MOON_POKECENTER
	dw MtMoon1FToggleData                  ; MT_MOON_1F
	dw NoToggleData                        ; MT_MOON_B1F
	dw MtMoonB2FToggleData                 ; MT_MOON_B2F
	dw MtMoonSquareToggleData              ; MT_MOON_SQUARE          ; marcelnote - new location
	dw NoToggleData                        ; CERULEAN_POKECENTER_MART  ; marcelnote - merged Cerulean Pokecenter and Mart
	dw NoToggleData                        ; CERULEAN_TRASHED_HOUSE
	dw NoToggleData                        ; CERULEAN_TRADE_HOUSE
	dw NoToggleData                        ; CERULEAN_BADGE_HOUSE
	dw NoToggleData                        ; BIKE_SHOP
	dw CeruleanGymToggleData               ; CERULEAN_GYM            ; marcelnote - Misty rematch
	dw CeruleanCave1FToggleData            ; CERULEAN_CAVE_1F
	dw CeruleanCave2FToggleData            ; CERULEAN_CAVE_2F
	dw CeruleanCaveB1FToggleData           ; CERULEAN_CAVE_B1F
	dw BillsHouseToggleData                ; BILLS_HOUSE
	dw NoToggleData                        ; ROUTE_5_GATE
	dw NoToggleData                        ; UNDERGROUND_PATH_ROUTE_5
	dw NoToggleData                        ; DAYCARE
	dw NoToggleData                        ; ROUTE_6_GATE
	dw NoToggleData                        ; UNDERGROUND_PATH_ROUTE_6
	dw NoToggleData                        ; ROUTE_7_GATE
	dw NoToggleData                        ; UNDERGROUND_PATH_ROUTE_7
	dw NoToggleData                        ; ROUTE_8_GATE
	dw NoToggleData                        ; UNDERGROUND_PATH_ROUTE_8
	dw NoToggleData                        ; UNDERGROUND_PATH_NORTH_SOUTH
	dw NoToggleData                        ; UNDERGROUND_PATH_WEST_EAST
	dw NoToggleData                        ; VERMILION_POKECENTER_MART ; marcelnote - merged Vermilion Pokecenter and Mart
	dw NoToggleData                        ; VERMILION_GOOD_ROD_HOUSE
	dw NoToggleData                        ; POKEMON_FAN_CLUB
	dw NoToggleData                        ; VERMILION_PIDGEY_HOUSE
	dw NoToggleData                        ; VERMILION_TRADE_HOUSE
	dw VermilionGymToggleData              ; VERMILION_GYM ; marcelnote - Lt.Surge rematch
	dw VermilionDockToggleData             ; VERMILION_DOCK ; marcelnote - new for Ferry entrance
	dw NoToggleData                        ; SS_ANNE_1F
	dw SSAnne2FToggleData                  ; SS_ANNE_2F
	dw NoToggleData                        ; SS_ANNE_3F
	dw SSAnneB1FToggleData                 ; SS_ANNE_B1F ; marcelnote - merged SS Anne B1F and B1FRooms
	dw NoToggleData                        ; SS_ANNE_BOW
	dw NoToggleData                        ; SS_ANNE_KITCHEN
	dw NoToggleData                        ; SS_ANNE_CAPTAINS_ROOM
	dw SSAnne1FRoomsToggleData             ; SS_ANNE_1F_ROOMS
	dw SSAnne2FRoomsToggleData             ; SS_ANNE_2F_ROOMS
	dw NoToggleData                        ; DIGLETTS_CAVE
	dw NoToggleData                        ; DIGLETTS_CAVE_ROUTE_11
	dw NoToggleData                        ; ROUTE_11_GATE
	dw NoToggleData                        ; ROCK_TUNNEL_POKECENTER
	dw NoToggleData                        ; ROCK_TUNNEL_1F
	dw NoToggleData                        ; ROCK_TUNNEL_B1F
	dw PowerPlantToggleData                ; POWER_PLANT
	dw NoToggleData                        ; LAVENDER_POKECENTER_MART
	dw MrFujisHouseToggleData              ; MR_FUJIS_HOUSE
	dw NoToggleData                        ; NAME_RATERS_HOUSE
	dw NoToggleData                        ; LAVENDER_CUBONE_HOUSE
	dw PokemonTower1FToggleData            ; POKEMON_TOWER_1F ;marcelnote - postgame Agatha event
	dw PokemonTower2FToggleData            ; POKEMON_TOWER_2F
	dw PokemonTower3FToggleData            ; POKEMON_TOWER_3F
	dw PokemonTower4FToggleData            ; POKEMON_TOWER_4F
	dw PokemonTower5FToggleData            ; POKEMON_TOWER_5F
	dw PokemonTower6FToggleData            ; POKEMON_TOWER_6F
	dw PokemonTower7FToggleData            ; POKEMON_TOWER_7F
	dw NoToggleData                        ; ROUTE_12_GATE
	dw NoToggleData                        ; ROUTE_12_FISHING_GUIDE_HOUSE
	dw NoToggleData                        ; CELADON_POKECENTER
	dw NoToggleData                        ; CELADON_MART_1F2F3F
	dw NoToggleData                        ; CELADON_MART_4F5F6F
	dw NoToggleData                        ; CELADON_MART_ROOF
	dw NoToggleData                        ; CELADON_MART_ELEVATOR
	dw NoToggleData                        ; CELADON_MANSION
	dw NoToggleData                        ; CELADON_MANSION_ROOF
	dw CeladonMansionRoofHouseToggleData   ; CELADON_MANSION_ROOF_HOUSE
	dw GameCornerToggleData                ; GAME_CORNER
	dw NoToggleData                        ; GAME_CORNER_PRIZE_ROOM
	dw NoToggleData                        ; CELADON_DINER
	dw NoToggleData                        ; CELADON_CHIEF_HOUSE
	dw NoToggleData                        ; CELADON_HOTEL
	dw CeladonGroveSouthGateToggleData     ; CELADON_GROVE_SOUTH_GATE ; marcelnote - was NoToggleData
	dw CeladonGymToggleData                ; CELADON_GYM              ; marcelnote - Erika rematch
	dw RocketHideoutB1FToggleData          ; ROCKET_HIDEOUT_B1F
	dw RocketHideoutB2FToggleData          ; ROCKET_HIDEOUT_B2F
	dw RocketHideoutB3FToggleData          ; ROCKET_HIDEOUT_B3F
	dw RocketHideoutB4FToggleData          ; ROCKET_HIDEOUT_B4F
	dw NoToggleData                        ; ROCKET_HIDEOUT_ELEVATOR
	dw CeladonGroveToggleData              ; CELADON_GROVE            ; marcelnote - was NoToggleData
	dw NoToggleData                        ; ROUTE_15_GATE
	dw NoToggleData                        ; ROUTE_16_GATE
	dw NoToggleData                        ; ROUTE_16_FLY_HOUSE
	dw NoToggleData                        ; ROUTE_18_GATE
	dw NoToggleData                        ; SAFFRON_POKECENTER_MART ; marcelnote - merged Saffron Pokecenter and Mart
	dw NoToggleData                        ; COPYCATS_HOUSE ; marcelnote - merged Copycat's house floors
	dw FightingDojoToggleData              ; FIGHTING_DOJO
	dw NoToggleData                        ; SAFFRON_PIDGEY_HOUSE
	dw NoToggleData                        ; MR_PSYCHICS_HOUSE
	dw SaffronGymToggleData                ; SAFFRON_GYM ; marcelnote - postgame Bruno event, Sabrina rematch
	dw NoToggleData                        ; POKEMON_ACADEMY_1F2F
	dw NoToggleData                        ; POKEMON_ACADEMY_3F4F
	dw SilphCo1FToggleData                 ; SILPH_CO_1F
	dw SilphCo2FToggleData                 ; SILPH_CO_2F
	dw SilphCo3FToggleData                 ; SILPH_CO_3F
	dw SilphCo4FToggleData                 ; SILPH_CO_4F
	dw SilphCo5FToggleData                 ; SILPH_CO_5F
	dw SilphCo6FToggleData                 ; SILPH_CO_6F
	dw SilphCo7FToggleData                 ; SILPH_CO_7F
	dw SilphCo8FToggleData                 ; SILPH_CO_8F
	dw SilphCo9FToggleData                 ; SILPH_CO_9F
	dw SilphCo10FToggleData                ; SILPH_CO_10F
	dw SilphCo11FToggleData                ; SILPH_CO_11F
	dw NoToggleData                        ; SILPH_CO_ELEVATOR
	dw NoToggleData                        ; FUCHSIA_POKECENTER_MART ; marcelnote - merged Fuchsia Pokecenter and Mart
	dw NoToggleData                        ; FUCHSIA_BILLS_GRANDPAS_HOUSE
	dw WardensHouseToggleData              ; WARDENS_HOUSE
	dw NoToggleData                        ; FUCHSIA_MEETING_ROOM
	dw NoToggleData                        ; FUCHSIA_SUPER_ROD_HOUSE
	dw NoToggleData                        ; FUCHSIA_MOVE_DELETER_HOUSE
	dw FuchsiaGymToggleData                ; FUCHSIA_GYM
	dw NoToggleData                        ; SAFARI_ZONE_GATE
	dw SafariZoneEastToggleData            ; SAFARI_ZONE_EAST
	dw SafariZoneNorthToggleData           ; SAFARI_ZONE_NORTH
	dw SafariZoneWestToggleData            ; SAFARI_ZONE_WEST
	dw SafariZoneCenterToggleData          ; SAFARI_ZONE_CENTER
	dw NoToggleData                        ; SAFARI_ZONE_CENTER_REST_HOUSE
	dw NoToggleData                        ; SAFARI_ZONE_SECRET_HOUSE
	dw NoToggleData                        ; SAFARI_ZONE_WEST_REST_HOUSE
	dw NoToggleData                        ; SAFARI_ZONE_EAST_REST_HOUSE
	dw NoToggleData                        ; SAFARI_ZONE_NORTH_REST_HOUSE
	dw NoToggleData                        ; SUMMER_BEACH_HOUSE   ; marcelnote - new location from pokeyellow
	dw SeafoamIslands1FToggleData          ; SEAFOAM_ISLANDS_1F
	dw SeafoamIslandsB1FToggleData         ; SEAFOAM_ISLANDS_B1F
	dw SeafoamIslandsB2FToggleData         ; SEAFOAM_ISLANDS_B2F
	dw SeafoamIslandsB3FToggleData         ; SEAFOAM_ISLANDS_B3F
	dw SeafoamIslandsB4FToggleData         ; SEAFOAM_ISLANDS_B4F
	dw NoToggleData                        ; CINNABAR_POKECENTER_MART
	dw NoToggleData                        ; CINNABAR_LAB         ; marcelnote - merged Cinnabar Lab maps
	dw CinnabarGymToggleData               ; CINNABAR_GYM         ; marcelnote - Blaine rematch
	dw PokemonMansion1FToggleData          ; POKEMON_MANSION_1F
	dw PokemonMansion2FToggleData          ; POKEMON_MANSION_2F
	dw PokemonMansion3FToggleData          ; POKEMON_MANSION_3F
	dw PokemonMansionB1FToggleData         ; POKEMON_MANSION_B1F
	dw CinnabarVolcano1FB1FToggleData      ; CINNABAR_VOLCANO_1FB1F
	dw CinnabarVolcano2FToggleData         ; CINNABAR_VOLCANO_2F
	dw NoToggleData                        ; MANDARIN_POKECENTER_MART
	dw NoToggleData                        ; MANDARIN_SURF_SHOP
	dw MandarinHotelToggleData             ; MANDARIN_HOTEL
	dw MandarinSilphCoToggleData           ; MANDARIN_SILPH_CO
	dw NoToggleData                        ; DR_JABARAS_LAB
	dw MandarinDockToggleData              ; MANDARIN_DOCK
	dw NoToggleData                        ; CITRUS_FERRY_DECK
	dw NoToggleData                        ; CITRUS_FERRY_OUTSIDE
	dw CitrusFerryRoomsToggleData          ; CITRUS_FERRY_ROOMS   ; marcelnote - for fossil
	dw SilphFactory1FToggleData            ; SILPH_FACTORY_1F
	dw SilphFactory2FToggleData            ; SILPH_FACTORY_2F
	dw NoToggleData                        ; ROUTE_22_OLD_ROD_HOUSE
	dw NoToggleData                        ; ROUTE_22_GATE
	dw BattleHallToggleData                ; BATTLE_HALL          ; marcelnote - for battle hall opponent Red/Green
	dw MtSilver1FToggleData                ; MT_SILVER_1F         ; marcelnote - added for items
	dw MtSilver2FToggleData                ; MT_SILVER_2F         ; marcelnote - added for items
	dw MtSilver3FToggleData                ; MT_SILVER_3F         ; marcelnote - added for Yellow battle
	dw VictoryRoad1FToggleData             ; VICTORY_ROAD_1F
	dw VictoryRoad2FToggleData             ; VICTORY_ROAD_2F
	dw VictoryRoad3FToggleData             ; VICTORY_ROAD_3F
	dw IndigoPlateauLobbyToggleData        ; INDIGO_PLATEAU_LOBBY ; marcelnote - added for girl blocking E4 entrance
	dw LoreleisRoomToggleData              ; LORELEIS_ROOM        ; marcelnote - added for Lorelei rematch
	dw BrunosRoomToggleData                ; BRUNOS_ROOM          ; marcelnote - added for Bruno rematch
	dw AgathasRoomToggleData               ; AGATHAS_ROOM         ; marcelnote - added for Agatha rematch
	dw LancesRoomToggleData                ; LANCES_ROOM          ; marcelnote - added for Lance rematch
	dw ChampionsRoomToggleData             ; CHAMPIONS_ROOM
	dw HallOfFameToggleData                ; HALL_OF_FAME         ; marcelnote - added for Rival rematch
	dw NoToggleData                        ; TRADE_CENTER
	dw NoToggleData                        ; COLOSSEUM
	assert_table_length NUM_MAPS
	dw -1 ; end

NoToggleData:
	db -1, -1, -1 ; end

DEF OFF EQU $11
DEF ON  EQU $15


ToggleableObjectStates:
; entries correspond to TOGGLE_* constants (see constants/toggle_constants)
	table_width 3
; format: map id, object id, OFF/ON
; marcelnote - !!!WARNING!!!
; the maps with items to pick up OR overworld map Pokémon to fight
; MUST be in this first list! (basically all constants marked with X in toggle_constants)

PalletTownToggleData:
	db PALLET_TOWN, PALLETTOWN_OAK, OFF
ViridianCityToggleData:
	db VIRIDIAN_CITY, VIRIDIANCITY_OLD_MAN_SLEEPY, ON
	db VIRIDIAN_CITY, VIRIDIANCITY_OLD_MAN,        OFF
PewterCityToggleData:
	db PEWTER_CITY, PEWTERCITY_SUPER_NERD1, ON
	db PEWTER_CITY, PEWTERCITY_YOUNGSTER,   ON
CeruleanCityToggleData:
	db CERULEAN_CITY, CERULEANCITY_RIVAL,       OFF
	db CERULEAN_CITY, CERULEANCITY_ROCKET,      ON
	db CERULEAN_CITY, CERULEANCITY_GUARD1,      OFF
	db CERULEAN_CITY, CERULEANCITY_SUPER_NERD3, ON
	db CERULEAN_CITY, CERULEANCITY_GUARD2,      ON
Route2ToggleData:
	db ROUTE_2, ROUTE2_MOON_STONE, ON
	db ROUTE_2, ROUTE2_HP_UP,      ON
Route4ToggleData:
	db ROUTE_4, ROUTE4_TM_WHIRLWIND, ON
Route9ToggleData:
	db ROUTE_9, ROUTE9_TM_TELEPORT, ON
Route12ToggleData:
	db ROUTE_12, ROUTE12_SNORLAX,    ON
	db ROUTE_12, ROUTE12_TM_PAY_DAY, ON
	db ROUTE_12, ROUTE12_IRON,       ON
Route15ToggleData:
	db ROUTE_15, ROUTE15_TM_RAGE, ON
Route16ToggleData:
	db ROUTE_16, ROUTE16_SNORLAX, ON
Route22ToggleData:
	db ROUTE_22, ROUTE22_RIVAL1, OFF
	db ROUTE_22, ROUTE22_RIVAL2, OFF
Route24ToggleData:
	db ROUTE_24, ROUTE24_COOLTRAINER_M1,  ON
	db ROUTE_24, ROUTE24_TM_THUNDER_WAVE, ON
Route25ToggleData:
	db ROUTE_25, ROUTE25_TM_SEISMIC_TOSS, ON
BluesAidesHousesToggleData: ; marcelnote - merged Blue's house with new Aide's house
	db BLUES_AIDES_HOUSES, BLUESHOUSE_DAISY1,   ON
	db BLUES_AIDES_HOUSES, BLUESHOUSE_DAISY2,   OFF
	db BLUES_AIDES_HOUSES, BLUESHOUSE_TOWN_MAP, ON
OaksLabToggleData:
	db OAKS_LAB, OAKSLAB_RIVAL,                ON
	db OAKS_LAB, OAKSLAB_CHARMANDER_POKE_BALL, ON
	db OAKS_LAB, OAKSLAB_SQUIRTLE_POKE_BALL,   ON
	db OAKS_LAB, OAKSLAB_BULBASAUR_POKE_BALL,  ON
	db OAKS_LAB, OAKSLAB_OAK,                  OFF
	db OAKS_LAB, OAKSLAB_POKEDEX1,             ON
	db OAKS_LAB, OAKSLAB_POKEDEX2,             ON
	db OAKS_LAB, OAKSLAB_OAK_WALKING,          OFF
ViridianGymToggleData:
	db VIRIDIAN_GYM, VIRIDIANGYM_GIOVANNI, ON
	db VIRIDIAN_GYM, VIRIDIANGYM_REVIVE,   ON
PewterMuseumToggleData:
	db PEWTER_MUSEUM, PEWTERMUSEUM1F_OLD_AMBER, ON
CeruleanCave1FToggleData:
	db CERULEAN_CAVE_1F, CERULEANCAVE1F_FULL_RESTORE, ON
	db CERULEAN_CAVE_1F, CERULEANCAVE1F_MAX_ELIXIR,   ON
	db CERULEAN_CAVE_1F, CERULEANCAVE1F_NUGGET,       ON
PokemonTower1FToggleData:
	db POKEMON_TOWER_1F, POKEMONTOWER1F_AGATHA, OFF     ; marcelnote - postgame Agatha
	db POKEMON_TOWER_1F, POKEMONTOWER1F_GENTLEMAN, OFF  ; marcelnote - postgame Agatha
PokemonTower2FToggleData:
	db POKEMON_TOWER_2F, POKEMONTOWER2F_RIVAL, ON
PokemonTower3FToggleData:
	db POKEMON_TOWER_3F, POKEMONTOWER3F_ESCAPE_ROPE, ON
PokemonTower4FToggleData:
	db POKEMON_TOWER_4F, POKEMONTOWER4F_ELIXIR,    ON
	db POKEMON_TOWER_4F, POKEMONTOWER4F_AWAKENING, ON
	db POKEMON_TOWER_4F, POKEMONTOWER4F_HP_UP,     ON
PokemonTower5FToggleData:
	db POKEMON_TOWER_5F, POKEMONTOWER5F_NUGGET, ON
PokemonTower6FToggleData:
	db POKEMON_TOWER_6F, POKEMONTOWER6F_AGATHA, OFF ; marcelnote - postgame Agatha event
	db POKEMON_TOWER_6F, POKEMONTOWER6F_RARE_CANDY, ON
	db POKEMON_TOWER_6F, POKEMONTOWER6F_X_ACCURACY, ON
PokemonTower7FToggleData:
	db POKEMON_TOWER_7F, POKEMONTOWER7F_ROCKET1, ON
	db POKEMON_TOWER_7F, POKEMONTOWER7F_ROCKET2, ON
	db POKEMON_TOWER_7F, POKEMONTOWER7F_ROCKET3, ON
	db POKEMON_TOWER_7F, POKEMONTOWER7F_MR_FUJI, ON
	db POKEMON_TOWER_7F, POKEMONTOWER7F_CHANNELER, OFF ; marcelnote - added 7FChanneler
MrFujisHouseToggleData:
	db MR_FUJIS_HOUSE, MRFUJISHOUSE_MR_FUJI, OFF
CeladonMansionRoofHouseToggleData:
	db CELADON_MANSION_ROOF_HOUSE, CELADONMANSION_ROOF_HOUSE_EEVEE_POKEBALL, ON
GameCornerToggleData:
	db GAME_CORNER, GAMECORNER_ROCKET, ON
WardensHouseToggleData:
	db WARDENS_HOUSE, WARDENSHOUSE_RARE_CANDY, ON
PokemonMansion1FToggleData:
	db POKEMON_MANSION_1F, POKEMONMANSION1F_ESCAPE_ROPE, ON
	db POKEMON_MANSION_1F, POKEMONMANSION1F_CARBOS,      ON
FightingDojoToggleData:
	db FIGHTING_DOJO, FIGHTINGDOJO_BRUNO,                OFF ; marcelnote - postgame Bruno
	db FIGHTING_DOJO, FIGHTINGDOJO_HITMONLEE_POKE_BALL,  ON
	db FIGHTING_DOJO, FIGHTINGDOJO_HITMONCHAN_POKE_BALL, ON
PowerPlantToggleData:
	db POWER_PLANT, POWERPLANT_VOLTORB1,      ON
	db POWER_PLANT, POWERPLANT_VOLTORB2,      ON
	db POWER_PLANT, POWERPLANT_VOLTORB3,      ON
	db POWER_PLANT, POWERPLANT_ELECTRODE1,    ON
	db POWER_PLANT, POWERPLANT_VOLTORB4,      ON
	db POWER_PLANT, POWERPLANT_VOLTORB5,      ON
	db POWER_PLANT, POWERPLANT_ELECTRODE2,    ON
	db POWER_PLANT, POWERPLANT_VOLTORB6,      ON
	db POWER_PLANT, POWERPLANT_ZAPDOS,        ON
	db POWER_PLANT, POWERPLANT_CARBOS,        ON
	db POWER_PLANT, POWERPLANT_HP_UP,         ON
	db POWER_PLANT, POWERPLANT_RARE_CANDY,    ON
	db POWER_PLANT, POWERPLANT_TM_THUNDER,    ON
	db POWER_PLANT, POWERPLANT_TM_REFLECT,    ON
	db POWER_PLANT, POWERPLANT_THUNDER_STONE, ON ; marcelnote - new
VictoryRoad2FToggleData:
;	db VICTORY_ROAD_2F, VICTORYROAD2F_MOLTRES,       ON  ; marcelnote - removed Moltres from Victory Road
	db VICTORY_ROAD_2F, VICTORYROAD2F_TM_SUBMISSION, ON
	db VICTORY_ROAD_2F, VICTORYROAD2F_FULL_HEAL,     ON
	db VICTORY_ROAD_2F, VICTORYROAD2F_TM_MEGA_KICK,  ON
	db VICTORY_ROAD_2F, VICTORYROAD2F_GUARD_SPEC,    ON
	db VICTORY_ROAD_2F, VICTORYROAD2F_BOULDER3,      ON
BillsHouseToggleData:
	db BILLS_HOUSE, BILLSHOUSE_BILL_POKEMON, ON
	db BILLS_HOUSE, BILLSHOUSE_BILL1,        OFF
	db BILLS_HOUSE, BILLSHOUSE_BILL2,        OFF
ViridianForestToggleData:
	db VIRIDIAN_FOREST, VIRIDIANFOREST_ANTIDOTE,  ON
	db VIRIDIAN_FOREST, VIRIDIANFOREST_POTION,    ON
	db VIRIDIAN_FOREST, VIRIDIANFOREST_POKE_BALL, ON
MtMoon1FToggleData:
	db MT_MOON_1F, MTMOON1F_POTION1,      ON
	db MT_MOON_1F, MTMOON1F_MOON_STONE,   ON
	db MT_MOON_1F, MTMOON1F_RARE_CANDY,   ON
	db MT_MOON_1F, MTMOON1F_ESCAPE_ROPE,  ON
	db MT_MOON_1F, MTMOON1F_POTION2,      ON
	db MT_MOON_1F, MTMOON1F_TM_WATER_GUN, ON
MtMoonB2FToggleData:
	db MT_MOON_B2F, MTMOONB2F_DOME_FOSSIL,   ON
	db MT_MOON_B2F, MTMOONB2F_HELIX_FOSSIL,  ON
	db MT_MOON_B2F, MTMOONB2F_HP_UP,         ON
	db MT_MOON_B2F, MTMOONB2F_TM_MEGA_PUNCH, ON
SSAnne2FToggleData:
	db SS_ANNE_2F, SSANNE2F_RIVAL, OFF
SSAnne1FRoomsToggleData:
	db SS_ANNE_1F_ROOMS, SSANNE1FROOMS_TM_BODY_SLAM, ON
SSAnne2FRoomsToggleData:
	db SS_ANNE_2F_ROOMS, SSANNE2FROOMS_MAX_ETHER,  ON
	db SS_ANNE_2F_ROOMS, SSANNE2FROOMS_RARE_CANDY, ON
SSAnneB1FToggleData: ; marcelnote - merged SS Anne B1F and B1FRooms
	db SS_ANNE_B1F, SSANNEB1FROOMS_ETHER,      ON
	db SS_ANNE_B1F, SSANNEB1FROOMS_TM_REST,    ON
	db SS_ANNE_B1F, SSANNEB1FROOMS_MAX_POTION, ON
VictoryRoad3FToggleData:
	db VICTORY_ROAD_3F, VICTORYROAD3F_MAX_REVIVE,   ON
	db VICTORY_ROAD_3F, VICTORYROAD3F_TM_EXPLOSION, ON
	db VICTORY_ROAD_3F, VICTORYROAD3F_BOULDER4,     ON
RocketHideoutB1FToggleData:
	db ROCKET_HIDEOUT_B1F, ROCKETHIDEOUTB1F_ESCAPE_ROPE,  ON
	db ROCKET_HIDEOUT_B1F, ROCKETHIDEOUTB1F_HYPER_POTION, ON
RocketHideoutB2FToggleData:
	db ROCKET_HIDEOUT_B2F, ROCKETHIDEOUTB2F_MOON_STONE,    ON
	db ROCKET_HIDEOUT_B2F, ROCKETHIDEOUTB2F_NUGGET,        ON
	db ROCKET_HIDEOUT_B2F, ROCKETHIDEOUTB2F_TM_HORN_DRILL, ON
	db ROCKET_HIDEOUT_B2F, ROCKETHIDEOUTB2F_SUPER_POTION,  ON
RocketHideoutB3FToggleData:
	db ROCKET_HIDEOUT_B3F, ROCKETHIDEOUTB3F_TM_DOUBLE_EDGE, ON
	db ROCKET_HIDEOUT_B3F, ROCKETHIDEOUTB3F_RARE_CANDY,     ON
RocketHideoutB4FToggleData:
	db ROCKET_HIDEOUT_B4F, ROCKETHIDEOUTB4F_GIOVANNI,      ON
	db ROCKET_HIDEOUT_B4F, ROCKETHIDEOUTB4F_HP_UP,         ON
	db ROCKET_HIDEOUT_B4F, ROCKETHIDEOUTB4F_TM_RAZOR_WIND, ON
	db ROCKET_HIDEOUT_B4F, ROCKETHIDEOUTB4F_IRON,          ON
	db ROCKET_HIDEOUT_B4F, ROCKETHIDEOUTB4F_SILPH_SCOPE,   OFF
	db ROCKET_HIDEOUT_B4F, ROCKETHIDEOUTB4F_LIFT_KEY,      OFF
SilphCo2FToggleData:
;	db SILPH_CO_2F, SILPHCO2F_SILPH_WORKER_F, ON ; marcelnote - not used (TM_SELFDESTRUCT woman)
	db SILPH_CO_2F, SILPHCO2F_SCIENTIST1,     ON
	db SILPH_CO_2F, SILPHCO2F_SCIENTIST2,     ON
	db SILPH_CO_2F, SILPHCO2F_ROCKET1,        ON
	db SILPH_CO_2F, SILPHCO2F_ROCKET2,        ON
SilphCo3FToggleData:
	db SILPH_CO_3F, SILPHCO3F_ROCKET,       ON
	db SILPH_CO_3F, SILPHCO3F_SCIENTIST,    ON
	db SILPH_CO_3F, SILPHCO3F_HYPER_POTION, ON
SilphCo4FToggleData:
	db SILPH_CO_4F, SILPHCO4F_ROCKET1,     ON
	db SILPH_CO_4F, SILPHCO4F_SCIENTIST,   ON
	db SILPH_CO_4F, SILPHCO4F_ROCKET2,     ON
	db SILPH_CO_4F, SILPHCO4F_FULL_HEAL,   ON
	db SILPH_CO_4F, SILPHCO4F_MAX_REVIVE,  ON
	db SILPH_CO_4F, SILPHCO4F_ESCAPE_ROPE, ON
SilphCo5FToggleData:
	db SILPH_CO_5F, SILPHCO5F_ROCKET1,      ON
	db SILPH_CO_5F, SILPHCO5F_SCIENTIST,    ON
	db SILPH_CO_5F, SILPHCO5F_ROCKER,       ON
	db SILPH_CO_5F, SILPHCO5F_ROCKET2,      ON
	db SILPH_CO_5F, SILPHCO5F_TM_TAKE_DOWN, ON
	db SILPH_CO_5F, SILPHCO5F_PROTEIN,      ON
	db SILPH_CO_5F, SILPHCO5F_CARD_KEY,     ON
SilphCo6FToggleData:
	db SILPH_CO_6F, SILPHCO6F_ROCKET1,    ON
	db SILPH_CO_6F, SILPHCO6F_SCIENTIST,  ON
	db SILPH_CO_6F, SILPHCO6F_ROCKET2,    ON
	db SILPH_CO_6F, SILPHCO6F_HP_UP,      ON
	db SILPH_CO_6F, SILPHCO6F_X_ACCURACY, ON
SilphCo7FToggleData:
	db SILPH_CO_7F, SILPHCO7F_ROCKET1,         ON
	db SILPH_CO_7F, SILPHCO7F_SCIENTIST,       ON
	db SILPH_CO_7F, SILPHCO7F_ROCKET2,         ON
	db SILPH_CO_7F, SILPHCO7F_ROCKET3,         ON
	db SILPH_CO_7F, SILPHCO7F_RIVAL,           ON
	db SILPH_CO_7F, SILPHCO7F_CALCIUM,         ON
	db SILPH_CO_7F, SILPHCO7F_TM_SWORDS_DANCE, ON
;	db SILPH_CO_7F, SILPHCO7F_UNUSED,          ON ; marcelnote - removed
SilphCo8FToggleData:
	db SILPH_CO_8F, SILPHCO8F_ROCKET1,   ON
	db SILPH_CO_8F, SILPHCO8F_SCIENTIST, ON
	db SILPH_CO_8F, SILPHCO8F_ROCKET2,   ON
SilphCo9FToggleData:
	db SILPH_CO_9F, SILPHCO9F_ROCKET1,   ON
	db SILPH_CO_9F, SILPHCO9F_SCIENTIST, ON
	db SILPH_CO_9F, SILPHCO9F_ROCKET2,   ON
SilphCo10FToggleData:
	db SILPH_CO_10F, SILPHCO10F_ROCKET,         ON
	db SILPH_CO_10F, SILPHCO10F_SCIENTIST,      ON
;	db SILPH_CO_10F, SILPHCO10F_SILPH_WORKER_F, ON ; marcelnote - removed
	db SILPH_CO_10F, SILPHCO10F_TM_EARTHQUAKE,  ON
	db SILPH_CO_10F, SILPHCO10F_RARE_CANDY,     ON
	db SILPH_CO_10F, SILPHCO10F_CARBOS,         ON
SilphCo11FToggleData:
	db SILPH_CO_11F, SILPHCO11F_GIOVANNI, ON
	db SILPH_CO_11F, SILPHCO11F_ROCKET1,  ON
	db SILPH_CO_11F, SILPHCO11F_ROCKET2,  ON
;UnusedMapF4ToggleData:
;	db UNUSED_MAP_F4, $02, ON ; unused ; marcelnote - removed
PokemonMansion2FToggleData:
	db POKEMON_MANSION_2F, POKEMONMANSION2F_CALCIUM, ON
PokemonMansion3FToggleData:
	db POKEMON_MANSION_3F, POKEMONMANSION3F_MAX_POTION, ON
	db POKEMON_MANSION_3F, POKEMONMANSION3F_IRON,       ON
PokemonMansionB1FToggleData:
	db POKEMON_MANSION_B1F, POKEMONMANSIONB1F_RARE_CANDY,   ON
	db POKEMON_MANSION_B1F, POKEMONMANSIONB1F_FULL_RESTORE, ON
	db POKEMON_MANSION_B1F, POKEMONMANSIONB1F_TM_BLIZZARD,  ON
	db POKEMON_MANSION_B1F, POKEMONMANSIONB1F_TM_SOLARBEAM, ON
	db POKEMON_MANSION_B1F, POKEMONMANSIONB1F_SECRET_KEY,   ON
	db POKEMON_MANSION_B1F, POKEMONMANSIONB1F_FUJIS_NOTES,  ON ; marcelnote - new
	db POKEMON_MANSION_B1F, POKEMONMANSIONB1F_HP_UP,        ON ; marcelnote - new
SafariZoneEastToggleData:
	db SAFARI_ZONE_EAST, SAFARIZONEEAST_FULL_RESTORE, ON
	db SAFARI_ZONE_EAST, SAFARIZONEEAST_MAX_RESTORE,  ON
	db SAFARI_ZONE_EAST, SAFARIZONEEAST_CARBOS,       ON
	db SAFARI_ZONE_EAST, SAFARIZONEEAST_TM_EGG_BOMB,  ON
SafariZoneNorthToggleData:
	db SAFARI_ZONE_NORTH, SAFARIZONENORTH_PROTEIN,       ON
	db SAFARI_ZONE_NORTH, SAFARIZONENORTH_TM_SKULL_BASH, ON
SafariZoneWestToggleData:
	db SAFARI_ZONE_WEST, SAFARIZONEWEST_MAX_POTION,     ON
	db SAFARI_ZONE_WEST, SAFARIZONEWEST_TM_DOUBLE_TEAM, ON
	db SAFARI_ZONE_WEST, SAFARIZONEWEST_MAX_REVIVE,     ON
	db SAFARI_ZONE_WEST, SAFARIZONEWEST_GOLD_TEETH,     ON
SafariZoneCenterToggleData:
	db SAFARI_ZONE_CENTER, SAFARIZONECENTER_NUGGET, ON
CeruleanCave2FToggleData:
	db CERULEAN_CAVE_2F, CERULEANCAVE2F_PP_UP,        ON
	db CERULEAN_CAVE_2F, CERULEANCAVE2F_ULTRA_BALL,   ON
	db CERULEAN_CAVE_2F, CERULEANCAVE2F_FULL_RESTORE, ON
CeruleanCaveB1FToggleData:
	db CERULEAN_CAVE_B1F, CERULEANCAVEB1F_MEWTWO,     ON
	db CERULEAN_CAVE_B1F, CERULEANCAVEB1F_ULTRA_BALL, ON
	db CERULEAN_CAVE_B1F, CERULEANCAVEB1F_MAX_REVIVE, ON
VictoryRoad1FToggleData:
	db VICTORY_ROAD_1F, VICTORYROAD1F_TM_SKY_ATTACK, ON
	db VICTORY_ROAD_1F, VICTORYROAD1F_RARE_CANDY,    ON
SeafoamIslands1FToggleData:
	db SEAFOAM_ISLANDS_1F, SEAFOAMISLANDS1F_BOULDER1, ON
	db SEAFOAM_ISLANDS_1F, SEAFOAMISLANDS1F_BOULDER2, ON
SeafoamIslandsB1FToggleData:
	db SEAFOAM_ISLANDS_B1F, SEAFOAMISLANDSB1F_BOULDER1, OFF
	db SEAFOAM_ISLANDS_B1F, SEAFOAMISLANDSB1F_BOULDER2, OFF
SeafoamIslandsB2FToggleData:
	db SEAFOAM_ISLANDS_B2F, SEAFOAMISLANDSB2F_WATER_STONE, ON ; marcelnote - new
	db SEAFOAM_ISLANDS_B2F, SEAFOAMISLANDSB2F_BOULDER1, OFF
	db SEAFOAM_ISLANDS_B2F, SEAFOAMISLANDSB2F_BOULDER2, OFF
SeafoamIslandsB3FToggleData:
	db SEAFOAM_ISLANDS_B3F, SEAFOAMISLANDSB3F_BOULDER2, ON
	db SEAFOAM_ISLANDS_B3F, SEAFOAMISLANDSB3F_BOULDER3, ON
	db SEAFOAM_ISLANDS_B3F, SEAFOAMISLANDSB3F_BOULDER5, OFF
	db SEAFOAM_ISLANDS_B3F, SEAFOAMISLANDSB3F_BOULDER6, OFF
SeafoamIslandsB4FToggleData:
	db SEAFOAM_ISLANDS_B4F, SEAFOAMISLANDSB4F_BOULDER1, OFF
	db SEAFOAM_ISLANDS_B4F, SEAFOAMISLANDSB4F_BOULDER2, OFF
	db SEAFOAM_ISLANDS_B4F, SEAFOAMISLANDSB4F_ARTICUNO, ON
; marcelnote - new maps
MtMoonSquareToggleData:
	db MT_MOON_SQUARE, MTMOONSQUARE_CLEFAIRY, OFF
	db MT_MOON_SQUARE, MTMOONSQUARE_MOON_STONE, OFF
	db MT_MOON_SQUARE, MTMOONSQUARE_SUPER_POTION, ON
CinnabarVolcano1FB1FToggleData:
	db CINNABAR_VOLCANO_1FB1F, CINNABARVOLCANOB1F_CHARIZARD, OFF
	db CINNABAR_VOLCANO_1FB1F, CINNABARVOLCANOB1F_LANCE, OFF
	db CINNABAR_VOLCANO_1FB1F, CINNABARVOLCANOB1F_IRON, ON
	db CINNABAR_VOLCANO_1FB1F, CINNABARVOLCANOB1F_ICE_HEAL, ON
	db CINNABAR_VOLCANO_1FB1F, CINNABARVOLCANO1F_LANCE, OFF
	db CINNABAR_VOLCANO_1FB1F, CINNABARVOLCANO1F_FULL_RESTORE, ON
CinnabarVolcano2FToggleData:
	db CINNABAR_VOLCANO_2F, CINNABARVOLCANO2F_MOLTRES, ON
	db CINNABAR_VOLCANO_2F, CINNABARVOLCANO2F_FIRE_STONE, ON
	db CINNABAR_VOLCANO_2F, CINNABARVOLCANO2F_ULTRA_BALL, ON
	db CINNABAR_VOLCANO_2F, CINNABARVOLCANO2F_NUGGET, ON
MandarinHotelToggleData:
	db MANDARIN_HOTEL, MANDARINHOTEL2F_MAX_ELIXIR, ON
CeladonGroveToggleData:
	db CELADON_GROVE, CELADONGROVE_MEW, OFF
	db CELADON_GROVE, CELADONGROVE_LEAF_STONE, ON
	db CELADON_GROVE, CELADONGROVE_GREAT_BALL, ON
SilphFactory1FToggleData:
	db SILPH_FACTORY_1F, SILPHFACTORY1F_ROCKET1, ON
	db SILPH_FACTORY_1F, SILPHFACTORY1F_ROCKET2, ON
	db SILPH_FACTORY_1F, SILPHFACTORY1F_ROCKET3, ON
	db SILPH_FACTORY_1F, SILPHFACTORY1F_ROCKET4, ON
	db SILPH_FACTORY_1F, SILPHFACTORY1F_RARE_CANDY, ON
	db SILPH_FACTORY_1F, SILPHFACTORY1F_CARBOS, ON
MtSilver1FToggleData:
	db MT_SILVER_1F, MTSILVER1F_PROTEIN, ON
	db MT_SILVER_1F, MTSILVER1F_ESCAPE_ROPE, ON
	db MT_SILVER_1F, MTSILVER1F_ULTRA_BALL, ON
	db MT_SILVER_1F, MTSILVER1F_MAX_ELIXIR, ON
MtSilver2FToggleData:
	db MT_SILVER_2F, MTSILVER2F_PP_UP, ON
	db MT_SILVER_2F, MTSILVER2F_CALCIUM, ON
	db MT_SILVER_2F, MTSILVER2F_ULTRA_BALL, ON
	db MT_SILVER_2F, MTSILVER2F_MAX_REVIVE, ON
	db MT_SILVER_2F, MTSILVER2F_FULL_RESTORE, ON
	assert_table_length NUM_TOGGLEABLE_OBJECTS
	db -1, 1, ON ; end



; marcelnote - the list continues here to allow for more than 256 toggleable objects
;              WARNING: this list cannot contain maps with objects to pick up!
ToggleableObjectStatesCont:
; entries correspond to TOGGLE_* constants (see constants/toggleable_constants)
	table_width 3
; format: map id, object id, OFF/ON

RedsYellowsHousesToggleData:
	db REDS_YELLOWS_HOUSES, YELLOWSHOUSE1F_DAD1, ON     ; marcelnote - Dad unpacking
	db REDS_YELLOWS_HOUSES, YELLOWSHOUSE1F_DAD2, OFF    ; marcelnote - Dad sitting
	db REDS_YELLOWS_HOUSES, YELLOWSHOUSE2F_ASLEEP, ON   ; marcelnote - Yellow asleep
	db REDS_YELLOWS_HOUSES, YELLOWSHOUSE2F_YELLOW, OFF  ; marcelnote - Yellow
Route1ToggleData:
	db ROUTE_1, ROUTE1_OAK, OFF  ; marcelnote - postgame Oak battle
PewterGymToggleData:
	db PEWTER_GYM, PEWTERGYM_BROCK, ON           ; marcelnote - default Brock
	db PEWTER_GYM, PEWTERGYM_BROCK_REMATCH, OFF  ; marcelnote - rematch Brock
CeruleanGymToggleData:
	db CERULEAN_GYM, CERULEANGYM_MISTY, ON           ; marcelnote - default Misty
	db CERULEAN_GYM, CERULEANGYM_MISTY_REMATCH, OFF  ; marcelnote - rematch Misty
VermilionCityToggleData:
	db VERMILION_CITY, VERMILIONCITY_SAILOR2, ON           ; marcelnote - SS Anne sailor who disappears
	db VERMILION_CITY, VERMILIONCITY_COOLTRAINER_F, OFF    ; marcelnote - girl who mentions Mandarin
VermilionGymToggleData:
	db VERMILION_GYM, VERMILIONGYM_LT_SURGE, ON           ; marcelnote - default Lt.Surge
	db VERMILION_GYM, VERMILIONGYM_LT_SURGE_REMATCH, OFF  ; marcelnote - rematch Lt.Surge
VermilionDockToggleData:
	db VERMILION_DOCK, VERMILIONDOCK_SAILOR, ON          ; marcelnote - sailor at Ferry entrance
CeladonGymToggleData:
	db CELADON_GYM, CELADONGYM_ERIKA, ON           ; marcelnote - default Erika
	db CELADON_GYM, CELADONGYM_ERIKA_REMATCH, OFF  ; marcelnote - rematch Erika
CeladonGroveSouthGateToggleData:
	db CELADON_GROVE_SOUTH_GATE, CELADONGROVESOUTHGATE_ROCKET, ON  ; marcelnote - blocking the way
FuchsiaGymToggleData:
	db FUCHSIA_GYM, FUCHSIAGYM_KOGA, ON           ; marcelnote - default Koga
	db FUCHSIA_GYM, FUCHSIAGYM_KOGA_REMATCH, OFF  ; marcelnote - rematch Koga
SaffronCityToggleData: ; marcelnote - moved from previous list
	db SAFFRON_CITY, SAFFRONCITY_ROCKET1,        ON
	db SAFFRON_CITY, SAFFRONCITY_ROCKET2,        ON
	db SAFFRON_CITY, SAFFRONCITY_ROCKET3,        ON
	db SAFFRON_CITY, SAFFRONCITY_ROCKET4,        ON
	db SAFFRON_CITY, SAFFRONCITY_ROCKET5,        ON
	db SAFFRON_CITY, SAFFRONCITY_ROCKET6,        ON
	db SAFFRON_CITY, SAFFRONCITY_ROCKET7,        ON
	db SAFFRON_CITY, SAFFRONCITY_SCIENTIST,      OFF
	db SAFFRON_CITY, SAFFRONCITY_SILPH_WORKER_M, OFF
	db SAFFRON_CITY, SAFFRONCITY_SILPH_WORKER_F, OFF
	db SAFFRON_CITY, SAFFRONCITY_GENTLEMAN,      OFF
	db SAFFRON_CITY, SAFFRONCITY_PIDGEOT,        OFF
	db SAFFRON_CITY, SAFFRONCITY_ROCKER,         OFF
	db SAFFRON_CITY, SAFFRONCITY_ROCKET8,        ON  ; Silph Co guard
	db SAFFRON_CITY, SAFFRONCITY_ROCKET9,        OFF ; Silph Co guard asleep
SaffronGymToggleData:
	db SAFFRON_GYM, SAFFRONGYM_SABRINA, ON           ; marcelnote - default Sabrina
	db SAFFRON_GYM, SAFFRONGYM_SABRINA_REMATCH, OFF  ; marcelnote - rematch Sabrina
	db SAFFRON_GYM, SAFFRONGYM_WILL, OFF             ; marcelnote - postgame Bruno event
	db SAFFRON_GYM, SAFFRONGYM_BRUNO, OFF            ; marcelnote - postgame Bruno event
SilphCo1FToggleData:
	db SILPH_CO_1F, SILPHCO1F_LINK_RECEPTIONIST, OFF
CinnabarGymToggleData:
	db CINNABAR_GYM, CINNABARGYM_BLAINE, ON           ; marcelnote - default Blaine
	db CINNABAR_GYM, CINNABARGYM_BLAINE_REMATCH, OFF  ; marcelnote - rematch Blaine
MandarinSilphCoToggleData:
	db MANDARIN_SILPH_CO, MANDARINSILPHCO_SCIENTIST, ON  ; marcelnote - worried Scientist
MandarinDockToggleData:
	db MANDARIN_DOCK, MANDARINDOCK_SAILOR, ON           ; marcelnote - sailor at Ferry entrance
CitrusFerryRoomsToggleData:
	db CITRUS_FERRY_ROOMS, CITRUSFERRYROOMS_FOSSIL, ON ; marcelnote - sailor at Ferry entrance
SilphFactory2FToggleData:
	db SILPH_FACTORY_2F, SILPHFACTORY2F_SCIENTIST1, ON   ; marcelnote - scientist blocking the way
	db SILPH_FACTORY_2F, SILPHFACTORY2F_LORELEI1, OFF    ; marcelnote - Lorelei at entrance
	db SILPH_FACTORY_2F, SILPHFACTORY2F_ROCKET1, ON      ; marcelnote - Archer
	db SILPH_FACTORY_2F, SILPHFACTORY2F_LORELEI2, OFF    ; marcelnote - Lorelei after beating Archer
BattleHallToggleData:
	db BATTLE_HALL, BATTLEHALL_RED, OFF    ; marcelnote - battle hall Red
	db BATTLE_HALL, BATTLEHALL_GREEN, OFF  ; marcelnote - battle hall Green
IndigoPlateauLobbyToggleData:
	db INDIGO_PLATEAU_LOBBY, INDIGOPLATEAULOBBY_COOLTRAINER_F, ON
	db INDIGO_PLATEAU_LOBBY, INDIGOPLATEAULOBBY_COOLTRAINER_F2, OFF
	db INDIGO_PLATEAU_LOBBY, INDIGOPLATEAULOBBY_RIVAL, OFF ; marcelnote - appears after E4 reopens
LoreleisRoomToggleData:
	db LORELEIS_ROOM, LORELEISROOM_LORELEI, ON
	db LORELEIS_ROOM, LORELEISROOM_LORELEI_REMATCH, OFF
BrunosRoomToggleData:
	db BRUNOS_ROOM, BRUNOSROOM_BRUNO, ON
	db BRUNOS_ROOM, BRUNOSROOM_BRUNO_REMATCH, OFF
AgathasRoomToggleData:
	db AGATHAS_ROOM, AGATHASROOM_AGATHA, ON
	db AGATHAS_ROOM, AGATHASROOM_AGATHA_REMATCH, OFF
LancesRoomToggleData:
	db LANCES_ROOM, LANCESROOM_LANCE, ON
	db LANCES_ROOM, LANCESROOM_LANCE_REMATCH, OFF
ChampionsRoomToggleData:
	db CHAMPIONS_ROOM, CHAMPIONSROOM_OAK, OFF
	db CHAMPIONS_ROOM, CHAMPIONSROOM_RIVAL, ON ; marcelnote - added for Rival rematch
HallOfFameToggleData:
	db HALL_OF_FAME, HALLOFFAME_OAK, ON
	db HALL_OF_FAME, HALLOFFAME_RIVAL, OFF
MtSilver3FToggleData:
	db MT_SILVER_3F, MTSILVER3F_YELLOW, ON ; marcelnote - Yellow battle
	assert_table_length NUM_TOGGLEABLE_OBJECTS_CONT
	db -1, 1, ON ; end
