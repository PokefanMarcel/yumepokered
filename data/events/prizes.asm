PrizeDifferentMenuPtrs:
	dw PrizeMenuMon1Entries, PrizeMenuMon1Cost
	dw PrizeMenuMon2Entries, PrizeMenuMon2Cost
	dw PrizeMenuTMsEntries,  PrizeMenuTMsCost

NoThanksText:
	db "NO THANKS@"

PrizeMenuMon1Entries:
	db ABRA
	db CLEFAIRY
IF DEF(_RED)
	db NIDORINA
ENDC
IF DEF(_BLUE) || DEF(_GREEN) ; marcelnote - added _GREEN
	db NIDORINO
ENDC
	db "@"

PrizeMenuMon1Cost: ; marcelnote - harmonized costs
	bcd2 120
	bcd2 500
;IF DEF(_RED)
;	bcd2 180
;	bcd2 500
;ENDC
;IF DEF(_BLUE)
;	bcd2 120
;	bcd2 750
;ENDC
	bcd2 1200
	db "@"

PrizeMenuMon2Entries: ; marcelnote - modifications to prizes
; marcelnote - PINSIR and SCYTHER are now more common, so made cheaper than DRATINI
;              and swap them to increase accessibility in the version where they are rarer
IF DEF(_RED)
	;db DRATINI
	;db SCYTHER
	db PINSIR
ENDC
IF DEF(_BLUE) || DEF(_GREEN) ; marcelnote - added _GREEN
	;db PINSIR
	;db DRATINI
	db SCYTHER
ENDC
	db DRATINI  ; marcelnote - DRATINI now second in all versions
	db PORYGON
	db "@"

PrizeMenuMon2Cost: ; marcelnote - harmonized costs
;IF DEF(_RED)
;	bcd2 2800
;	bcd2 5500
;	bcd2 9999
;ENDC
;IF DEF(_BLUE) || DEF(_GREEN) ; marcelnote - added _GREEN
	bcd2 2500
	bcd2 4600
	bcd2 6500
;ENDC
	db "@"

PrizeMenuTMsEntries:
	db TM_DRAGON_RAGE
	db TM_HYPER_BEAM
	db TM_SUBSTITUTE
	db "@"

PrizeMenuTMsCost:
	bcd2 3300
	bcd2 5500
	bcd2 7700
	db "@"
