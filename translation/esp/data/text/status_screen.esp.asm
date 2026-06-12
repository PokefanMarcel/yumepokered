; marcelnote - moved from engine/pokemon/status_screen.asm
StatusScreenStatusText:
	db "ESTADO/@"

StatusScreenOKText:
	db "OK@"

StatusScreenTypeText:
	db "TIPO/@"

StatusScreenOTText:
	db   "EO/"
	next ""
	; fallthrough
StatusScreenIDNoText:
	db "№<ID><DOT>@"

StatusScreenInfoText:
	db "INFO/@"

StatusScreenStatsText:
	db "ESTAD.  @"

StatusScreenDVsText:
	db "FOR.IND.@"

StatusScreenStatExpText:
	db "PTS.ESF.@"

StatusScreenExpText:
	db   "PUNTOS EXP"
	next ""

StatusScreenLevelUpText:
	db   "SIG.NIVEL@"

StatusScreenToNextLevelText:
	db "a@"

; TODO - Spanish translation
StatusScreenFieldMoveText:
	db "SKILL@"

StatsText:
	db   "ATAQUE"
	next "DEFENSA"
	next "VELOCID."
	next "ESPECIAL@"
