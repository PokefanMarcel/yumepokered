WarpTileIDPointers:
	table_width 2, WarpTileIDPointers
	dw .OverworldWarpTileIDs
	dw .BigHouseWarpTileIDs ; marcelnote - merged REDS_HOUSE tilesets
	dw .ForestWarpTileIDs
	dw .SafariWarpTileIDs ; marcelnote ; new tileset from FOREST
	dw .PokecenterWarpTileIDs
	dw .GymWarpTileIDs
	dw .HouseWarpTileIDs
	dw .UndergroundWarpTileIDs
	dw .GateWarpTileIDs
	dw .ShipWarpTileIDs
	dw .ShipPortWarpTileIDs
	dw .CemeteryWarpTileIDs
	dw .InteriorWarpTileIDs
	dw .CavernWarpTileIDs
	dw .LobbyWarpTileIDs
	dw .MansionWarpTileIDs
	dw .LabWarpTileIDs
	dw .ClubWarpTileIDs
	dw .FacilityWarpTileIDs
	dw .PlateauWarpTileIDs
	dw .AcademyWarpTileIDs  ; marcelnote - new tileset
	dw .MountainWarpTileIDs ; marcelnote - new tileset
	assert_table_length NUM_TILESETS

MACRO warp_tiles
	IF _NARG
		db \# ; all args
	ENDC
	db -1 ; end
ENDM

.OverworldWarpTileIDs:
	warp_tiles $1B, $58

.GateWarpTileIDs:
	db $3B
	; fallthrough
.BigHouseWarpTileIDs: ; marcelnote - merged REDS_HOUSE tilesets
.AcademyWarpTileIDs: ; marcelnote - new tileset
	warp_tiles $1A, $1C

.PokecenterWarpTileIDs:
.ClubWarpTileIDs: ; marcelnote - added stairs for Route22Gate3F
	warp_tiles $5E

.SafariWarpTileIDs: ; marcelnote - new tileset from FOREST
	warp_tiles $5A, $5C, $3A

.GymWarpTileIDs:
	warp_tiles $4A

.HouseWarpTileIDs:
	warp_tiles $54, $5C, $32

.ShipWarpTileIDs:
	warp_tiles $37, $39, $1E, $4A

.InteriorWarpTileIDs:
	warp_tiles $15, $55, $04

.CavernWarpTileIDs:
	warp_tiles $18, $1A, $22

.LobbyWarpTileIDs:
	warp_tiles $1A, $1C, $38

.MansionWarpTileIDs:
	warp_tiles $1A, $1C, $53

.LabWarpTileIDs:
	warp_tiles $34

.FacilityWarpTileIDs:
	db $43, $58, $20
	; fallthrough
.CemeteryWarpTileIDs:
	db $1B
	; fallthrough
.UndergroundWarpTileIDs:
	warp_tiles $13

.MountainWarpTileIDs: ; marcelnote - new tileset
	warp_tiles $24

.PlateauWarpTileIDs:
	db $1B, $3B
	; fallthrough
.ShipPortWarpTileIDs:
.ForestWarpTileIDs: ; marcelnote - no need for warp tiles anymore
	warp_tiles ; end
