Version_GFX: ; marcelnote - for some reason they need an even number of tiles
IF DEF(_RED)
	INCBIN "gfx/title/red_version.1bpp" ; 8 tiles
ELIF DEF(_GREEN)
	INCBIN "gfx/title/green_version.1bpp" ; 10 tiles
ELIF DEF(_BLUE)
	INCBIN "gfx/title/blue_version.1bpp" ; 8 tiles
ENDC
Version_GFXEnd:
