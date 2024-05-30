Route5Gate_Script:
	call EnableAutoTextBoxDrawing
	ld a, [wRoute5GateCurScript]
	ld hl, Route5Gate_ScriptPointers
	jp CallFunctionInTable

Route5Gate_ScriptPointers:
	def_script_pointers
	dw_const Route5GateDefaultScript,      SCRIPT_ROUTE5GATE_DEFAULT
	dw_const Route5GatePlayerMovingScript, SCRIPT_ROUTE5GATE_PLAYER_MOVING

Route5GateMovePlayerUpScript:
	ld a, D_UP
	ld [wSimulatedJoypadStatesEnd], a
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	jp StartSimulatingJoypadStates

Route5GateDefaultScript:
	ld a, [wd728]
	bit 6, a
	ret nz
	ld hl, .PlayerInCoordsArray
	call ArePlayerCoordsInArray
	ret nc
	ld a, PLAYER_DIR_LEFT
	ld [wPlayerMovingDirection], a
	xor a
	ldh [hJoyHeld], a
	farcall RemoveGuardDrink
	ldh a, [hItemToRemoveID]
	and a
	jr nz, .have_drink
	ld a, TEXT_ROUTE5GATE_GUARD_GEE_IM_THIRSTY
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	call Route5GateMovePlayerUpScript
	ld a, SCRIPT_ROUTE5GATE_PLAYER_MOVING
	ld [wRoute5GateCurScript], a
	ret
.have_drink
	ld a, TEXT_ROUTE5GATE_GUARD_GIVE_DRINK
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld hl, wd728
	set 6, [hl]
	ret

.PlayerInCoordsArray:
	dbmapcoord  3,  3
	dbmapcoord  4,  3
	db -1 ; end

Route5GatePlayerMovingScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	xor a
	ld [wJoyIgnore], a
	ld [wRoute5GateCurScript], a
	ret

Route5Gate_TextPointers:
	def_text_pointers
	dw_const Route5GateBrunetteGirlText,       TEXT_ROUTE5GATE_BRUNETTE_GIRL ; marcelnote - added 2nd floor
	dw_const Route5GateSuperNerdText,          TEXT_ROUTE5GATE_SUPER_NERD    ; marcelnote - added 2nd floor
	dw_const Route5GatePersianText,            TEXT_ROUTE5GATE_PERSIAN       ; marcelnote - added 2nd floor
	dw_const Route5GateSandslashText,          TEXT_ROUTE5GATE_SANDSLASH     ; marcelnote - added 2nd floor
	dw_const SaffronGateGuardText,             TEXT_ROUTE5GATE_GUARD
	dw_const SaffronGateGuardGeeImThirstyText, TEXT_ROUTE5GATE_GUARD_GEE_IM_THIRSTY
	dw_const SaffronGateGuardGiveDrinkText,    TEXT_ROUTE5GATE_GUARD_GIVE_DRINK

SaffronGateGuardText:
	text_asm
	ld a, [wd728]
	bit 6, a
	jr nz, .thanks_for_drink
	farcall RemoveGuardDrink
	ldh a, [hItemToRemoveID]
	and a
	jr nz, .have_drink
	ld hl, SaffronGateGuardGeeImThirstyText
	call PrintText
	call Route5GateMovePlayerUpScript
	ld a, SCRIPT_ROUTE5GATE_PLAYER_MOVING
	ld [wRoute5GateCurScript], a
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.have_drink
	ld hl, SaffronGateGuardGiveDrinkText
	call PrintText
	ld hl, wd728
	set 6, [hl]
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.thanks_for_drink
	ld hl, SaffronGateGuardThanksForTheDrinkText
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

SaffronGateGuardGeeImThirstyText:
	text_far _SaffronGateGuardGeeImThirstyText
	text_end

SaffronGateGuardGiveDrinkText:
	text_far _SaffronGateGuardImParchedText
	sound_get_key_item
	text_far _SaffronGateGuardYouCanGoOnThroughText
	text_end

SaffronGateGuardThanksForTheDrinkText:
	text_far _SaffronGateGuardThanksForTheDrinkText
	text_end

Route5GateBrunetteGirlText: ; marcelnote - added 2nd floor
	text_far _Route5GateBrunetteGirlText
	text_end

Route5GateSuperNerdText: ; marcelnote - added 2nd floor
	text_far _Route5GateSuperNerdText
	text_end

Route5GatePersianText: ; marcelnote - added 2nd floor
	text_far _Route5GatePersianText
	text_asm
	ld a, PERSIAN
	call PlayCry
	ld hl, .Route5GatePersianFriendlyText
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd
.Route5GatePersianFriendlyText
	text_far _Route5GatePersianFriendlyText
	text_end

Route5GateSandslashText: ; marcelnote - added 2nd floor
	text_far _Route5GateSandslashText
	text_asm
	ld a, SANDSLASH
	call PlayCry
	ld hl, .Route5GateSandslashFriendlyText
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd
.Route5GateSandslashFriendlyText
	text_far _Route5GateSandslashFriendlyText
	text_end
