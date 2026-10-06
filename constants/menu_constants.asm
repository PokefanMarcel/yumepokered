DEF BAG_ITEM_CAPACITY     EQU 30 ; marcelnote - increased from 20
DEF BAG_KEY_ITEM_CAPACITY EQU 30 ; marcelnote - new for bag pockets, a bit less than 30 key items currently
DEF PC_ITEM_CAPACITY      EQU 50

; Box and menu IDs index MenuDefinitions directly. List IDs remain first so
; existing list-format comparisons keep their meaning.
	const_def
	const NOLISTMENU
	const PRICEDITEMLISTMENU
	const ITEMLISTMENU
	const SPECIALLISTMENU
	const ELEVATORLISTMENU
	const MESSAGE_BOX
;	const MENU_TEMPLATE_03 ; unused
;	const MENU_TEMPLATE_10 ; unused
	const MON_SPRITE_POPUP
	const BAG_INFO_BOX
	const USE_TOSS_MENU_TEMPLATE
	const USE_SLCT_MENU_TEMPLATE
	const BATTLE_MENU_TEMPLATE
	const SAFARI_BATTLE_MENU_TEMPLATE
	const SWITCH_STATS_CANCEL_MENU_TEMPLATE
	const MOM_DAISY_CANCEL_MENU_TEMPLATE
	const BUY_SELL_QUIT_MENU_TEMPLATE
	const MONEY_BOX_TEMPLATE
	const CURRENT_FLOOR_BOX_TEMPLATE
	const YES_NO_MENU
	const BOY_GIRL_MENU
;	const SOUTH_EAST_MENU  ; marcelnote - unused
;	const WIDE_YES_NO_MENU ; marcelnote - unused
;	const NORTH_EAST_MENU  ; marcelnote - unused
	const TRADE_CANCEL_MENU
	const HEAL_CANCEL_MENU
	const NO_YES_MENU
	const MONEY_BOX
	const BUY_SELL_QUIT_MENU
	const FIELD_MOVE_MON_MENU
DEF NUM_MENU_IDS EQU const_value

; Definition kinds: drawing and input remain separate routines.
	const_def
	const MENU_KIND_BOX
	const MENU_KIND_TEXT
	const MENU_KIND_CHOICE
	const MENU_KIND_LIST
	const MENU_KIND_CUSTOM

; Choice flags stored in the definition, independently of its ID.
DEF BIT_CHOICE_CABLE_BORDER EQU 0
DEF BIT_CHOICE_IGNORE_B     EQU 1
DEF BIT_CHOICE_BACKUP_TILES EQU 2 ; use wBuffer; wider choices restore externally

; Callers may set this bit in wTextBoxID to start on the second choice.
DEF BIT_SECOND_MENU_OPTION_DEFAULT EQU 7
ASSERT NUM_MENU_IDS <= (1 << BIT_SECOND_MENU_OPTION_DEFAULT)

; List behavior cached alongside the layout when the list is opened.
DEF BIT_LIST_SPECIAL_NAMES EQU 0
DEF BIT_LIST_HAS_QUANTITY  EQU 1

; menu exit method constants for list menus and the buy/sell/quit menu
DEF CHOSE_MENU_ITEM   EQU 1 ; pressed A
DEF CANCELLED_MENU    EQU 2 ; pressed B

; menu exit method constants for two-option menus
DEF CHOSE_FIRST_ITEM  EQU 1
DEF CHOSE_SECOND_ITEM EQU 2

; move mon constants ; marcelnote - revamped Bill's PC, now daycare only
	const_def
	const DAYCARE_TO_PARTY ; 0
	const PARTY_TO_DAYCARE ; 1

; party menu types
; PartyMenuMessagePointers indexes (see engine/menus/party_menu.asm)
	const_def
	const NORMAL_PARTY_MENU    ; $00
	const USE_ITEM_PARTY_MENU  ; $01
	const BATTLE_PARTY_MENU    ; $02
	const TMHM_PARTY_MENU      ; $03
	const SWAP_MONS_PARTY_MENU ; $04
	const EVO_STONE_PARTY_MENU ; $05
; party menu message IDs
; PartyMenuItemUseMessagePointers indexes (see engine/menus/party_menu.asm)
	const_next $F0
DEF FIRST_PARTY_MENU_TEXT_ID EQU const_value
	const ANTIDOTE_MSG         ; $F0
	const BURN_HEAL_MSG        ; $F1
	const ICE_HEAL_MSG         ; $F2
	const AWAKENING_MSG        ; $F3
	const PARALYZ_HEAL_MSG     ; $F4
	const POTION_MSG           ; $F5
	const FULL_HEAL_MSG        ; $F6
	const REVIVE_MSG           ; $F7
	const RARE_CANDY_MSG       ; $F8

; naming screen types
	const_def
	const NAME_PLAYER_SCREEN ; 0
	const NAME_RIVAL_SCREEN  ; 1
	const NAME_MON_SCREEN    ; 2

; Stats box layout (see engine/pokemon/status_screen.asm)
	const_def
	const STATUS_SCREEN_STATS_BOX ; 0
	const LEVEL_UP_STATS_BOX      ; 1

; Status screen info pages ; marcelnote - new for Stats page
	const_def
	const STATUS_SCREEN_INFO_STATS    ; 0
	const STATUS_SCREEN_INFO_DVS      ; 1
	const STATUS_SCREEN_INFO_STAT_EXP ; 2
