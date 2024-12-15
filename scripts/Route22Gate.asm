; marcelnote - this script was modified to accommodate additions to Route22Gate
Route22Gate_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route22Gate_ScriptPointers
	ld a, [wRoute22GateCurScript]
	jp CallFunctionInTable ; marcelnote - removed y-coord check to update [wLastMap]

Route22Gate_ScriptPointers:
	def_script_pointers
	dw_const Route22GateShowRedOrGreenScript, SCRIPT_ROUTE22GATE_SHOW_RED_OR_GREEN ; marcelnote - changed default script
	dw_const Route22GateCheckCoordsScript,    SCRIPT_ROUTE22GATE_CHECK_COORDS      ; default after first one ran
	dw_const Route22GatePlayerMovingScript,   SCRIPT_ROUTE22GATE_PLAYER_MOVING

Route22GateShowRedOrGreenScript: ; marcelnote - runs only on first entrance in Route22Gate
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld a, HS_ROUTE_22_GATE_3F_RED
	jr nz, .isGirl
	ld a, HS_ROUTE_22_GATE_3F_GREEN
.isGirl
	ld [wMissableObjectIndex], a
	predef ShowObjectCont
	ld a, SCRIPT_ROUTE22GATE_CHECK_COORDS
	ld [wRoute22GateCurScript], a
	ret

Route22GateCheckCoordsScript: ; marcelnote - adapted for 2nd guard and receptionist
	ld hl, Route22GateScriptCoords
	call ArePlayerCoordsInArray
	ret nc
	xor a
	ldh [hJoyHeld], a
	ld a, [wCoordIndex]
	cp 3
	jr z, .receptionist
	jr nc, .route28Guard
	CheckEvent EVENT_ROUTE22GATE_PRESENTED_BOULDER_BADGE
	ret nz
	ld a, TEXT_ROUTE22GATE_GUARD
	jr .loadTextID
.route28Guard
	CheckEvent EVENT_ROUTE22GATE_WELCOME_CHAMPION
	ret nz
	ld a, TEXT_ROUTE22GATE_GUARD2
	jr .loadTextID
.receptionist
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_RIGHT
	ret nz
	ld a, TEXT_ROUTE22GATE_RECEPTIONIST_SCRIPT
.loadTextID
	ldh [hTextID], a
	jp DisplayTextID

Route22GateScriptCoords:
	dbmapcoord 12,  2 ; marcelnote - adjusted for new layout
	dbmapcoord 13,  2 ; marcelnote - adjusted for new layout
	dbmapcoord 34,  6 ; marcelnote - new receptionist
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
	ld a, SCRIPT_ROUTE22GATE_CHECK_COORDS
	ld [wRoute22GateCurScript], a
	ret

Route22Gate_TextPointers:
	def_text_pointers
	dw_const Route22GateGuardText,               TEXT_ROUTE22GATE_GUARD
	dw_const Route22GateGuard2Text,              TEXT_ROUTE22GATE_GUARD2              ; marcelnote - new guard
	dw_const Route22GateCooltrainerMText,        TEXT_ROUTE22GATE_COOLTRAINER_M       ; marcelnote - new NPC
	dw_const Route22GateCooltrainerFText,        TEXT_ROUTE22GATE_COOLTRAINER_F       ; marcelnote - new NPC
	dw_const Route22GateYoungsterText,           TEXT_ROUTE22GATE_YOUNGSTER           ; marcelnote - new NPC
	dw_const Route22GateReceptionistText,        TEXT_ROUTE22GATE_RECEPTIONIST        ; marcelnote - new receptionist
	dw_const Route22GateReceptionistScriptText,  TEXT_ROUTE22GATE_RECEPTIONIST_SCRIPT ; marcelnote - new receptionist

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
	ld a, [wObtainedBadges]
IF DEF(_DEBUG) ; marcelnote - added for debug
	bit BIT_VOLCANOBADGE, a
ELSE
	CheckEvent EVENT_BEAT_ROUTE_1_OAK ; real condition
ENDC
	jr nz, .beat_oak
	ld hl, Route22GateGuard2ScaryStrongText
	call PrintText
	ld a, D_RIGHT
	call Route22GateMovePlayerScript
	ld a, SCRIPT_ROUTE22GATE_PLAYER_MOVING
	ld [wRoute22GateCurScript], a
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd
.beat_oak
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
	text_asm
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ld hl, Route22GateReceptionistOpponentWaitingForYouText
	jr z, .print_text
	ld hl, Route22GateReceptionistWelcomeText
	call PrintText
	ld hl, .PleaseStepAroundText
.print_text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.PleaseStepAroundText:
	text_far _Route22GateReceptionistPleaseStepAroundText
	text_end

Route22GateReceptionistWelcomeText: ; marcelnote - new receptionist
	text_far _Route22GateReceptionistWelcomeText
	text_end

Route22GateReceptionistOpponentWaitingForYouText: ; marcelnote - new receptionist
	text_far _Route22GateReceptionistOpponentWaitingForYouText
	text_end

Route22GateReceptionistScriptText: ; marcelnote - new receptionist
	text_asm
	ld a, ROUTE22GATE_RECEPTIONIST
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_DOWN
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld hl, Route22GateReceptionistWelcomeText
	call PrintText
	ld a, [wObtainedBadges]
IF DEF(_DEBUG)
	bit BIT_VOLCANOBADGE, a
	jr nz, .gotAllBadges
ELSE
	inc a ; if got 8 badges then a = %11111111, so this sets the z flag
	jr z, .gotAllBadges
ENDC
	ld hl, .SorryText
	call PrintText
	jr .loadLeftMovement
.gotAllBadges
	ld hl, .WantToBattleText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .saidNo
	ResetEvent EVENT_BEAT_BATTLE_HALL_TRAINER
	ld hl, .FantasticText
	call PrintText
	ld hl, Route22GateReceptionistOpponentWaitingForYouText
	call PrintText
	ld a, D_RIGHT
	jr .movePlayer
.saidNo
	ld hl, .ComeBackAnytimeText
	call PrintText
.loadLeftMovement
	ld a, D_LEFT
.movePlayer
	call Route22GateMovePlayerScript
	ld a, SCRIPT_ROUTE22GATE_PLAYER_MOVING
	ld [wRoute22GateCurScript], a
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.SorryText:
	text_far _Route22GateReceptionistSorryText
	text_end

.WantToBattleText:
	text_far _Route22GateReceptionistWantToBattleText
	text_end

.FantasticText:
	text_far _Route22GateReceptionistFantasticText
	text_end

.ComeBackAnytimeText:
	text_far _Route22GateReceptionistComeBackAnytimeText
	text_end
