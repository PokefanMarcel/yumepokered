SeafoamIslandsB4F_Script: ; marcelnote - refactored map script
	call EnableAutoTextBoxDrawing
	ld hl, ArticunoTrainerHeader
	ld de, SeafoamIslandsB4F_ScriptPointers
	ld bc, wSeafoamIslandsB4FCurScript
	jp ExecuteCurMapScriptInTable

SeafoamIslandsB4F_ScriptPointers:
	def_script_pointers
	dw_const SeafoamIslandsB4FDefaultScript,        SCRIPT_SEAFOAMISLANDSB4F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_SEAFOAMISLANDSB4F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_SEAFOAMISLANDSB4F_END_BATTLE
	dw_const SeafoamIslandsB4FPlayerMovingScript,   SCRIPT_SEAFOAMISLANDSB4F_PLAYER_MOVING
	dw_const SeafoamIslandsB4FStrongCurrentScript,  SCRIPT_SEAFOAMISLANDSB4F_STRONG_CURRENT

SeafoamIslandsB4FDefaultScript: ; marcelnote - modified
	ld hl, .Coords
	call ArePlayerCoordsInArray
	ret nc
	ld a, [wCoordIndex]
	cp 3
	jr c, .west
	; east
	CheckEventHL EVENT_SEAFOAM_B3F_BOULDERS_DOWN
	ret nz
	cp 5
	ld b, 1
	ld a, PAD_UP
	ld [wSimulatedJoypadStatesEnd], a
	jr nc, .forcePlayerUpFromEastSurfEntry
	ld [wSimulatedJoypadStatesEnd + 1], a
	inc b
.forcePlayerUpFromEastSurfEntry
	ld a, b
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld hl, wStatusFlags7
	res BIT_FORCED_WARP, [hl]
	ld a, SCRIPT_SEAFOAMISLANDSB4F_PLAYER_MOVING
	ld [wSeafoamIslandsB4FCurScript], a
	ret

.west
	CheckEventHL EVENT_SEAFOAM_B4F_BOULDERS_DOWN
	ret nz
	dec a
	ld de, .RLEList_StrongCurrentNearLeftBoulder
	jr z, .forceSurfMovement
	ld de, .RLEList_StrongCurrentNearRightBoulder
.forceSurfMovement
	ld hl, wSimulatedJoypadStatesEnd
	call DecodeRLEList
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, SCRIPT_SEAFOAMISLANDSB4F_STRONG_CURRENT
	ld [wSeafoamIslandsB4FCurScript], a
	ret

.RLEList_StrongCurrentNearRightBoulder:
	db 3, PAD_UP
	db 2, PAD_RIGHT
	db 1, PAD_UP
	db -1 ; end

.RLEList_StrongCurrentNearLeftBoulder:
	db 3, PAD_UP
	db 3, PAD_RIGHT
	db 1, PAD_UP
	db -1 ; end

.Coords
	; west
	dbmapcoord  4, 14
	dbmapcoord  5, 14
	; east
	dbmapcoord 20, 17
	dbmapcoord 21, 17
	dbmapcoord 20, 16
	dbmapcoord 21, 16
	db -1 ; end

SeafoamIslandsB4FStrongCurrentScript:
	ld a, [wSimulatedJoypadStatesIndex]
	dec a
	jr nz, SeafoamIslandsB4FPlayerMovingScript
	ld [wWalkBikeSurfState], a ; WALKING (a = 0)
	call ForceBikeOrSurf
	; fallthrough

SeafoamIslandsB4FPlayerMovingScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	ld [wSeafoamIslandsB4FCurScript], a ; SCRIPT_SEAFOAMISLANDSB4F_DEFAULT
	ret

SeafoamIslandsB4F_TextPointers:
	def_text_pointers
	dw_const BoulderText,                       TEXT_SEAFOAMISLANDSB4F_BOULDER1
	dw_const BoulderText,                       TEXT_SEAFOAMISLANDSB4F_BOULDER2
	dw_const SeafoamIslandsB4FArticunoText,     TEXT_SEAFOAMISLANDSB4F_ARTICUNO
	dw_const SeafoamIslandsB4FBouldersSignText, TEXT_SEAFOAMISLANDSB4F_BOULDERS_SIGN
	dw_const SeafoamIslandsB4FDangerSignText,   TEXT_SEAFOAMISLANDSB4F_DANGER_SIGN

; Articuno is object 3, but its event flag is bit 2.
; This is not a problem because its sight range is 0, and
; this map never checks for engaging trainers by sight.
SeafoamIslandsB4F_TrainerHeaders:
	def_trainers 2
ArticunoTrainerHeader:
	trainer EVENT_BEAT_ARTICUNO, 0, SeafoamIslandsB4FArticunoBattleText, SeafoamIslandsB4FArticunoBattleText, SeafoamIslandsB4FArticunoBattleText
	db -1 ; end

SeafoamIslandsB4FArticunoText:
	text_asm
	ld hl, ArticunoTrainerHeader
	call TalkToTrainer
	rst TextScriptEnd

SeafoamIslandsB4FArticunoBattleText:
	text_far _SeafoamIslandsB4FArticunoBattleText
	text_asm
	ld a, ARTICUNO
	call PlayCry
	call WaitForSoundToFinish
	rst TextScriptEnd

SeafoamIslandsB4FBouldersSignText:
	text_far _SeafoamIslandsB4FBouldersSignText
	text_end

SeafoamIslandsB4FDangerSignText:
	text_far _SeafoamIslandsB4FDangerSignText
	text_end
