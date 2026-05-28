; marcelnote - moved from engine/menus/pokedex.asm
PokedexSeenText:
	db "VIST@"

PokedexOwnText:
	db "TIEN@"

PokedexContentsText:
	db "CONTENIDO@"

PokedexMenuItemsText:
	db   "INFO"
	next "MOVS" ; marcelnote - reorganized for learnset page
	next "ÁREA"
	next "GRIT@"

PokedexTypeText:
	db   "TIPO/@"

PokedexStatsText:
	db   "SALUD"
	next "ATAQUE"
	next "DEFENSA"
	next "VELOCID."
	next "ESPECIAL@"

HeightWeightText:
	db   "AL  ?′??″"
	next "PE   ???<l><b>@"

HeightWeightMetricText:
	db   "AL   ???<m>"
	next "PE   ???<k><g>@"

; TODO - Spanish translation
PokedexMovesHeader: db "MOVS.@"
