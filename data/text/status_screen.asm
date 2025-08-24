; marcelnote - moved from engine/pokemon/status_screen.asm
StatusScreenStatusText:
	db "STATUS/@"

StatusScreenOKText:
	db "OK@"

StatusScreenTypeText:
	db "TYPE/@"

StatusScreenOTText:
	db   "OT/"
	next ""
	; fallthrough
StatusScreenIDNoText:
	db "<ID>№<DOT>@"

StatusScreenInfoText:
	db "INFO/@"

StatusScreenStatsText:
	db "STATS   @"

StatusScreenDVsText:
	db "DVS     @"

StatusScreenStatExpText:
	db "STAT.EXP@"

StatusScreenExpText:
	db   "EXP.POINTS"
	next ""
	; fallthrough
StatusScreenLevelUpText:
	db   "LEVEL UP@"

StatusScreenToNextLevelText:
	db "to@"

StatusScreenFieldMoveText:
	db "SKILL@"

StatsText:
	db   "ATTACK"
	next "DEFENSE"
	next "SPEED"
	next "SPECIAL@"
