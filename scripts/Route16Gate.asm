; marcelnote - merged Route16Gate floors
Route16Gate_Script:
	ld hl, wStatusFlags6
	res BIT_ALWAYS_ON_BIKE, [hl]
	call EnableAutoTextBoxDrawing
	ld a, [wRoute16GateCurScript]
	ld hl, Route16Gate_ScriptPointers
	jp CallFunctionInTable
    ; marcelnote - Route16Gate2F_Script used to be just:
	; jp DisableAutoTextBoxDrawing ; to avoid text box from showing up when looking at binoculars from the side

Route16Gate_ScriptPointers:
	def_script_pointers
	dw_const Route16GateDefaultScript,           SCRIPT_ROUTE16GATE_DEFAULT
	dw_const Route16GatePlayerMovingUpScript,    SCRIPT_ROUTE16GATE_PLAYER_MOVING_UP
	dw_const Route16GateGuardScript,             SCRIPT_ROUTE16GATE_GUARD
	dw_const Route16GatePlayerMovingRightScript, SCRIPT_ROUTE16GATE_PLAYER_MOVING_RIGHT

Route16GateDefaultScript:
	ld b, BICYCLE
	call IsItemInBag
	ret nz
	ld hl, .StopsPlayerCoords
	call ArePlayerCoordsInArray
	ret nc
	ld a, TEXT_ROUTE16GATE1F_GUARD_WAIT_UP
	ldh [hTextID], a
	call DisplayTextID
	xor a
	ldh [hJoyHeld], a
	ld a, [wCoordIndex]
	cp $1
	jr z, .next_to_counter
	ld a, [wCoordIndex]
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	ld b, $0
	ld c, a
	ld a, D_UP
	ld hl, wSimulatedJoypadStatesEnd
	call FillMemory
	call StartSimulatingJoypadStates
	ld a, SCRIPT_ROUTE16GATE_PLAYER_MOVING_UP
	ld [wRoute16GateCurScript], a
	ret
.next_to_counter
	ld a, SCRIPT_ROUTE16GATE_GUARD
	ld [wRoute16GateCurScript], a
	ret

.StopsPlayerCoords:
	dbmapcoord  4,  7
	dbmapcoord  4,  8
	dbmapcoord  4,  9
	dbmapcoord  4, 10
	db -1 ; end

Route16GatePlayerMovingUpScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	ld a, D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoyIgnore], a
	call UpdateSprites ; marcelnote - fix for Gambler showing on wall when stopped by guard (from pokered wiki)

Route16GateGuardScript:
	ld a, TEXT_ROUTE16GATE1F_GUARD
	ldh [hTextID], a
	call DisplayTextID
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	ld a, D_RIGHT
	ld [wSimulatedJoypadStatesEnd], a
	call StartSimulatingJoypadStates
	ld a, SCRIPT_ROUTE16GATE_PLAYER_MOVING_RIGHT
	ld [wRoute16GateCurScript], a
	ret

Route16GatePlayerMovingRightScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld hl, wStatusFlags5
	res BIT_SCRIPTED_MOVEMENT_STATE, [hl]
	ld a, SCRIPT_ROUTE16GATE_DEFAULT
	ld [wRoute16GateCurScript], a
	ret

Route16Gate_TextPointers:
	def_text_pointers
	dw_const Route16Gate1FGuardText,           TEXT_ROUTE16GATE1F_GUARD
	dw_const Route16Gate1FGamblerText,         TEXT_ROUTE16GATE1F_GAMBLER
	dw_const Route16Gate2FLittleBoyText,       TEXT_ROUTE16GATE2F_LITTLE_BOY
	dw_const Route16Gate2FLittleGirlText,      TEXT_ROUTE16GATE2F_LITTLE_GIRL
	dw_const Route16Gate1FGuardWaitUpText,     TEXT_ROUTE16GATE1F_GUARD_WAIT_UP

Route16Gate1FGuardText: ; marcelnote - optimized
	text_asm
	ld b, BICYCLE
	call IsItemInBag
	ld hl, .NoPedestriansAllowedText
	jr z, .got_text
	ld hl, .CyclingRoadExplanationText
.got_text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.NoPedestriansAllowedText:
	text_far _Route16Gate1FGuardNoPedestriansAllowedText
	text_end

.CyclingRoadExplanationText:
	text_far _Route16Gate1FGuardCyclingRoadExplanationText
	text_end

Route16Gate1FGuardWaitUpText:
	text_far _Route16Gate1FGuardWaitUpText
	text_end

Route16Gate1FGamblerText:
	text_far _Route16Gate1FGamblerText
	text_end

Route16Gate2FLittleBoyText:
	text_far _Route16Gate2FLittleBoyText
	text_end

Route16Gate2FLittleGirlText:
	text_far _Route16Gate2FLittleGirlText
	text_end
