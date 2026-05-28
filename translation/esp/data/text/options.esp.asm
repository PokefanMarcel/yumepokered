; marcelnote - moved from engine/menus/options.asm
AllOptionsText:
	db   "VELOCIDAD TEXTO"
	next "ANIMACIÓN BATALLA"
	next "ESTILO BATALLA"
	next "ESTILO SPRITE"
	next "UNIDADES MEDIDA"
	next ""
	next "IR A CASA" ; marcelnote - option to Go Home
	next "SALIR@"

OptionsColonsText:
	db   ":"
	next ":"
	next ":"
	next ":"
	next ":@"

InstantText:
	db "INSTANTÁNEA@"
FastText:
	db "RÁPIDA     @"
MediumText:
	db "MEDIA      @"
SlowText:
	db "LENTA      @"

AnimationOnText:
	db "SÍ@"
AnimationOffText:
	db "NO@"

BattleStyleShiftText:
	db "CAMBIAR @"
BattleStyleSetText:
	db "MANTENER@"

MeasureUnitsImperialText:
	db "IMPERIALES@"
MeasureUnitsMetricText:
	db "MÉTRICAS  @"

SpriteStyleGreenText:
	db "VERDE  @"
SpriteStyleBlueText:
	db "AZUL   @"
SpriteStyleCrystalText:
	db "CRISTAL@"
