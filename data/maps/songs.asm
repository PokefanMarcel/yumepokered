MapSongBanks::
	table_width 2, MapSongBanks
	; Cities
	db MUSIC_PALLET_TOWN, BANK(Music_PalletTown)       ; PALLET_TOWN
	db MUSIC_CITIES1, BANK(Music_Cities1)              ; VIRIDIAN_CITY
	db MUSIC_CITIES1, BANK(Music_Cities1)              ; PEWTER_CITY
	db MUSIC_CITIES2, BANK(Music_Cities2)              ; CERULEAN_CITY
	db MUSIC_LAVENDER, BANK(Music_Lavender)            ; LAVENDER_TOWN
	db MUSIC_VERMILION, BANK(Music_Vermilion)          ; VERMILION_CITY
	db MUSIC_CELADON, BANK(Music_Celadon)              ; CELADON_CITY
	db MUSIC_CITIES1, BANK(Music_Cities1)              ; SAFFRON_CITY
	db MUSIC_CITIES2, BANK(Music_Cities2)              ; FUCHSIA_CITY
	db MUSIC_CINNABAR, BANK(Music_Cinnabar)            ; CINNABAR_ISLAND
	db MUSIC_CINNABAR, BANK(Music_Cinnabar)            ; MANDARIN_ISLAND ; marcelnote - new map
	db MUSIC_INDIGO_PLATEAU, BANK(Music_IndigoPlateau) ; INDIGO_PLATEAU
	; Routes
	db MUSIC_ROUTES1, BANK(Music_Routes1)              ; ROUTE_1
	db MUSIC_ROUTES1, BANK(Music_Routes1)              ; ROUTE_2
	db MUSIC_ROUTES3, BANK(Music_Routes3)              ; ROUTE_3
	db MUSIC_ROUTES3, BANK(Music_Routes3)              ; ROUTE_4
	db MUSIC_ROUTES3, BANK(Music_Routes3)              ; ROUTE_5
	db MUSIC_ROUTES3, BANK(Music_Routes3)              ; ROUTE_6
	db MUSIC_ROUTES3, BANK(Music_Routes3)              ; ROUTE_7
	db MUSIC_ROUTES3, BANK(Music_Routes3)              ; ROUTE_8
	db MUSIC_ROUTES3, BANK(Music_Routes3)              ; ROUTE_9
	db MUSIC_ROUTES3, BANK(Music_Routes3)              ; ROUTE_10
	db MUSIC_ROUTES4, BANK(Music_Routes4)              ; ROUTE_11
	db MUSIC_ROUTES4, BANK(Music_Routes4)              ; ROUTE_12
	db MUSIC_ROUTES4, BANK(Music_Routes4)              ; ROUTE_13
	db MUSIC_ROUTES4, BANK(Music_Routes4)              ; ROUTE_14
	db MUSIC_ROUTES4, BANK(Music_Routes4)              ; ROUTE_15
	db MUSIC_ROUTES3, BANK(Music_Routes3)              ; ROUTE_16
	db MUSIC_ROUTES3, BANK(Music_Routes3)              ; ROUTE_17
	db MUSIC_ROUTES3, BANK(Music_Routes3)              ; ROUTE_18
	db MUSIC_ROUTES3, BANK(Music_Routes3)              ; ROUTE_19
	db MUSIC_ROUTES3, BANK(Music_Routes3)              ; ROUTE_20
	db MUSIC_ROUTES3, BANK(Music_Routes3)              ; ROUTE_21
	db MUSIC_ROUTES3, BANK(Music_Routes3)              ; ROUTE_22
	db MUSIC_INDIGO_PLATEAU, BANK(Music_IndigoPlateau) ; ROUTE_23
	db MUSIC_ROUTES2, BANK(Music_Routes2)              ; ROUTE_24
	db MUSIC_ROUTES2, BANK(Music_Routes2)              ; ROUTE_25
	db MUSIC_INDIGO_PLATEAU, BANK(Music_IndigoPlateau) ; ROUTE_28 ; marcelnote - new location
	db MUSIC_ROUTES3, BANK(Music_Routes3)              ; ORANGE_ROUTE_1 ; marcelnote - new location
	; Indoor maps
	db MUSIC_PALLET_TOWN, BANK(Music_PalletTown)           ; REDS_YELLOWS_HOUSES ; marcelnote - was REDS_HOUSE_1F
	db MUSIC_PALLET_TOWN, BANK(Music_PalletTown)           ; BLUES_HOUSE
	db MUSIC_OAKS_LAB, BANK(Music_OaksLab)                 ; OAKS_LAB
	db MUSIC_POKECENTER, BANK(Music_Pokecenter)            ; VIRIDIAN_POKECENTER_MART ; marcelnote - merged Viridian Pokecenter and Mart
	db MUSIC_CITIES1, BANK(Music_Cities1)                  ; VIRIDIAN_SCHOOL_HOUSE
	db MUSIC_CITIES1, BANK(Music_Cities1)                  ; VIRIDIAN_NICKNAME_HOUSE
	db MUSIC_GYM, BANK(Music_Gym)                          ; VIRIDIAN_GYM
	db MUSIC_CITIES1, BANK(Music_Cities1)                  ; VIRIDIAN_FOREST_SOUTH_GATE
	db MUSIC_CITIES1, BANK(Music_Cities1)                  ; ROUTE_2_GATE
	db MUSIC_DUNGEON2, BANK(Music_Dungeon2)                ; VIRIDIAN_FOREST
	db MUSIC_CITIES1, BANK(Music_Cities1)                  ; VIRIDIAN_FOREST_NORTH_GATE
	db MUSIC_CITIES1, BANK(Music_Cities1)                  ; ROUTE_2_TRADE_HOUSE
	db MUSIC_DUNGEON2, BANK(Music_Dungeon2)                ; DIGLETTS_CAVE_ROUTE_2
	db MUSIC_POKECENTER, BANK(Music_Pokecenter)            ; PEWTER_POKECENTER_MART ; marcelnote - merged Pewter Pokecenter and Mart
	db MUSIC_CITIES1, BANK(Music_Cities1)                  ; PEWTER_MUSEUM ; marcelnote - merged Pewter Museum floors
	db MUSIC_CITIES1, BANK(Music_Cities1)                  ; PEWTER_NIDORAN_HOUSE
	db MUSIC_CITIES1, BANK(Music_Cities1)                  ; PEWTER_SPEECH_HOUSE
	db MUSIC_GYM, BANK(Music_Gym)                          ; PEWTER_GYM
	db MUSIC_CITIES1, BANK(Music_Cities1)                  ; CELADON_GROVE_NORTH_GATE  ; marcelnote - new location
	db MUSIC_POKECENTER, BANK(Music_Pokecenter)            ; MT_MOON_POKECENTER
	db MUSIC_DUNGEON3, BANK(Music_Dungeon3)                ; MT_MOON_1F
	db MUSIC_DUNGEON3, BANK(Music_Dungeon3)                ; MT_MOON_B1F
	db MUSIC_DUNGEON3, BANK(Music_Dungeon3)                ; MT_MOON_B2F
	db MUSIC_ROUTES3, BANK(Music_Routes3)                  ; MT_MOON_SQUARE ; marcelnote - new location
	db MUSIC_POKECENTER, BANK(Music_Pokecenter)            ; CERULEAN_POKECENTER_MART  ; marcelnote - merged Cerulean Pokecenter and Mart
	db MUSIC_CITIES2, BANK(Music_Cities2)                  ; CERULEAN_TRASHED_HOUSE
	db MUSIC_CITIES2, BANK(Music_Cities2)                  ; CERULEAN_TRADE_HOUSE
	db MUSIC_CITIES2, BANK(Music_Cities2)                  ; CERULEAN_BADGE_HOUSE ; marcelnote - changed from MUSIC_CITIES1
	db MUSIC_CITIES2, BANK(Music_Cities2)                  ; BIKE_SHOP
	db MUSIC_GYM, BANK(Music_Gym)                          ; CERULEAN_GYM
	db MUSIC_DUNGEON1, BANK(Music_Dungeon1)                ; CERULEAN_CAVE_1F
	db MUSIC_DUNGEON1, BANK(Music_Dungeon1)                ; CERULEAN_CAVE_2F
	db MUSIC_DUNGEON1, BANK(Music_Dungeon1)                ; CERULEAN_CAVE_B1F
	db MUSIC_CITIES2, BANK(Music_Cities2)                  ; BILLS_HOUSE
	db MUSIC_CITIES1, BANK(Music_Cities1)                  ; ROUTE_5_GATE
	db MUSIC_CITIES1, BANK(Music_Cities1)                  ; UNDERGROUND_PATH_ROUTE_5
	db MUSIC_CITIES1, BANK(Music_Cities1)                  ; DAYCARE
	db MUSIC_CITIES1, BANK(Music_Cities1)                  ; ROUTE_6_GATE
	db MUSIC_CITIES1, BANK(Music_Cities1)                  ; UNDERGROUND_PATH_ROUTE_6
	db MUSIC_CITIES1, BANK(Music_Cities1)                  ; ROUTE_7_GATE
	db MUSIC_CITIES1, BANK(Music_Cities1)                  ; UNDERGROUND_PATH_ROUTE_7
	db MUSIC_CITIES1, BANK(Music_Cities1)                  ; ROUTE_8_GATE
	db MUSIC_CITIES1, BANK(Music_Cities1)                  ; UNDERGROUND_PATH_ROUTE_8
	db MUSIC_ROUTES1, BANK(Music_Routes1)                  ; UNDERGROUND_PATH_NORTH_SOUTH
	db MUSIC_ROUTES1, BANK(Music_Routes1)                  ; UNDERGROUND_PATH_WEST_EAST
	db MUSIC_POKECENTER, BANK(Music_Pokecenter)            ; VERMILION_POKECENTER_MART ; marcelnote - merged Vermilion Pokecenter and Mart
	db MUSIC_CITIES2, BANK(Music_Cities2)                  ; VERMILION_GOOD_ROD_HOUSE ; marcelnote - from Old to Good Rod
	db MUSIC_VERMILION, BANK(Music_Vermilion)              ; POKEMON_FAN_CLUB
	db MUSIC_VERMILION, BANK(Music_Vermilion)              ; VERMILION_PIDGEY_HOUSE
	db MUSIC_VERMILION, BANK(Music_Vermilion)              ; VERMILION_TRADE_HOUSE
	db MUSIC_GYM, BANK(Music_Gym)                          ; VERMILION_GYM
	db MUSIC_SS_ANNE, BANK(Music_SSAnne)                   ; VERMILION_DOCK
	db MUSIC_SS_ANNE, BANK(Music_SSAnne)                   ; SS_ANNE_1F
	db MUSIC_SS_ANNE, BANK(Music_SSAnne)                   ; SS_ANNE_2F
	db MUSIC_SS_ANNE, BANK(Music_SSAnne)                   ; SS_ANNE_3F
	db MUSIC_SS_ANNE, BANK(Music_SSAnne)                   ; SS_ANNE_B1F ; marcelnote - merged SS Anne B1F and B1FRooms
	db MUSIC_SS_ANNE, BANK(Music_SSAnne)                   ; SS_ANNE_BOW
	db MUSIC_SS_ANNE, BANK(Music_SSAnne)                   ; SS_ANNE_KITCHEN
	db MUSIC_SS_ANNE, BANK(Music_SSAnne)                   ; SS_ANNE_CAPTAINS_ROOM
	db MUSIC_SS_ANNE, BANK(Music_SSAnne)                   ; SS_ANNE_1F_ROOMS
	db MUSIC_SS_ANNE, BANK(Music_SSAnne)                   ; SS_ANNE_2F_ROOMS
	db MUSIC_DUNGEON2, BANK(Music_Dungeon2)                ; DIGLETTS_CAVE
	db MUSIC_DUNGEON2, BANK(Music_Dungeon2)                ; DIGLETTS_CAVE_ROUTE_11
	db MUSIC_VERMILION, BANK(Music_Vermilion)              ; ROUTE_11_GATE            ; marcelnote - merged ROUTE_11_GATE floors
	db MUSIC_POKECENTER, BANK(Music_Pokecenter)            ; ROCK_TUNNEL_POKECENTER
	db MUSIC_DUNGEON3, BANK(Music_Dungeon3)                ; ROCK_TUNNEL_1F
	db MUSIC_DUNGEON3, BANK(Music_Dungeon3)                ; ROCK_TUNNEL_B1F
	db MUSIC_DUNGEON1, BANK(Music_Dungeon1)                ; POWER_PLANT
	db MUSIC_POKECENTER, BANK(Music_Pokecenter)            ; LAVENDER_POKECENTER_MART ; marcelnote - merged Lavender Pokecenter and Mart
	db MUSIC_LAVENDER, BANK(Music_Lavender)                ; MR_FUJIS_HOUSE
	db MUSIC_CITIES2, BANK(Music_Cities2)                  ; NAME_RATERS_HOUSE
	db MUSIC_LAVENDER, BANK(Music_Lavender)                ; LAVENDER_CUBONE_HOUSE
	db MUSIC_POKEMON_TOWER, BANK(Music_PokemonTower)       ; POKEMON_TOWER_1F
	db MUSIC_POKEMON_TOWER, BANK(Music_PokemonTower)       ; POKEMON_TOWER_2F
	db MUSIC_POKEMON_TOWER, BANK(Music_PokemonTower)       ; POKEMON_TOWER_3F
	db MUSIC_POKEMON_TOWER, BANK(Music_PokemonTower)       ; POKEMON_TOWER_4F
	db MUSIC_POKEMON_TOWER, BANK(Music_PokemonTower)       ; POKEMON_TOWER_5F
	db MUSIC_POKEMON_TOWER, BANK(Music_PokemonTower)       ; POKEMON_TOWER_6F
	db MUSIC_POKEMON_TOWER, BANK(Music_PokemonTower)       ; POKEMON_TOWER_7F
	db MUSIC_CITIES1, BANK(Music_Cities1)                  ; ROUTE_12_GATE                ; marcelnote - merged ROUTE_12_GATE floors
	db MUSIC_CITIES2, BANK(Music_Cities2)                  ; ROUTE_12_FISHING_GUIDE_HOUSE ; marcelnote - from Super Rod to Fishing Guide, chanegd from MUSIC_CELADON
	db MUSIC_POKECENTER, BANK(Music_Pokecenter)            ; CELADON_POKECENTER
	db MUSIC_POKECENTER, BANK(Music_Pokecenter)            ; CELADON_MART_1F2F3F          ; marcelnote - merged 1F 2F 3F
	db MUSIC_POKECENTER, BANK(Music_Pokecenter)            ; CELADON_MART_4F5F6F          ; marcelnote - merged 4F 5F + new 6F
	db MUSIC_POKECENTER, BANK(Music_Pokecenter)            ; CELADON_MART_ROOF
	db MUSIC_POKECENTER, BANK(Music_Pokecenter)            ; CELADON_MART_ELEVATOR
	db MUSIC_CELADON, BANK(Music_Celadon)                  ; CELADON_MANSION              ; marcelnote - merged Celadon Mansion floors, added 4F
	db MUSIC_CELADON, BANK(Music_Celadon)                  ; CELADON_MANSION_ROOF
	db MUSIC_CELADON, BANK(Music_Celadon)                  ; CELADON_MANSION_ROOF_HOUSE
	db MUSIC_GAME_CORNER, BANK(Music_GameCorner)           ; GAME_CORNER
	db MUSIC_CELADON, BANK(Music_Celadon)                  ; GAME_CORNER_PRIZE_ROOM
	db MUSIC_CELADON, BANK(Music_Celadon)                  ; CELADON_DINER
	db MUSIC_CELADON, BANK(Music_Celadon)                  ; CELADON_CHIEF_HOUSE
	db MUSIC_CELADON, BANK(Music_Celadon)                  ; CELADON_HOTEL
	db MUSIC_CELADON, BANK(Music_Celadon)                  ; CELADON_GROVE_SOUTH_GATE     ; marcelnote - was ROUTE_16_GATE_2F
	db MUSIC_GYM, BANK(Music_Gym)                          ; CELADON_GYM
	db MUSIC_DUNGEON1, BANK(Music_Dungeon1)                ; ROCKET_HIDEOUT_B1F
	db MUSIC_DUNGEON1, BANK(Music_Dungeon1)                ; ROCKET_HIDEOUT_B2F
	db MUSIC_DUNGEON1, BANK(Music_Dungeon1)                ; ROCKET_HIDEOUT_B3F
	db MUSIC_DUNGEON1, BANK(Music_Dungeon1)                ; ROCKET_HIDEOUT_B4F
	db MUSIC_DUNGEON1, BANK(Music_Dungeon1)                ; ROCKET_HIDEOUT_ELEVATOR
	db MUSIC_DUNGEON3, BANK(Music_Dungeon3)                ; CELADON_GROVE                ; marcelnote - new location
	db MUSIC_CITIES1, BANK(Music_Cities1)                  ; ROUTE_15_GATE                ; marcelnote - merged ROUTE_15_GATE floors
	db MUSIC_CITIES1, BANK(Music_Cities1)                  ; ROUTE_16_GATE                ; marcelnote - merged ROUTE_16_GATE floors
	db MUSIC_CELADON, BANK(Music_Celadon)                  ; ROUTE_16_FLY_HOUSE
	db MUSIC_CITIES1, BANK(Music_Cities1)                  ; ROUTE_18_GATE                ; marcelnote - merged ROUTE_18_GATE floors
	db MUSIC_POKECENTER, BANK(Music_Pokecenter)            ; SAFFRON_POKECENTER_MART      ; marcelnote - merged Saffron Pokecenter and Mart
	db MUSIC_CITIES1, BANK(Music_Cities1)                  ; COPYCATS_HOUSE               ; marcelnote - merged Copycat's house floors
	db MUSIC_CITIES1, BANK(Music_Cities1)                  ; FIGHTING_DOJO
	db MUSIC_CITIES1, BANK(Music_Cities1)                  ; SAFFRON_PIDGEY_HOUSE
	db MUSIC_CITIES1, BANK(Music_Cities1)                  ; MR_PSYCHICS_HOUSE
	db MUSIC_GYM, BANK(Music_Gym)                          ; SAFFRON_GYM
	db MUSIC_CITIES1, BANK(Music_Cities1)                  ; POKEMON_ACADEMY_1F2F ; marcelnote - new location
	db MUSIC_CITIES1, BANK(Music_Cities1)                  ; POKEMON_ACADEMY_3F4F ; marcelnote - new location
	db MUSIC_SILPH_CO, BANK(Music_SilphCo)                 ; SILPH_CO_1F
	db MUSIC_SILPH_CO, BANK(Music_SilphCo)                 ; SILPH_CO_2F
	db MUSIC_SILPH_CO, BANK(Music_SilphCo)                 ; SILPH_CO_3F
	db MUSIC_SILPH_CO, BANK(Music_SilphCo)                 ; SILPH_CO_4F
	db MUSIC_SILPH_CO, BANK(Music_SilphCo)                 ; SILPH_CO_5F
	db MUSIC_SILPH_CO, BANK(Music_SilphCo)                 ; SILPH_CO_6F
	db MUSIC_SILPH_CO, BANK(Music_SilphCo)                 ; SILPH_CO_7F
	db MUSIC_SILPH_CO, BANK(Music_SilphCo)                 ; SILPH_CO_8F
	db MUSIC_SILPH_CO, BANK(Music_SilphCo)                 ; SILPH_CO_9F
	db MUSIC_SILPH_CO, BANK(Music_SilphCo)                 ; SILPH_CO_10F
	db MUSIC_SILPH_CO, BANK(Music_SilphCo)                 ; SILPH_CO_11F
	db MUSIC_SILPH_CO, BANK(Music_SilphCo)                 ; SILPH_CO_ELEVATOR
	db MUSIC_POKECENTER, BANK(Music_Pokecenter)            ; FUCHSIA_POKECENTER_MART ; marcelnote - merged Fuchsia Pokecenter and Mart
	db MUSIC_CITIES2, BANK(Music_Cities2)                  ; FUCHSIA_BILLS_GRANDPAS_HOUSE
	db MUSIC_CITIES2, BANK(Music_Cities2)                  ; WARDENS_HOUSE
	db MUSIC_CITIES2, BANK(Music_Cities2)                  ; FUCHSIA_MEETING_ROOM
	db MUSIC_CITIES2, BANK(Music_Cities2)                  ; FUCHSIA_SUPER_ROD_HOUSE    ; marcelnote - from Good to Super Rod
	db MUSIC_CITIES2, BANK(Music_Cities2)                  ; FUCHSIA_MOVE_DELETER_HOUSE ; marcelnote - new location
	db MUSIC_GYM, BANK(Music_Gym)                          ; FUCHSIA_GYM
	db MUSIC_CITIES2, BANK(Music_Cities2)                  ; SAFARI_ZONE_GATE
	db MUSIC_SAFARI_ZONE, BANK(Music_SafariZone)           ; SAFARI_ZONE_EAST
	db MUSIC_SAFARI_ZONE, BANK(Music_SafariZone)           ; SAFARI_ZONE_NORTH
	db MUSIC_SAFARI_ZONE, BANK(Music_SafariZone)           ; SAFARI_ZONE_WEST
	db MUSIC_SAFARI_ZONE, BANK(Music_SafariZone)           ; SAFARI_ZONE_CENTER
	db MUSIC_SAFARI_ZONE, BANK(Music_SafariZone)           ; SAFARI_ZONE_CENTER_REST_HOUSE
	db MUSIC_SAFARI_ZONE, BANK(Music_SafariZone)           ; SAFARI_ZONE_SECRET_HOUSE
	db MUSIC_SAFARI_ZONE, BANK(Music_SafariZone)           ; SAFARI_ZONE_WEST_REST_HOUSE
	db MUSIC_SAFARI_ZONE, BANK(Music_SafariZone)           ; SAFARI_ZONE_EAST_REST_HOUSE
	db MUSIC_SAFARI_ZONE, BANK(Music_SafariZone)           ; SAFARI_ZONE_NORTH_REST_HOUSE
	db MUSIC_DUNGEON2, BANK(Music_Dungeon2)                ; SEAFOAM_ISLANDS_1F
	db MUSIC_DUNGEON2, BANK(Music_Dungeon2)                ; SEAFOAM_ISLANDS_B1F
	db MUSIC_DUNGEON2, BANK(Music_Dungeon2)                ; SEAFOAM_ISLANDS_B2F
	db MUSIC_DUNGEON2, BANK(Music_Dungeon2)                ; SEAFOAM_ISLANDS_B3F
	db MUSIC_DUNGEON2, BANK(Music_Dungeon2)                ; SEAFOAM_ISLANDS_B4F
	db MUSIC_POKECENTER, BANK(Music_Pokecenter)            ; CINNABAR_POKECENTER_MART   ; marcelnote - merged Cinnabar Pokecenter and Mart
	db MUSIC_CINNABAR, BANK(Music_Cinnabar)                ; CINNABAR_LAB               ; marcelnote - merged Cinnabar Lab maps
	db MUSIC_GYM, BANK(Music_Gym)                          ; CINNABAR_GYM
	db MUSIC_CINNABAR_MANSION, BANK(Music_CinnabarMansion) ; POKEMON_MANSION_1F
	db MUSIC_CINNABAR_MANSION, BANK(Music_CinnabarMansion) ; POKEMON_MANSION_2F
	db MUSIC_CINNABAR_MANSION, BANK(Music_CinnabarMansion) ; POKEMON_MANSION_3F
	db MUSIC_CINNABAR_MANSION, BANK(Music_CinnabarMansion) ; POKEMON_MANSION_B1F
	db MUSIC_DUNGEON2, BANK(Music_Dungeon2)                ; CINNABAR_VOLCANO_1FB1F   ; marcelnote - new location
	db MUSIC_DUNGEON2, BANK(Music_Dungeon2)                ; CINNABAR_VOLCANO_2F      ; marcelnote - new location
	db MUSIC_POKECENTER, BANK(Music_Pokecenter)            ; MANDARIN_POKECENTER_MART ; marcelnote - new location
	db MUSIC_CINNABAR, BANK(Music_Cinnabar)                ; MANDARIN_SURF_SHOP       ; marcelnote - new location
	db MUSIC_CINNABAR, BANK(Music_Cinnabar)                ; MANDARIN_HOTEL           ; marcelnote - new location
	db MUSIC_CINNABAR, BANK(Music_Cinnabar)                ; MANDARIN_SILPH_CO        ; marcelnote - new location
	db MUSIC_SS_ANNE, BANK(Music_SSAnne)                   ; MANDARIN_DOCK            ; marcelnote - new location
	db MUSIC_SS_ANNE, BANK(Music_SSAnne)                   ; ORANGE_FERRY_DECK        ; marcelnote - new location
	db MUSIC_SS_ANNE, BANK(Music_SSAnne)                   ; ORANGE_FERRY_OUTSIDE     ; marcelnote - new location
	db MUSIC_SS_ANNE, BANK(Music_SSAnne)                   ; ORANGE_FERRY_ROOMS       ; marcelnote - new location
	db MUSIC_CINNABAR_MANSION, BANK(Music_CinnabarMansion) ; SILPH_FACTORY_1F         ; marcelnote - new location
	db MUSIC_CINNABAR_MANSION, BANK(Music_CinnabarMansion) ; SILPH_FACTORY_2F         ; marcelnote - new location
	db MUSIC_CITIES2, BANK(Music_Cities2)                  ; ROUTE_22_OLD_ROD_HOUSE   ; marcelnote - new location
	db MUSIC_GYM, BANK(Music_Gym)                          ; ROUTE_22_GATE            ; marcelnote - changed from MUSIC_DUNGEON2
	db MUSIC_GYM, BANK(Music_Gym)                          ; ROUTE_22_GATE_3F         ; marcelnote - was ROUTE_12_GATE_2F
	db MUSIC_INDIGO_PLATEAU, BANK(Music_IndigoPlateau)     ; MT_SILVER_1F             ; marcelnote - new location
	db MUSIC_INDIGO_PLATEAU, BANK(Music_IndigoPlateau)     ; MT_SILVER_2F             ; marcelnote - new location
	db MUSIC_INDIGO_PLATEAU, BANK(Music_IndigoPlateau)     ; MT_SILVER_3F             ; marcelnote - new location
	db MUSIC_DUNGEON3, BANK(Music_Dungeon3)                ; VICTORY_ROAD_1F
	db MUSIC_DUNGEON3, BANK(Music_Dungeon3)                ; VICTORY_ROAD_2F
	db MUSIC_DUNGEON3, BANK(Music_Dungeon3)                ; VICTORY_ROAD_3F
	db MUSIC_INDIGO_PLATEAU, BANK(Music_IndigoPlateau)     ; INDIGO_PLATEAU_LOBBY
	db MUSIC_GYM, BANK(Music_Gym)                          ; LORELEIS_ROOM
	db MUSIC_DUNGEON1, BANK(Music_Dungeon1)                ; BRUNOS_ROOM
	db MUSIC_POKEMON_TOWER, BANK(Music_PokemonTower)       ; AGATHAS_ROOM
	db MUSIC_INDIGO_PLATEAU, BANK(Music_IndigoPlateau)     ; LANCES_ROOM
	db MUSIC_INDIGO_PLATEAU, BANK(Music_IndigoPlateau)     ; CHAMPIONS_ROOM
	db MUSIC_PALLET_TOWN, BANK(Music_PalletTown)           ; HALL_OF_FAME
	db MUSIC_CELADON, BANK(Music_Celadon)                  ; TRADE_CENTER
	db MUSIC_CELADON, BANK(Music_Celadon)                  ; COLOSSEUM
	assert_table_length NUM_MAPS
