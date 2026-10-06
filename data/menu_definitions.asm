; One directly indexed table for boxes, choices, lists, and custom displays.
; Several IDs may share a definition when their layouts are identical.
MACRO menu_definition
	ASSERT (\1) * 2 == @ - MenuDefinitions, "Menu ID/table order mismatch"
	dw \2
ENDM

MenuDefinitions:
	table_width 2
	menu_definition NOLISTMENU,                        0
	menu_definition PRICEDITEMLISTMENU,                .PricedItemList
	menu_definition ITEMLISTMENU,                      .ItemList
	menu_definition SPECIALLISTMENU,                   .SpecialList
	menu_definition ELEVATORLISTMENU,                  .ElevatorList
	menu_definition MESSAGE_BOX,                       .MessageBox
;	menu_definition MENU_TEMPLATE_03,                  .Template03 ; marcelnote - unused
;	menu_definition MENU_TEMPLATE_10,                  .Template10 ; marcelnote - unused
	menu_definition MON_SPRITE_POPUP,                  .MonPopup
	menu_definition BAG_INFO_BOX,                      .BagInfo
	menu_definition USE_TOSS_MENU_TEMPLATE,            .UseToss
	menu_definition USE_SLCT_MENU_TEMPLATE,            .UseSelect
	menu_definition BATTLE_MENU_TEMPLATE,              .Battle
	menu_definition SAFARI_BATTLE_MENU_TEMPLATE,       .SafariBattle
	menu_definition SWITCH_STATS_CANCEL_MENU_TEMPLATE, .SwitchStatsCancel
	menu_definition MOM_DAISY_CANCEL_MENU_TEMPLATE,    .MomDaisyCancel
	menu_definition BUY_SELL_QUIT_MENU_TEMPLATE,       .BuySellQuitTemplate
	menu_definition MONEY_BOX_TEMPLATE,                .MoneyTemplate
	menu_definition CURRENT_FLOOR_BOX_TEMPLATE,        .CurrentFloor
	menu_definition YES_NO_MENU,                       .YesNo
	menu_definition BOY_GIRL_MENU,                     .BoyGirl
;	menu_definition SOUTH_EAST_MENU,                   .SouthEast ; marcelnote - unused
;	menu_definition WIDE_YES_NO_MENU,                  .WideYesNo ; marcelnote - unused
;	menu_definition NORTH_EAST_MENU,                   .NorthEast ; marcelnote - unused
	menu_definition TRADE_CANCEL_MENU,                 .TradeCancel
	menu_definition HEAL_CANCEL_MENU,                  .HealCancel
	menu_definition NO_YES_MENU,                       .NoYes
	menu_definition MONEY_BOX,                         .Money ; why need different from MoneyTemplate?
	menu_definition BUY_SELL_QUIT_MENU,                .BuySellQuit
	menu_definition FIELD_MOVE_MON_MENU,               .FieldMoves
	assert_table_length NUM_MENU_IDS


MACRO menu_box
	db MENU_KIND_BOX
	db \1, \2, \3, \4 ; upper-left X/Y, lower-right X/Y
ENDM

.MessageBox:
	menu_box  0, 12, 19, 17
.MonPopup:
	menu_box  6,  4, 14, 13
.BagInfo:
	menu_box  4, 13, 19, 15
;.Template03: ; marcelnote - unused
;	menu_box  0,  0, 19, 14
;.Template10: ; marcelnote - unused
;	menu_box  7,  0, 19, 17


MACRO menu_text
	db MENU_KIND_TEXT
	db \1, \2, \3, \4
	dw \5 ; text pointer
	db (\1) + (\6), (\2) + (\7) ; text offset from the box origin
ENDM

.UseToss:
IF DEF(_FRA) || DEF(_ESP)
	menu_text 12, 10, 19, 14, UseTossText, 2, 1
ELSE
	menu_text 13, 10, 19, 14, UseTossText, 2, 1
ENDC
.UseSelect:
IF DEF(_FRA) || DEF(_ESP)
	menu_text 12, 10, 19, 14, UseSlctText, 2, 1
ELSE
	menu_text 13, 10, 19, 14, UseSlctText, 2, 1
ENDC
.Battle:
IF DEF(_FRA)
	menu_text  6, 12, 19, 17, BattleMenuText, 2, 2
ELSE
	menu_text  8, 12, 19, 17, BattleMenuText, 2, 2
ENDC
.SafariBattle:
	menu_text  0, 12, 19, 17, SafariZoneBattleMenuText, 2, 2
.SwitchStatsCancel:
	menu_text 11, 11, 19, 17, SwitchStatsCancelText, 2, 1
.MomDaisyCancel:
	menu_text 11,  5, 19, 11, MomDaisyCancelText, 2, 1
.BuySellQuitTemplate:
	menu_text  0,  0, 10,  6, BuySellQuitText, 2, 1
.MoneyTemplate:
	menu_text 11,  0, 19,  2, MoneyText, 2, 0
.CurrentFloor:
	menu_text  0,  0,  8,  2, FloorText, 2, 0


MACRO menu_list
	ASSERT (\4) - (\2) - 1 == 9, "List height must remain fixed"
	db MENU_KIND_LIST
	db \1, \2, \3, \4
	db \5 ; list behavior flags
ENDM

.PricedItemList:
	menu_list  4,  2, 19, 12, 0
.ItemList:
	menu_list  4,  2, 19, 12, 1 << BIT_LIST_HAS_QUANTITY
.SpecialList:
	menu_list  4,  2, 19, 12, 1 << BIT_LIST_SPECIAL_NAMES
.ElevatorList:
	menu_list 10,  0, 19, 10, 1 << BIT_LIST_SPECIAL_NAMES


MACRO menu_choice
	ASSERT (\2) == 3, "Two-option choices have three interior rows"
	; wBuffer saves 6x5 tiles including borders; only Yes/No needs this backup.
	; Do not set BIT_CHOICE_BACKUP_TILES for interior width >= 5 (full width >= 7).
	; Wider choices require caller-side full-screen save/restore.
	IF (\5) & (1 << BIT_CHOICE_BACKUP_TILES)
		ASSERT (\1) < 5, "Choice is too wide for wBuffer; restore externally"
	ENDC
	ASSERT (\3) >= 1 && (\3) + 2 <= (\2)
	db MENU_KIND_CHOICE
	db \1, \2, \3 ; inner width/height, first text row relative to origin
	dw \4
	db \5 ; input/border flags; text X is 2, cursor X is 1
ENDM

; Choices use the caller's HL as their box origin.
.YesNo:
	menu_choice 4, 3, 1, YesNoMenuText, 1 << BIT_CHOICE_BACKUP_TILES
.BoyGirl: ; wider than wBuffer; BoyGirlChoice saves/restores buffer 1
IF DEF(_FRA)
	menu_choice 7, 3, 1, BoyGirlMenuText, 1 << BIT_CHOICE_IGNORE_B
ELSE
	menu_choice 5, 3, 1, BoyGirlMenuText, 1 << BIT_CHOICE_IGNORE_B
ENDC
.TradeCancel: ; wider than wBuffer; TradeCenter_Trade saves/restores buffer 1
IF DEF(_FRA)
	menu_choice 8, 3, 1, TradeCancelMenuText, 1 << BIT_CHOICE_CABLE_BORDER
ELSE
	menu_choice 7, 3, 1, TradeCancelMenuText, 1 << BIT_CHOICE_CABLE_BORDER
ENDC
.HealCancel: ; wider than wBuffer; YesNoChoicePokeCenter saves/restores buffer 1
	menu_choice 7, 3, 1, HealCancelMenuText, 0
.NoYes: ; no backup needed: both answers reset through Init
	menu_choice 4, 3, 1, NoYesMenuText, 1 << BIT_CHOICE_IGNORE_B
;.SouthEast: ; marcelnote - unused
;	menu_choice 6, 3, 1, SouthEastMenuText, 0
;.WideYesNo: ; marcelnote - unused
;	menu_choice 6, 3, 1, YesNoMenuText, 0
;.NorthEast: ; marcelnote - unused
;	menu_choice 6, 3, 1, NorthEastMenuText, 0


.Money:
	dbw MENU_KIND_CUSTOM, DisplayMoneyBox
.BuySellQuit:
	dbw MENU_KIND_CUSTOM, DoBuySellQuitMenu
.FieldMoves:
	dbw MENU_KIND_CUSTOM, DisplayFieldMoveMonMenu
