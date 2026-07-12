BorderPalettes:
IF DEF(_RED)
	INCBIN "gfx/sgb/red_border.tilemap"
ELIF DEF(_GREEN)
	INCBIN "gfx/sgb/green_border.tilemap"
ELIF DEF(_BLUE)
	INCBIN "gfx/sgb/blue_border.tilemap"
ENDC

	ds $100

; marcelnote - new 16-color SGB border palettes

; PAL_SGB1 holds the richer/default background and Mew sticker colors.
; Index 14 is a source-art marker that renders as gray here.
IF DEF(_RED)
	RGB 30,29,29 ; index  0: white
	RGB 24,05,05 ; index  1: dark red
	RGB 31,14,13 ; index  2: light red
	RGB 09,13,08 ; index  3: dark green
	RGB 02,06,19 ; index  4: dark blue
	RGB 24,24,24 ; index  5: gray
	RGB 31,14,20 ; index  6: Yume pink
	RGB 30,26,28 ; index  7: light pink (Mew skin)
	RGB 00,00,00 ; index  8: black
	RGB 14,19,27 ; index  9: light blue
	RGB 26,23,25 ; index 10: dark pink (Mew shadow)
	RGB 11,21,15 ; index 11: light green
	RGB 31,12,08 ; index 12: medium red (ball accent)
	RGB 13,24,28 ; index 13: cyan (Mew eyes)
	RGB 24,24,24 ; index 14: deep pink marker -> gray
	RGB 24,05,05 ; index 15: deep purple marker -> dark red
ELIF DEF(_GREEN)
	RGB 30,29,29 ; index  0: white
	RGB 09,13,08 ; index  1: dark green
	RGB 11,21,15 ; index  2: light green
	RGB 02,06,19 ; index  3: dark blue
	RGB 24,05,05 ; index  4: dark red
	RGB 24,24,24 ; index  5: gray
	RGB 31,14,20 ; index  6: Yume pink
	RGB 30,26,28 ; index  7: light pink (Mew skin)
	RGB 00,00,00 ; index  8: black
	RGB 31,14,13 ; index  9: light red
	RGB 26,23,25 ; index 10: dark pink (Mew shadow)
	RGB 14,19,27 ; index 11: light blue
	RGB 08,18,09 ; index 12: medium green (ball accent)
	RGB 13,24,28 ; index 13: cyan (Mew eyes)
	RGB 24,24,24 ; index 14: deep pink marker -> gray
	RGB 09,13,08 ; index 15: deep purple marker -> dark green
ELIF DEF(_BLUE)
	RGB 30,29,29 ; index  0: white
	RGB 02,06,19 ; index  1: dark blue
	RGB 14,19,27 ; index  2: light blue
	RGB 24,05,05 ; index  3: dark red
	RGB 09,13,08 ; index  4: dark green
	RGB 24,24,24 ; index  5: gray
	RGB 31,14,20 ; index  6: Yume pink
	RGB 30,26,28 ; index  7: light pink (Mew skin)
	RGB 00,00,00 ; index  8: black
	RGB 11,21,15 ; index  9: light green
	RGB 26,23,25 ; index 10: dark pink (Mew shadow)
	RGB 31,14,13 ; index 11: light red
	RGB 07,15,26 ; index 12: medium blue (ball accent)
	RGB 13,24,28 ; index 13: cyan (Mew eyes)
	RGB 24,24,24 ; index 14: deep pink marker -> gray
	RGB 02,06,19 ; index 15: deep purple marker -> dark blue
ENDC

; PAL_SGB2 holds the Bulbasaur, Charmander and Squirtle sticker colors.
; Since they don't use dark blue, alias it to light blue to optimize tile count.
	RGB 29,30,31 ; index  0: starter white (#EEF7FF)
	RGB 14,19,27 ; index  1: dark blue -> light blue (#7299DC)
	RGB 14,19,27 ; index  2: eye blue (#7299DC)
	RGB 27,08,03 ; index  3: red mouth (#DC431B)
	RGB 09,13,08 ; index  4: bulb dark green (#4C6843)
	RGB 24,24,24 ; index  5: starter gray (#C2C3C7)
	RGB 31,14,20 ; index  6: mouth pink (#FF77A8)
	RGB 29,15,01 ; index  7: Charmander orange (#F07B07)
	RGB 00,00,00 ; index  8: black (#000000)
	RGB 11,21,15 ; index  9: bulb green (#5EAD7B)
	RGB 26,10,00 ; index 10: Charmander shadow (#D65200)
	RGB 00,00,00 ; index 11: unused
	RGB 16,23,22 ; index 12: Bulbasaur teal (#82BEB6)
	RGB 13,24,28 ; index 13: Squirtle light blue (#6EC7E7)
	RGB 08,13,16 ; index 14: Squirtle dark blue (#426F86)
	RGB 10,16,14 ; index 15: Bulbasaur shadow (#538273)

; PAL_SGB3 is unused for now.
	RGB 00,00,00 ; index 0: unused
	RGB 00,00,00 ; index  1: unused
	RGB 00,00,00 ; index  2: unused
	RGB 00,00,00 ; index  3: unused
	RGB 00,00,00 ; index  4: unused
	RGB 00,00,00 ; index  5: unused
	RGB 00,00,00 ; index  6: unused
	RGB 00,00,00 ; index  7: unused
	RGB 00,00,00 ; index  8: unused
	RGB 00,00,00 ; index  9: unused
	RGB 00,00,00 ; index 10: unused
	RGB 00,00,00 ; index 11: unused
	RGB 00,00,00 ; index 12: unused
	RGB 00,00,00 ; index 13: unused
	RGB 00,00,00 ; index 14: unused
	RGB 00,00,00 ; index 15: unused

; PAL_SGB4 reduces the border pattern to gray, white, and the version highlight color.
; Dark blue, dark green, Yume pink, and dark red source colors map to gray.
; The source-art markers map to the version highlight color.
IF DEF(_RED)
	RGB 29,30,31 ; index  0: white
	RGB 24,24,24 ; index  1: dark red -> gray
	RGB 31,14,13 ; index  2: light red
	RGB 24,24,24 ; index  3: dark green -> gray
	RGB 24,24,24 ; index  4: dark blue -> gray
	RGB 24,24,24 ; index  5: gray
	RGB 24,24,24 ; index  6: Yume pink -> gray
	RGB 30,26,28 ; index  7: light pink (Mew skin)
	RGB 00,00,00 ; index  8: black
	RGB 14,19,27 ; index  9: light blue
	RGB 26,23,25 ; index 10: dark pink (Mew shadow)
	RGB 00,00,00 ; index 11: unused
	RGB 00,00,00 ; index 12: unused
	RGB 13,24,28 ; index 13: cyan (Mew eyes)
	RGB 31,14,13 ; index 14: deep pink marker -> light red
	RGB 31,14,13 ; index 15: deep purple marker -> light red
ELIF DEF(_GREEN)
	RGB 29,30,31 ; index  0: white
	RGB 24,24,24 ; index  1: dark green -> gray
	RGB 11,21,15 ; index  2: light green
	RGB 24,24,24 ; index  3: dark blue -> gray
	RGB 24,24,24 ; index  4: dark red -> gray
	RGB 24,24,24 ; index  5: gray
	RGB 24,24,24 ; index  6: Yume pink -> gray
	RGB 30,26,28 ; index  7: light pink (Mew skin)
	RGB 00,00,00 ; index  8: black
	RGB 14,19,27 ; index  9: light blue
	RGB 26,23,25 ; index 10: dark pink (Mew shadow)
	RGB 00,00,00 ; index 11: unused
	RGB 00,00,00 ; index 12: unused
	RGB 13,24,28 ; index 13: cyan (Mew eyes)
	RGB 11,21,15 ; index 14: deep pink marker -> light green
	RGB 11,21,15 ; index 15: deep purple marker -> light green
ELIF DEF(_BLUE)
	RGB 29,30,31 ; index  0: white
	RGB 24,24,24 ; index  1: dark blue -> gray
	RGB 14,19,27 ; index  2: light blue
	RGB 24,24,24 ; index  3: dark red -> gray
	RGB 24,24,24 ; index  4: dark green -> gray
	RGB 24,24,24 ; index  5: gray
	RGB 24,24,24 ; index  6: Yume pink -> gray
	RGB 30,26,28 ; index  7: light pink (Mew skin)
	RGB 00,00,00 ; index  8: black
	RGB 14,19,27 ; index  9: light blue
	RGB 26,23,25 ; index 10: dark pink (Mew shadow)
	RGB 00,00,00 ; index 11: unused
	RGB 00,00,00 ; index 12: unused
	RGB 13,24,28 ; index 13: cyan (Mew eyes)
	RGB 14,19,27 ; index 14: deep pink marker -> light blue
	RGB 14,19,27 ; index 15: deep purple marker -> light blue
ENDC


; Original 4-color border palettes for reference.

; PAL_SGB1
;IF DEF(_RED)
;	RGB 30,29,29 ; warm white
;	RGB 25,22,25 ; dusty mauve
;	RGB 25,17,21 ; muted rose shadow
;	RGB 24,14,12 ; brown-red shadow
;ELIF DEF(_GREEN)
;	RGB 30,29,29 ; warm white
;	RGB 23,29,17 ; pale yellow-green
;	RGB 17,24,11 ; leaf green
;	RGB 11,18,08 ; deep green
;ELIF DEF(_BLUE)
;	RGB 00,00,00 ; undefined slot; if used, turns up as 30,29,29... o_O
;	RGB 10,17,26 ; slate blue
;	RGB 05,09,20 ; dark navy
;	RGB 16,20,27 ; pale blue-gray
;ENDC
;	ds 12 * 2 ; unused space for 12 more RGB colors

; PAL_SGB2
;IF DEF(_RED)
;	RGB 30,29,29 ; warm white
;	RGB 22,31,16 ; bright lime
;	RGB 27,20,06 ; golden brown
;	RGB 15,15,15 ; mid gray
;ELIF DEF(_GREEN)
;	RGB 30,29,29 ; warm white
;	RGB 15,18,27 ; blue-gray
;	RGB 24,19,07 ; ocher
;	RGB 15,15,15 ; mid gray
;ELIF DEF(_BLUE)
;	RGB 30,29,29 ; warm white
;	RGB 27,11,06 ; orange-red
;	RGB 05,09,20 ; dark navy
;	RGB 28,25,15 ; pale gold
;ENDC
;	ds 12 * 2 ; unused space for 12 more RGB colors

; PAL_SGB3
;IF DEF(_RED)
;	RGB 30,29,29 ; warm white
;	RGB 31,31,17 ; pale yellow
;	RGB 18,21,29 ; steel blue
;	RGB 15,15,15 ; mid gray
;ELIF DEF(_GREEN)
;	RGB 30,29,29 ; warm white
;	RGB 28,25,04 ; yellow ocher
;	RGB 27,17,19 ; dusty red
;	RGB 15,15,15 ; mid gray
;ELIF DEF(_BLUE)
;	RGB 30,29,29 ; warm white
;	RGB 12,15,11 ; muted green-gray
;	RGB 05,09,20 ; dark navy
;	RGB 14,22,17 ; green teal
;ENDC
;	ds 12 * 2 ; unused space for 12 more RGB colors

; PAL_SGB4
;	RGB 30,29,29 ; warm white
;	RGB 28,25,04 ; yellow ocher
;	RGB 27,17,19 ; dusty red
;	RGB 15,15,15 ; mid gray
;	ds 12 * 2 ; unused space for 12 more RGB colors

SGBBorderGraphics:
IF DEF(_RED)
	INCBIN "gfx/sgb/red_border.4bpp"
ELIF DEF(_GREEN)
	INCBIN "gfx/sgb/green_border.4bpp"
ELIF DEF(_BLUE)
	INCBIN "gfx/sgb/blue_border.4bpp"
ENDC
