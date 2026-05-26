; marcelnote - moved from engine/menus/options.asm
AllOptionsText:
	db   "VELOCIDAD TEXTO"
	next "ANIMACIÓN BATALLA"
	next "ESTILO BATALLA"
	next "SPRITE STYLE" ; TODO - Spanish translation
	next "MEASURE UNITS" ; TODO - Spanish translation
	next ""
	next "GO HOME" ; TODO - Spanish translation ; marcelnote - option to Go Home
	next "SALIR@" ; marcelnote - changed from CANCEL@

OptionsColonsText:
	db   ":"
	next ":"
	next ":"
	next ":"
	next ":@"

; TODO - Spanish translation
InstantText:
	db "INSTANT@"
FastText:
	db "RÁP.   @"
MediumText:
	db "MED.   @"
SlowText:
	db "LEN.   @"

AnimationOnText:
	db "SÍ@"
AnimationOffText:
	db "NO@"

BattleStyleShiftText:
	db "CAMBIAR @"
BattleStyleSetText:
	db "MANTENER@"

; TODO - Spanish translation
MeasureUnitsImperialText:
	db "IMPERIAL@"
; TODO - Spanish translation
MeasureUnitsMetricText:
	db "METRIC  @"

; TODO - Spanish translation
SpriteStyleGreenText:
	db "GREEN  @"
; TODO - Spanish translation
SpriteStyleBlueText:
	db "BLUE   @"
; TODO - Spanish translation
SpriteStyleCrystalText:
	db "CRYSTAL@"
