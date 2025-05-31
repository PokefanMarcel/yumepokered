; Loads tile patterns for tiles used in the pokedex.
LoadPokedexTilePatterns: ; marcelnote - gathered all dex tiles in same file
	ld de, PokedexTileGraphics
	ld hl, vChars2 tile $60
	lb bc, BANK(PokedexTileGraphics), (PokedexTileGraphicsEnd - PokedexTileGraphics) / $10
	jp CopyVideoData ; load pokeball tile for marking caught mons
