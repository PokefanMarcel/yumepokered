; marcelnote - merged Route18Gate floors
Route18Gate_Script:
	ld hl, wStatusFlags6
	res BIT_ALWAYS_ON_BIKE, [hl]
	call EnableAutoTextBoxDrawing
	ld a, [wRoute18GateCurScript]
	ld hl, Route18Gate_ScriptPointers
	jp CallFunctionInTable
	; marcelnote - Route18Gate2F_Script used to be just:
	; jp DisableAutoTextBoxDrawing

Route18Gate_ScriptPointers:
	def_script_pointers
	dw_const Route18GateDefaultScript,           SCRIPT_ROUTE18GATE_DEFAULT
	dw_const Route18GatePlayerMovingUpScript,    SCRIPT_ROUTE18GATE_PLAYER_MOVING_UP
	dw_const Route18GateGuardScript,             SCRIPT_ROUTE18GATE_GUARD
	dw_const Route18GatePlayerMovingRightScript, SCRIPT_ROUTE18GATE_PLAYER_MOVING_RIGHT

Route18GateDefaultScript:
	call Route16Gate1FIsBicycleInBagScript
	ret nz
	ld hl, .StopsPlayerCoords
	call ArePlayerCoordsInArray
	ret nc
	ld a, TEXT_ROUTE18GATE1F_GUARD_EXCUSE_ME
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	xor a
	ldh [hJoyHeld], a
	ld a, [wCoordIndex]
	cp $1
	jr z, .next_to_counter
	ld a, [wCoordIndex]
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	ld b, 0
	ld c, a
	ld a, D_UP
	ld hl, wSimulatedJoypadStatesEnd
	call FillMemory
	call StartSimulatingJoypadStates
	ld a, SCRIPT_ROUTE18GATE_PLAYER_MOVING_UP
	ld [wRoute18GateCurScript], a
	ret
.next_to_counter
	ld a, SCRIPT_ROUTE18GATE_GUARD
	ld [wRoute18GateCurScript], a
	ret

.StopsPlayerCoords:
	dbmapcoord  4,  3
	dbmapcoord  4,  4
	dbmapcoord  4,  5
	dbmapcoord  4,  6
	db -1 ; end

Route18GatePlayerMovingUpScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	ld a, D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoyIgnore], a

Route18GateGuardScript:
	ld a, TEXT_ROUTE18GATE1F_GUARD
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	ld a, D_RIGHT
	ld [wSimulatedJoypadStatesEnd], a
	call StartSimulatingJoypadStates
	ld a, SCRIPT_ROUTE18GATE_PLAYER_MOVING_RIGHT
	ld [wRoute18GateCurScript], a
	ret

Route18GatePlayerMovingRightScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld hl, wStatusFlags5
	res BIT_SCRIPTED_MOVEMENT_STATE, [hl]
	ld a, SCRIPT_ROUTE18GATE_DEFAULT
	ld [wRoute18GateCurScript], a
	ret

Route18Gate_TextPointers:
	def_text_pointers
	dw_const Route18Gate1FGuardText,           TEXT_ROUTE18GATE1F_GUARD
	dw_const Route18Gate2FYoungsterText,       TEXT_ROUTE18GATE2F_YOUNGSTER        ; marcelnote - merged 2nd floor
	dw_const Route18Gate1FGuardExcuseMeText,   TEXT_ROUTE18GATE1F_GUARD_EXCUSE_ME
	dw_const Route18Gate2FLeftBinocularsText,  TEXT_ROUTE18GATE2F_LEFT_BINOCULARS  ; marcelnote - merged 2nd floor
	dw_const Route18Gate2FRightBinocularsText, TEXT_ROUTE18GATE2F_RIGHT_BINOCULARS ; marcelnote - merged 2nd floor

Route18Gate1FGuardText:
	text_asm
	call Route16Gate1FIsBicycleInBagScript
	jr z, .no_bike
	ld hl, .CyclingRoadUphillText
	call PrintText
	jr .text_script_end
.no_bike
	ld hl, .YouNeedABicycleText
	call PrintText
.text_script_end
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.YouNeedABicycleText:
	text_far _Route18Gate1FGuardYouNeedABicycleText
	text_end

.CyclingRoadUphillText:
	text_far _Route18Gate1FGuardCyclingRoadUphillText
	text_end

Route18Gate1FGuardExcuseMeText:
	text_far _Route18Gate1FGuardExcuseMeText
	text_end

Route18Gate2FYoungsterText:
	text_asm
	ld a, TRADE_FOR_MARC
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

Route18Gate2FLeftBinocularsText:
	text_asm
	ld hl, .Text
	jp GateUpstairsScript_PrintIfFacingUp

.Text:
	text_far _Route18Gate2FLeftBinocularsText
	text_end

Route18Gate2FRightBinocularsText:
	text_asm
	ld hl, .Text
	jp GateUpstairsScript_PrintIfFacingUp

.Text:
	text_far _Route18Gate2FRightBinocularsText
	text_end
