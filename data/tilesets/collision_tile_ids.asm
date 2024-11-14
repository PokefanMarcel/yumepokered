MACRO coll_tiles
	IF _NARG
		db \# ; all args
	ENDC
	db -1 ; end
ENDM

Underground_Coll::
	coll_tiles $0b, $0c, $13, $15, $18

Overworld_Coll::
	coll_tiles $00, $10, $1b, $20, $21, $23, $2c, $2d, $2e, $30, $31, $33, $39, $3c, $3e, $52, $54, $58, $5b

BigHouse_Coll::  ; marcelnote - merged REDS_HOUSE tilesets, added $04 (carpet)
	coll_tiles $01, $02, $03, $04, $11, $12, $13, $14, $1c, $1a

Pokecenter_Coll::
	coll_tiles $11, $1a, $1c, $3c, $5e

Gym_Coll::
	coll_tiles $11, $16, $19, $2b, $3c, $3d, $3f, $4a, $4c, $4d, $03

Forest_Coll:: ; marcelnote - updated for revised tileset
	coll_tiles $01, $1f, $20, $30, $34, $37, $40, $4a, $4c, $5d

Safari_Coll:: ; marcelnote - new tileset from FOREST
	coll_tiles $1e, $20, $2e, $30, $34, $37, $39, $3a, $40, $51, $52, $5a, $5c, $5e, $5f

House_Coll::
	coll_tiles $01, $12, $14, $28, $32, $37, $44, $54, $5c

Gate_Coll::
	coll_tiles $01, $12, $14, $1a, $1c, $37, $38, $3b, $3c, $5e

Ship_Coll::
	coll_tiles $04, $0d, $17, $1d, $1e, $23, $34, $37, $39, $4a

ShipPort_Coll::
	coll_tiles $0a, $32, $3b ; marcelnote - removed $1a (mooring tile)

Cemetery_Coll::
	coll_tiles $01, $13, $1b, $22 ; marcelnote - removed $10, $42, $52

Interior_Coll::
	coll_tiles $04, $0f, $15, $1f, $3b, $45, $47, $55, $56

Cavern_Coll::  ; marcelnote - added $41 for elevation
	coll_tiles $05, $15, $18, $1a, $20, $21, $22, $2a, $2d, $30, $41

Lobby_Coll::
	coll_tiles $14, $17, $1a, $1c, $20, $38, $45

Mansion_Coll:: ; marcelnote - added $59
	coll_tiles $01, $05, $11, $12, $14, $1a, $1c, $2c, $53, $59

Lab_Coll::
	coll_tiles $0c, $26, $16, $1e, $34, $37

Club_Coll:: ; marcelnote - changed $0f to $00, added $50, $51, $5e
	coll_tiles $00, $1a, $1f, $26, $28, $29, $2c, $2d, $2e, $2f, $41, $50, $51, $5e

Facility_Coll:: ; marcelnote - removed $22, $32, $48
	coll_tiles $01, $10, $11, $13, $1b, $20, $21, $30, $31, $42, $43, $52, $55, $58, $5e

Plateau_Coll::
	coll_tiles $1b, $23, $2c, $2d, $3b, $45

Academy_Coll::  ; marcelnote - new tileset
	coll_tiles $01, $12, $14, $1A, $1C

Mountain_Coll::  ; marcelnote - new tileset
	coll_tiles $40, $2E, $12, $20, $24, $53, $5A
