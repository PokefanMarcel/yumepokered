DEF MAP_TILESET_SIZE EQU $60

; tileset ids
; Tilesets indexes (see data/tilesets/tileset_headers.asm)
	const_def
	const OVERWORLD    ; 0
	const BIG_HOUSE    ; 1 ; marcelnote - renamed from REDS_HOUSE_1
;	const MART         ; X ; marcelnote - removed MART tileset because redundant with POKECENTER
	const FOREST       ; 2
;	const REDS_HOUSE_2 ; X
;	const DOJO         ; X ; marcelnote - removed DOJO tileset because redundant with GYM
	const SAFARI       ; 3 ; marcelnote - new tileset to free space in FOREST
	const POKECENTER   ; 4
	const GYM          ; 5
	const HOUSE        ; 6
;	const FOREST_GATE  ; X ; marcelnote - removed FOREST_GATE and MUSEUM tilesets
;	const MUSEUM       ; X ;              because redundant with GATE
	const UNDERGROUND  ; 7
	const GATE         ; 8
	const SHIP         ; 9
	const SHIP_PORT    ; 10
	const CEMETERY     ; 11
	const INTERIOR     ; 12
	const CAVERN       ; 13
	const LOBBY        ; 14
	const MANSION      ; 15
	const LAB          ; 16
	const CLUB         ; 17
	const FACILITY     ; 18
	const PLATEAU      ; 19
	const ACADEMY      ; 20 ; marcelnote - new Academy tileset
	const MOUNTAIN     ; 21 ; marcelnote - new Mountain tileset
	const BEACH_HOUSE  ; 22 ; marcelnote - new Beach House tileset from pokeyellow
	const PLANT        ; 23 ; marcelnote - new tileset for Power Plant
	const GAME         ; 24 ; marcelnote - new tileset for Game Corner
DEF NUM_TILESETS EQU const_value
