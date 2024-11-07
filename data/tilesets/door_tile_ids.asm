DoorTileIDPointers:
	dbw OVERWORLD,   .OverworldDoorTileIDs
	dbw FOREST,      .ForestDoorTileIDs
	dbw SAFARI,      .SafariDoorTileIDs ; marcelnote - new tileset from FOREST
	dbw POKECENTER,  .PokecenterDoorTileIDs ; marcelnote - was MART, replaced
	dbw HOUSE,       .HouseDoorTileIDs
	dbw GATE,        .GateDoorTileIDs ; marcelnote - changed from .TilesetMuseumDoorTileIDs
	dbw SHIP,        .ShipDoorTileIDs
	dbw LOBBY,       .LobbyDoorTileIDs
	dbw MANSION,     .MansionDoorTileIDs
	dbw LAB,         .LabDoorTileIDs
	dbw FACILITY,    .FacilityDoorTileIDs
	dbw PLATEAU,     .PlateauDoorTileIDs
	dbw ACADEMY,     .AcademyDoorTileIDs    ; marcelnote - new tileset
	dbw MOUNTAIN,    .MountainDoorTileIDs   ; marcelnote - new tileset
	db -1 ; end

MACRO door_tiles
	IF _NARG
		db \# ; all args
	ENDC
	db 0 ; end
ENDM

.OverworldDoorTileIDs:
	door_tiles $1B, $58

.ForestDoorTileIDs:
.SafariDoorTileIDs: ; marcelnote - new tileset from FOREST
	door_tiles $3a

.PokecenterDoorTileIDs: ; marcelnote - was MartDoorTileIDs, replaced
	door_tiles $5e

.HouseDoorTileIDs:
	door_tiles $54

.GateDoorTileIDs: ; marcelnote - changed from .TilesetMuseumDoorTileIDs
	door_tiles $3b

.ShipDoorTileIDs:
	door_tiles $1e

.LobbyDoorTileIDs:
	door_tiles $1c, $38, $1a

.MansionDoorTileIDs:
	door_tiles $1a, $1c, $53

.LabDoorTileIDs:
	door_tiles $34

.FacilityDoorTileIDs:
	door_tiles $43, $58, $1b

.PlateauDoorTileIDs:
	door_tiles $3b, $1b

.AcademyDoorTileIDs:    ; marcelnote - new tileset
	door_tiles $1a, $1c

.MountainDoorTileIDs:   ; marcelnote - new tileset
	door_tiles $24, $5A
