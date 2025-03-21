SuperPalettes:
; entries correspond to PAL_* constants
	table_width 2 * 4
	; marcelnote -
	; Town palettes were changed to reflect Japanese names more.
	; When the RGB color is too dark, I added the same constant to all three RGB elements.
	RGB 31,29,31, 21,28,11, 20,26,31, 03,02,02 ; PAL_ROUTE
	; Pallet is Massara/Masshiro (pure white) but left as is
	RGB 31,29,31, 25,28,27, 20,26,31, 03,02,02 ; PAL_PALLET    ; was 25,28,27
	; Viridian is Tokiwa-iro (RGB 0,123,67) but too dark, so add 80
	RGB 31,29,31, 10,25,18, 20,26,31, 03,02,02 ; PAL_VIRIDIAN  ; was 17,26,03
	; Pewter is Nibi-iro (RGB 114,113,113) but too dark, so add 70
	RGB 31,29,31, 23,22,22, 20,26,31, 03,02,02 ; PAL_PEWTER    ; was 23,25,16
	; Cerulean is Hanada-iro (RGB 4,79,103) but too dark, so add 100
	RGB 31,29,31, 13,22,25, 20,26,31, 03,02,02 ; PAL_CERULEAN  ; was 17,20,30
	; Lavender is Shion-iro (RGB 151,110,154) but too dark, so add 50
	RGB 31,29,31, 25,20,25, 20,26,31, 03,02,02 ; PAL_LAVENDER  ; was 27,20,27
	; Vermilion is Kuchiba-iro (RGB 213,120,53)
	RGB 31,29,31, 26,15,06, 20,26,31, 03,02,02 ; PAL_VERMILION ; was 30,18,00
	; Celadon is Tamamushi-iro (RGB 32,96,79 ???) but too dark, so add 100
	RGB 31,29,31, 16,24,22, 20,26,31, 03,02,02 ; PAL_CELADON   ; was 16,30,22
	; Saffron is Yamabuki-iro (RGB 255,164,0) but too orange, so instead use Saffron (RGB 244,196,48)
	RGB 31,29,31, 30,24,06, 20,26,31, 03,02,02 ; PAL_SAFFRON   ; was 27,27,03
	; Fuchsia is Sekichiku-iro (RGB 229,171,190) but too dull, add 20
	RGB 31,29,31, 31,23,26, 20,26,31, 03,02,02 ; PAL_FUCHSIA   ; was 31,15,22
	; Cinnabar is Guren-iro (RGB 173,0,45) but too dark, add 50
	RGB 31,29,31, 27,06,11, 20,26,31, 03,02,02 ; PAL_CINNABAR  ; was 26,10,06
	; Mandarin is Kinkan/Kumquat (RGB 251,153,18)
	RGB 31,29,31, 30,19,02, 20,26,31, 03,02,02 ; PAL_MANDARIN  ; new
	; Indigo is Sekiei/Quartz (RGB 81,72,79) but too black, so instead use Indigo (RGB 75,0,130)+100
	RGB 31,29,31, 21,12,28, 20,26,31, 03,02,02 ; PAL_INDIGO    ; was 22,14,24
	RGB 31,29,31, 20,26,31, 17,23,10, 03,02,02 ; PAL_TOWNMAP
IF DEF(_RED)
	RGB 31,29,31, 30,30,17, 17,23,10, 21,00,04 ; PAL_LOGO1
ELIF DEF(_BLUE)
	RGB 31,29,31, 30,30,17, 21,00,04, 14,19,29 ; PAL_LOGO1
ELIF DEF(_GREEN)
	RGB 31,29,31, 30,30,17, 21,00,04, 12,23,00 ; PAL_LOGO1
ENDC
	RGB 31,29,31, 30,30,17, 18,18,24, 07,07,16 ; PAL_LOGO2
	RGB 31,29,31, 24,20,30, 11,20,30, 03,02,02 ; PAL_0F
	RGB 31,29,31, 30,22,17, 16,14,19, 03,02,02 ; PAL_MEWMON
	RGB 31,29,31, 18,20,27, 11,15,23, 03,02,02 ; PAL_BLUEMON
	RGB 31,29,31, 31,20,10, 26,10,06, 03,02,02 ; PAL_REDMON
	RGB 31,29,31, 21,25,29, 14,19,25, 03,02,02 ; PAL_CYANMON
	RGB 31,29,31, 27,22,24, 21,15,23, 03,02,02 ; PAL_PURPLEMON
	RGB 31,29,31, 28,20,15, 21,14,09, 03,02,02 ; PAL_BROWNMON
	RGB 31,29,31, 20,26,16, 09,20,11, 03,02,02 ; PAL_GREENMON
	RGB 31,29,31, 30,22,24, 28,15,21, 03,02,02 ; PAL_PINKMON
	RGB 31,29,31, 31,28,14, 26,20,00, 03,02,02 ; PAL_YELLOWMON
	RGB 31,29,31, 26,21,22, 15,15,18, 03,02,02 ; PAL_GRAYMON
	RGB 31,29,31, 26,21,22, 27,20,06, 03,02,02 ; PAL_SLOTS1
IF DEF(_RED)
	RGB 31,29,31, 31,31,17, 25,17,21, 03,02,02 ; PAL_SLOTS2
	RGB 31,29,31, 22,31,16, 25,17,21, 03,02,02 ; PAL_SLOTS3
	RGB 31,29,31, 16,19,29, 25,17,21, 03,02,02 ; PAL_SLOTS4
ELIF DEF(_BLUE)
	RGB 31,29,31, 31,31,17, 16,19,29, 03,02,02 ; PAL_SLOTS2
	RGB 31,29,31, 22,31,16, 16,19,29, 03,02,02 ; PAL_SLOTS3
	RGB 31,29,31, 25,17,21, 16,19,29, 03,02,02 ; PAL_SLOTS4
ELIF DEF(_GREEN)
	RGB 31,29,31, 29,26,04, 18,23,12, 03,02,02 ; PAL_SLOTS2
	RGB 31,29,31, 26,14,20, 18,23,12, 03,02,02 ; PAL_SLOTS3
	RGB 31,29,31, 16,19,29, 18,23,12, 03,02,02 ; PAL_SLOTS4
ENDC
	RGB 31,29,31, 07,07,07, 02,03,03, 03,02,02 ; PAL_BLACK
	RGB 31,29,31, 30,26,15, 09,20,11, 03,02,02 ; PAL_GREENBAR
	RGB 31,29,31, 30,26,15, 26,20,00, 03,02,02 ; PAL_YELLOWBAR
	RGB 31,29,31, 30,26,15, 26,10,06, 03,02,02 ; PAL_REDBAR
	RGB 31,29,31, 30,22,17, 11,15,23, 03,02,02 ; PAL_BADGE
	RGB 31,29,31, 21,14,09, 18,24,22, 03,02,02 ; PAL_CAVE
	RGB 31,29,31, 27,06,11, 15,15,18, 03,02,02 ; PAL_VOLCANO ; marcelnote - new
	RGB 31,29,31, 31,28,14, 24,20,10, 03,02,02 ; PAL_GAMEFREAK
	assert_table_length NUM_SGB_PALS
