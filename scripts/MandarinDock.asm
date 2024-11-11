; marcelnote - new location
MandarinDock_Script:
	call EnableAutoTextBoxDrawing
	ld hl, MandarinDock_ScriptPointers
	ld a, [wMandarinDockCurScript]
	jp CallFunctionInTable

MandarinDock_ScriptPointers:
	def_script_pointers
	dw_const DoRet,                              SCRIPT_MANDARINDOCK_DEFAULT
	dw_const MandarinDockAllAboardScript,        SCRIPT_MANDARINDOCK_ALL_ABOARD
	dw_const MandarinDockPlayerMovingDownScript, SCRIPT_MANDARINDOCK_PLAYER_MOVING_DOWN

MandarinDockAllAboardScript:
	xor a
	ldh [hJoyHeld], a
	ld a, MANDARINDOCK_SAILOR
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_DOWN
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	call UpdateSprites
	ld c, 30
	call DelayFrames
	ld a, HS_MANDARIN_DOCK_SAILOR
	ld [wMissableObjectIndex], a
	predef HideObjectCont
	ld a, HS_VERMILION_DOCK_SAILOR
	ld [wMissableObjectIndex], a
	predef HideObjectCont
	ld a, D_DOWN
	ld [wSimulatedJoypadStatesEnd], a
	ld [wSimulatedJoypadStatesEnd+1], a
	ld a, 2
	ld [wSimulatedJoypadStatesIndex], a
	ld a, SCRIPT_MANDARINDOCK_PLAYER_MOVING_DOWN
	ld [wMandarinDockCurScript], a
	call StartSimulatingJoypadStates
	ret

MandarinDockPlayerMovingDownScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	ld c, 10
	call DelayFrames
	ld a, SCRIPT_MANDARINDOCK_DEFAULT
	ld [wMandarinDockCurScript], a
	ret

MandarinDock_TextPointers:
	def_text_pointers
	dw_const MandarinDockSailorText, TEXT_MANDARINDOCK_SAILOR

MandarinDockSailorText:
	text_asm
	ld hl, .AreYouReadyText
	call PrintText
	ld a, $01
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .no
	ld a, VERMILION_DOCK
	ld [wLastMap], a
	ld a, SCRIPT_MANDARINDOCK_ALL_ABOARD
	ld [wMandarinDockCurScript], a
	ld hl, .AllAboardText
	call PrintText
.no
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.AreYouReadyText:
	text_far _MandarinDockSailorAreYouReadyText
	text_end

.AllAboardText:
	text_far _MandarinDockSailorAllAboardText
	text_end