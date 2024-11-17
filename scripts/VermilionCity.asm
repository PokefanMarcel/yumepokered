VermilionCity_Script:
	call EnableAutoTextBoxDrawing
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_2, [hl]
	res BIT_CUR_MAP_LOADED_2, [hl]
	push hl
	call nz, VermilionCityLeftSSAnneCallbackScript
	pop hl
	bit BIT_CUR_MAP_LOADED_1, [hl]
	res BIT_CUR_MAP_LOADED_1, [hl]
	call nz, .setFirstLockTrashCanIndex
	ld hl, VermilionCity_ScriptPointers
	ld a, [wVermilionCityCurScript]
	jp CallFunctionInTable

.setFirstLockTrashCanIndex
	call Random
	ldh a, [hRandomSub]
	and $e
	ld [wFirstLockTrashCanIndex], a
	ret

VermilionCityLeftSSAnneCallbackScript:
	CheckEventHL EVENT_SS_ANNE_LEFT
	ret z
	CheckEventReuseHL EVENT_WALKED_PAST_GUARD_AFTER_SS_ANNE_LEFT
	SetEventReuseHL EVENT_WALKED_PAST_GUARD_AFTER_SS_ANNE_LEFT
	ret nz
	ld a, SCRIPT_VERMILIONCITY_PLAYER_EXIT_SHIP
	ld [wVermilionCityCurScript], a
	ret

VermilionCity_ScriptPointers:
	def_script_pointers
	dw_const VermilionCityDefaultScript,             SCRIPT_VERMILIONCITY_DEFAULT
	dw_const VermilionCityPlayerMovingUp1Script,     SCRIPT_VERMILIONCITY_PLAYER_MOVING_UP1
	dw_const VermilionCityPlayerExitShipScript,      SCRIPT_VERMILIONCITY_PLAYER_EXIT_SHIP
	dw_const VermilionCityPlayerMovingUp2Script,     SCRIPT_VERMILIONCITY_PLAYER_MOVING_UP2
	dw_const VermilionCityPlayerAllowedToPassScript, SCRIPT_VERMILIONCITY_PLAYER_ALLOWED_TO_PASS

VermilionCityDefaultScript:
	CheckEvent EVENT_FERRY_ARRIVED
	jr z, .FerryAlreadyReset
	ResetEventRange EVENT_FERRY_ARRIVED, EVENT_BEAT_ORANGE_FERRY_OUTSIDE_TRAINER_3
	ld a, HS_VERMILION_DOCK_SAILOR
	ld [wMissableObjectIndex], a
	predef ShowObjectCont
	ld a, HS_MANDARIN_DOCK_SAILOR
	ld [wMissableObjectIndex], a
	predef ShowObjectCont
.FerryAlreadyReset
	ld a, [wSpritePlayerStateData1FacingDirection]
	and a ; cp SPRITE_FACING_DOWN
	ret nz
	ld hl, VermilionCityTicketCheckCoords
	call ArePlayerCoordsInArray
	ret nc
	ld a, SPRITE_FACING_LEFT
	ldh [hSpriteFacingDirection], a
	ld a, [wCoordIndex] ; 1 if S.S.Anne entrance, 2 if ferries
	dec a
	jr nz, .atFerries
	ldh [hJoyHeld], a ; a is 0 here since fell through jr nz check
	ld a, VERMILIONCITY_SAILOR1
	ldh [hSpriteIndex], a
	call SetSpriteFacingDirectionAndDelay
	ld a, TEXT_VERMILIONCITY_SAILOR1
	ldh [hTextID], a
	call DisplayTextID
	CheckEvent EVENT_SS_ANNE_LEFT
	jr nz, .cannot_enter
	ld b, S_S_TICKET
	;predef GetQuantityOfItemInBag
	;ld a, b
	;and a
	call IsItemInBag
	ret nz
	jr .cannot_enter
.atFerries
	dec a ; a was 1
	ldh [hJoyHeld], a
	ld a, VERMILIONCITY_SAILOR3
	ldh [hSpriteIndex], a
	call SetSpriteFacingDirectionAndDelay
	ld a, TEXT_VERMILIONCITY_SAILOR3
	ldh [hTextID], a
	call DisplayTextID
	ld b, ORANGE_PASS
	call IsItemInBag
	ret nz
.cannot_enter
	ld a, D_UP
	ld [wSimulatedJoypadStatesEnd], a
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, SCRIPT_VERMILIONCITY_PLAYER_MOVING_UP1
	ld [wVermilionCityCurScript], a
	ret

VermilionCityTicketCheckCoords:
	dbmapcoord 18, 30
	dbmapcoord 32, 30 ; marcelnote - now also check Ferry entrance
	db -1 ; end

VermilionCityPlayerAllowedToPassScript:
	ld hl, VermilionCityTicketCheckCoords
	call ArePlayerCoordsInArray
	ret c
	ld a, SCRIPT_VERMILIONCITY_DEFAULT
	ld [wVermilionCityCurScript], a
	ret

VermilionCityPlayerExitShipScript:
	ld a, A_BUTTON | B_BUTTON | SELECT | START | D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoyIgnore], a
	ld a, D_UP
	ld [wSimulatedJoypadStatesEnd], a
	ld [wSimulatedJoypadStatesEnd + 1], a
	ld a, 2
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, SCRIPT_VERMILIONCITY_PLAYER_MOVING_UP2
	ld [wVermilionCityCurScript], a
	ret

VermilionCityPlayerMovingUp2Script:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	xor a
	ld [wJoyIgnore], a
	ldh [hJoyHeld], a
	ld a, SCRIPT_VERMILIONCITY_DEFAULT
	ld [wVermilionCityCurScript], a
	ret

VermilionCityPlayerMovingUp1Script:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	ld c, 10
	call DelayFrames
	ld a, SCRIPT_VERMILIONCITY_DEFAULT
	ld [wVermilionCityCurScript], a
	ret

VermilionCity_TextPointers:
	def_text_pointers
	dw_const VermilionCityBeautyText,             TEXT_VERMILIONCITY_BEAUTY
	dw_const VermilionCityGambler1Text,           TEXT_VERMILIONCITY_GAMBLER1
	dw_const VermilionCitySailor1Text,            TEXT_VERMILIONCITY_SAILOR1
	dw_const VermilionCityGambler2Text,           TEXT_VERMILIONCITY_GAMBLER2
	dw_const VermilionCityMachopText,             TEXT_VERMILIONCITY_MACHOP
	dw_const VermilionCitySailor2Text,            TEXT_VERMILIONCITY_SAILOR2
	dw_const VermilionCitySailor3Text,            TEXT_VERMILIONCITY_SAILOR3 ; marcelnote - new for ferry
	dw_const VermilionCitySignText,               TEXT_VERMILIONCITY_SIGN
	dw_const VermilionCityNoticeSignText,         TEXT_VERMILIONCITY_NOTICE_SIGN
	dw_const MartSignText,                        TEXT_VERMILIONCITY_MART_SIGN
	dw_const PokeCenterSignText,                  TEXT_VERMILIONCITY_POKECENTER_SIGN
	dw_const VermilionCityPokemonFanClubSignText, TEXT_VERMILIONCITY_POKEMON_FAN_CLUB_SIGN
	dw_const VermilionCityGymSignText,            TEXT_VERMILIONCITY_GYM_SIGN
	dw_const VermilionCityHarborSignText,         TEXT_VERMILIONCITY_HARBOR_SIGN

VermilionCityBeautyText:
	text_far _VermilionCityBeautyText
	text_end

VermilionCityGambler1Text:
	text_asm
	CheckEvent EVENT_SS_ANNE_LEFT
	ld hl, .SSAnneDepartedText
	jr nz, .print_text
	ld hl, .DidYouSeeText
.print_text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.DidYouSeeText:
	text_far _VermilionCityGambler1DidYouSeeText
	text_end

.SSAnneDepartedText:
	text_far _VermilionCityGambler1SSAnneDepartedText
	text_end

VermilionCitySailor1Text: ; marcelnote - optimized
	text_asm
	CheckEvent EVENT_SS_ANNE_LEFT
	ld hl, .ShipSetSailText
	jr nz, .print_text
	ld hl, .inFrontOfOrBehindGuardCoords
	call ArePlayerCoordsInArray
	ld hl, .WelcomeToSSAnneText
	jr c, .print_text
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_RIGHT
	jr z, .print_text
	ld hl, .DoYouHaveATicketText
	call PrintText
	ld b, S_S_TICKET
	call IsItemInBag
	ld hl, .YouNeedATicketText
	jr z, .print_text
	ld hl, .FlashedTicketText
	ld a, SCRIPT_VERMILIONCITY_PLAYER_ALLOWED_TO_PASS
	ld [wVermilionCityCurScript], a
.print_text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.inFrontOfOrBehindGuardCoords
	dbmapcoord 19, 29 ; in front of guard
	dbmapcoord 19, 31 ; behind guard
	db -1 ; end

.WelcomeToSSAnneText:
	text_far _VermilionCitySailor1WelcomeToSSAnneText
	text_end

.DoYouHaveATicketText:
	text_far _VermilionCitySailor1DoYouHaveATicketText
	text_end

.FlashedTicketText:
	text_far _VermilionCitySailor1FlashedTicketText
	text_end

.YouNeedATicketText:
	text_far _VermilionCitySailor1YouNeedATicketText
	text_end

.ShipSetSailText:
	text_far _VermilionCitySailor1ShipSetSailText
	text_end

VermilionCityGambler2Text:
	text_far _VermilionCityGambler2Text
	text_end

VermilionCityMachopText:
	text_far _VermilionCityMachopText
	text_asm
	ld a, MACHOP
	call PlayCry
	call WaitForSoundToFinish
	ld hl, .StompingTheLandFlatText
	ret

.StompingTheLandFlatText:
	text_far _VermilionCityMachopStompingTheLandFlatText
	text_end

VermilionCitySailor2Text:
	text_far _VermilionCitySailor2Text
	text_end

VermilionCitySignText:
	text_far _VermilionCitySignText
	text_end

VermilionCityNoticeSignText:
	text_far _VermilionCityNoticeSignText
	text_end

VermilionCityPokemonFanClubSignText:
	text_far _VermilionCityPokemonFanClubSignText
	text_end

VermilionCityGymSignText:
	text_far _VermilionCityGymSignText
	text_end

VermilionCityHarborSignText:
	text_far _VermilionCityHarborSignText
	text_end

VermilionCitySailor3Text: ; marcelnote - new for ferry
	text_asm
	ld hl, .inFrontOfOrBehindGuardCoords
	call ArePlayerCoordsInArray
	ld hl, .WelcomeToFerriesText
	jr c, .print_text
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_RIGHT
	jr z, .print_text
	ld b, ORANGE_PASS
	call IsItemInBag
	ld hl, .YouNeedPassText
	jr z, .print_text
	ld hl, .ShowedPassText
	ld a, SCRIPT_VERMILIONCITY_PLAYER_ALLOWED_TO_PASS
	ld [wVermilionCityCurScript], a
.print_text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.inFrontOfOrBehindGuardCoords
	dbmapcoord 33, 29 ; in front of guard
	dbmapcoord 33, 31 ; behind guard
	db -1 ; end

.WelcomeToFerriesText:
	text_far _MandarinIslandSailorWelcomeToFerriesText
	text_end

.YouNeedPassText:
	text_far _MandarinIslandSailorYouNeedPassText
	text_end

.ShowedPassText:
	text_far _MandarinIslandSailorShowedPassText
	text_end
