PokemonLogoGraphics: INCBIN "gfx/title/pokemon_logo.2bpp"
IF DEF(_FRA)
FontGraphics:: INCBIN "translation/fra/gfx/font-fra.1bpp"
ELSE
FontGraphics:: INCBIN "gfx/font/font.1bpp"
ENDC
FontGraphicsEnd::

HpBarAndStatusGraphics:: INCBIN "gfx/font/font_battle_extra.2bpp"
HpBarAndStatusGraphicsEnd::

BattleHudTiles: INCBIN "gfx/battle/battle_hud.1bpp" ; marcelnote - reorganized Battle HUD tiles
BattleHudTilesEnd:

NamingScreenTiles: INCBIN "gfx/font/naming_screen.1bpp" ; marcelnote - reorganized Naming screen tiles
NamingScreenTilesEnd:

NintendoCopyrightLogoGraphics: INCBIN "gfx/splash/copyright.2bpp"

GameFreakLogoGraphics: INCBIN "gfx/title/gamefreak_inc.2bpp"
GameFreakLogoGraphicsEnd:

TextBoxGraphics:: INCBIN "gfx/font/font_extra.2bpp"
TextBoxGraphicsEnd::

PokedexTileGraphics: INCBIN "gfx/pokedex/pokedex.2bpp"
PokedexTileGraphicsEnd:

WorldMapTileGraphics: INCBIN "gfx/town_map/town_map.2bpp"
WorldMapTileGraphicsEnd:

PlayerCharacterTitleGraphics: INCBIN "gfx/title/player.2bpp"
PlayerCharacterTitleGraphicsEnd:
