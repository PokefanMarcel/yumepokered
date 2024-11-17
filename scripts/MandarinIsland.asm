; marcelnote - new location
MandarinIsland_Script:
	call EnableAutoTextBoxDrawing
	ld hl, MandarinIsland_ScriptPointers
	ld a, [wMandarinIslandCurScript]
	jp CallFunctionInTable

MandarinIsland_ScriptPointers:
	def_script_pointers
	dw_const MandarinIslandDefaultScript,             SCRIPT_MANDARINISLAND_DEFAULT
	dw_const MandarinIslandPlayerMovingUpScript,      SCRIPT_MANDARINISLAND_PLAYER_MOVING_UP
	dw_const MandarinIslandPlayerAllowedToPassScript, SCRIPT_MANDARINISLAND_PLAYER_ALLOWED_TO_PASS

MandarinIslandDefaultScript:
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
	ld hl, MandarinIslandTicketCheckCoords
	call ArePlayerCoordsInArray
	ret nc
	xor a
	ldh [hJoyHeld], a
	ld a, SPRITE_FACING_LEFT
	ldh [hSpriteFacingDirection], a
	ld a, MANDARINISLAND_SAILOR_FERRIES
	ldh [hSpriteIndex], a
	call SetSpriteFacingDirectionAndDelay
	ld a, TEXT_MANDARINISLAND_SAILOR_FERRIES
	ldh [hTextID], a
	call DisplayTextID
	ld b, ORANGE_PASS
	call IsItemInBag
	ret nz
	ld a, D_UP
	ld [wSimulatedJoypadStatesEnd], a
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, SCRIPT_MANDARINISLAND_PLAYER_MOVING_UP
	ld [wMandarinIslandCurScript], a
	ret

MandarinIslandTicketCheckCoords:
	dbmapcoord 26, 26
	db -1 ; end

MandarinIslandPlayerAllowedToPassScript:
	ld hl, MandarinIslandTicketCheckCoords
	call ArePlayerCoordsInArray
	ret c ; could do lighter with      ld a, [wYCoord]     cp 26      ret nc
	ld a, SCRIPT_MANDARINISLAND_DEFAULT
	ld [wMandarinIslandCurScript], a
	ret

MandarinIslandPlayerMovingUpScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	ld c, 10
	call DelayFrames
	ld a, SCRIPT_MANDARINISLAND_DEFAULT
	ld [wMandarinIslandCurScript], a
	ret

MandarinIsland_TextPointers:
	def_text_pointers
	; objects
	dw_const MandarinIslandFisherText,         TEXT_MANDARINISLAND_FISHER
	dw_const MandarinIslandLittleGirlText,     TEXT_MANDARINISLAND_LITTLE_GIRL
	dw_const MandarinIslandRockerText,         TEXT_MANDARINISLAND_ROCKER
	dw_const MandarinIslandSwimmerText,        TEXT_MANDARINISLAND_SWIMMER
	dw_const MandarinIslandSwimmerFText,       TEXT_MANDARINISLAND_SWIMMER_F
	dw_const MandarinIslandCooltrainerMText,   TEXT_MANDARINISLAND_COOLTRAINER_M
	dw_const MandarinIslandSilphWorkerFText,   TEXT_MANDARINISLAND_SILPH_WORKER_F
	dw_const MandarinIslandGirlText,           TEXT_MANDARINISLAND_GIRL
	dw_const MandarinIslandSailorFerriesText,  TEXT_MANDARINISLAND_SAILOR_FERRIES
	; bg
	dw_const MandarinIslandSignText,           TEXT_MANDARINISLAND_SIGN
	dw_const MartSignText,                     TEXT_MANDARINISLAND_MART_SIGN
	dw_const PokeCenterSignText,               TEXT_MANDARINISLAND_POKECENTER_SIGN
	dw_const MandarinIslandSurfShopSignText,   TEXT_MANDARINISLAND_SURFSHOP_SIGN
	dw_const MandarinIslandSilphCoSignText,    TEXT_MANDARINISLAND_SILPH_CO_SIGN
	dw_const MandarinIslandHotelSignText,      TEXT_MANDARINISLAND_HOTEL_SIGN


MandarinIslandFisherText:
	text_far _MandarinIslandFisherText
	text_end

MandarinIslandLittleGirlText:
	text_far _MandarinIslandLittleGirlText
	text_end

MandarinIslandRockerText:
	text_far _MandarinIslandRockerText
	text_end

MandarinIslandSwimmerText:
	text_far _MandarinIslandSwimmerText
	text_end

MandarinIslandSwimmerFText:
	text_far _MandarinIslandSwimmerFText
	text_end

MandarinIslandCooltrainerMText:
	text_far _MandarinIslandCooltrainerMText
	text_end

MandarinIslandSilphWorkerFText:
	text_far _MandarinIslandSilphWorkerFText
	text_end

MandarinIslandGirlText:
	text_far _MandarinIslandGirlText
	text_end

MandarinIslandSignText:
	text_far _MandarinIslandSignText
	text_end

MandarinIslandSurfShopSignText:
	text_far _MandarinIslandSurfShopSignText
	text_end

MandarinIslandSilphCoSignText:
	text_far _MandarinIslandSilphCoSignText
	text_end

MandarinIslandHotelSignText:
	text_far _MandarinIslandHotelSignText
	text_end

MandarinIslandSailorFerriesText:
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
	ld a, SCRIPT_MANDARINISLAND_PLAYER_ALLOWED_TO_PASS
	ld [wMandarinIslandCurScript], a
.print_text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.inFrontOfOrBehindGuardCoords
	dbmapcoord 27, 25 ; in front of guard
	dbmapcoord 27, 27 ; behind guard
	db -1 ; end

.WelcomeToFerriesText:
	text_far _VermilionCitySailor3WelcomeToFerriesText
	text_end

.YouNeedPassText:
	text_far _VermilionCitySailor3YouNeedPassText
	text_end

.ShowedPassText:
	text_far _VermilionCitySailor3ShowedPassText
	text_end