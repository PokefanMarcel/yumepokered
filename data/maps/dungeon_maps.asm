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
	; all SS_ANNE maps, both CINNABAR_VOLCANO maps
	db SS_ANNE_1F, CINNABAR_VOLCANO_2F
	; LANCES_ROOM, both SILPH_FACTORY maps, and HALL_OF_FAME
	db LANCES_ROOM, HALL_OF_FAME
	; all POKEMON_TOWER maps and Lavender Town buildings
	db LAVENDER_POKECENTER_MART, LAVENDER_CUBONE_HOUSE
	; SEAFOAM_ISLANDS_[1-B1-B4]F
	db SEAFOAM_ISLANDS_1F, SEAFOAM_ISLANDS_B4F
	; all ROCKET_HIDEOUT maps
	db ROCKET_HIDEOUT_B1F, ROCKET_HIDEOUT_B4F
	; POKEMON_MANSION[1F-B1F], SAFARI_ZONE, and CERULEAN_CAVE maps
	db POKEMON_MANSION_1F, CERULEAN_CAVE_1F
	; SILPH_CO_[2-11]F
	db SILPH_CO_2F, SILPH_CO_11F
	; MT_SILVER_[1-3]F
	db MT_SILVER_1F, MT_SILVER_3F
	; VICTORY_ROAD_[1-3]F
	db VICTORY_ROAD_1F, VICTORY_ROAD_3F
	; ROCK_TUNNEL_[1-B1]F, POWER_PLANT
	db ROCK_TUNNEL_1F, POWER_PLANT
	db -1 ; end
