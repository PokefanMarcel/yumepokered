WarpTileListPointers:
	dw .FacingDownWarpTiles
	dw .FacingUpWarpTiles
	dw .FacingLeftWarpTiles
	dw .FacingRightWarpTiles

MACRO warp_carpet_tiles
	IF _NARG
		db \# ; all args
	ENDC
	db -1 ; end
ENDM

.FacingDownWarpTiles:
	warp_carpet_tiles $01, $12, $17, $3D, $04, $18, $33, $2c ; marcelnote - added $2c for Docks (Orange Ferry entrance)

.FacingUpWarpTiles:
	warp_carpet_tiles $01, $5C

.FacingLeftWarpTiles:
	warp_carpet_tiles $1A, $4B, $12, $17 ; marcelnote - added $12, $17 for updated Route16

.FacingRightWarpTiles:
	warp_carpet_tiles $0F, $4E, $5C, $5A ; marcelnote - added $5C, $5A for updated Route16
