; marcelnote - this script was modified to accommodate additions to Route22Gate
Route22Gate_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route22Gate_ScriptPointers
	ld a, [wRoute22GateCurScript]
	call CallFunctionInTable
	ld a, [wYCoord]
	cp 4
	ld a, ROUTE_23
	jr c, .set_last_map
	ld a, ROUTE_22
.set_last_map
	ld [wLastMap], a
	ret

Route22Gate_ScriptPointers:
	def_script_pointers
	dw_const Route22GateDefaultScript,      SCRIPT_ROUTE22GATE_DEFAULT
	dw_const Route22GatePlayerMovingScript, SCRIPT_ROUTE22GATE_PLAYER_MOVING

Route22GateDefaultScript: ; marcelnote - adapted for 2nd guard, will have to be readapted for receptionist
	ld hl, Route22GateScriptCoords
	call ArePlayerCoordsInArray
	ret nc
	xor a
	ldh [hJoyHeld], a
	ld a, [wCoordIndex]
	cp 3
	jr nc, .route28Guard
	CheckEvent EVENT_ROUTE22GATE_PRESENTED_BOULDER_BADGE
	ret nz
	ld a, TEXT_ROUTE22GATE_GUARD
	jr .loadTextID
.route28Guard
	CheckEvent EVENT_ROUTE22GATE_WELCOME_CHAMPION
	ret nz
	ld a, TEXT_ROUTE22GATE_GUARD2
.loadTextID
	ldh [hSpriteIndexOrTextID], a
	jp DisplayTextID

Route22GateScriptCoords:
	dbmapcoord 12,  2 ; marcelnote - adjusted for new layout
	dbmapcoord 13,  2 ; marcelnote - adjusted for new layout
	dbmapcoord  3,  3 ; marcelnote - new guard
	dbmapcoord  3,  4 ; marcelnote - new guard
	db -1 ; end

Route22GateMovePlayerScript: ; marcelnote - now takes a = D_DOWN, D_RIGHT... as argument
	ld [wSimulatedJoypadStatesEnd], a
	ld [wSpritePlayerStateData1FacingDirection], a
	ld [wJoyIgnore], a
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	jp StartSimulatingJoypadStates

Route22GatePlayerMovingScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	xor a
	ld [wJoyIgnore], a
	call Delay3
	ld a, SCRIPT_ROUTE22GATE_DEFAULT
	ld [wRoute22GateCurScript], a
	ret

Route22Gate_TextPointers:
	def_text_pointers
	dw_const Route22GateGuardText,        TEXT_ROUTE22GATE_GUARD
	dw_const Route22GateGuard2Text,       TEXT_ROUTE22GATE_GUARD2        ; marcelnote - new guard
	dw_const Route22GateCooltrainerMText, TEXT_ROUTE22GATE_COOLTRAINER_M ; marcelnote - new NPC
	dw_const Route22GateCooltrainerFText, TEXT_ROUTE22GATE_COOLTRAINER_F ; marcelnote - new NPC
	dw_const Route22GateYoungsterText,    TEXT_ROUTE22GATE_YOUNGSTER     ; marcelnote - new NPC
	dw_const Route22GateReceptionistText, TEXT_ROUTE22GATE_RECEPTIONIST  ; marcelnote - new receptionist

Route22GateGuardText: ; marcelnote - adapted for additions to Route22Gate
	text_asm
	ld a, [wObtainedBadges]
	bit BIT_BOULDERBADGE, a
	jr nz, .has_boulderbadge
	ld hl, Route22GateGuardNoBoulderbadgeText
	call PrintText
	ld a, D_DOWN ; marcelnote - now the MovePlayerScript takes a = D_DOWN as argument
	call Route22GateMovePlayerScript
	ld a, SCRIPT_ROUTE22GATE_PLAYER_MOVING
	ld [wRoute22GateCurScript], a
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd
.has_boulderbadge
	ld hl, Route22GateGuardGoRightAheadText
	call PrintText
	SetEvent EVENT_ROUTE22GATE_PRESENTED_BOULDER_BADGE ; marcelnote - new event instead of separate script
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

Route22GateGuardNoBoulderbadgeText:
	text_far _Route22GateGuardNoBoulderbadgeText
	text_asm
	ld a, SFX_DENIED
	call PlaySoundWaitForCurrent
	call WaitForSoundToFinish
	ld hl, Route22GateGuardICantLetYouPassText
	ret

Route22GateGuardICantLetYouPassText:
	text_far _Route22GateGuardICantLetYouPassText
	text_end

Route22GateGuardGoRightAheadText:
	text_far _Route22GateGuardGoRightAheadText
	sound_get_item_1
	text_end

Route22GateGuard2Text: ; marcelnote - new guard
	text_asm
	;ld a, [wObtainedBadges]
	;bit BIT_VOLCANOBADGE, a ; for testing purposes
	CheckEvent EVENT_BECAME_CHAMPION
	jr nz, .is_champion
	ld hl, Route22GateGuard2ScaryStrongText
	call PrintText
	ld a, D_RIGHT
	call Route22GateMovePlayerScript
	ld a, SCRIPT_ROUTE22GATE_PLAYER_MOVING
	ld [wRoute22GateCurScript], a
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd
.is_champion
	ld hl, Route22GateGuard2WelcomeChampionText
	call PrintText
	SetEvent EVENT_ROUTE22GATE_WELCOME_CHAMPION
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

Route22GateGuard2ScaryStrongText: ; marcelnote - new guard
	text_far _Route22GateGuard2ScaryStrongText
	text_end

Route22GateGuard2WelcomeChampionText: ; marcelnote - new guard
	text_far _Route22GateGuard2WelcomeChampionText
	text_end

Route22GateCooltrainerMText: ; marcelnote - new NPC
	text_far _Route22GateCooltrainerMText
	text_end

Route22GateYoungsterText: ; marcelnote - new NPC
	text_far _Route22GateYoungsterText
	text_end

Route22GateCooltrainerFText: ; marcelnote - new NPC
	text_far _Route22GateCooltrainerFText
	text_end

Route22GateReceptionistText: ; marcelnote - new receptionist
	text_far _Route22GateReceptionistText
	text_end

