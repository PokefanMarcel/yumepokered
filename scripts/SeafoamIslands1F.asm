SeafoamIslands1F_Script: ; marcelnote - modified for new special warp engine
	call EnableAutoTextBoxDrawing
	SetEvent EVENT_IN_SEAFOAM_ISLANDS
	ld hl, wMiscFlags
	bit BIT_PUSHED_BOULDER, [hl]
	jr z, .checkHoles
	res BIT_PUSHED_BOULDER, [hl]
	ld hl, .HolesCoords
	call CheckBoulderCoords
	ret nc
	ld a, [wCoordIndex]
	dec a
	jr nz, .boulder2FellDownHole
	ld a, TOGGLE_SEAFOAM_ISLANDS_1F_BOULDER_1
	ld [wToggleableObjectIndex], a
	predef HideObject
	ld a, TOGGLE_SEAFOAM_ISLANDS_B1F_BOULDER_1
	ld [wToggleableObjectIndex], a
	predef_jump ShowObject
.boulder2FellDownHole
	ld a, TOGGLE_SEAFOAM_ISLANDS_1F_BOULDER_2
	ld [wToggleableObjectIndex], a
	predef HideObject
	ld a, TOGGLE_SEAFOAM_ISLANDS_B1F_BOULDER_2
	ld [wToggleableObjectIndex], a
	predef_jump ShowObject
.checkHoles
	ld d, DUNGEON_WARP_SEAFOAM_1F_LEFT
	ld hl, .HolesCoords
	jp IsPlayerOnDungeonWarp

.HolesCoords:
	dbmapcoord 17,  6
	dbmapcoord 24,  6
	db -1 ; end

SeafoamIslands1F_TextPointers:
	def_text_pointers
	dw_const BoulderText, TEXT_SEAFOAMISLANDS1F_BOULDER1
	dw_const BoulderText, TEXT_SEAFOAMISLANDS1F_BOULDER2
