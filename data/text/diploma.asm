; marcelnote - moved from engine/events/diploma.asm
DiplomaText:
	db DIPLOMA_TEXTBOX_BULLET, "Diploma", DIPLOMA_TEXTBOX_BULLET, "@"

DiplomaPlayer:
	db "Player@"

DiplomaEmptyText:
	db "@"

DiplomaCongrats:
	db   "Congrats! This"
	next "diploma certifies"
	next "that you have"
	next "completed your"
	next "#DEX.@"
