SeafoamIslandsB3F_Script: ; marcelnote - refactored map script and modified for new special warp engine
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
	ld a, TOGGLE_SEAFOAM_ISLANDS_B3F_BOULDER_1
	ld [wToggleableObjectIndex], a
	predef HideObject
	ld a, TOGGLE_SEAFOAM_ISLANDS_B4F_BOULDER_1
	ld [wToggleableObjectIndex], a
	predef ShowObject
	CheckHideShow TOGGLE_SEAFOAM_ISLANDS_B4F_BOULDER_2
	jr nz, .runCurrentMapScript
	SetEvent EVENT_SEAFOAM_B4F_BOULDERS_DOWN
	jr .runCurrentMapScript
.boulder2FellDownHole
	ld a, TOGGLE_SEAFOAM_ISLANDS_B3F_BOULDER_2
	ld [wToggleableObjectIndex], a
	predef HideObject
	ld a, TOGGLE_SEAFOAM_ISLANDS_B4F_BOULDER_2
	ld [wToggleableObjectIndex], a
	predef ShowObject
	CheckHideShow TOGGLE_SEAFOAM_ISLANDS_B4F_BOULDER_1
	jr nz, .runCurrentMapScript
	SetEvent EVENT_SEAFOAM_B4F_BOULDERS_DOWN
	jr .runCurrentMapScript
.checkHoles
	ld d, DUNGEON_WARP_SEAFOAM_B3F_LEFT
	ld hl, .HolesCoords
	call IsPlayerOnDungeonWarp
	ret c
.runCurrentMapScript
	ld hl, SeafoamIslandsB3F_ScriptPointers
	ld a, [wSeafoamIslandsB3FCurScript]
	jp CallFunctionInTable

.HolesCoords:
	dbmapcoord  3, 16
	dbmapcoord  6, 16
	db -1 ; end

SeafoamIslandsB3F_ScriptPointers:
	def_script_pointers
	dw_const SeafoamIslandsB3FDefaultScript,      SCRIPT_SEAFOAMISLANDSB3F_DEFAULT
	dw_const SeafoamIslandsB3FPlayerMovingScript, SCRIPT_SEAFOAMISLANDSB3F_PLAYER_MOVING

SeafoamIslandsB3FDefaultScript:
	CheckEvent EVENT_SEAFOAM_B3F_BOULDERS_DOWN
	ret nz
	ld hl, .Coords
	call ArePlayerCoordsInArray
	ld hl, wCurrentMapScriptFlags  ; marcelnote - preserving vanilla behavior,
	bit BIT_CUR_MAP_LOADED_1, [hl] ;  the automovement triggers from the boulder
	res BIT_CUR_MAP_LOADED_1, [hl] ;  positions only if we just fell down from B2F
	ret nc
	jr nz, .gotMapLoadedState
	ccf ; unset C flag if map is already loaded
.gotMapLoadedState
	ld a, [wCoordIndex]
	dec a
	ld de, .RLEList_StrongCurrentNearSteps
	jr z, .forceSurfMovement
	ret nc
	dec a
	ld de, .RLEList_StrongCurrentNearLeftBoulder
	jr z, .forceSurfMovement
	ld de, .RLEList_StrongCurrentNearRightBoulder
.forceSurfMovement
	ld hl, wSimulatedJoypadStatesEnd
	call DecodeRLEList
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld hl, wStatusFlags7
	set BIT_FORCED_WARP, [hl]
	ld a, SCRIPT_SEAFOAMISLANDSB3F_PLAYER_MOVING
	ld [wSeafoamIslandsB3FCurScript], a
	ret

.RLEList_StrongCurrentNearSteps:
	db 7, PAD_DOWN ; marcelnote - refactored warp engine
	db 5, PAD_RIGHT
	db 3, PAD_DOWN
	db -1 ; end

.RLEList_StrongCurrentNearRightBoulder:
	db 7, PAD_DOWN ; marcelnote - refactored warp engine
	db 1, PAD_RIGHT
	db 4, PAD_DOWN
	db -1 ; end

.RLEList_StrongCurrentNearLeftBoulder:
	db 7, PAD_DOWN ; marcelnote - refactored warp engine
	db 2, PAD_RIGHT
	db 4, PAD_DOWN
	db -1 ; end

.Coords
	dbmapcoord 15,  8 ; near steps
	dbmapcoord 18,  7 ; near left boulder
	dbmapcoord 19,  7 ; near right boulder
	db -1 ; end

SeafoamIslandsB3FPlayerMovingScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	ld [wSeafoamIslandsB3FCurScript], a ; SCRIPT_SEAFOAMISLANDSB3F_DEFAULT (a = 0)
	ret

SeafoamIslandsB3F_TextPointers:
	def_text_pointers
	dw_const BoulderText, TEXT_SEAFOAMISLANDSB3F_BOULDER1
	dw_const BoulderText, TEXT_SEAFOAMISLANDSB3F_BOULDER2
	dw_const BoulderText, TEXT_SEAFOAMISLANDSB3F_BOULDER3
	dw_const BoulderText, TEXT_SEAFOAMISLANDSB3F_BOULDER4
	dw_const BoulderText, TEXT_SEAFOAMISLANDSB3F_BOULDER5
	dw_const BoulderText, TEXT_SEAFOAMISLANDSB3F_BOULDER6
