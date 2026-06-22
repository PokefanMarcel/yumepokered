; marcelnote - Pikachu's Beach minigame
; Some sprites were moved in VRAM.

PikachusBeachOAMData:
	dbw $00, .SingleTile ; referenced but unused
	dbw $00, .SurfingPikachu
	dbw $36, .SurfingPikachu
	dbw $03, .SurfingPikachu
	dbw $39, .SurfingPikachu
	dbw $06, .SurfingPikachu
	dbw $3c, .SurfingPikachu
	dbw $09, .SurfingPikachu
	dbw $60, .SurfingPikachu
	dbw $0c, .SurfingPikachu
	dbw $63, .SurfingPikachu
	dbw $30, .SurfingPikachu
	dbw $66, .SurfingPikachu
	dbw $33, .SurfingPikachu
	dbw $69, .SurfingPikachu
	dbw $6c, .UnusedFrontPikachu
	dbw $9c, .UnusedBackPikachu
	dbw $6c, .ResultsPikachu1
	dbw $0f, .ResultsPikachu2
	dbw $a7, .SmallSplash
	dbw $a8, .LargeSplash
	dbw $d6, .EmptySurfboard
	dbw $90, .StartText
	dbw $b0, .GoalText ; marcelnote - restored GOAL anim
	dbw $d0, .OhNoText
	dbw $a7, .WaterSpray
	dbw $f0, .Plus50Pts
	dbw $f0, .Plus150Pts
	dbw $f0, .Plus350Pts
	dbw $f0, .Plus750Pts
	dbw $f0, .Plus180Pts
	dbw $f0, .Plus500Pts
	dbw $00, .IntroPikachu ; marcelnote - minus $80 since moved Pikachu in VRAM
	dbw $04, .IntroPikachu
	dbw $08, .IntroPikachu
	dbw $0c, .IntroPikachu

.SingleTile:
	db 1
	db  -4,  -4, $00, 0

.SurfingPikachu:
.UnusedFrontPikachu:
.UnusedBackPikachu:
.ResultsPikachu1:
	db 9
	db -12, -12, $00, 0
	db -12,  -4, $01, 0
	db -12,   4, $02, 0
	db  -4, -12, $10, 0
	db  -4,  -4, $11, 0
	db  -4,   4, $12, 0
	db   4, -12, $20, 0
	db   4,  -4, $21, 0
	db   4,   4, $22, 0

.ResultsPikachu2:
	db 9
	db -12, -12, $00, 0
	db -12,  -4, $30, 0
	db -12,   4, $60, 0
	db  -4, -12, $10, 0
	db  -4,  -4, $40, 0
	db  -4,   4, $70, 0
	db   4, -12, $20, 0
	db   4,  -4, $50, 0
	db   4,   4, $80, 0

.StartText:
.GoalText:
.OhNoText:
	db 12
	db  -8, -24, $00, 0
	db  -8, -16, $01, 0
	db  -8,  -8, $02, 0
	db  -8,   0, $03, 0
	db  -8,   8, $04, 0
	db  -8,  16, $05, 0
	db   0, -24, $10, 0
	db   0, -16, $11, 0
	db   0,  -8, $12, 0
	db   0,   0, $13, 0
	db   0,   8, $14, 0
	db   0,  16, $15, 0

.WaterSpray:
	db 3
	db  -4,  11, $00, OAM_PAL1
	db   4,   3, $0f, OAM_PAL1
	db   4,  11, $10, OAM_PAL1

.SmallSplash:
	db 6
	db  -4, -16, $00, OAM_PAL1 | OAM_XFLIP
	db  -4,   8, $00, OAM_PAL1
	db   4, -16, $10, OAM_PAL1 | OAM_XFLIP
	db   4,  -8, $0f, OAM_PAL1 | OAM_XFLIP
	db   4,   0, $0f, OAM_PAL1
	db   4,   8, $10, OAM_PAL1

.LargeSplash:
	db 12
	db -12, -16, $00, OAM_PAL1
	db -12,  -8, $01, OAM_PAL1
	db -12,   0, $01, OAM_PAL1 | OAM_XFLIP
	db -12,   8, $00, OAM_PAL1 | OAM_XFLIP
	db  -4, -16, $10, OAM_PAL1
	db  -4,  -8, $11, OAM_PAL1
	db  -4,   0, $11, OAM_PAL1 | OAM_XFLIP
	db  -4,   8, $10, OAM_PAL1 | OAM_XFLIP
	db   4, -16, $20, OAM_PAL1
	db   4,  -8, $21, OAM_PAL1
	db   4,   0, $21, OAM_PAL1 | OAM_XFLIP
	db   4,   8, $20, OAM_PAL1 | OAM_XFLIP

.EmptySurfboard:
	db 3
	db   4, -12, $00, 0
	db   4,  -4, $01, 0
	db   4,   4, $02, 0

.Plus50Pts:
	db 3
	db  -4, -12, $0a, 0
	db  -4,  -4, $05, 0
	db  -4,   4, $00, 0

.Plus150Pts:
	db 4
	db  -4, -16, $0a, 0
	db  -4,  -8, $01, 0
	db  -4,   0, $05, 0
	db  -4,   8, $00, 0

.Plus350Pts:
	db 4
	db  -4, -16, $0a, 0
	db  -4,  -8, $03, 0
	db  -4,   0, $05, 0
	db  -4,   8, $00, 0

.Plus750Pts:
	db 4
	db  -4, -16, $0a, 0
	db  -4,  -8, $07, 0
	db  -4,   0, $05, 0
	db  -4,   8, $00, 0

.Plus180Pts:
	db 4
	db  -4, -16, $0a, 0
	db  -4,  -8, $01, 0
	db  -4,   0, $08, 0
	db  -4,   8, $00, 0

.Plus500Pts:
	db 4
	db  -4, -16, $0a, 0
	db  -4,  -8, $05, 0
	db  -4,   0, $00, 0
	db  -4,   8, $00, 0

.IntroPikachu:
	db 12
	db -12, -16, $03, OAM_XFLIP
	db -12,  -8, $02, OAM_XFLIP
	db -12,   0, $01, OAM_XFLIP
	db -12,   8, $00, OAM_XFLIP
	db  -4, -16, $13, OAM_XFLIP
	db  -4,  -8, $12, OAM_XFLIP
	db  -4,   0, $11, OAM_XFLIP
	db  -4,   8, $10, OAM_XFLIP
	db   4, -16, $23, OAM_XFLIP
	db   4,  -8, $22, OAM_XFLIP
	db   4,   0, $21, OAM_XFLIP
	db   4,   8, $20, OAM_XFLIP
