WhichTechniqueString: ; marcelnote - modified to solve misprinting bug
;	db "WHICH TECHNIQUE?@"
	db   "MIMIC which move?"
	next "           @"

OldManName:
	db "OLD MAN@"

DisabledText: ; marcelnote - was "disabled!@", removed "!" for narrower box
	db "disabled@"

TypeText:
	db "TYPE@"

PowerText:    ; marcelnote - new
	db "PWR@"

AccuracyText: ; marcelnote - new
	db "ACC@"

PPText:       ; marcelnote - new
	db "PP@"

NoPowerText:  ; marcelnote - new
	db "-@"