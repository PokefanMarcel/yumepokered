; tileset ids
; Tilesets indexes (see data/tilesets/tileset_headers.asm)
	const_def
	const OVERWORLD    ; 0
	const BIG_HOUSE    ; 1 ; marcelnote - renamed REDS_HOUSE_1
	;const MART         ; 2 ; marcelnote - removed MART tileset because redundant with POKECENTER
	const FOREST       ; 3
	;const REDS_HOUSE_2 ; 4
	;const DOJO         ; 5 ; marcelnote - removed DOJO tileset because redundant with GYM
	const SAFARI       ; 5 ; marcelnote - new tileset to free space in FOREST
	const POKECENTER   ; 6
	const GYM          ; 7
	const HOUSE        ; 8
	;const FOREST_GATE  ; 9  ; marcelnote - removed FOREST_GATE and MUSEUM tilesets
	;const MUSEUM       ; 10 ;              because redundant with GATE
	const UNDERGROUND  ; 11
	const GATE         ; 12
	const SHIP         ; 13
	const SHIP_PORT    ; 14
	const CEMETERY     ; 15
	const INTERIOR     ; 16
	const CAVERN       ; 17
	const LOBBY        ; 18
	const MANSION      ; 19
	const LAB          ; 20
	const CLUB         ; 21
	const FACILITY     ; 22
	const PLATEAU      ; 23
	const ACADEMY      ; 24 ; marcelnote - new Academy tileset
	const MOUNTAIN     ; 25 ; marcelnote - new Mountain tileset
	const BEACH_HOUSE  ; 24 ; marcelnote - new Beach House tileset from pokeyellow
	const PLANT        ; 24 ; marcelnote - new tileset for Power Plant
	const GAME         ; 24 ; marcelnote - new tileset for Game Corner
DEF NUM_TILESETS EQU const_value
