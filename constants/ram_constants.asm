; wSlotMachineFlags
	const_def 6
	const BIT_SLOTS_CAN_WIN               ; 6
	const BIT_SLOTS_CAN_WIN_WITH_7_OR_BAR ; 7

; wMiscFlags
	const_def
	const BIT_SEEN_BY_TRAINER      ; 0
	const BIT_BOULDER_DUST         ; 1
	const BIT_TURNING              ; 2
	const BIT_USING_GENERIC_PC     ; 3
	const BIT_NO_SPRITE_UPDATES    ; 4
	const BIT_NO_MENU_BUTTON_SOUND ; 5
	const BIT_TRIED_PUSH_BOULDER   ; 6
	const BIT_PUSHED_BOULDER       ; 7

; wAutoTextBoxDrawingControl
DEF BIT_NO_AUTO_TEXT_BOX EQU 0

; wTextPredefFlag
DEF BIT_TEXT_PREDEF EQU 0

; wFontLoaded
DEF BIT_FONT_LOADED EQU 0

; wCurrentMapScriptFlags
	const_def 5
	const BIT_CUR_MAP_LOADED_1 ; 5
	const BIT_CUR_MAP_LOADED_2 ; 6
	const BIT_CUR_MAP_USED_ELEVATOR ; 7

; wOptions
DEF TEXT_DELAY_MASK EQU %11 ; marcelnote - changed from %111 = 7
	const_def 4                ; 0-1 are for text delay
	; marcelnote - bits 2-3 are free
	const BIT_60_FPS           ; 4 ; marcelnote - new 60fps option
	const BIT_UNITS_METRIC     ; 5 ; marcelnote - new metric / imperial option
	const BIT_BATTLE_SET       ; 6
	const BIT_BATTLE_ANIM_OFF  ; 7

DEF TEXT_DELAY_INSTANT EQU 0 ; 0  ; marcelnote - new
DEF TEXT_DELAY_FAST    EQU 1 ; 1  ; marcelnote - changed from %001 = 1
DEF TEXT_DELAY_MEDIUM  EQU 2 ; 2  ; marcelnote - changed from %011 = 3
DEF TEXT_DELAY_SLOW    EQU 3 ; 3  ; marcelnote - changed from %101 = 5

; wLetterPrintingDelayFlags
	const_def
	const BIT_FAST_TEXT_DELAY ; 0
	const BIT_TEXT_DELAY      ; 1

; wCurMapTileset
DEF BIT_NO_PREVIOUS_MAP EQU 7

; wCurrentBoxNum
DEF BIT_HAS_CHANGED_BOXES EQU 7
DEF BOX_NUM_MASK EQU %01111111

; wObtainedBadges, wBeatGymFlags
	const_def
	const BIT_BOULDERBADGE ; 0
	const BIT_CASCADEBADGE ; 1
	const BIT_THUNDERBADGE ; 2
	const BIT_RAINBOWBADGE ; 3
	const BIT_SOULBADGE    ; 4
	const BIT_MARSHBADGE   ; 5
	const BIT_VOLCANOBADGE ; 6
	const BIT_EARTHBADGE   ; 7
DEF NUM_BADGES EQU const_value

; wStatusFlags1
	const_def
	const BIT_STRENGTH_ACTIVE ; 0
	const BIT_SURF_ALLOWED    ; 1
	const BIT_EXP_ALL_ACTIVE  ; 2 ; marcelnote - ExpAll can be activated/deactivated (was unused bit)
	const BIT_GOT_OLD_ROD     ; 3
	const BIT_GOT_GOOD_ROD    ; 4
	const BIT_GOT_SUPER_ROD   ; 5
	const_skip                ; 6 ; marcelnote - unused, was BIT_GAVE_SAFFRON_GUARDS_DRINK
	const BIT_UNUSED_CARD_KEY ; 7

; wStatusFlags2
	const_def
	const BIT_WILD_ENCOUNTER_COOLDOWN ; 0
	const BIT_NO_AUDIO_FADE_OUT       ; 1
	const BIT_PLAYED_CRY              ; 2 ; marcelnote - Pokémon cry has been played in status screen
	const BIT_POKE_BEEPER_ALERT       ; 3 ; marcelnote - new for PokéBeeper

; wStatusFlags3
	const_def
	const BIT_INIT_TRADE_CENTER_FACING ; 0
	const_skip 2                       ; 1-2 ; unused
	const BIT_WARP_FROM_CUR_SCRIPT     ; 3
	const BIT_ON_DUNGEON_WARP          ; 4
	const BIT_NO_NPC_FACE_PLAYER       ; 5
	const BIT_TALKED_TO_TRAINER        ; 6
	const BIT_PRINT_END_BATTLE_TEXT    ; 7

; wStatusFlags4
	const_def
	const BIT_IS_GIRL                 ; 0 ; marcelnote - for player gender, was BIT_GOT_LAPRAS
	const BIT_UNKNOWN_4_1             ; 1
	const BIT_USED_POKECENTER         ; 2
	const BIT_GOT_STARTER             ; 3
	const BIT_NO_BATTLES              ; 4
	const BIT_BATTLE_OVER_OR_BLACKOUT ; 5
	const BIT_LINK_CONNECTED          ; 6
	const BIT_INIT_SCRIPTED_MOVEMENT  ; 7

; wStatusFlags5
	const_def
	const BIT_SCRIPTED_NPC_MOVEMENT   ; 0
	const BIT_UNKNOWN_5_1             ; 1
	const BIT_UNKNOWN_5_2             ; 2
	const_skip                        ; 3 ; unused
	const BIT_UNKNOWN_5_4             ; 4
	const BIT_DISABLE_JOYPAD          ; 5
	const BIT_NO_TEXT_DELAY           ; 6
	const BIT_SCRIPTED_MOVEMENT_STATE ; 7

; wStatusFlags6
	const_def
	const BIT_GAME_TIMER_COUNTING ; 0
	const BIT_DEBUG_MODE          ; 1
	const BIT_FLY_OR_DUNGEON_WARP ; 2
	const BIT_FLY_WARP            ; 3
	const BIT_DUNGEON_WARP        ; 4
	const BIT_ALWAYS_ON_BIKE      ; 5
	const BIT_ESCAPE_WARP         ; 6
	const BIT_RUNNING             ; 7 ; marcelnote - was unused

; wStatusFlags7
	const_def
	const BIT_TEST_BATTLE        ; 0
	const BIT_NO_MAP_MUSIC       ; 1
	const BIT_FORCED_WARP        ; 2
	const BIT_TRAINER_BATTLE     ; 3
	const BIT_USE_CUR_MAP_SCRIPT ; 4
	const_skip 2                 ; 5-6 ; unused
	const BIT_USED_FLY           ; 7

; wElite4Flags
	const_def
	const BIT_UNUSED_BEAT_ELITE_4 ; 0
	const BIT_STARTED_ELITE_4     ; 1

; wMovementFlags
	const_def
	const BIT_STANDING_ON_DOOR ; 0
	const BIT_EXITING_DOOR     ; 1
	const BIT_STANDING_ON_WARP ; 2
	const_skip 3               ; 3-5 ; unused
	const BIT_LEDGE_OR_FISHING ; 6
	const BIT_SPINNING         ; 7

; wWalkBikeSurfState
	const_def
	const WALKING              ; 0
	const BIKING               ; 1
	const SURFING              ; 2

; wBagPocketsFlags ; marcelnote - new for bag pockets
	const_def
	const BIT_KEY_ITEMS_POCKET   ; 0 ; is 1 if currently in Key Items pocket
	const_skip                   ; 1 ; unused, leave space for a possible TM pocket
	const BIT_PRINT_INFO_BOX     ; 2 ; whether to print Item info box (i.e. only in start menu bag and battle)
	const BIT_PC_WITHDRAWING     ; 3 ; to prevent switching pockets when withdrawing from PC
	const_skip                   ; 4-7 ; unused

; hFindPathFlags
	const_def
	const BIT_PATH_FOUND_Y ; 0
	const BIT_PATH_FOUND_X ; 1

; hNPCPlayerRelativePosFlags
	const_def
	const BIT_NPC_LOWER_Y ; 0
	const BIT_NPC_LOWER_X ; 1

; rLCDC
DEF LCDC_DEFAULT EQU LCDC_ON | LCDC_WIN_9C00 | LCDC_WIN_ON | LCDC_BLOCK21 | LCDC_BG_9800 | LCDC_OBJ_8 | LCDC_OBJ_ON | LCDC_BG_ON
