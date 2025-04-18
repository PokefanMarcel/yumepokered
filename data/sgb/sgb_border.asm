BorderPalettes:
IF DEF(_RED)
	INCBIN "gfx/sgb/red_border.tilemap"
ELIF DEF(_BLUE)
	INCBIN "gfx/sgb/blue_border.tilemap"
ELIF DEF(_GREEN) ; PureRGBnote: GREENBUILD: added the graphics for pokemon green's SGB border.
	INCBIN "gfx/sgb/green_border.tilemap"
ENDC

	ds $100

IF DEF(_RED)
	RGB 30,29,29 ; PAL_SGB1
	RGB 25,22,25
	RGB 25,17,21
	RGB 24,14,12
ELIF DEF(_BLUE)
	RGB 0,0,0 ; PAL_SGB1 (the first color is not defined, but if used, turns up as 30,29,29... o_O)
	RGB 10,17,26
	RGB 5,9,20
	RGB 16,20,27
ELIF DEF(_GREEN)
	RGB 30,29,29 ; PAL_SGB1
	RGB 23,29,17
	RGB 17,24,11
	RGB 11,18,8
ENDC

	ds $18

IF DEF(_RED)
	RGB 30,29,29 ; PAL_SGB2
	RGB 22,31,16
	RGB 27,20,6
	RGB 15,15,15
ELIF DEF(_BLUE)
	RGB 30,29,29 ; PAL_SGB2
	RGB 27,11,6
	RGB 5,9,20
	RGB 28,25,15
ELIF DEF(_GREEN)
	RGB 30,29,29 ; PAL_SGB2
	RGB 15,18,27
	RGB 24,19,7
	RGB 15,15,15
ENDC

	ds $18

IF DEF(_RED)
	RGB 30,29,29 ; PAL_SGB3
	RGB 31,31,17
	RGB 18,21,29
	RGB 15,15,15
ELIF DEF(_BLUE)
	RGB 30,29,29 ; PAL_SGB3
	RGB 12,15,11
	RGB 5,9,20
	RGB 14,22,17
ELIF DEF(_GREEN)
	RGB 30,29,29 ; PAL_SGB3
	RGB 28,25,4
	RGB 27,17,19
	RGB 15,15,15
ENDC

	ds $18

SGBBorderGraphics:
IF DEF(_RED)
	INCBIN "gfx/sgb/red_border.2bpp"
ELIF DEF(_BLUE)
	INCBIN "gfx/sgb/blue_border.2bpp"
ELIF DEF(_GREEN)
	INCBIN "gfx/sgb/green_border.2bpp"
ENDC
