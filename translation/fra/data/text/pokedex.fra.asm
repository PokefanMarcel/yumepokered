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

HeightWeightText: ; marcelnote - changed from "TAI" and "PDS"
	db   "TA  ?′??″"
	next "PO   ???<l><b>@"

HeightWeightMetricText: ; marcelnote - changed from "TAI" and "PDS"
	db   "TA   ???<m>"
	next "PO   ???<k><g>@"

PokedexMovesHeader: db "CAPA.@"
