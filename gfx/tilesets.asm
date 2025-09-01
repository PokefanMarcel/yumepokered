SECTION "Tilesets 1", ROMX

IF DEF(_FRA)
Overworld_GFX::     INCBIN "translation/fra/gfx/tilesets/overworld.fra.2bpp"
ELSE
Overworld_GFX::     INCBIN "gfx/tilesets/overworld.2bpp"
ENDC
Overworld_Block::   INCBIN "gfx/blocksets/overworld.bst"

BigHouse_GFX::      INCBIN "gfx/tilesets/big_house.2bpp" ; marcelnote - removed REDS_HOUSE_2 tileset
BigHouse_Block::    INCBIN "gfx/blocksets/big_house.bst" ;              and renamed REDS_HOUSE_1

House_GFX::         INCBIN "gfx/tilesets/house.2bpp"
House_Block::       INCBIN "gfx/blocksets/house.bst"
; marcelnote - MANSION was here
ShipPort_GFX::      INCBIN "gfx/tilesets/ship_port.2bpp"
ShipPort_Block::    INCBIN "gfx/blocksets/ship_port.bst"
Interior_GFX::      INCBIN "gfx/tilesets/interior.2bpp"
Interior_Block::    INCBIN "gfx/blocksets/interior.bst"
Plateau_GFX::       INCBIN "gfx/tilesets/plateau.2bpp"
Plateau_Block::     INCBIN "gfx/blocksets/plateau.bst"


SECTION "Tilesets 2", ROMX

Gym_GFX::           INCBIN "gfx/tilesets/gym.2bpp"
Gym_Block::         INCBIN "gfx/blocksets/gym.bst"

Pokecenter_GFX::    INCBIN "gfx/tilesets/pokecenter.2bpp" ; marcelnote - removed MART tileset
Pokecenter_Block::  INCBIN "gfx/blocksets/pokecenter.bst"

Gate_GFX::          INCBIN "gfx/tilesets/gate.2bpp"
Gate_Block::        INCBIN "gfx/blocksets/gate.bst"

Forest_GFX::        INCBIN "gfx/tilesets/forest.2bpp"
Forest_Block::      INCBIN "gfx/blocksets/forest.bst"
; marcelnote - FACILITY was here


SECTION "Tilesets 3", ROMX

Cemetery_GFX::      INCBIN "gfx/tilesets/cemetery.2bpp"
Cemetery_Block::    INCBIN "gfx/blocksets/cemetery.bst"
; marcelnote - CAVERN was here
Lobby_GFX::         INCBIN "gfx/tilesets/lobby.2bpp"
Lobby_Block::       INCBIN "gfx/blocksets/lobby.bst"
Ship_GFX::          INCBIN "gfx/tilesets/ship.2bpp"
Ship_Block::        INCBIN "gfx/blocksets/ship.bst"
Lab_GFX::           INCBIN "gfx/tilesets/lab.2bpp"
Lab_Block::         INCBIN "gfx/blocksets/lab.bst"
Club_GFX::          INCBIN "gfx/tilesets/club.2bpp"
Club_Block::        INCBIN "gfx/blocksets/club.bst"
Underground_GFX::   INCBIN "gfx/tilesets/underground.2bpp"
Underground_Block:: INCBIN "gfx/blocksets/underground.bst"


SECTION "Tilesets 4", ROMX  ; marcelnote - new or moved tilesets

Academy_GFX::       INCBIN "gfx/tilesets/academy.2bpp"
Academy_Block::     INCBIN "gfx/blocksets/academy.bst"
Mountain_GFX::      INCBIN "gfx/tilesets/mountain.2bpp"
Mountain_Block::    INCBIN "gfx/blocksets/mountain.bst"
Cavern_GFX::        INCBIN "gfx/tilesets/cavern.2bpp"   ; marcelnote - moved CAVERN blockset
Cavern_Block::      INCBIN "gfx/blocksets/cavern.bst"   ; marcelnote - moved CAVERN blockset
Facility_GFX::      INCBIN "gfx/tilesets/facility.2bpp" ; marcelnote - moved FACILITY blockset
Facility_Block::    INCBIN "gfx/blocksets/facility.bst" ; marcelnote - moved FACILITY blockset
Mansion_GFX::       INCBIN "gfx/tilesets/mansion.2bpp"  ; marcelnote - moved MANSION blockset
Mansion_Block::     INCBIN "gfx/blocksets/mansion.bst"  ; marcelnote - moved MANSION blockset


SECTION "Tilesets 5", ROMX  ; marcelnote - new or moved tilesets

Safari_GFX::        INCBIN "gfx/tilesets/safari.2bpp"
Safari_Block::      INCBIN "gfx/blocksets/safari.bst"
BeachHouse_GFX::    INCBIN "gfx/tilesets/beach_house.2bpp" ; marcelnote - new tileset from pokeyellow
BeachHouse_Block::  INCBIN "gfx/blocksets/beach_house.bst" ; marcelnote - new tileset from pokeyellow
Plant_GFX::         INCBIN "gfx/tilesets/plant.2bpp"       ; marcelnote - new for Power Plant
Plant_Block::       INCBIN "gfx/blocksets/plant.bst"       ; marcelnote - new for Power Plant
Game_GFX::          INCBIN "gfx/tilesets/game.2bpp"        ; marcelnote - new for Game Corner
Game_Block::        INCBIN "gfx/blocksets/game.bst"        ; marcelnote - new for Game Corner
