PokemonLogoGraphics: INCBIN "gfx/title/pokemon_logo.2bpp"

IF DEF(_FRA)
	FontGraphics:: INCBIN "translation/fra/gfx/font.fra.1bpp"
	FontGraphicsEnd::

	HpBarAndStatusGraphics:: INCBIN "translation/fra/gfx/font_battle_extra.fra.2bpp"
	HpBarAndStatusGraphicsEnd::

	NamingScreenTiles: INCBIN "translation/fra/gfx/naming_screen.fra.1bpp" ; marcelnote - reorganized Naming screen tiles
	NamingScreenTilesEnd:

	PokedexTileGraphics: INCBIN "translation/fra/gfx/pokedex.fra.2bpp"
	PokedexTileGraphicsEnd:
ELSE
	FontGraphics:: INCBIN "gfx/font/font.1bpp"
	FontGraphicsEnd::

	HpBarAndStatusGraphics:: INCBIN "gfx/font/font_battle_extra.2bpp"
	HpBarAndStatusGraphicsEnd::

	NamingScreenTiles: INCBIN "gfx/font/naming_screen.1bpp" ; marcelnote - reorganized Naming screen tiles
	NamingScreenTilesEnd:

	PokedexTileGraphics: INCBIN "gfx/pokedex/pokedex.2bpp"
	PokedexTileGraphicsEnd:
ENDC

BattleHudTiles: INCBIN "gfx/battle/battle_hud.1bpp" ; marcelnote - reorganized Battle HUD tiles
BattleHudTilesEnd:

NintendoCopyrightLogoGraphics: INCBIN "gfx/splash/copyright.2bpp"

GameFreakLogoGraphics: INCBIN "gfx/title/gamefreak_inc.2bpp"
GameFreakLogoGraphicsEnd:

TextBoxGraphics:: INCBIN "gfx/font/font_extra.2bpp"
TextBoxGraphicsEnd::

StatsBarGraphics: INCBIN "gfx/pokedex/stats_bar.2bpp" ; marcelnote - new
StatsBarGraphicsEnd:

StatExpBarGraphics: INCBIN "gfx/status_screen/stat_exp_bar.2bpp" ; marcelnote - new
StatExpBarGraphicsEnd:

WorldMapTileGraphics: INCBIN "gfx/town_map/town_map.2bpp"
WorldMapTileGraphicsEnd:

MonNestOptionsTileGraphics: INCBIN "gfx/town_map/mon_nest_options.2bpp" ; marcelnote - new
MonNestOptionsTileGraphicsEnd:

PlayerCharacterTitleGraphics: INCBIN "gfx/title/player.2bpp"
PlayerCharacterTitleGraphicsEnd:
