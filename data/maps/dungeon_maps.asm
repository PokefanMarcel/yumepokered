; GetBattleTransitionID_IsDungeonMap fails to recognize
; VICTORY_ROAD_2F, VICTORY_ROAD_3F, all ROCKET_HIDEOUT maps,
; POKEMON_MANSION_1F, SEAFOAM_ISLANDS_[B1F-B4F], POWER_PLANT,
; DIGLETTS_CAVE, and SILPH_CO_[9-11]F as dungeon maps

; marcelnote - this is used to determine the visual battle transition
;              was extensively changed with new map constants order and fixing comment above

; GetBattleTransitionID_IsDungeonMap checks if wCurMap
; is equal to one of these maps
DungeonMaps1:
	db VIRIDIAN_FOREST
	db LANCES_ROOM
	db -1 ; end

; GetBattleTransitionID_IsDungeonMap checks if wCurMap
; is in between or equal to each pair of maps
DungeonMaps2: ; marcelnote - modified to fix above comment and account for new maps
	db MT_MOON_1F, MT_MOON_B2F                  ; all MT_MOON maps
	db CERULEAN_CAVE_1F, CERULEAN_CAVE_B1F      ; all CERULEAN_CAVE maps
	db SS_ANNE_1F, DIGLETTS_CAVE                ; all SS_ANNE maps and DIGLETTS_CAVE
	db ROCK_TUNNEL_1F, POWER_PLANT              ; all ROCK_TUNNEL maps and POWER_PLANT
	db POKEMON_TOWER_1F, POKEMON_TOWER_7F       ; all POKEMON_TOWER maps
	db ROCKET_HIDEOUT_B1F, CELADON_GROVE        ; all ROCKET_HIDEOUT maps and CELADON_GROVE
	db SILPH_CO_2F, SILPH_CO_11F                ; all SILPH_CO maps except ELEVATOR and 1F
	db SAFARI_ZONE_EAST, SAFARI_ZONE_CENTER     ; all SAFARI_ZONE outdoor maps
	db SEAFOAM_ISLANDS_1F, SEAFOAM_ISLANDS_B4F  ; all SEAFOAM_ISLANDS maps
	db POKEMON_MANSION_1F, CINNABAR_VOLCANO_2F  ; all POKEMON_MANSION and CINNABAR_VOLCANO maps
	db SILPH_FACTORY_1F, SILPH_FACTORY_2F       ; all SILPH_FACTORY maps
	db MT_SILVER_1F, VICTORY_ROAD_3F            ; all MT_SILVER and VICTORY_ROAD maps
	db -1 ; end
