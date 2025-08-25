PokedexSeenText:
	db "VUS@"

PokedexOwnText:
	db "PRIS@"

PokedexContentsText:
	db "SOMMAIRE@"

PokedexMenuItemsText:
	db   "INFO"
	next "CAPA"
	next "ZONE"
	next "CRI@"

PokedexTypeText:
	db   "TYPE/@"

PokedexStatsText:
	db   "PV"
	next "ATTAQUE"
	next "DEFENSE"
	next "VITESSE"
	next "SPECIAL@"

HeightWeightText:
	db   "TAI ?′??″"
	next "PDS  ???<l><b>@"

HeightWeightMetricText:
	db   "TAI  ???<m>"
	next "PDS  ???<k><g>@"

PokedexMovesHeader: db "CAPA.@"
