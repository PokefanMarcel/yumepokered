; marcelnote - moved from engine/menus/options.asm
AllOptionsText:
	db   "VITESSE TEXTE"
	next "ANIMATION COMBAT"
	next "STYLE COMBAT"
	next "UNITE MESURE"
	next ""
	next ""
	next ""
	next "RETOUR@"

OptionsColonsText:
	db   ":"
	next ":"
	next ":"
	next ":@"

InstantText:
	db "IMMEDIAT@"
FastText:
	db "RAPIDE  @"
MediumText:
	db "MOYEN   @"
SlowText:
	db "LENT    @"

AnimationOnText:
	db "OUI@"
AnimationOffText:
	db "NON@"

BattleStyleShiftText:
	db "CHOIX @"
BattleStyleSetText:
	db "DEFINI@"

MeasureUnitsImperialText:
	db "IMPERIAL@"
MeasureUnitsMetricText:
	db "METRIQUE@"
