; marcelnote - new location
MandarinIsland_Script:
	jp EnableAutoTextBoxDrawing

;MandarinIsland_ScriptPointers:
;	def_script_pointers
;	dw_const MandarinIslandDefaultScript,      SCRIPT_MANDARINISLAND_DEFAULT

MandarinIsland_TextPointers:
	def_text_pointers
	; objects
	dw_const MandarinIslandFisherText,         TEXT_MANDARINISLAND_FISHER
	dw_const MandarinIslandLittleGirlText,     TEXT_MANDARINISLAND_LITTLE_GIRL
	dw_const MandarinIslandRockerText,         TEXT_MANDARINISLAND_ROCKER
	dw_const MandarinIslandSwimmerText,        TEXT_MANDARINISLAND_SWIMMER
	dw_const MandarinIslandSwimmerFText,       TEXT_MANDARINISLAND_SWIMMER_F
	dw_const MandarinIslandCooltrainerMText,   TEXT_MANDARINISLAND_COOLTRAINER_M
	dw_const MandarinIslandSilphWorkerFText,   TEXT_MANDARINISLAND_SILPH_WORKER_F
	dw_const MandarinIslandGirlText,           TEXT_MANDARINISLAND_GIRL
	; bg
	dw_const MandarinIslandSignText,           TEXT_MANDARINISLAND_SIGN
	dw_const MartSignText,                     TEXT_MANDARINISLAND_MART_SIGN
	dw_const PokeCenterSignText,               TEXT_MANDARINISLAND_POKECENTER_SIGN
	dw_const MandarinIslandSurfShopSignText,   TEXT_MANDARINISLAND_SURFSHOP_SIGN
	dw_const MandarinIslandSilphCoSignText,    TEXT_MANDARINISLAND_SILPH_CO_SIGN
	dw_const MandarinIslandHotelSignText,      TEXT_MANDARINISLAND_HOTEL_SIGN


MandarinIslandFisherText:
	text_far _MandarinIslandFisherText
	text_end

MandarinIslandLittleGirlText:
	text_far _MandarinIslandLittleGirlText
	text_end

MandarinIslandRockerText:
	text_far _MandarinIslandRockerText
	text_end

MandarinIslandSwimmerText:
	text_far _MandarinIslandSwimmerText
	text_end

MandarinIslandSwimmerFText:
	text_far _MandarinIslandSwimmerFText
	text_end

MandarinIslandCooltrainerMText:
	text_far _MandarinIslandCooltrainerMText
	text_end

MandarinIslandSilphWorkerFText:
	text_far _MandarinIslandSilphWorkerFText
	text_end

MandarinIslandGirlText:
	text_far _MandarinIslandGirlText
	text_end

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