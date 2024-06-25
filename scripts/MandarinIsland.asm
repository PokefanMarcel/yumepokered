; marcelnote - new location
MandarinIsland_Script:
	jp EnableAutoTextBoxDrawing

;MandarinIsland_ScriptPointers:
;	def_script_pointers
;	dw_const MandarinIslandDefaultScript,      SCRIPT_MANDARINISLAND_DEFAULT

MandarinIsland_TextPointers:
	def_text_pointers
	dw_const MandarinIslandSignText,           TEXT_MANDARINISLAND_SIGN
	dw_const MartSignText,                     TEXT_MANDARINISLAND_MART_SIGN
	dw_const PokeCenterSignText,               TEXT_MANDARINISLAND_POKECENTER_SIGN
	dw_const MandarinIslandSurfShopSignText,   TEXT_MANDARINISLAND_SURFSHOP_SIGN
	dw_const MandarinIslandSilphCoSignText,    TEXT_MANDARINISLAND_SILPH_CO_SIGN
	dw_const MandarinIslandHotelSignText,      TEXT_MANDARINISLAND_HOTEL_SIGN


MandarinIslandSignText:
	text_far _MandarinIslandSignText
	text_end

MandarinIslandSurfShopSignText:
	text_far _MandarinIslandSurfShopSignText
	text_end

MandarinIslandSilphCoSignText:
	text_far _MandarinIslandSilphCoSignText
	text_end

MandarinIslandHotelSignText:
	text_far _MandarinIslandHotelSignText
	text_end