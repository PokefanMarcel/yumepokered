Version_GFX: ; marcelnote - for some reason they need an even number of tiles
IF DEF(_RED) && !DEF(_FRA)
	INCBIN "gfx/title/red_version.1bpp" ; 8 tiles
ELIF DEF(_GREEN) && !DEF(_FRA)
	INCBIN "gfx/title/green_version.1bpp" ; 10 tiles
ELIF DEF(_BLUE) && !DEF(_FRA)
	INCBIN "gfx/title/blue_version.1bpp" ; 8 tiles
ELIF DEF(_RED) && DEF(_FRA)
	INCBIN "translation/fra/gfx/version_rouge.fra.1bpp" ; 10 tiles
ELIF DEF(_GREEN) && DEF(_FRA)
	INCBIN "translation/fra/gfx/version_verte.fra.1bpp" ; 10 tiles
ELIF DEF(_BLUE) && DEF(_FRA)
	INCBIN "translation/fra/gfx/version_bleue.fra.1bpp" ; 10 tiles
ENDC
Version_GFXEnd:
