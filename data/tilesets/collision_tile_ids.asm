MACRO coll_tiles
	IF _NARG
		db \# ; all args
	ENDC
	db -1 ; end
ENDM

; marcelnote - most collision sets were updated

Underground_Coll::
	coll_tiles $00, \ ; floor
	           $11, \ ; floor, shaded
	           $20, $22, \ ; floor, lighted from south
	           $33, $42, \ ; floor, lighted from west
	           $5e    ; stairs

Overworld_Coll::
	coll_tiles $00, \ ; plain white (road)
	           $10, $20, $21, \ ; cables
	           $1b, \ ; door
	           $2c, $30, $39, \ ; grassy ground
	           $3c, \ ; dock
	           $52, \ ; grass
	           $58, \ ; cavern entrance
	           $5b    ; pavement

BigHouse_Coll::
	coll_tiles $01, $02, $03, $04, $11, $12, $13, $14, $1c, $1a

Pokecenter_Coll::
	coll_tiles $10, $11, $14, $5c, $5e

Gym_Coll::
	coll_tiles $11, \ ; striped floor (e.g. Pewter gym)
	           $16, \ ; carpet
	           $19, \ ; tiled floor (e.g. Hall of fame)
	           $2b, \ ; grassy floor (Erika's gym)
	           $03, \ ; flower
	           $3c, $3e, $3f, \ ; spinner tiles
	           $4a, \ ; stairs
	           $4d    ; spinner stop

Forest_Coll::
	coll_tiles $01, \ ; grassy ground
	           $02, \ ; wood pavement
	           $10, \ ; ground
	           $11, \ ; grass
	           $12, \ ; flower
	           $20, \ ; small rock
	           $4b, $5e, \ ; platform
	           $1e, $5d    ; stairs

Safari_Coll::
	coll_tiles $1e, $20, $2e, $30, $34, $37, $39, $3a, $40, $51, $52, $5a, $5c, $5e, $5f

House_Coll::
	coll_tiles $01, $12, $14, $28, $37, $44, $54

Gate_Coll::
	coll_tiles $01, \ ; tiled floor
	           $12, \ ; chair
	           $14, \ ; carpet
	           $53, $54, $55, \ ; carpet
	           $5a, \ ; door
	           $5c, \ ; upstairs
	           $5e    ; downstairs

Ship_Coll::
	coll_tiles $04, $0d, $17, $1d, $1e, $23, $34, $37, $39, $4a

ShipPort_Coll::
	coll_tiles $0a, $32, $3b

Cemetery_Coll::
	coll_tiles $01, $13, $1b, $22

Interior_Coll::
	coll_tiles $04, $0f, $15, $1f, $3b, $45, $47, $55, $56

Cavern_Coll::
	coll_tiles $05, $15, $18, $1a, $20, $21, $22, $2a, $2d, $30, $41

Lobby_Coll::
	coll_tiles $14, $17, $1a, $1c, $20, $38, $45, $55

Mansion_Coll::
	coll_tiles $01, $05, $11, $12, $14, $1a, $1c, $2c, $53, $59

Lab_Coll::
	coll_tiles $00, $34, $47, $4a, $5a, $5e

Club_Coll::
	coll_tiles $00, $1a, $1f, $26, $28, $29, $2c, $2d, $2e, $2f, $41, $50, $51, $5e

Facility_Coll::
	coll_tiles $01, \ ; tiled floor
	           $11, \ ; hole
	           $13, \ ; upstairs
	           $1b, \ ; downstairs
	           $20, $22, $23, \ ; spinner tiles
	           $42, \ ; carpet edge
	           $43, \ ; upstairs
	           $52, \ ; carpet
	           $55, \ ; broken floor
	           $58, \ ; elevator door
	           $5e    ; spinner stop

Plateau_Coll::
	coll_tiles $1b, $23, $2c, $2d, $3b, $45

Academy_Coll::  ; marcelnote - new tileset
	coll_tiles $01, $12, $14, $1a, $1c

Mountain_Coll::  ; marcelnote - new tileset
	coll_tiles $01, $12, $20, $2e, $40, $5c, $5e

BeachHouse_Coll::  ; marcelnote - new tileset from pokeyellow
	coll_tiles $01, $12, $20, $21, $58, $5a

Plant_Coll:: ; marcelnote - new tileset for Power Plant
	coll_tiles $01, $10, $11

Game_Coll:: ; marcelnote - new tileset from Lobby
	coll_tiles $00, $14, $34, $5e
