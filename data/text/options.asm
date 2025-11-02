; marcelnote - moved from engine/menus/options.asm
AllOptionsText:
	db   "TEXT SPEED"
	next "BATTLE ANIMATION"
	next "BATTLE STYLE"
	next "SPRITE STYLE"
	next "MEASURE UNITS"
	next ""
	next ""
	next "DONE@" ; marcelnote - changed from CANCEL@

OptionsColonsText:
	db   ":"
	next ":"
	next ":"
	next ":"
	next ":@"

InstantText:
	db "INSTANT@"
FastText:
	db "FAST   @"
MediumText:
	db "MEDIUM @"
SlowText:
	db "SLOW   @"

AnimationOnText:
	db "ON @"
AnimationOffText:
	db "OFF@"

BattleStyleShiftText:
	db "SHIFT@"
BattleStyleSetText:
	db "SET  @"

MeasureUnitsImperialText:
	db "IMPERIAL@"
MeasureUnitsMetricText:
	db "METRIC  @"

SpriteStyleGreenText:
	db "GREEN  @"
SpriteStyleBlueText:
	db "BLUE   @"
SpriteStyleYellowText:
	db "YELLOW @"
