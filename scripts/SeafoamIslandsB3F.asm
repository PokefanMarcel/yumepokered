SeafoamIslandsB3F_Script: ; marcelnote - modified for new special warp engine
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
	dw_const SeafoamIslandsB3FDefaultScript,       SCRIPT_SEAFOAMISLANDSB3F_DEFAULT
	dw_const SeafoamIslandsB3FObjectMoving1Script, SCRIPT_SEAFOAMISLANDSB3F_OBJECT_MOVING1
	dw_const SeafoamIslandsB3FMoveObjectScript,    SCRIPT_SEAFOAMISLANDSB3F_MOVE_OBJECT
	dw_const SeafoamIslandsB3FObjectMoving2Script, SCRIPT_SEAFOAMISLANDSB3F_OBJECT_MOVING2
	EXPORT SCRIPT_SEAFOAMISLANDSB3F_MOVE_OBJECT ; used by engine/overworld/player_state.asm

SeafoamIslandsB3FDefaultScript:
	CheckEvent EVENT_SEAFOAM_B3F_BOULDERS_DOWN
	ret nz
	ld a, [wYCoord]
	cp 8
	ret nz
	ld a, [wXCoord]
	cp 15
	ret nz
	ld hl, wSimulatedJoypadStatesEnd
	ld de, RLEList_ForcedSurfingStrongCurrentNearSteps
	call DecodeRLEList
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld hl, wStatusFlags7
	set BIT_FORCED_WARP, [hl]
	ld a, SCRIPT_SEAFOAMISLANDSB3F_OBJECT_MOVING1
	ld [wSeafoamIslandsB3FCurScript], a
	ret

RLEList_ForcedSurfingStrongCurrentNearSteps:
	db 7, PAD_DOWN ; marcelnote - refactored warp engine
	db 5, PAD_RIGHT
	db 3, PAD_DOWN
	db -1 ; end

SeafoamIslandsB3FObjectMoving1Script:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	; a = 0 = SCRIPT_SEAFOAMISLANDSB3F_DEFAULT
	ld [wSeafoamIslandsB3FCurScript], a
	ret

SeafoamIslandsB3FMoveObjectScript:
	CheckEvent EVENT_SEAFOAM_B3F_BOULDERS_DOWN
	ret nz
	ld a, [wXCoord]
	cp 18
	ld de, .RLEList_StrongCurrentNearLeftBoulder
	jr z, .forceSurfMovement
	cp 19
	ld a, SCRIPT_SEAFOAMISLANDSB3F_DEFAULT
	jr nz, .playerNotInStrongCurrent
	ld de, .RLEList_StrongCurrentNearRightBoulder
.forceSurfMovement
	ld hl, wSimulatedJoypadStatesEnd
	call DecodeRLEList
	ld [wSimulatedJoypadStatesIndex], a
	xor a
	ld [wSpritePlayerStateData2MovementByte1], a
	ld hl, wStatusFlags5
	set BIT_SCRIPTED_MOVEMENT_STATE, [hl]
	ld hl, wStatusFlags7
	set BIT_FORCED_WARP, [hl]
	ld a, SCRIPT_SEAFOAMISLANDSB3F_OBJECT_MOVING2
.playerNotInStrongCurrent
	ld [wSeafoamIslandsB3FCurScript], a
	ret

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

SeafoamIslandsB3FObjectMoving2Script:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	; a = 0 = SCRIPT_SEAFOAMISLANDSB3F_DEFAULT
	ld [wSeafoamIslandsB3FCurScript], a
	ret

SeafoamIslandsB3F_TextPointers:
	def_text_pointers
	dw_const BoulderText, TEXT_SEAFOAMISLANDSB3F_BOULDER1
	dw_const BoulderText, TEXT_SEAFOAMISLANDSB3F_BOULDER2
	dw_const BoulderText, TEXT_SEAFOAMISLANDSB3F_BOULDER3
	dw_const BoulderText, TEXT_SEAFOAMISLANDSB3F_BOULDER4
	dw_const BoulderText, TEXT_SEAFOAMISLANDSB3F_BOULDER5
	dw_const BoulderText, TEXT_SEAFOAMISLANDSB3F_BOULDER6
