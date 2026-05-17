Route6Gate_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route6Gate_ScriptPointers
	ld a, [wRoute6GateCurScript]
	call CallFunctionInTable
	ret

Route6Gate_ScriptPointers:
	def_script_pointers
	dw_const Route6GateDefaultScript,      SCRIPT_ROUTE6GATE_DEFAULT
	dw_const Route6GatePlayerMovingScript, SCRIPT_ROUTE6GATE_PLAYER_MOVING

Route6GateDefaultScript:
	CheckEvent EVENT_GAVE_SAFFRON_GUARDS_DRINK
	ret nz
	ld hl, .PlayerInCoordsArray
	call ArePlayerCoordsInArray
	ret nc
	ld a, PLAYER_DIR_RIGHT
	ld [wPlayerMovingDirection], a
	xor a
	ldh [hJoyHeld], a
	callfar RemoveGuardDrink
	ldh a, [hItemToRemoveID]
	and a
	jr nz, .haveDrink
	ld a, TEXT_ROUTE6GATE_GUARD_GEE_IM_THIRSTY
	ldh [hTextID], a
	call DisplayTextID
	call Route6GateMovePlayerDownScript
	ld a, SCRIPT_ROUTE6GATE_PLAYER_MOVING
	ld [wRoute6GateCurScript], a
	ret
.haveDrink
	SetEvent EVENT_GAVE_SAFFRON_GUARDS_DRINK
	ld a, TEXT_ROUTE6GATE_GUARD_GIVE_DRINK
	ldh [hTextID], a
	jp DisplayTextID

.PlayerInCoordsArray:
	dbmapcoord  3,  2
	dbmapcoord  4,  2
	db -1 ; end

Route6GatePlayerMovingScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	xor a
	ld [wJoyIgnore], a
	ld [wRoute6GateCurScript], a
	ret

Route6GateMovePlayerDownScript:
	ld hl, wStatusFlags5
	set BIT_SCRIPTED_MOVEMENT_STATE, [hl]
	ld a, PAD_DOWN
	ld [wSimulatedJoypadStatesEnd], a
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	xor a
	ld [wSpritePlayerStateData2MovementByte1], a
	ld [wOverrideSimulatedJoypadStatesMask], a
	ret

Route6Gate_TextPointers:
	def_text_pointers
	dw_const Route6GateOaksAideText,           TEXT_ROUTE6GATE_OAKS_AIDE         ; marcelnote - new for PokéBeeper
	dw_const Route6GateMiddleAgedWomanText,    TEXT_ROUTE6GATE_MIDDLE_AGED_WOMAN ; marcelnote - added 2nd floor
	dw_const Route6GateYoungsterText,          TEXT_ROUTE6GATE_YOUNGSTER         ; marcelnote - added 2nd floor
	dw_const SaffronGateGuardText,             TEXT_ROUTE6GATE_GUARD
	dw_const SaffronGateGuardGeeImThirstyText, TEXT_ROUTE6GATE_GUARD_GEE_IM_THIRSTY
	dw_const SaffronGateGuardGiveDrinkText,    TEXT_ROUTE6GATE_GUARD_GIVE_DRINK

Route6GateOaksAideText: ; marcelnote - new for PokéBeeper
	text_asm
	CheckEvent EVENT_GOT_POKE_BEEPER
	jr nz, .gotItem
	ld a, 20
	ldh [hOaksAideRequirement], a
	ld a, POKE_BEEPER
	ldh [hOaksAideRewardItem], a
	ld [wNamedObjectIndex], a
	call GetItemName ; stores name in wNameBuffer
	predef OaksAideScript
	ldh a, [hOaksAideResult]
	dec a ; OAKS_AIDE_GOT_ITEM?
	jr nz, .noItem
	SetEvent EVENT_GOT_POKE_BEEPER
.gotItem
	ld hl, .PokeBeeperExplanationText
	call PrintText
.noItem
	rst TextScriptEnd

.PokeBeeperExplanationText:
	text_far _Route6GateOaksAidePokeBeeperExplanationText
	text_end

Route6GateMiddleAgedWomanText: ; marcelnote - added 2nd floor
	text_far _Route6GateMiddleAgedWomanText
	text_end

Route6GateYoungsterText: ; marcelnote - added 2nd floor
	text_far _Route6GateYoungsterText
	text_end
