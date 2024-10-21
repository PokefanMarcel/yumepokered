; marcelnote - merged 4F 5F + new 6F
CeladonMart4F5F6F_Script:
	jp EnableAutoTextBoxDrawing

CeladonMart4F5F6F_TextPointers:
	def_text_pointers
	; object events
	dw_const CeladonMart4FClerkText,            TEXT_CELADONMART4F_CLERK
	dw_const CeladonMart4FSuperNerdText,        TEXT_CELADONMART4F_SUPER_NERD
	dw_const CeladonMart4FYoungsterText,        TEXT_CELADONMART4F_YOUNGSTER
	dw_const CeladonMart5FGentlemanText,        TEXT_CELADONMART5F_GENTLEMAN
	dw_const CeladonMart5FSailorText,           TEXT_CELADONMART5F_SAILOR
	dw_const CeladonMart5FClerk1Text,           TEXT_CELADONMART5F_CLERK1
	dw_const CeladonMart5FClerk2Text,           TEXT_CELADONMART5F_CLERK2
	dw_const CeladonMart6FClerkText,            TEXT_CELADONMART6F_CLERK             ; marcelnote - new floor
	dw_const CeladonMart6FBeautyText,           TEXT_CELADONMART6F_BEAUTY            ; marcelnote - new floor
	dw_const CeladonMart6FMiddleAgedWomanText,  TEXT_CELADONMART6F_MIDDLE_AGED_WOMAN ; marcelnote - new floor
	; background events
	dw_const CeladonMart4FCurrentFloorSignText, TEXT_CELADONMART4F_CURRENT_FLOOR_SIGN
	dw_const CeladonMart5FCurrentFloorSignText, TEXT_CELADONMART5F_CURRENT_FLOOR_SIGN
	dw_const CeladonMart6FCurrentFloorSignText, TEXT_CELADONMART6F_CURRENT_FLOOR_SIGN ; marcelnote - new floor

CeladonMart4FSuperNerdText:
	text_far _CeladonMart4FSuperNerdText
	text_end

CeladonMart4FYoungsterText:
	text_far _CeladonMart4FYoungsterText
	text_end

CeladonMart4FCurrentFloorSignText:
	text_far _CeladonMart4FCurrentFloorSignText
	text_end

CeladonMart5FGentlemanText:
	text_far _CeladonMart5FGentlemanText
	text_end

CeladonMart5FSailorText:
	text_far _CeladonMart5FSailorText
	text_end

CeladonMart5FCurrentFloorSignText:
	text_far _CeladonMart5FCurrentFloorSignText
	text_end

CeladonMart6FBeautyText: ; marcelnote - new floor
	text_asm
	CheckEvent EVENT_BEAT_SILPH_FACTORY_2F_TRAINER_0 ; is Silph Factory event cleared?
	ld hl, .AlwaysComeHereText
	jr nz, .EventCleared
	ld hl, .UsuallyStocksText
.EventCleared
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.UsuallyStocksText
	text_far _CeladonMart6FBeautyUsuallyStocksText
	text_end

.AlwaysComeHereText
	text_far _CeladonMart6FBeautyAlwaysComeHereText
	text_end

CeladonMart6FMiddleAgedWomanText: ; marcelnote - new floor
	text_far _CeladonMart6FMiddleAgedWomanText
	text_end

CeladonMart6FCurrentFloorSignText: ; marcelnote - new floor
	text_far _CeladonMart6FCurrentFloorSignText
	text_end


CeladonMart4FClerkText: ; marcelnote - moved Mart inventories
	script_mart POKE_DOLL, LEAF_STONE, FIRE_STONE, WATER_STONE, THUNDER_STONE ; marcelnote - changed order

CeladonMart5FClerk1Text: ; marcelnote - moved Mart inventories
	script_mart X_ATTACK, X_DEFEND, X_SPEED, X_SPECIAL, X_ACCURACY, GUARD_SPEC, DIRE_HIT ; marcelnote - changed order

CeladonMart5FClerk2Text: ; marcelnote - moved Mart inventories
	script_mart HP_UP, PROTEIN, IRON, CARBOS, CALCIUM

CeladonMart6FClerkText: ; marcelnote - new floor
	text_asm
	CheckEvent EVENT_BEAT_SILPH_FACTORY_2F_TRAINER_0 ; is Silph Factory event cleared?
	jr z, .NoInventory
	call CeladonMart6FClerkDialogue
;	ld hl, .NormalClerkText
;	call TextCommandProcessor
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd
.NoInventory
	ld hl, .NoInventoryText
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.NoInventoryText:
	text_far _CeladonMart6FClerkNoInventoryText
	text_end

;.NormalClerkText:
;	script_mart RARE_CANDY, PP_UP, ETHER, MAX_ETHER, ELIXIR, MAX_ELIXIR

CeladonMart6FClerkDialogue:
; marcelnote - recreating item list manually because I do not know
;              how to integrate script_mart in text_asm
	ld a, 1
	ld [wUpdateSpritesEnabled], a
	ld hl, wItemList
	ld a, 6 ; 1st entry = total number of items in the list
	ld [hli], a
	ld a, RARE_CANDY
	ld [hli], a
	ld a, PP_UP
	ld [hli], a
	ld a, ETHER
	ld [hli], a
	ld a, MAX_ETHER
	ld [hli], a
	ld a, ELIXIR
	ld [hli], a
	ld a, MAX_ELIXIR
	ld [hli], a
	ld a, -1 ; ends the list
	ld [hl], a
   	ld hl, PokemartGreetingText
   	call PrintText
   	ld a, PRICEDITEMLISTMENU
   	ld [wListMenuID], a
   	callfar DisplayPokemartDialogue_
   	ret
