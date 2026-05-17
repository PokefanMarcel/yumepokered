SeafoamIslandsB2F_Script: ; marcelnote - modified for new special warp engine
	call EnableAutoTextBoxDrawing
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
	ld a, TOGGLE_SEAFOAM_ISLANDS_B2F_BOULDER_1
	ld [wToggleableObjectIndex], a
	predef HideObject
	ld a, TOGGLE_SEAFOAM_ISLANDS_B3F_BOULDER_3
	ld [wToggleableObjectIndex], a
	predef ShowObject
	CheckHideShow TOGGLE_SEAFOAM_ISLANDS_B3F_BOULDER_4
	ret nz
	SetEvent EVENT_SEAFOAM_B3F_BOULDERS_DOWN
	ret
.boulder2FellDownHole
	ld a, TOGGLE_SEAFOAM_ISLANDS_B2F_BOULDER_2
	ld [wToggleableObjectIndex], a
	predef HideObject
	ld a, TOGGLE_SEAFOAM_ISLANDS_B3F_BOULDER_4
	ld [wToggleableObjectIndex], a
	predef ShowObject
	CheckHideShow TOGGLE_SEAFOAM_ISLANDS_B3F_BOULDER_3
	ret nz
	SetEvent EVENT_SEAFOAM_B3F_BOULDERS_DOWN
	ret
.checkHoles
	ld d, DUNGEON_WARP_SEAFOAM_B2F_LEFT
	ld hl, .HolesCoords
	jp IsPlayerOnDungeonWarp

.HolesCoords:
	dbmapcoord 19,  6
	dbmapcoord 22,  6
	db -1 ; end

SeafoamIslandsB2F_TextPointers:
	def_text_pointers
	dw_const PickUpItemText, TEXT_SEAFOAMISLANDSB2F_WATER_STONE ; marcelnote - new
	dw_const BoulderText,    TEXT_SEAFOAMISLANDSB2F_BOULDER1
	dw_const BoulderText,    TEXT_SEAFOAMISLANDSB2F_BOULDER2
