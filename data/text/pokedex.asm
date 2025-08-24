; marcelnote - moved from engine/menus/pokedex.asm
PokedexSeenText:
	db "SEEN@"

PokedexOwnText:
	db "OWN@"

PokedexContentsText:
	db "CONTENTS@"

PokedexMenuItemsText:
	db   "DATA"
	next "MOVE" ; marcelnote - reorganized for learnset page
	next "AREA"
	next "CRY@"

PokedexTypeText:
	db   "TYPE/@"

PokedexStatsText:
	db   "HP"
	next "ATTACK"
	next "DEFENSE"
	next "SPEED"
	next "SPECIAL@"

HeightWeightText:
	db   "HT  ?′??″"
	next "WT   ???<l><b>@"

HeightWeightMetricText:
	db   "HT   ???<m>"
	next "WT   ???<k><g>@"

PokedexMovesHeader: db "'s MOVES@"
