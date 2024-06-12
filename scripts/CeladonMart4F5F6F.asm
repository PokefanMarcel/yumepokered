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
	dw_const CeladonMart6FClerkText,            TEXT_CELADONMART6F_CLERK ; marcelnote - new floor
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

CeladonMart6FClerkText: ; marcelnote - new floor, later to be put in marts.asm?
	text_far _CeladonMart6FClerkText
	text_end

CeladonMart6FCurrentFloorSignText: ; marcelnote - new floor
	text_far _CeladonMart6FCurrentFloorSignText
	text_end


CeladonMart4FClerkText: ; marcelnote - moved Mart inventories
	script_mart POKE_DOLL, FIRE_STONE, THUNDER_STONE, WATER_STONE, LEAF_STONE

CeladonMart5FClerk1Text: ; marcelnote - moved Mart inventories
	script_mart X_ACCURACY, GUARD_SPEC, DIRE_HIT, X_ATTACK, X_DEFEND, X_SPEED, X_SPECIAL

CeladonMart5FClerk2Text: ; marcelnote - moved Mart inventories
	script_mart HP_UP, PROTEIN, IRON, CARBOS, CALCIUM
