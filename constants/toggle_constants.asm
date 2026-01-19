DEF OFF EQU $11
DEF ON  EQU $15

;MACRO toggle_consts_for ; marcelnote - was added to pokered
;	DEF TOGGLEMAP{\1}_ID EQU const_value
;	DEF TOGGLEMAP{\1}_NAME EQUS "\1"
;ENDM

; ToggleableObjectStates indexes (see data/maps/toggleable_objects.asm)
; This lists the object_events that can be toggled by ShowObject/HideObject.
; The constants marked with an X are never used, because those object_events
; are not toggled on/off in any map's script.
; (The X-ed ones are either items or static Pokemon encounters that deactivate
; after battle and are detected in wToggleableObjectList.)

	const_def
	const TOGGLE_PALLET_TOWN_OAK               ; 00
	const TOGGLE_LYING_OLD_MAN                 ; 01
	const TOGGLE_OLD_MAN                       ; 02
	const TOGGLE_MUSEUM_GUY                    ; 03
	const TOGGLE_GYM_GUY                       ; 04
	const TOGGLE_CERULEAN_RIVAL                ; 05
	const TOGGLE_CERULEAN_ROCKET               ; 06
	const TOGGLE_CERULEAN_GUARD_1              ; 07
	const TOGGLE_CERULEAN_CAVE_GUY             ; 08
	const TOGGLE_CERULEAN_GUARD_2              ; 09
	const TOGGLE_ROUTE_2_ITEM_1                ; 19 X
	const TOGGLE_ROUTE_2_ITEM_2                ; 1A X
	const TOGGLE_ROUTE_4_ITEM                  ; 1B X
	const TOGGLE_ROUTE_9_ITEM                  ; 1C X
	const TOGGLE_ROUTE_12_SNORLAX              ; 1D
	const TOGGLE_ROUTE_12_ITEM_1               ; 1E X
	const TOGGLE_ROUTE_12_ITEM_2               ; 1F X
	const TOGGLE_ROUTE_15_ITEM                 ; 20 X
	const TOGGLE_ROUTE_16_SNORLAX              ; 21
	const TOGGLE_ROUTE_22_RIVAL_1              ; 22
	const TOGGLE_ROUTE_22_RIVAL_2              ; 23
	const TOGGLE_NUGGET_BRIDGE_GUY             ; 24
	const TOGGLE_ROUTE_24_ITEM                 ; 25 X
	const TOGGLE_ROUTE_25_ITEM                 ; 26 X
	const TOGGLE_DAISY_SITTING                 ; 27
	const TOGGLE_DAISY_WALKING                 ; 28
	const TOGGLE_TOWN_MAP                      ; 29
	const TOGGLE_OAKS_LAB_RIVAL                ; 2A
	const TOGGLE_STARTER_BALL_1                ; 2B
	const TOGGLE_STARTER_BALL_2                ; 2C
	const TOGGLE_STARTER_BALL_3                ; 2D
	const TOGGLE_OAKS_LAB_OAK                  ; 2E
	const TOGGLE_POKEDEX_1                     ; 2F
	const TOGGLE_POKEDEX_2                     ; 30
	const TOGGLE_OAKS_LAB_OAK_WALKING          ; 31
	const TOGGLE_VIRIDIAN_GYM_GIOVANNI         ; 32
	const TOGGLE_VIRIDIAN_GYM_ITEM             ; 33 X
	const TOGGLE_OLD_AMBER                     ; 34
	const TOGGLE_CERULEAN_CAVE_1F_ITEM_1       ; 35 X
	const TOGGLE_CERULEAN_CAVE_1F_ITEM_2       ; 36 X
	const TOGGLE_CERULEAN_CAVE_1F_ITEM_3       ; 37 X
	const TOGGLE_POKEMON_TOWER_1F_AGATHA       ; 39 ; marcelnote - postgame Agatha
	const TOGGLE_POKEMON_TOWER_1F_GENTLEMAN    ; 39bis ; marcelnote - postgame Agatha
	const TOGGLE_POKEMON_TOWER_2F_RIVAL        ; 3A
	const TOGGLE_POKEMON_TOWER_3F_ITEM         ; 3B X
	const TOGGLE_POKEMON_TOWER_4F_ITEM_1       ; 3C X
	const TOGGLE_POKEMON_TOWER_4F_ITEM_2       ; 3D X
	const TOGGLE_POKEMON_TOWER_4F_ITEM_3       ; 3E X
	const TOGGLE_POKEMON_TOWER_5F_ITEM         ; 3F X
	const TOGGLE_POKEMON_TOWER_6F_AGATHA       ; 3Fbis X ; marcelnote - postgame Agatha
	const TOGGLE_POKEMON_TOWER_6F_ITEM_1       ; 40 X
	const TOGGLE_POKEMON_TOWER_6F_ITEM_2       ; 41 X
	const TOGGLE_POKEMON_TOWER_7F_ROCKET_1     ; 42 X
	const TOGGLE_POKEMON_TOWER_7F_ROCKET_2     ; 43 X
	const TOGGLE_POKEMON_TOWER_7F_ROCKET_3     ; 44 X
	const TOGGLE_POKEMON_TOWER_7F_MR_FUJI      ; 45
	const TOGGLE_POKEMON_TOWER_7F_CHANNELER    ; 46 ; marcelnote - 7FChanneler
	const TOGGLE_MR_FUJIS_HOUSE_MR_FUJI        ; 47
	const TOGGLE_CELADON_MANSION_EEVEE_GIFT    ; 48
	const TOGGLE_GAME_CORNER_ROCKET            ; 49
	const TOGGLE_WARDENS_HOUSE_ITEM            ; 4A X
	const TOGGLE_POKEMON_MANSION_1F_ITEM_1     ; 4B X
	const TOGGLE_POKEMON_MANSION_1F_ITEM_2     ; 4C X
	const TOGGLE_FIGHTING_DOJO_BRUNO           ; 4D ; marcelnote - postgame Bruno
	const TOGGLE_FIGHTING_DOJO_GIFT_1          ; 4E
	const TOGGLE_FIGHTING_DOJO_GIFT_2          ; 4F
	const TOGGLE_VOLTORB_1                     ; 51 X
	const TOGGLE_VOLTORB_2                     ; 52 X
	const TOGGLE_VOLTORB_3                     ; 53 X
	const TOGGLE_ELECTRODE_1                   ; 54 X
	const TOGGLE_VOLTORB_4                     ; 55 X
	const TOGGLE_VOLTORB_5                     ; 56 X
	const TOGGLE_ELECTRODE_2                   ; 57 X
	const TOGGLE_VOLTORB_6                     ; 58 X
	const TOGGLE_ZAPDOS                        ; 59 X
	const TOGGLE_POWER_PLANT_ITEM_1            ; 5A X
	const TOGGLE_POWER_PLANT_ITEM_2            ; 5B X
	const TOGGLE_POWER_PLANT_ITEM_3            ; 5C X
	const TOGGLE_POWER_PLANT_ITEM_4            ; 5D X
	const TOGGLE_POWER_PLANT_ITEM_5            ; 5E X
	const TOGGLE_POWER_PLANT_ITEM_6            ; 5F X ; marcelnote - new ThunderStone
	;const TOGGLE_MOLTRES                      ; 5F X ; marcelnote - removed Moltres from Victory Road
	const TOGGLE_VICTORY_ROAD_2F_ITEM_1        ; 60 X
	const TOGGLE_VICTORY_ROAD_2F_ITEM_2        ; 61 X
	const TOGGLE_VICTORY_ROAD_2F_ITEM_3        ; 62 X
	const TOGGLE_VICTORY_ROAD_2F_ITEM_4        ; 63 X
	const TOGGLE_VICTORY_ROAD_2F_BOULDER       ; 64
	const TOGGLE_BILL_POKEMON                  ; 65
	const TOGGLE_BILL_1                        ; 66
	const TOGGLE_BILL_2                        ; 67
	const TOGGLE_VIRIDIAN_FOREST_ITEM_1        ; 68 X
	const TOGGLE_VIRIDIAN_FOREST_ITEM_2        ; 69 X
	const TOGGLE_VIRIDIAN_FOREST_ITEM_3        ; 6A X
	const TOGGLE_MT_MOON_1F_ITEM_1             ; 6B X
	const TOGGLE_MT_MOON_1F_ITEM_2             ; 6C X
	const TOGGLE_MT_MOON_1F_ITEM_3             ; 6D X
	const TOGGLE_MT_MOON_1F_ITEM_4             ; 6E X
	const TOGGLE_MT_MOON_1F_ITEM_5             ; 6F X
	const TOGGLE_MT_MOON_1F_ITEM_6             ; 70 X
	const TOGGLE_MT_MOON_B2F_FOSSIL_1          ; 71
	const TOGGLE_MT_MOON_B2F_FOSSIL_2          ; 72
	const TOGGLE_MT_MOON_B2F_ITEM_1            ; 73 X
	const TOGGLE_MT_MOON_B2F_ITEM_2            ; 74 X
	const TOGGLE_SS_ANNE_2F_RIVAL              ; 75
	const TOGGLE_SS_ANNE_1F_ROOMS_ITEM         ; 76 X
	const TOGGLE_SS_ANNE_2F_ROOMS_ITEM_1       ; 77 X
	const TOGGLE_SS_ANNE_2F_ROOMS_ITEM_2       ; 78 X
	const TOGGLE_SS_ANNE_B1F_ROOMS_ITEM_1      ; 79 X
	const TOGGLE_SS_ANNE_B1F_ROOMS_ITEM_2      ; 7A X
	const TOGGLE_SS_ANNE_B1F_ROOMS_ITEM_3      ; 7B X
	const TOGGLE_VICTORY_ROAD_3F_ITEM_1        ; 7C X
	const TOGGLE_VICTORY_ROAD_3F_ITEM_2        ; 7D X
	const TOGGLE_VICTORY_ROAD_3F_BOULDER       ; 7E
	const TOGGLE_ROCKET_HIDEOUT_B1F_ITEM_1     ; 7F X
	const TOGGLE_ROCKET_HIDEOUT_B1F_ITEM_2     ; 80 X
	const TOGGLE_ROCKET_HIDEOUT_B2F_ITEM_1     ; 81 X
	const TOGGLE_ROCKET_HIDEOUT_B2F_ITEM_2     ; 82 X
	const TOGGLE_ROCKET_HIDEOUT_B2F_ITEM_3     ; 83 X
	const TOGGLE_ROCKET_HIDEOUT_B2F_ITEM_4     ; 84 X
	const TOGGLE_ROCKET_HIDEOUT_B3F_ITEM_1     ; 85 X
	const TOGGLE_ROCKET_HIDEOUT_B3F_ITEM_2     ; 86 X
	const TOGGLE_ROCKET_HIDEOUT_B4F_GIOVANNI   ; 87
	const TOGGLE_ROCKET_HIDEOUT_B4F_ITEM_1     ; 88 X
	const TOGGLE_ROCKET_HIDEOUT_B4F_ITEM_2     ; 89 X
	const TOGGLE_ROCKET_HIDEOUT_B4F_ITEM_3     ; 8A X
	const TOGGLE_ROCKET_HIDEOUT_B4F_ITEM_4     ; 8B
	const TOGGLE_ROCKET_HIDEOUT_B4F_ITEM_5     ; 8C
;	const TOGGLE_SILPH_CO_2F_1                 ; 8C XXX never (de)activated? ; marcelnote - removed (TM_SELFDESTRUCT woman)
	const TOGGLE_SILPH_CO_2F_2                 ; 8D
	const TOGGLE_SILPH_CO_2F_3                 ; 8E
	const TOGGLE_SILPH_CO_2F_4                 ; 8F
	const TOGGLE_SILPH_CO_2F_5                 ; 90
	const TOGGLE_SILPH_CO_3F_1                 ; 91
	const TOGGLE_SILPH_CO_3F_2                 ; 92
	const TOGGLE_SILPH_CO_3F_ITEM              ; 93 X
	const TOGGLE_SILPH_CO_4F_1                 ; 94
	const TOGGLE_SILPH_CO_4F_2                 ; 95
	const TOGGLE_SILPH_CO_4F_3                 ; 96
	const TOGGLE_SILPH_CO_4F_ITEM_1            ; 97 X
	const TOGGLE_SILPH_CO_4F_ITEM_2            ; 98 X
	const TOGGLE_SILPH_CO_4F_ITEM_3            ; 99 X
	const TOGGLE_SILPH_CO_5F_1                 ; 9A
	const TOGGLE_SILPH_CO_5F_2                 ; 9B
	const TOGGLE_SILPH_CO_5F_3                 ; 9C
	const TOGGLE_SILPH_CO_5F_4                 ; 9D
	const TOGGLE_SILPH_CO_5F_ITEM_1            ; 9E X
	const TOGGLE_SILPH_CO_5F_ITEM_2            ; 9F X
	const TOGGLE_SILPH_CO_5F_ITEM_3            ; A0 X
	const TOGGLE_SILPH_CO_6F_1                 ; A1
	const TOGGLE_SILPH_CO_6F_2                 ; A2
	const TOGGLE_SILPH_CO_6F_3                 ; A3
	const TOGGLE_SILPH_CO_6F_ITEM_1            ; A4 X
	const TOGGLE_SILPH_CO_6F_ITEM_2            ; A5 X
	const TOGGLE_SILPH_CO_7F_1                 ; A6
	const TOGGLE_SILPH_CO_7F_2                 ; A7
	const TOGGLE_SILPH_CO_7F_3                 ; A8
	const TOGGLE_SILPH_CO_7F_4                 ; A9
	const TOGGLE_SILPH_CO_7F_RIVAL             ; AA
	const TOGGLE_SILPH_CO_7F_ITEM_1            ; AB X
	const TOGGLE_SILPH_CO_7F_ITEM_2            ; AC X
;	const TOGGLE_SILPH_CO_7F_8                 ; AC XXX sprite doesn't exist ; marcelnote - removed
	const TOGGLE_SILPH_CO_8F_1                 ; AD
	const TOGGLE_SILPH_CO_8F_2                 ; AE
	const TOGGLE_SILPH_CO_8F_3                 ; AF
	const TOGGLE_SILPH_CO_9F_1                 ; B0
	const TOGGLE_SILPH_CO_9F_2                 ; B1
	const TOGGLE_SILPH_CO_9F_3                 ; B2
	const TOGGLE_SILPH_CO_10F_1                ; B3
	const TOGGLE_SILPH_CO_10F_2                ; B4
;	const TOGGLE_SILPH_CO_10F_3                ; B4 XXX never (de)activated? ; marcelnote - removed
	const TOGGLE_SILPH_CO_10F_ITEM_1           ; B5 X
	const TOGGLE_SILPH_CO_10F_ITEM_2           ; B6 X
	const TOGGLE_SILPH_CO_10F_ITEM_3           ; B7 X
	const TOGGLE_SILPH_CO_11F_1                ; B8
	const TOGGLE_SILPH_CO_11F_2                ; B9
	const TOGGLE_SILPH_CO_11F_3                ; BA
;	const TOGGLE_UNUSED_MAP_F4_1               ; BA XXX sprite doesn't exist ; marcelnote - removed
	const TOGGLE_POKEMON_MANSION_2F_ITEM       ; BB X
	const TOGGLE_POKEMON_MANSION_3F_ITEM_1     ; BC X
	const TOGGLE_POKEMON_MANSION_3F_ITEM_2     ; BD X
	const TOGGLE_POKEMON_MANSION_B1F_ITEM_1    ; BE X
	const TOGGLE_POKEMON_MANSION_B1F_ITEM_2    ; BF X
	const TOGGLE_POKEMON_MANSION_B1F_ITEM_3    ; C0 X
	const TOGGLE_POKEMON_MANSION_B1F_ITEM_4    ; C1 X
	const TOGGLE_POKEMON_MANSION_B1F_ITEM_5    ; C2 X
	const TOGGLE_POKEMON_MANSION_B1F_FUJIS_NOTES ; marcelnote - new
	const TOGGLE_POKEMON_MANSION_B1F_HP_UP     ; marcelnote - new
	const TOGGLE_SAFARI_ZONE_EAST_ITEM_1       ; C3 X
	const TOGGLE_SAFARI_ZONE_EAST_ITEM_2       ; C4 X
	const TOGGLE_SAFARI_ZONE_EAST_ITEM_3       ; C5 X
	const TOGGLE_SAFARI_ZONE_EAST_ITEM_4       ; C6 X
	const TOGGLE_SAFARI_ZONE_NORTH_ITEM_1      ; C7 X
	const TOGGLE_SAFARI_ZONE_NORTH_ITEM_2      ; C8 X
	const TOGGLE_SAFARI_ZONE_WEST_ITEM_1       ; C9 X
	const TOGGLE_SAFARI_ZONE_WEST_ITEM_2       ; CA X
	const TOGGLE_SAFARI_ZONE_WEST_ITEM_3       ; CB X
	const TOGGLE_SAFARI_ZONE_WEST_ITEM_4       ; CC X
	const TOGGLE_SAFARI_ZONE_CENTER_ITEM       ; CD X
	const TOGGLE_CERULEAN_CAVE_2F_ITEM_1       ; CE X
	const TOGGLE_CERULEAN_CAVE_2F_ITEM_2       ; CF X
	const TOGGLE_CERULEAN_CAVE_2F_ITEM_3       ; D0 X
	const TOGGLE_MEWTWO                        ; D1 X
	const TOGGLE_CERULEAN_CAVE_B1F_ITEM_1      ; D2 X
	const TOGGLE_CERULEAN_CAVE_B1F_ITEM_2      ; D3 X
	const TOGGLE_VICTORY_ROAD_1F_ITEM_1        ; D4 X
	const TOGGLE_VICTORY_ROAD_1F_ITEM_2        ; D5 X
	const TOGGLE_SEAFOAM_ISLANDS_1F_BOULDER_1  ; D9
	const TOGGLE_SEAFOAM_ISLANDS_1F_BOULDER_2  ; DA
	const TOGGLE_SEAFOAM_ISLANDS_B1F_BOULDER_1 ; DB
	const TOGGLE_SEAFOAM_ISLANDS_B1F_BOULDER_2 ; DC
	const TOGGLE_SEAFOAM_ISLANDS_B2F_WATER_STONE ; DC bis ; marcelnote - new
	const TOGGLE_SEAFOAM_ISLANDS_B2F_BOULDER_1 ; DD
	const TOGGLE_SEAFOAM_ISLANDS_B2F_BOULDER_2 ; DE
	const TOGGLE_SEAFOAM_ISLANDS_B3F_BOULDER_1 ; DF
	const TOGGLE_SEAFOAM_ISLANDS_B3F_BOULDER_2 ; E0
	const TOGGLE_SEAFOAM_ISLANDS_B3F_BOULDER_3 ; E1
	const TOGGLE_SEAFOAM_ISLANDS_B3F_BOULDER_4 ; E2
	const TOGGLE_SEAFOAM_ISLANDS_B4F_BOULDER_1 ; E3
	const TOGGLE_SEAFOAM_ISLANDS_B4F_BOULDER_2 ; E4
	const TOGGLE_ARTICUNO                      ; E5 X
	const TOGGLE_MT_MOON_SQUARE_CLEFAIRY       ; E6 ; marcelnote - Clefairy
	const TOGGLE_MT_MOON_SQUARE_ITEM_1         ; E7 ; marcelnote - Moon Stone
	const TOGGLE_MT_MOON_SQUARE_ITEM_2         ; E8 ; marcelnote - Super Potion
	const TOGGLE_CINNABAR_VOLCANO_B1F_CHARIZARD; EB ; marcelnote - postgame Charizard
	const TOGGLE_CINNABAR_VOLCANO_B1F_LANCE    ; EC ; marcelnote - postgame Lance B1F
	const TOGGLE_CINNABAR_VOLCANO_B1F_ITEM_1   ; ED ; marcelnote - Iron
	const TOGGLE_CINNABAR_VOLCANO_B1F_ITEM_2   ; EE ; marcelnote - Ice Heal
	const TOGGLE_CINNABAR_VOLCANO_1F_LANCE     ; EF ; marcelnote - postgame Lance 1F
	const TOGGLE_CINNABAR_VOLCANO_1F_ITEM_1    ; F0 ; marcelnote - Full Restore
	const TOGGLE_CINNABAR_VOLCANO_2F_MOLTRES   ; F1 ; marcelnote - Moltres
	const TOGGLE_CINNABAR_VOLCANO_2F_ITEM_1    ; F2 ; marcelnote - Fire Stone
	const TOGGLE_CINNABAR_VOLCANO_2F_ITEM_2    ; F3 ; marcelnote - Ultra Ball
	const TOGGLE_CINNABAR_VOLCANO_2F_ITEM_3    ; F4 ; marcelnote - Nugget
	const TOGGLE_MANDARIN_HOTEL_ITEM_1              ; marcelnote - Max Elixir
	const TOGGLE_CELADON_GROVE_MEW                  ; marcelnote - Mew
	const TOGGLE_CELADON_GROVE_ITEM_1               ; marcelnote - Leaf Stone
	const TOGGLE_CELADON_GROVE_ITEM_2               ; marcelnote - Great Ball
	const TOGGLE_SILPH_FACTORY_1F_ROCKET_1          ; marcelnote - Rocket 1
	const TOGGLE_SILPH_FACTORY_1F_ROCKET_2          ; marcelnote - Rocket 2
	const TOGGLE_SILPH_FACTORY_1F_ROCKET_3          ; marcelnote - Rocket 3
	const TOGGLE_SILPH_FACTORY_1F_ROCKET_4          ; marcelnote - Rocket 4
	const TOGGLE_SILPH_FACTORY_1F_ITEM_1            ; marcelnote - Rare Candy
	const TOGGLE_SILPH_FACTORY_1F_ITEM_2            ; marcelnote - Carbos
	const TOGGLE_MT_SILVER_1F_PROTEIN               ; marcelnote - Protein
	const TOGGLE_MT_SILVER_1F_ESCAPE_ROPE           ; marcelnote - Escape Rope
	const TOGGLE_MT_SILVER_1F_ULTRA_BALL            ; marcelnote - Ultra Ball
	const TOGGLE_MT_SILVER_1F_MAX_ELIXIR            ; marcelnote - Max Elixir
	const TOGGLE_MT_SILVER_2F_PP_UP                 ; marcelnote - PP Up
	const TOGGLE_MT_SILVER_2F_CALCIUM               ; marcelnote - Calcium
	const TOGGLE_MT_SILVER_2F_ULTRA_BALL            ; marcelnote - Ultra Ball
	const TOGGLE_MT_SILVER_2F_MAX_REVIVE            ; marcelnote - Max Revive
	const TOGGLE_MT_SILVER_2F_FULL_RESTORE          ; marcelnote - Full Restore
DEF NUM_TOGGLEABLE_OBJECTS EQU const_value
	; max objects = 256
	; current total = 263 – 11 – 5 (end - start - commented out) = 247

; marcelnote - the list continues here to allow for more than 256 HideShow objects
;              but cannot put items which can be picked up
	const_def
	const TOGGLE_REDS_YELLOWS_HOUSES_DAD1        ; Dad unpacking
	const TOGGLE_REDS_YELLOWS_HOUSES_DAD2        ; Dad sitting
	const TOGGLE_REDS_YELLOWS_HOUSES_ASLEEP      ; Yellow asleep
	const TOGGLE_REDS_YELLOWS_HOUSES_YELLOW      ; Yellow
	const TOGGLE_ROUTE_1_OAK                     ; postgame Oak battle
	const TOGGLE_PEWTER_GYM_BROCK                ; default Brock
	const TOGGLE_PEWTER_GYM_BROCK_REMATCH        ; rematch Brock
	const TOGGLE_CERULEAN_GYM_MISTY              ; default Misty
	const TOGGLE_CERULEAN_GYM_MISTY_REMATCH      ; rematch Misty
	const TOGGLE_VERMILION_CITY_SAILOR2          ; SS Anne sailor who disappears
	const TOGGLE_VERMILION_CITY_COOLTRAINER_F    ; girl on harbor who mentions Mandarin
	const TOGGLE_VERMILION_GYM_LT_SURGE          ; default Lt.Surge
	const TOGGLE_VERMILION_GYM_LT_SURGE_REMATCH  ; rematch Lt.Surge
	const TOGGLE_VERMILION_DOCK_SAILOR           ; sailor at Ferry entrance
	const TOGGLE_CELADON_GYM_ERIKA               ; default Erika
	const TOGGLE_CELADON_GYM_ERIKA_REMATCH       ; rematch Erika
	const TOGGLE_CELADON_GROVE_SOUTH_GATE_ROCKET ; blocking the way
	const TOGGLE_FUCHSIA_GYM_KOGA                ; default Koga
	const TOGGLE_FUCHSIA_GYM_KOGA_REMATCH        ; rematch Koga
	const TOGGLE_SAFFRON_CITY_1                ; 0A
	const TOGGLE_SAFFRON_CITY_2                ; 0B
	const TOGGLE_SAFFRON_CITY_3                ; 0C
	const TOGGLE_SAFFRON_CITY_4                ; 0D
	const TOGGLE_SAFFRON_CITY_5                ; 0E
	const TOGGLE_SAFFRON_CITY_6                ; 0F
	const TOGGLE_SAFFRON_CITY_7                ; 10
	const TOGGLE_SAFFRON_CITY_8                ; 11
	const TOGGLE_SAFFRON_CITY_9                ; 12
	const TOGGLE_SAFFRON_CITY_A                ; 13
	const TOGGLE_SAFFRON_CITY_B                ; 14
	const TOGGLE_SAFFRON_CITY_C                ; 15
	const TOGGLE_SAFFRON_CITY_D                ; 16
	const TOGGLE_SAFFRON_CITY_E                ; 17 ; Silph Co guard
	const TOGGLE_SAFFRON_CITY_F                ; 18 ; Silph Co guard asleep
	const TOGGLE_SAFFRON_GYM_SABRINA             ; default Sabrina
	const TOGGLE_SAFFRON_GYM_SABRINA_REMATCH     ; rematch Sabrina
	const TOGGLE_SAFFRON_GYM_WILL                ; postgame Will
	const TOGGLE_SAFFRON_GYM_BRUNO               ; postgame Bruno
	const TOGGLE_SILPH_CO_1F_RECEPTIONIST        ; Silph Co 1F receptionist
	const TOGGLE_CINNABAR_GYM_BLAINE             ; default Blaine
	const TOGGLE_CINNABAR_GYM_BLAINE_REMATCH     ; rematch Blaine
	const TOGGLE_MANDARIN_SILPH_CO_SCIENTIST     ; worried Scientist
	const TOGGLE_MANDARIN_DOCK_SAILOR            ; sailor at Ferry entrance
	const TOGGLE_CITRUS_FERRY_ROOMS_FOSSIL       ; Dome or Helix fossil
	const TOGGLE_SILPH_FACTORY_2F_SCIENTIST_1    ; scientist blocking the way
	const TOGGLE_SILPH_FACTORY_2F_LORELEI_1      ; postgame Lorelei
	const TOGGLE_SILPH_FACTORY_2F_ROCKET_1       ; Archer
	const TOGGLE_SILPH_FACTORY_2F_LORELEI_2      ; postgame Lorelei
	const TOGGLE_BATTLE_HALL_RED                 ; battle hall Red
	const TOGGLE_BATTLE_HALL_GREEN               ; battle hall Green
	const TOGGLE_INDIGO_PLATEAU_LOBBY_GIRL1      ; now moves after first defeating E4
	const TOGGLE_INDIGO_PLATEAU_LOBBY_GIRL2      ; blocks way after first defeating E4
	const TOGGLE_INDIGO_PLATEAU_LOBBY_RIVAL      ; appears after E4 reopens
	const TOGGLE_LORELEIS_ROOM_LORELEI           ; added for Lorelei rematch
	const TOGGLE_LORELEIS_ROOM_LORELEI_REMATCH   ; added for Lorelei rematch
	const TOGGLE_BRUNOS_ROOM_BRUNO               ; added for Bruno rematch
	const TOGGLE_BRUNOS_ROOM_BRUNO_REMATCH       ; added for Bruno rematch
	const TOGGLE_AGATHAS_ROOM_AGATHA             ; added for Agatha rematch
	const TOGGLE_AGATHAS_ROOM_AGATHA_REMATCH     ; added for Agatha rematch
	const TOGGLE_LANCES_ROOM_LANCE               ; added for Lance rematch
	const TOGGLE_LANCES_ROOM_LANCE_REMATCH       ; added for Lance rematch
	const TOGGLE_CHAMPIONS_ROOM_OAK              ;
	const TOGGLE_CHAMPIONS_ROOM_RIVAL            ; added for Rival rematch
	const TOGGLE_HALL_OF_FAME_OAK                ; first victory only
	const TOGGLE_HALL_OF_FAME_RIVAL              ; for Rival rematches
	const TOGGLE_MT_SILVER_3F_YELLOW             ; for Yellow battle
DEF NUM_TOGGLEABLE_OBJECTS_CONT EQU const_value
	; max objects = 256
	; current total = 336 – 270 = 66
