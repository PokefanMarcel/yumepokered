Version_GFX: ; marcelnote - for some reason they need an even number of tiles
IF DEF(_FRA)

	IF DEF(_RED)
		INCBIN "translation/fra/gfx/version_rouge.fra.1bpp" ; 10 tiles
	ELIF DEF(_GREEN)
		INCBIN "translation/fra/gfx/version_verte.fra.1bpp" ; 10 tiles
	ELIF DEF(_BLUE)
		INCBIN "translation/fra/gfx/version_bleue.fra.1bpp" ; 10 tiles
	ENDC

ELIF DEF(_ESP)

	IF DEF(_RED)
		INCBIN "translation/esp/gfx/version_roja.esp.1bpp" ; 10 tiles
	ELIF DEF(_GREEN)
		INCBIN "translation/esp/gfx/version_verde.esp.1bpp" ; 9 tiles
	ELIF DEF(_BLUE)
		INCBIN "translation/esp/gfx/version_azul.esp.1bpp" ; 8 tiles
	ENDC

ELSE

	IF DEF(_RED)
		INCBIN "gfx/title/red_version.1bpp" ; 8 tiles
	ELIF DEF(_GREEN)
		INCBIN "gfx/title/green_version.1bpp" ; 10 tiles
	ELIF DEF(_BLUE)
		INCBIN "gfx/title/blue_version.1bpp" ; 8 tiles
	ENDC

ENDC
Version_GFXEnd:
