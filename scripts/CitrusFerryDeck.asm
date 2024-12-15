; marcelnote - new location
CitrusFerryDeck_Script:
	call EnableAutoTextBoxDrawing
	ld a, [wCitrusFerryDeckCurScript]
	ld hl, CitrusFerryDeck_ScriptPointers
	jp CallFunctionInTable

CitrusFerryDeck_ScriptPointers:
	def_script_pointers
	dw_const CitrusFerryDeckDefaultScript,           SCRIPT_CITRUSFERRYDECK_DEFAULT
	dw_const CitrusFerryDeckPlayerMovingDownScript,  SCRIPT_CITRUSFERRYDECK_PLAYER_MOVING_DOWN
	dw_const CitrusFerryDeckEntranceScript,          SCRIPT_CITRUSFERRYDECK_ENTRANCE

CitrusFerryDeckDefaultScript:
	CheckEvent EVENT_FERRY_ARRIVED
	ret nz
	ld a, [wYCoord]
	and a
	jr nz, .checkSailor
	ld a, D_DOWN
	ld [wSimulatedJoypadStatesEnd], a
	ld [wSimulatedJoypadStatesEnd + 1], a
	ld a, 2
	ld [wSimulatedJoypadStatesIndex], a
	ld a, SCRIPT_CITRUSFERRYDECK_ENTRANCE
	ld [wCitrusFerryDeckCurScript], a
	jr .startMovement
.checkSailor
	cp 1
	ret nz
	xor a
	ldh [hJoyHeld], a
	ld a, CITRUSFERRYDECK_SAILOR1
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_LEFT
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, TEXT_CITRUSFERRYDECK_SAILOR_SORRY
	ldh [hTextID], a
	call DisplayTextID
	ld a, D_DOWN
	ld [wSimulatedJoypadStatesEnd], a
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	ld a, SCRIPT_CITRUSFERRYDECK_PLAYER_MOVING_DOWN
	ld [wCitrusFerryDeckCurScript], a
.startMovement
	call StartSimulatingJoypadStates
	ret

CitrusFerryDeckPlayerMovingDownScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	ld c, 10
	call DelayFrames
	ld a, SCRIPT_CITRUSFERRYDECK_DEFAULT
	ld [wCitrusFerryDeckCurScript], a
	ret

CitrusFerryDeckEntranceScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	ld c, 10
	call DelayFrames
	farcall ShakeElevator
	ld a, TEXT_CITRUSFERRYROOMS_SPEAKER_LEFT
	ldh [hTextID], a
	call DisplayTextID
	ld a, SCRIPT_CITRUSFERRYDECK_DEFAULT
	ld [wCitrusFerryDeckCurScript], a
	ret

CitrusFerryDeck_TextPointers:
	def_text_pointers
	dw_const CitrusFerryDeckSailor1Text,        TEXT_CITRUSFERRYDECK_SAILOR1
	dw_const CitrusFerryDeckSailor2Text,        TEXT_CITRUSFERRYDECK_SAILOR2
	dw_const CitrusFerryDeckVendingMachineText, TEXT_CITRUSFERRYDECK_VENDING_MACHINE
	dw_const CitrusFerryDeckSailorSorryText,    TEXT_CITRUSFERRYDECK_SAILOR_SORRY
	dw_const CitrusFerryDeckSpeakerWelcomeText, TEXT_CITRUSFERRYROOMS_SPEAKER_LEFT

CitrusFerryDeckSailor1Text:
	text_asm
	CheckEvent EVENT_FERRY_ARRIVED
	ld hl, .EnjoyYourTripText
	jr z, .print_text
	ld a, [wLastMap]
	cp VERMILION_DOCK
	ld hl, .EndOfTheLineVermilionText
	jr z, .print_text
	ld hl, .EndOfTheLineMandarinText
.print_text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.EnjoyYourTripText:
	text_far _CitrusFerryDeckSailorEnjoyYourTripText
	text_end

.EndOfTheLineVermilionText:
	text_far _CitrusFerryDeckSailorEndOfTheLineVermilionText
	text_end

.EndOfTheLineMandarinText:
	text_far _CitrusFerryDeckSailorEndOfTheLineMandarinText
	text_end

CitrusFerryDeckSailor2Text:
	text_far _CitrusFerryDeckSailor2Text
	text_end

CitrusFerryDeckSailorSorryText:
	text_far _CitrusFerryDeckSailorSorryText
	text_end

CitrusFerryDeckSpeakerWelcomeText:
	text_far _CitrusFerryDeckSpeakerWelcomeText
	text_end

CitrusFerryDeckVendingMachineText:
	script_vending_machine
