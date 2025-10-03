; marcelnote - moved from engine/pokemon/status_screen.asm
StatusScreenStatusText:
	db "STATUT/@"

StatusScreenOKText:
	db "OK@"

StatusScreenTypeText:
	db "TYPE/@"

StatusScreenOTText:
	db   "DO/"
	next ""
	; fallthrough
StatusScreenIDNoText:
	db "№<ID>.@"

StatusScreenInfoText:
	db "INFO/@"

StatusScreenStatsText:
	db "STATS   @"

StatusScreenDVsText:
	db "DVS     @"

StatusScreenStatExpText:
	db "STAT.EXP@"

StatusScreenExpText:
	db   "PTS EXP."
	next ""
	; fallthrough
StatusScreenLevelUpText:
	db   "PROCH.NIV.@"

StatusScreenToNextLevelText:
	db "<▶>@"

StatusScreenFieldMoveText:
	db "COMP.@"

StatsText:
	db   "ATTAQUE"
	next "DEFENSE"
	next "VITESSE"
	next "SPECIAL@"
