; width of east/west connections
; height of north/south connections
DEF MAP_BORDER EQU 3

; connection directions
	const_def
	const EAST_F
	const WEST_F
	const SOUTH_F
	const NORTH_F

; wCurMapConnections
	const_def
	shift_const EAST   ; 1
	shift_const WEST   ; 2
	shift_const SOUTH  ; 4
	shift_const NORTH  ; 8

; flower and water tile animations ; marcelnote - redid this with bits
	const_def
	const BIT_ANIM_WATER      ; bit 0 = water tile $14 is animated
	const BIT_ANIM_FLOWER     ; bit 1 = flower tile $03 is animated
	const BIT_ANIM_WBOLLARD   ; bit 2 = bollard tile $5e is animated
	const BIT_ANIM_LANTERN    ; bit 3 = lantern tiles $3A and $3B are animated
	const BIT_ANIM_LAVA       ; bit 4 = lava tiles $48, $49, $4A are animated
	const BIT_ANIM_WATERFALL  ; bit 5 = waterfall tile (to do) is animated

	DEF TILEANIM_NONE                     EQU %00000000 ; = 0
	DEF TILEANIM_WATER                    EQU %00000001 ; = 1
	DEF TILEANIM_WATER_FLOWER             EQU %00000011 ; = 3
	DEF TILEANIM_WATER_WBOLLARD           EQU %00000101 ; = 5
	DEF TILEANIM_WATER_FLOWER_WBOLLARD    EQU %00000111 ; = 7
	DEF TILEANIM_LANTERN                  EQU %00001000 ; = 8
	DEF TILEANIM_WATER_LAVA               EQU %00010001 ; = 17
	; still need to add waterfall
	; and to change definitions using (1 << BIT_ANIM_WATER) | (1 << BIT_ANIM_FLOWER) | ...
	; and rename constants according to relevant tileset e.g. TILEANIM_OVERWORLD
