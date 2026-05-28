; marcelnote - moved from engine/menus/pokedex.asm
PokedexSeenText:
	db "VIST@"

PokedexOwnText:
	db "TIEN@"

PokedexContentsText:
	db "CONTENIDO@"

PokedexMenuItemsText:
	db   "INFO"
	next "GRIT"
	next "ÁREA"
	next "SALE@"

; tests if a pokemon's bit is set in the seen or owned pokemon bit fields
; INPUT:
; [wPokedexNum] = pokedex number
; hl = address of bit field
PokedexTypeText:
	db   "TIPO/@"

PokedexStatsText:
	db   "SALUD"
	next "ATAQUE"
	next "DEFENSA"
	next "VELOCID."
	next "ESPECIAL@"

HeightWeightText:
	db   "AL   ???<m>"
	next "PE   ???<k><g>@"

; leftover from JPN Pokedex, where species have the suffix "Pokemon"
HeightWeightMetricText:
	db   "HT   ???<m>"
	next "WT   ???<k><g>@"

; TODO - Spanish translation
PokedexMovesHeader: db "'s MOVES@"
