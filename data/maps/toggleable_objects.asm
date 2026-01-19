; toggleable objects for each map

ToggleableObjectMapPointers:
; entries correspond to map ids
	table_width 2
	dw PalletTownHS    ; PALLET_TOWN
	dw ViridianCityHS  ; VIRIDIAN_CITY
	dw PewterCityHS    ; PEWTER_CITY
	dw CeruleanCityHS  ; CERULEAN_CITY
	dw NoHS            ; LAVENDER_TOWN
	dw VermilionCityHS ; VERMILION_CITY ; marcelnote - new for Sailor who disappears
	dw NoHS            ; CELADON_CITY
	dw SaffronCityHS   ; SAFFRON_CITY
	dw NoHS            ; FUCHSIA_CITY
	dw NoHS            ; CINNABAR_ISLAND
	dw NoHS            ; MANDARIN_ISLAND ; marcelnote - new map
	dw NoHS            ; INDIGO_PLATEAU
	dw Route1HS        ; ROUTE_1 ; marcelnote - added for postgame Oak battle
	dw Route2HS        ; ROUTE_2
	dw NoHS            ; ROUTE_3
	dw Route4HS        ; ROUTE_4
	dw NoHS            ; ROUTE_5
	dw NoHS            ; ROUTE_6
	dw NoHS            ; ROUTE_7
	dw NoHS            ; ROUTE_8
	dw Route9HS        ; ROUTE_9
	dw NoHS            ; ROUTE_10
	dw NoHS            ; ROUTE_11
	dw Route12HS       ; ROUTE_12
	dw NoHS            ; ROUTE_13
	dw NoHS            ; ROUTE_14
	dw Route15HS       ; ROUTE_15
	dw Route16HS       ; ROUTE_16
	dw NoHS            ; ROUTE_17
	dw NoHS            ; ROUTE_18
	dw NoHS            ; ROUTE_19
	dw NoHS            ; ROUTE_20
	dw NoHS            ; ROUTE_21
	dw Route22HS       ; ROUTE_22
	dw NoHS            ; ROUTE_23
	dw Route24HS       ; ROUTE_24
	dw Route25HS       ; ROUTE_25
	dw NoHS            ; ROUTE_28 ; marcelnote - new location
	dw NoHS            ; ORANGE_ROUTE_1 ; marcelnote - new location
	dw RedsYellowsHousesHS         ; REDS_YELLOWS_HOUSES ; marcelnote - added to hide Yellow asleep
	dw BluesAidesHousesHS          ; BLUES_AIDES_HOUSES  ; marcelnote - merged Blue's house with new Aide's house
	dw OaksLabHS                   ; OAKS_LAB
	dw NoHS                        ; VIRIDIAN_POKECENTER_MART ; marcelnote - merged Viridian Pokecenter and Mart
	dw NoHS                        ; VIRIDIAN_SCHOOL_HOUSE
	dw NoHS                        ; VIRIDIAN_NICKNAME_HOUSE
	dw ViridianGymHS               ; VIRIDIAN_GYM
	dw NoHS                        ; VIRIDIAN_FOREST_SOUTH_GATE
	dw NoHS                        ; ROUTE_2_GATE
	dw ViridianForestHS            ; VIRIDIAN_FOREST
	dw NoHS                        ; VIRIDIAN_FOREST_NORTH_GATE
	dw NoHS                        ; ROUTE_2_TRADE_HOUSE
	dw NoHS                        ; DIGLETTS_CAVE_ROUTE_2
	dw NoHS                        ; PEWTER_POKECENTER_MART ; marcelnote - merged Pewter Pokecenter and Mart
	dw PewterMuseumHS              ; PEWTER_MUSEUM ; marcelnote - merged Pewter Museum floors
	dw NoHS                        ; PEWTER_NIDORAN_HOUSE
	dw NoHS                        ; PEWTER_SPEECH_HOUSE
	dw PewterGymHS                 ; PEWTER_GYM              ; marcelnote - Brock rematch
	dw NoHS                        ; CELADON_GROVE_NORTH_GATE
	dw NoHS                        ; MT_MOON_POKECENTER
	dw MtMoon1FHS                  ; MT_MOON_1F
	dw NoHS                        ; MT_MOON_B1F
	dw MtMoonB2FHS                 ; MT_MOON_B2F
	dw MtMoonSquareHS              ; MT_MOON_SQUARE          ; marcelnote - new location
	dw NoHS                        ; CERULEAN_POKECENTER_MART  ; marcelnote - merged Cerulean Pokecenter and Mart
	dw NoHS                        ; CERULEAN_TRASHED_HOUSE
	dw NoHS                        ; CERULEAN_TRADE_HOUSE
	dw NoHS                        ; CERULEAN_BADGE_HOUSE
	dw NoHS                        ; BIKE_SHOP
	dw CeruleanGymHS               ; CERULEAN_GYM            ; marcelnote - Misty rematch
	dw CeruleanCave1FHS            ; CERULEAN_CAVE_1F
	dw CeruleanCave2FHS            ; CERULEAN_CAVE_2F
	dw CeruleanCaveB1FHS           ; CERULEAN_CAVE_B1F
	dw BillsHouseHS                ; BILLS_HOUSE
	dw NoHS                        ; ROUTE_5_GATE
	dw NoHS                        ; UNDERGROUND_PATH_ROUTE_5
	dw NoHS                        ; DAYCARE
	dw NoHS                        ; ROUTE_6_GATE
	dw NoHS                        ; UNDERGROUND_PATH_ROUTE_6
	dw NoHS                        ; ROUTE_7_GATE
	dw NoHS                        ; UNDERGROUND_PATH_ROUTE_7
	dw NoHS                        ; ROUTE_8_GATE
	dw NoHS                        ; UNDERGROUND_PATH_ROUTE_8
	dw NoHS                        ; UNDERGROUND_PATH_NORTH_SOUTH
	dw NoHS                        ; UNDERGROUND_PATH_WEST_EAST
	dw NoHS                        ; VERMILION_POKECENTER_MART ; marcelnote - merged Vermilion Pokecenter and Mart
	dw NoHS                        ; VERMILION_GOOD_ROD_HOUSE
	dw NoHS                        ; POKEMON_FAN_CLUB
	dw NoHS                        ; VERMILION_PIDGEY_HOUSE
	dw NoHS                        ; VERMILION_TRADE_HOUSE
	dw VermilionGymHS              ; VERMILION_GYM ; marcelnote - Lt.Surge rematch
	dw VermilionDockHS             ; VERMILION_DOCK ; marcelnote - new for Ferry entrance
	dw NoHS                        ; SS_ANNE_1F
	dw SSAnne2FHS                  ; SS_ANNE_2F
	dw NoHS                        ; SS_ANNE_3F
	dw SSAnneB1FHS                 ; SS_ANNE_B1F ; marcelnote - merged SS Anne B1F and B1FRooms
	dw NoHS                        ; SS_ANNE_BOW
	dw NoHS                        ; SS_ANNE_KITCHEN
	dw NoHS                        ; SS_ANNE_CAPTAINS_ROOM
	dw SSAnne1FRoomsHS             ; SS_ANNE_1F_ROOMS
	dw SSAnne2FRoomsHS             ; SS_ANNE_2F_ROOMS
	dw NoHS                        ; DIGLETTS_CAVE
	dw NoHS                        ; DIGLETTS_CAVE_ROUTE_11
	dw NoHS                        ; ROUTE_11_GATE
	dw NoHS                        ; ROCK_TUNNEL_POKECENTER
	dw NoHS                        ; ROCK_TUNNEL_1F
	dw NoHS                        ; ROCK_TUNNEL_B1F
	dw PowerPlantHS                ; POWER_PLANT
	dw NoHS                        ; LAVENDER_POKECENTER_MART
	dw MrFujisHouseHS              ; MR_FUJIS_HOUSE
	dw NoHS                        ; NAME_RATERS_HOUSE
	dw NoHS                        ; LAVENDER_CUBONE_HOUSE
	dw PokemonTower1FHS            ; POKEMON_TOWER_1F ;marcelnote - postgame Agatha event
	dw PokemonTower2FHS            ; POKEMON_TOWER_2F
	dw PokemonTower3FHS            ; POKEMON_TOWER_3F
	dw PokemonTower4FHS            ; POKEMON_TOWER_4F
	dw PokemonTower5FHS            ; POKEMON_TOWER_5F
	dw PokemonTower6FHS            ; POKEMON_TOWER_6F
	dw PokemonTower7FHS            ; POKEMON_TOWER_7F
	dw NoHS                        ; ROUTE_12_GATE
	dw NoHS                        ; ROUTE_12_FISHING_GUIDE_HOUSE
	dw NoHS                        ; CELADON_POKECENTER
	dw NoHS                        ; CELADON_MART_1F2F3F
	dw NoHS                        ; CELADON_MART_4F5F6F
	dw NoHS                        ; CELADON_MART_ROOF
	dw NoHS                        ; CELADON_MART_ELEVATOR
	dw NoHS                        ; CELADON_MANSION
	dw NoHS                        ; CELADON_MANSION_ROOF
	dw CeladonMansionRoofHouseHS   ; CELADON_MANSION_ROOF_HOUSE
	dw GameCornerHS                ; GAME_CORNER
	dw NoHS                        ; GAME_CORNER_PRIZE_ROOM
	dw NoHS                        ; CELADON_DINER
	dw NoHS                        ; CELADON_CHIEF_HOUSE
	dw NoHS                        ; CELADON_HOTEL
	dw CeladonGroveSouthGateHS     ; CELADON_GROVE_SOUTH_GATE ; marcelnote - was NoHS
	dw CeladonGymHS                ; CELADON_GYM              ; marcelnote - Erika rematch
	dw RocketHideoutB1FHS          ; ROCKET_HIDEOUT_B1F
	dw RocketHideoutB2FHS          ; ROCKET_HIDEOUT_B2F
	dw RocketHideoutB3FHS          ; ROCKET_HIDEOUT_B3F
	dw RocketHideoutB4FHS          ; ROCKET_HIDEOUT_B4F
	dw NoHS                        ; ROCKET_HIDEOUT_ELEVATOR
	dw CeladonGroveHS              ; CELADON_GROVE            ; marcelnote - was NoHS
	dw NoHS                        ; ROUTE_15_GATE
	dw NoHS                        ; ROUTE_16_GATE
	dw NoHS                        ; ROUTE_16_FLY_HOUSE
	dw NoHS                        ; ROUTE_18_GATE
	dw NoHS                        ; SAFFRON_POKECENTER_MART ; marcelnote - merged Saffron Pokecenter and Mart
	dw NoHS                        ; COPYCATS_HOUSE ; marcelnote - merged Copycat's house floors
	dw FightingDojoHS              ; FIGHTING_DOJO
	dw NoHS                        ; SAFFRON_PIDGEY_HOUSE
	dw NoHS                        ; MR_PSYCHICS_HOUSE
	dw SaffronGymHS                ; SAFFRON_GYM ; marcelnote - postgame Bruno event, Sabrina rematch
	dw NoHS                        ; POKEMON_ACADEMY_1F2F
	dw NoHS                        ; POKEMON_ACADEMY_3F4F
	dw SilphCo1FHS                 ; SILPH_CO_1F
	dw SilphCo2FHS                 ; SILPH_CO_2F
	dw SilphCo3FHS                 ; SILPH_CO_3F
	dw SilphCo4FHS                 ; SILPH_CO_4F
	dw SilphCo5FHS                 ; SILPH_CO_5F
	dw SilphCo6FHS                 ; SILPH_CO_6F
	dw SilphCo7FHS                 ; SILPH_CO_7F
	dw SilphCo8FHS                 ; SILPH_CO_8F
	dw SilphCo9FHS                 ; SILPH_CO_9F
	dw SilphCo10FHS                ; SILPH_CO_10F
	dw SilphCo11FHS                ; SILPH_CO_11F
	dw NoHS                        ; SILPH_CO_ELEVATOR
	dw NoHS                        ; FUCHSIA_POKECENTER_MART ; marcelnote - merged Fuchsia Pokecenter and Mart
	dw NoHS                        ; FUCHSIA_BILLS_GRANDPAS_HOUSE
	dw WardensHouseHS              ; WARDENS_HOUSE
	dw NoHS                        ; FUCHSIA_MEETING_ROOM
	dw NoHS                        ; FUCHSIA_SUPER_ROD_HOUSE
	dw NoHS                        ; FUCHSIA_MOVE_DELETER_HOUSE
	dw FuchsiaGymHS                ; FUCHSIA_GYM
	dw NoHS                        ; SAFARI_ZONE_GATE
	dw SafariZoneEastHS            ; SAFARI_ZONE_EAST
	dw SafariZoneNorthHS           ; SAFARI_ZONE_NORTH
	dw SafariZoneWestHS            ; SAFARI_ZONE_WEST
	dw SafariZoneCenterHS          ; SAFARI_ZONE_CENTER
	dw NoHS                        ; SAFARI_ZONE_CENTER_REST_HOUSE
	dw NoHS                        ; SAFARI_ZONE_SECRET_HOUSE
	dw NoHS                        ; SAFARI_ZONE_WEST_REST_HOUSE
	dw NoHS                        ; SAFARI_ZONE_EAST_REST_HOUSE
	dw NoHS                        ; SAFARI_ZONE_NORTH_REST_HOUSE
	dw NoHS                        ; SUMMER_BEACH_HOUSE   ; marcelnote - new location from pokeyellow
	dw SeafoamIslands1FHS          ; SEAFOAM_ISLANDS_1F
	dw SeafoamIslandsB1FHS         ; SEAFOAM_ISLANDS_B1F
	dw SeafoamIslandsB2FHS         ; SEAFOAM_ISLANDS_B2F
	dw SeafoamIslandsB3FHS         ; SEAFOAM_ISLANDS_B3F
	dw SeafoamIslandsB4FHS         ; SEAFOAM_ISLANDS_B4F
	dw NoHS                        ; CINNABAR_POKECENTER_MART
	dw NoHS                        ; CINNABAR_LAB         ; marcelnote - merged Cinnabar Lab maps
	dw CinnabarGymHS               ; CINNABAR_GYM         ; marcelnote - Blaine rematch
	dw PokemonMansion1FHS          ; POKEMON_MANSION_1F
	dw PokemonMansion2FHS          ; POKEMON_MANSION_2F
	dw PokemonMansion3FHS          ; POKEMON_MANSION_3F
	dw PokemonMansionB1FHS         ; POKEMON_MANSION_B1F
	dw CinnabarVolcano1FB1FHS      ; CINNABAR_VOLCANO_1FB1F
	dw CinnabarVolcano2FHS         ; CINNABAR_VOLCANO_2F
	dw NoHS                        ; MANDARIN_POKECENTER_MART
	dw NoHS                        ; MANDARIN_SURF_SHOP
	dw MandarinHotelHS             ; MANDARIN_HOTEL
	dw MandarinSilphCoHS           ; MANDARIN_SILPH_CO
	dw NoHS                        ; DR_JABARAS_LAB
	dw MandarinDockHS              ; MANDARIN_DOCK
	dw NoHS                        ; CITRUS_FERRY_DECK
	dw NoHS                        ; CITRUS_FERRY_OUTSIDE
	dw CitrusFerryRoomsHS          ; CITRUS_FERRY_ROOMS   ; marcelnote - for fossil
	dw SilphFactory1FHS            ; SILPH_FACTORY_1F
	dw SilphFactory2FHS            ; SILPH_FACTORY_2F
	dw NoHS                        ; ROUTE_22_OLD_ROD_HOUSE
	dw NoHS                        ; ROUTE_22_GATE
	dw BattleHallHS                ; BATTLE_HALL          ; marcelnote - for battle hall opponent Red/Green
	dw MtSilver1FHS                ; MT_SILVER_1F         ; marcelnote - added for items
	dw MtSilver2FHS                ; MT_SILVER_2F         ; marcelnote - added for items
	dw MtSilver3FHS                ; MT_SILVER_3F         ; marcelnote - added for Yellow battle
	dw VictoryRoad1FHS             ; VICTORY_ROAD_1F
	dw VictoryRoad2FHS             ; VICTORY_ROAD_2F
	dw VictoryRoad3FHS             ; VICTORY_ROAD_3F
	dw IndigoPlateauLobbyHS        ; INDIGO_PLATEAU_LOBBY ; marcelnote - added for girl blocking E4 entrance
	dw LoreleisRoomHS              ; LORELEIS_ROOM        ; marcelnote - added for Lorelei rematch
	dw BrunosRoomHS                ; BRUNOS_ROOM          ; marcelnote - added for Bruno rematch
	dw AgathasRoomHS               ; AGATHAS_ROOM         ; marcelnote - added for Agatha rematch
	dw LancesRoomHS                ; LANCES_ROOM          ; marcelnote - added for Lance rematch
	dw ChampionsRoomHS             ; CHAMPIONS_ROOM
	dw HallOfFameHS                ; HALL_OF_FAME         ; marcelnote - added for Rival rematch
	dw NoHS                        ; TRADE_CENTER
	dw NoHS                        ; COLOSSEUM
	assert_table_length NUM_MAPS
	dw -1 ; end

NoHS:
	db -1, -1, -1 ; end

ToggleableObjectStates:
; entries correspond to TOGGLE_* constants (see constants/toggle_constants)
	table_width 3
; format: map id, object id, OFF/ON
; marcelnote - !!!WARNING!!!
; the maps with items to pick up OR overworld map Pokémon to fight
; MUST be in this first list! (basically all constants marked with X in toggle_constants)

PalletTownHS:
	db PALLET_TOWN, PALLETTOWN_OAK, OFF
ViridianCityHS:
	db VIRIDIAN_CITY, VIRIDIANCITY_OLD_MAN_SLEEPY, ON
	db VIRIDIAN_CITY, VIRIDIANCITY_OLD_MAN,        OFF
PewterCityHS:
	db PEWTER_CITY, PEWTERCITY_SUPER_NERD1, ON
	db PEWTER_CITY, PEWTERCITY_YOUNGSTER,   ON
CeruleanCityHS:
	db CERULEAN_CITY, CERULEANCITY_RIVAL,       OFF
	db CERULEAN_CITY, CERULEANCITY_ROCKET,      ON
	db CERULEAN_CITY, CERULEANCITY_GUARD1,      OFF
	db CERULEAN_CITY, CERULEANCITY_SUPER_NERD3, ON
	db CERULEAN_CITY, CERULEANCITY_GUARD2,      ON
Route2HS:
	db ROUTE_2, ROUTE2_MOON_STONE, ON
	db ROUTE_2, ROUTE2_HP_UP,      ON
Route4HS:
	db ROUTE_4, ROUTE4_TM_WHIRLWIND, ON
Route9HS:
	db ROUTE_9, ROUTE9_TM_TELEPORT, ON
Route12HS:
	db ROUTE_12, ROUTE12_SNORLAX,    ON
	db ROUTE_12, ROUTE12_TM_PAY_DAY, ON
	db ROUTE_12, ROUTE12_IRON,       ON
Route15HS:
	db ROUTE_15, ROUTE15_TM_RAGE, ON
Route16HS:
	db ROUTE_16, ROUTE16_SNORLAX, ON
Route22HS:
	db ROUTE_22, ROUTE22_RIVAL1, OFF
	db ROUTE_22, ROUTE22_RIVAL2, OFF
Route24HS:
	db ROUTE_24, ROUTE24_COOLTRAINER_M1,  ON
	db ROUTE_24, ROUTE24_TM_THUNDER_WAVE, ON
Route25HS:
	db ROUTE_25, ROUTE25_TM_SEISMIC_TOSS, ON
BluesAidesHousesHS: ; marcelnote - merged Blue's house with new Aide's house
	db BLUES_AIDES_HOUSES, BLUESHOUSE_DAISY1,   ON
	db BLUES_AIDES_HOUSES, BLUESHOUSE_DAISY2,   OFF
	db BLUES_AIDES_HOUSES, BLUESHOUSE_TOWN_MAP, ON
OaksLabHS:
	db OAKS_LAB, OAKSLAB_RIVAL,                ON
	db OAKS_LAB, OAKSLAB_CHARMANDER_POKE_BALL, ON
	db OAKS_LAB, OAKSLAB_SQUIRTLE_POKE_BALL,   ON
	db OAKS_LAB, OAKSLAB_BULBASAUR_POKE_BALL,  ON
	db OAKS_LAB, OAKSLAB_OAK,                  OFF
	db OAKS_LAB, OAKSLAB_POKEDEX1,             ON
	db OAKS_LAB, OAKSLAB_POKEDEX2,             ON
	db OAKS_LAB, OAKSLAB_OAK_WALKING,          OFF
ViridianGymHS:
	db VIRIDIAN_GYM, VIRIDIANGYM_GIOVANNI, ON
	db VIRIDIAN_GYM, VIRIDIANGYM_REVIVE,   ON
PewterMuseumHS:
	db PEWTER_MUSEUM, PEWTERMUSEUM1F_OLD_AMBER, ON
CeruleanCave1FHS:
	db CERULEAN_CAVE_1F, CERULEANCAVE1F_FULL_RESTORE, ON
	db CERULEAN_CAVE_1F, CERULEANCAVE1F_MAX_ELIXIR,   ON
	db CERULEAN_CAVE_1F, CERULEANCAVE1F_NUGGET,       ON
PokemonTower1FHS:
	db POKEMON_TOWER_1F, POKEMONTOWER1F_AGATHA, OFF     ; marcelnote - postgame Agatha
	db POKEMON_TOWER_1F, POKEMONTOWER1F_GENTLEMAN, OFF  ; marcelnote - postgame Agatha
PokemonTower2FHS:
	db POKEMON_TOWER_2F, POKEMONTOWER2F_RIVAL, ON
PokemonTower3FHS:
	db POKEMON_TOWER_3F, POKEMONTOWER3F_ESCAPE_ROPE, ON
PokemonTower4FHS:
	db POKEMON_TOWER_4F, POKEMONTOWER4F_ELIXIR,    ON
	db POKEMON_TOWER_4F, POKEMONTOWER4F_AWAKENING, ON
	db POKEMON_TOWER_4F, POKEMONTOWER4F_HP_UP,     ON
PokemonTower5FHS:
	db POKEMON_TOWER_5F, POKEMONTOWER5F_NUGGET, ON
PokemonTower6FHS:
	db POKEMON_TOWER_6F, POKEMONTOWER6F_AGATHA, OFF ; marcelnote - postgame Agatha event
	db POKEMON_TOWER_6F, POKEMONTOWER6F_RARE_CANDY, ON
	db POKEMON_TOWER_6F, POKEMONTOWER6F_X_ACCURACY, ON
PokemonTower7FHS:
	db POKEMON_TOWER_7F, POKEMONTOWER7F_ROCKET1, ON
	db POKEMON_TOWER_7F, POKEMONTOWER7F_ROCKET2, ON
	db POKEMON_TOWER_7F, POKEMONTOWER7F_ROCKET3, ON
	db POKEMON_TOWER_7F, POKEMONTOWER7F_MR_FUJI, ON
	db POKEMON_TOWER_7F, POKEMONTOWER7F_CHANNELER, OFF ; marcelnote - added 7FChanneler
MrFujisHouseHS:
	db MR_FUJIS_HOUSE, MRFUJISHOUSE_MR_FUJI, OFF
CeladonMansionRoofHouseHS:
	db CELADON_MANSION_ROOF_HOUSE, CELADONMANSION_ROOF_HOUSE_EEVEE_POKEBALL, ON
GameCornerHS:
	db GAME_CORNER, GAMECORNER_ROCKET, ON
WardensHouseHS:
	db WARDENS_HOUSE, WARDENSHOUSE_RARE_CANDY, ON
PokemonMansion1FHS:
	db POKEMON_MANSION_1F, POKEMONMANSION1F_ESCAPE_ROPE, ON
	db POKEMON_MANSION_1F, POKEMONMANSION1F_CARBOS,      ON
FightingDojoHS:
	db FIGHTING_DOJO, FIGHTINGDOJO_BRUNO,                OFF ; marcelnote - postgame Bruno
	db FIGHTING_DOJO, FIGHTINGDOJO_HITMONLEE_POKE_BALL,  ON
	db FIGHTING_DOJO, FIGHTINGDOJO_HITMONCHAN_POKE_BALL, ON
PowerPlantHS:
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
VictoryRoad2FHS:
;	db VICTORY_ROAD_2F, VICTORYROAD2F_MOLTRES,       ON  ; marcelnote - removed Moltres from Victory Road
	db VICTORY_ROAD_2F, VICTORYROAD2F_TM_SUBMISSION, ON
	db VICTORY_ROAD_2F, VICTORYROAD2F_FULL_HEAL,     ON
	db VICTORY_ROAD_2F, VICTORYROAD2F_TM_MEGA_KICK,  ON
	db VICTORY_ROAD_2F, VICTORYROAD2F_GUARD_SPEC,    ON
	db VICTORY_ROAD_2F, VICTORYROAD2F_BOULDER3,      ON
BillsHouseHS:
	db BILLS_HOUSE, BILLSHOUSE_BILL_POKEMON, ON
	db BILLS_HOUSE, BILLSHOUSE_BILL1,        OFF
	db BILLS_HOUSE, BILLSHOUSE_BILL2,        OFF
ViridianForestHS:
	db VIRIDIAN_FOREST, VIRIDIANFOREST_ANTIDOTE,  ON
	db VIRIDIAN_FOREST, VIRIDIANFOREST_POTION,    ON
	db VIRIDIAN_FOREST, VIRIDIANFOREST_POKE_BALL, ON
MtMoon1FHS:
	db MT_MOON_1F, MTMOON1F_POTION1,      ON
	db MT_MOON_1F, MTMOON1F_MOON_STONE,   ON
	db MT_MOON_1F, MTMOON1F_RARE_CANDY,   ON
	db MT_MOON_1F, MTMOON1F_ESCAPE_ROPE,  ON
	db MT_MOON_1F, MTMOON1F_POTION2,      ON
	db MT_MOON_1F, MTMOON1F_TM_WATER_GUN, ON
MtMoonB2FHS:
	db MT_MOON_B2F, MTMOONB2F_DOME_FOSSIL,   ON
	db MT_MOON_B2F, MTMOONB2F_HELIX_FOSSIL,  ON
	db MT_MOON_B2F, MTMOONB2F_HP_UP,         ON
	db MT_MOON_B2F, MTMOONB2F_TM_MEGA_PUNCH, ON
SSAnne2FHS:
	db SS_ANNE_2F, SSANNE2F_RIVAL, OFF
SSAnne1FRoomsHS:
	db SS_ANNE_1F_ROOMS, SSANNE1FROOMS_TM_BODY_SLAM, ON
SSAnne2FRoomsHS:
	db SS_ANNE_2F_ROOMS, SSANNE2FROOMS_MAX_ETHER,  ON
	db SS_ANNE_2F_ROOMS, SSANNE2FROOMS_RARE_CANDY, ON
SSAnneB1FHS: ; marcelnote - merged SS Anne B1F and B1FRooms
	db SS_ANNE_B1F, SSANNEB1FROOMS_ETHER,      ON
	db SS_ANNE_B1F, SSANNEB1FROOMS_TM_REST,    ON
	db SS_ANNE_B1F, SSANNEB1FROOMS_MAX_POTION, ON
VictoryRoad3FHS:
	db VICTORY_ROAD_3F, VICTORYROAD3F_MAX_REVIVE,   ON
	db VICTORY_ROAD_3F, VICTORYROAD3F_TM_EXPLOSION, ON
	db VICTORY_ROAD_3F, VICTORYROAD3F_BOULDER4,     ON
RocketHideoutB1FHS:
	db ROCKET_HIDEOUT_B1F, ROCKETHIDEOUTB1F_ESCAPE_ROPE,  ON
	db ROCKET_HIDEOUT_B1F, ROCKETHIDEOUTB1F_HYPER_POTION, ON
RocketHideoutB2FHS:
	db ROCKET_HIDEOUT_B2F, ROCKETHIDEOUTB2F_MOON_STONE,    ON
	db ROCKET_HIDEOUT_B2F, ROCKETHIDEOUTB2F_NUGGET,        ON
	db ROCKET_HIDEOUT_B2F, ROCKETHIDEOUTB2F_TM_HORN_DRILL, ON
	db ROCKET_HIDEOUT_B2F, ROCKETHIDEOUTB2F_SUPER_POTION,  ON
RocketHideoutB3FHS:
	db ROCKET_HIDEOUT_B3F, ROCKETHIDEOUTB3F_TM_DOUBLE_EDGE, ON
	db ROCKET_HIDEOUT_B3F, ROCKETHIDEOUTB3F_RARE_CANDY,     ON
RocketHideoutB4FHS:
	db ROCKET_HIDEOUT_B4F, ROCKETHIDEOUTB4F_GIOVANNI,      ON
	db ROCKET_HIDEOUT_B4F, ROCKETHIDEOUTB4F_HP_UP,         ON
	db ROCKET_HIDEOUT_B4F, ROCKETHIDEOUTB4F_TM_RAZOR_WIND, ON
	db ROCKET_HIDEOUT_B4F, ROCKETHIDEOUTB4F_IRON,          ON
	db ROCKET_HIDEOUT_B4F, ROCKETHIDEOUTB4F_SILPH_SCOPE,   OFF
	db ROCKET_HIDEOUT_B4F, ROCKETHIDEOUTB4F_LIFT_KEY,      OFF
SilphCo2FHS:
;	db SILPH_CO_2F, SILPHCO2F_SILPH_WORKER_F, ON ; marcelnote - not used (TM_SELFDESTRUCT woman)
	db SILPH_CO_2F, SILPHCO2F_SCIENTIST1,     ON
	db SILPH_CO_2F, SILPHCO2F_SCIENTIST2,     ON
	db SILPH_CO_2F, SILPHCO2F_ROCKET1,        ON
	db SILPH_CO_2F, SILPHCO2F_ROCKET2,        ON
SilphCo3FHS:
	db SILPH_CO_3F, SILPHCO3F_ROCKET,       ON
	db SILPH_CO_3F, SILPHCO3F_SCIENTIST,    ON
	db SILPH_CO_3F, SILPHCO3F_HYPER_POTION, ON
SilphCo4FHS:
	db SILPH_CO_4F, SILPHCO4F_ROCKET1,     ON
	db SILPH_CO_4F, SILPHCO4F_SCIENTIST,   ON
	db SILPH_CO_4F, SILPHCO4F_ROCKET2,     ON
	db SILPH_CO_4F, SILPHCO4F_FULL_HEAL,   ON
	db SILPH_CO_4F, SILPHCO4F_MAX_REVIVE,  ON
	db SILPH_CO_4F, SILPHCO4F_ESCAPE_ROPE, ON
SilphCo5FHS:
	db SILPH_CO_5F, SILPHCO5F_ROCKET1,      ON
	db SILPH_CO_5F, SILPHCO5F_SCIENTIST,    ON
	db SILPH_CO_5F, SILPHCO5F_ROCKER,       ON
	db SILPH_CO_5F, SILPHCO5F_ROCKET2,      ON
	db SILPH_CO_5F, SILPHCO5F_TM_TAKE_DOWN, ON
	db SILPH_CO_5F, SILPHCO5F_PROTEIN,      ON
	db SILPH_CO_5F, SILPHCO5F_CARD_KEY,     ON
SilphCo6FHS:
	db SILPH_CO_6F, SILPHCO6F_ROCKET1,    ON
	db SILPH_CO_6F, SILPHCO6F_SCIENTIST,  ON
	db SILPH_CO_6F, SILPHCO6F_ROCKET2,    ON
	db SILPH_CO_6F, SILPHCO6F_HP_UP,      ON
	db SILPH_CO_6F, SILPHCO6F_X_ACCURACY, ON
SilphCo7FHS:
	db SILPH_CO_7F, SILPHCO7F_ROCKET1,         ON
	db SILPH_CO_7F, SILPHCO7F_SCIENTIST,       ON
	db SILPH_CO_7F, SILPHCO7F_ROCKET2,         ON
	db SILPH_CO_7F, SILPHCO7F_ROCKET3,         ON
	db SILPH_CO_7F, SILPHCO7F_RIVAL,           ON
	db SILPH_CO_7F, SILPHCO7F_CALCIUM,         ON
	db SILPH_CO_7F, SILPHCO7F_TM_SWORDS_DANCE, ON
;	db SILPH_CO_7F, SILPHCO7F_UNUSED,          ON ; marcelnote - removed
SilphCo8FHS:
	db SILPH_CO_8F, SILPHCO8F_ROCKET1,   ON
	db SILPH_CO_8F, SILPHCO8F_SCIENTIST, ON
	db SILPH_CO_8F, SILPHCO8F_ROCKET2,   ON
SilphCo9FHS:
	db SILPH_CO_9F, SILPHCO9F_ROCKET1,   ON
	db SILPH_CO_9F, SILPHCO9F_SCIENTIST, ON
	db SILPH_CO_9F, SILPHCO9F_ROCKET2,   ON
SilphCo10FHS:
	db SILPH_CO_10F, SILPHCO10F_ROCKET,         ON
	db SILPH_CO_10F, SILPHCO10F_SCIENTIST,      ON
;	db SILPH_CO_10F, SILPHCO10F_SILPH_WORKER_F, ON ; marcelnote - removed
	db SILPH_CO_10F, SILPHCO10F_TM_EARTHQUAKE,  ON
	db SILPH_CO_10F, SILPHCO10F_RARE_CANDY,     ON
	db SILPH_CO_10F, SILPHCO10F_CARBOS,         ON
SilphCo11FHS:
	db SILPH_CO_11F, SILPHCO11F_GIOVANNI, ON
	db SILPH_CO_11F, SILPHCO11F_ROCKET1,  ON
	db SILPH_CO_11F, SILPHCO11F_ROCKET2,  ON
;UnusedMapF4HS:
;	db UNUSED_MAP_F4, $02, ON ; unused ; marcelnote - removed
PokemonMansion2FHS:
	db POKEMON_MANSION_2F, POKEMONMANSION2F_CALCIUM, ON
PokemonMansion3FHS:
	db POKEMON_MANSION_3F, POKEMONMANSION3F_MAX_POTION, ON
	db POKEMON_MANSION_3F, POKEMONMANSION3F_IRON,       ON
PokemonMansionB1FHS:
	db POKEMON_MANSION_B1F, POKEMONMANSIONB1F_RARE_CANDY,   ON
	db POKEMON_MANSION_B1F, POKEMONMANSIONB1F_FULL_RESTORE, ON
	db POKEMON_MANSION_B1F, POKEMONMANSIONB1F_TM_BLIZZARD,  ON
	db POKEMON_MANSION_B1F, POKEMONMANSIONB1F_TM_SOLARBEAM, ON
	db POKEMON_MANSION_B1F, POKEMONMANSIONB1F_SECRET_KEY,   ON
	db POKEMON_MANSION_B1F, POKEMONMANSIONB1F_FUJIS_NOTES,  ON ; marcelnote - new
	db POKEMON_MANSION_B1F, POKEMONMANSIONB1F_HP_UP,        ON ; marcelnote - new
SafariZoneEastHS:
	db SAFARI_ZONE_EAST, SAFARIZONEEAST_FULL_RESTORE, ON
	db SAFARI_ZONE_EAST, SAFARIZONEEAST_MAX_RESTORE,  ON
	db SAFARI_ZONE_EAST, SAFARIZONEEAST_CARBOS,       ON
	db SAFARI_ZONE_EAST, SAFARIZONEEAST_TM_EGG_BOMB,  ON
SafariZoneNorthHS:
	db SAFARI_ZONE_NORTH, SAFARIZONENORTH_PROTEIN,       ON
	db SAFARI_ZONE_NORTH, SAFARIZONENORTH_TM_SKULL_BASH, ON
SafariZoneWestHS:
	db SAFARI_ZONE_WEST, SAFARIZONEWEST_MAX_POTION,     ON
	db SAFARI_ZONE_WEST, SAFARIZONEWEST_TM_DOUBLE_TEAM, ON
	db SAFARI_ZONE_WEST, SAFARIZONEWEST_MAX_REVIVE,     ON
	db SAFARI_ZONE_WEST, SAFARIZONEWEST_GOLD_TEETH,     ON
SafariZoneCenterHS:
	db SAFARI_ZONE_CENTER, SAFARIZONECENTER_NUGGET, ON
CeruleanCave2FHS:
	db CERULEAN_CAVE_2F, CERULEANCAVE2F_PP_UP,        ON
	db CERULEAN_CAVE_2F, CERULEANCAVE2F_ULTRA_BALL,   ON
	db CERULEAN_CAVE_2F, CERULEANCAVE2F_FULL_RESTORE, ON
CeruleanCaveB1FHS:
	db CERULEAN_CAVE_B1F, CERULEANCAVEB1F_MEWTWO,     ON
	db CERULEAN_CAVE_B1F, CERULEANCAVEB1F_ULTRA_BALL, ON
	db CERULEAN_CAVE_B1F, CERULEANCAVEB1F_MAX_REVIVE, ON
VictoryRoad1FHS:
	db VICTORY_ROAD_1F, VICTORYROAD1F_TM_SKY_ATTACK, ON
	db VICTORY_ROAD_1F, VICTORYROAD1F_RARE_CANDY,    ON
SeafoamIslands1FHS:
	db SEAFOAM_ISLANDS_1F, SEAFOAMISLANDS1F_BOULDER1, ON
	db SEAFOAM_ISLANDS_1F, SEAFOAMISLANDS1F_BOULDER2, ON
SeafoamIslandsB1FHS:
	db SEAFOAM_ISLANDS_B1F, SEAFOAMISLANDSB1F_BOULDER1, OFF
	db SEAFOAM_ISLANDS_B1F, SEAFOAMISLANDSB1F_BOULDER2, OFF
SeafoamIslandsB2FHS:
	db SEAFOAM_ISLANDS_B2F, SEAFOAMISLANDSB2F_WATER_STONE, ON ; marcelnote - new
	db SEAFOAM_ISLANDS_B2F, SEAFOAMISLANDSB2F_BOULDER1, OFF
	db SEAFOAM_ISLANDS_B2F, SEAFOAMISLANDSB2F_BOULDER2, OFF
SeafoamIslandsB3FHS:
	db SEAFOAM_ISLANDS_B3F, SEAFOAMISLANDSB3F_BOULDER2, ON
	db SEAFOAM_ISLANDS_B3F, SEAFOAMISLANDSB3F_BOULDER3, ON
	db SEAFOAM_ISLANDS_B3F, SEAFOAMISLANDSB3F_BOULDER5, OFF
	db SEAFOAM_ISLANDS_B3F, SEAFOAMISLANDSB3F_BOULDER6, OFF
SeafoamIslandsB4FHS:
	db SEAFOAM_ISLANDS_B4F, SEAFOAMISLANDSB4F_BOULDER1, OFF
	db SEAFOAM_ISLANDS_B4F, SEAFOAMISLANDSB4F_BOULDER2, OFF
	db SEAFOAM_ISLANDS_B4F, SEAFOAMISLANDSB4F_ARTICUNO, ON
; marcelnote - new maps
MtMoonSquareHS:
	db MT_MOON_SQUARE, MTMOONSQUARE_CLEFAIRY, OFF
	db MT_MOON_SQUARE, MTMOONSQUARE_MOON_STONE, OFF
	db MT_MOON_SQUARE, MTMOONSQUARE_SUPER_POTION, ON
CinnabarVolcano1FB1FHS:
	db CINNABAR_VOLCANO_1FB1F, CINNABARVOLCANOB1F_CHARIZARD, OFF
	db CINNABAR_VOLCANO_1FB1F, CINNABARVOLCANOB1F_LANCE, OFF
	db CINNABAR_VOLCANO_1FB1F, CINNABARVOLCANOB1F_IRON, ON
	db CINNABAR_VOLCANO_1FB1F, CINNABARVOLCANOB1F_ICE_HEAL, ON
	db CINNABAR_VOLCANO_1FB1F, CINNABARVOLCANO1F_LANCE, OFF
	db CINNABAR_VOLCANO_1FB1F, CINNABARVOLCANO1F_FULL_RESTORE, ON
CinnabarVolcano2FHS:
	db CINNABAR_VOLCANO_2F, CINNABARVOLCANO2F_MOLTRES, ON
	db CINNABAR_VOLCANO_2F, CINNABARVOLCANO2F_FIRE_STONE, ON
	db CINNABAR_VOLCANO_2F, CINNABARVOLCANO2F_ULTRA_BALL, ON
	db CINNABAR_VOLCANO_2F, CINNABARVOLCANO2F_NUGGET, ON
MandarinHotelHS:
	db MANDARIN_HOTEL, MANDARINHOTEL2F_MAX_ELIXIR, ON
CeladonGroveHS:
	db CELADON_GROVE, CELADONGROVE_MEW, OFF
	db CELADON_GROVE, CELADONGROVE_LEAF_STONE, ON
	db CELADON_GROVE, CELADONGROVE_GREAT_BALL, ON
SilphFactory1FHS:
	db SILPH_FACTORY_1F, SILPHFACTORY1F_ROCKET1, ON
	db SILPH_FACTORY_1F, SILPHFACTORY1F_ROCKET2, ON
	db SILPH_FACTORY_1F, SILPHFACTORY1F_ROCKET3, ON
	db SILPH_FACTORY_1F, SILPHFACTORY1F_ROCKET4, ON
	db SILPH_FACTORY_1F, SILPHFACTORY1F_RARE_CANDY, ON
	db SILPH_FACTORY_1F, SILPHFACTORY1F_CARBOS, ON
MtSilver1FHS:
	db MT_SILVER_1F, MTSILVER1F_PROTEIN, ON
	db MT_SILVER_1F, MTSILVER1F_ESCAPE_ROPE, ON
	db MT_SILVER_1F, MTSILVER1F_ULTRA_BALL, ON
	db MT_SILVER_1F, MTSILVER1F_MAX_ELIXIR, ON
MtSilver2FHS:
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

RedsYellowsHousesHS:
	db REDS_YELLOWS_HOUSES, YELLOWSHOUSE1F_DAD1, ON     ; marcelnote - Dad unpacking
	db REDS_YELLOWS_HOUSES, YELLOWSHOUSE1F_DAD2, OFF    ; marcelnote - Dad sitting
	db REDS_YELLOWS_HOUSES, YELLOWSHOUSE2F_ASLEEP, ON   ; marcelnote - Yellow asleep
	db REDS_YELLOWS_HOUSES, YELLOWSHOUSE2F_YELLOW, OFF  ; marcelnote - Yellow
Route1HS:
	db ROUTE_1, ROUTE1_OAK, OFF  ; marcelnote - postgame Oak battle
PewterGymHS:
	db PEWTER_GYM, PEWTERGYM_BROCK, ON           ; marcelnote - default Brock
	db PEWTER_GYM, PEWTERGYM_BROCK_REMATCH, OFF  ; marcelnote - rematch Brock
CeruleanGymHS:
	db CERULEAN_GYM, CERULEANGYM_MISTY, ON           ; marcelnote - default Misty
	db CERULEAN_GYM, CERULEANGYM_MISTY_REMATCH, OFF  ; marcelnote - rematch Misty
VermilionCityHS:
	db VERMILION_CITY, VERMILIONCITY_SAILOR2, ON           ; marcelnote - SS Anne sailor who disappears
	db VERMILION_CITY, VERMILIONCITY_COOLTRAINER_F, OFF    ; marcelnote - girl who mentions Mandarin
VermilionGymHS:
	db VERMILION_GYM, VERMILIONGYM_LT_SURGE, ON           ; marcelnote - default Lt.Surge
	db VERMILION_GYM, VERMILIONGYM_LT_SURGE_REMATCH, OFF  ; marcelnote - rematch Lt.Surge
VermilionDockHS:
	db VERMILION_DOCK, VERMILIONDOCK_SAILOR, ON          ; marcelnote - sailor at Ferry entrance
CeladonGymHS:
	db CELADON_GYM, CELADONGYM_ERIKA, ON           ; marcelnote - default Erika
	db CELADON_GYM, CELADONGYM_ERIKA_REMATCH, OFF  ; marcelnote - rematch Erika
CeladonGroveSouthGateHS:
	db CELADON_GROVE_SOUTH_GATE, CELADONGROVESOUTHGATE_ROCKET, ON  ; marcelnote - blocking the way
FuchsiaGymHS:
	db FUCHSIA_GYM, FUCHSIAGYM_KOGA, ON           ; marcelnote - default Koga
	db FUCHSIA_GYM, FUCHSIAGYM_KOGA_REMATCH, OFF  ; marcelnote - rematch Koga
SaffronCityHS: ; marcelnote - moved from previous list
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
SaffronGymHS:
	db SAFFRON_GYM, SAFFRONGYM_SABRINA, ON           ; marcelnote - default Sabrina
	db SAFFRON_GYM, SAFFRONGYM_SABRINA_REMATCH, OFF  ; marcelnote - rematch Sabrina
	db SAFFRON_GYM, SAFFRONGYM_WILL, OFF             ; marcelnote - postgame Bruno event
	db SAFFRON_GYM, SAFFRONGYM_BRUNO, OFF            ; marcelnote - postgame Bruno event
SilphCo1FHS:
	db SILPH_CO_1F, SILPHCO1F_LINK_RECEPTIONIST, OFF
CinnabarGymHS:
	db CINNABAR_GYM, CINNABARGYM_BLAINE, ON           ; marcelnote - default Blaine
	db CINNABAR_GYM, CINNABARGYM_BLAINE_REMATCH, OFF  ; marcelnote - rematch Blaine
MandarinSilphCoHS:
	db MANDARIN_SILPH_CO, MANDARINSILPHCO_SCIENTIST, ON  ; marcelnote - worried Scientist
MandarinDockHS:
	db MANDARIN_DOCK, MANDARINDOCK_SAILOR, ON           ; marcelnote - sailor at Ferry entrance
CitrusFerryRoomsHS:
	db CITRUS_FERRY_ROOMS, CITRUSFERRYROOMS_FOSSIL, ON ; marcelnote - sailor at Ferry entrance
SilphFactory2FHS:
	db SILPH_FACTORY_2F, SILPHFACTORY2F_SCIENTIST1, ON   ; marcelnote - scientist blocking the way
	db SILPH_FACTORY_2F, SILPHFACTORY2F_LORELEI1, OFF    ; marcelnote - Lorelei at entrance
	db SILPH_FACTORY_2F, SILPHFACTORY2F_ROCKET1, ON      ; marcelnote - Archer
	db SILPH_FACTORY_2F, SILPHFACTORY2F_LORELEI2, OFF    ; marcelnote - Lorelei after beating Archer
BattleHallHS:
	db BATTLE_HALL, BATTLEHALL_RED, OFF    ; marcelnote - battle hall Red
	db BATTLE_HALL, BATTLEHALL_GREEN, OFF  ; marcelnote - battle hall Green
IndigoPlateauLobbyHS:
	db INDIGO_PLATEAU_LOBBY, INDIGOPLATEAULOBBY_COOLTRAINER_F, ON
	db INDIGO_PLATEAU_LOBBY, INDIGOPLATEAULOBBY_COOLTRAINER_F2, OFF
	db INDIGO_PLATEAU_LOBBY, INDIGOPLATEAULOBBY_RIVAL, OFF ; marcelnote - appears after E4 reopens
LoreleisRoomHS:
	db LORELEIS_ROOM, LORELEISROOM_LORELEI, ON
	db LORELEIS_ROOM, LORELEISROOM_LORELEI_REMATCH, OFF
BrunosRoomHS:
	db BRUNOS_ROOM, BRUNOSROOM_BRUNO, ON
	db BRUNOS_ROOM, BRUNOSROOM_BRUNO_REMATCH, OFF
AgathasRoomHS:
	db AGATHAS_ROOM, AGATHASROOM_AGATHA, ON
	db AGATHAS_ROOM, AGATHASROOM_AGATHA_REMATCH, OFF
LancesRoomHS:
	db LANCES_ROOM, LANCESROOM_LANCE, ON
	db LANCES_ROOM, LANCESROOM_LANCE_REMATCH, OFF
ChampionsRoomHS:
	db CHAMPIONS_ROOM, CHAMPIONSROOM_OAK, OFF
	db CHAMPIONS_ROOM, CHAMPIONSROOM_RIVAL, ON ; marcelnote - added for Rival rematch
HallOfFameHS:
	db HALL_OF_FAME, HALLOFFAME_OAK, ON
	db HALL_OF_FAME, HALLOFFAME_RIVAL, OFF
MtSilver3FHS:
	db MT_SILVER_3F, MTSILVER3F_YELLOW, ON ; marcelnote - Yellow battle
	assert_table_length NUM_TOGGLEABLE_OBJECTS_CONT
	db -1, 1, ON ; end
