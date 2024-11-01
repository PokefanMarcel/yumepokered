; GetBattleTransitionID_IsDungeonMap fails to recognize
; VICTORY_ROAD_2F, VICTORY_ROAD_3F, all ROCKET_HIDEOUT maps,
; POKEMON_MANSION_1F, SEAFOAM_ISLANDS_[B1F-B4F], POWER_PLANT,
; DIGLETTS_CAVE, and SILPH_CO_[9-11]F as dungeon maps

; GetBattleTransitionID_IsDungeonMap checks if wCurMap
; is equal to one of these maps
DungeonMaps1:
	db VIRIDIAN_FOREST
	; marcelnote - fix for aforementioned bug and adding new maps
	db DIGLETTS_CAVE
	db CELADON_GROVE
	db -1 ; end

; GetBattleTransitionID_IsDungeonMap checks if wCurMap
; is in between or equal to each pair of maps
DungeonMaps2: ; marcelnote - modified to fix aforementioned bug and account for new maps
	; all MT_MOON maps
	db MT_MOON_1F, MT_MOON_B2F
	; all SS_ANNE maps
	db SS_ANNE_1F, SS_ANNE_B1F_ROOMS
	; LANCES_ROOM, CHAMPIONS_ROOM, and HALL_OF_FAME
	db LANCES_ROOM, HALL_OF_FAME
	; all POKEMON_TOWER maps and Lavender Town buildings
	db LAVENDER_POKECENTER_MART, LAVENDER_CUBONE_HOUSE
	; all SEAFOAM_ISLANDS maps
	db SEAFOAM_ISLANDS_1F, SEAFOAM_ISLANDS_B4F
	; all ROCKET_HIDEOUT maps except ELEVATOR
	db ROCKET_HIDEOUT_B1F, ROCKET_HIDEOUT_B4F
	; all SAFARI_ZONE outdoor maps
	db SAFARI_ZONE_EAST, SAFARI_ZONE_CENTER
	; all CERULEAN_CAVE maps
	db CERULEAN_CAVE_2F, CERULEAN_CAVE_1F
	; all POKEMON_MANSION and CINNABAR_VOLCANO maps
	db POKEMON_MANSION_1F, CINNABAR_VOLCANO_2F
	; all SILPH_CO maps except ELEVATOR and 1F ; why not include 1F?
	db SILPH_CO_2F, SILPH_CO_11F
	; all MT_SILVER and VICTORY_ROAD maps
	db MT_SILVER_1F, VICTORY_ROAD_3F
	; all ROCK_TUNNEL maps, POWER_PLANT
	db ROCK_TUNNEL_1F, POWER_PLANT
	; all SILPH_FACTORY maps
	db SILPH_FACTORY_1F, SILPH_FACTORY_2F
	db -1 ; end
