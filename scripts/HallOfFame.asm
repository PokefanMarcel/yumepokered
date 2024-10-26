HallOfFame_Script:
	call EnableAutoTextBoxDrawing
	ld hl, HallOfFame_ScriptPointers
	ld a, [wHallOfFameCurScript]
	jp CallFunctionInTable

HallofFameRoomClearScripts: ; unreferenced
	xor a
	ld [wJoyIgnore], a
	ld [wHallOfFameCurScript], a
	ret

HallOfFame_ScriptPointers:
	def_script_pointers
	dw_const HallOfFameDefaultScript,            SCRIPT_HALLOFFAME_DEFAULT
	dw_const HallOfFameCongratulationsScript,    SCRIPT_HALLOFFAME_CONGRATULATIONS
	dw_const HallOfFameResetEventsAndSaveScript, SCRIPT_HALLOFFAME_RESET_EVENTS_AND_SAVE
	dw_const DoRet,                              SCRIPT_HALLOFFAME_NOOP ; PureRGB - DoRet

HallOfFameResetEventsAndSaveScript:
	call Delay3
	ld a, [wLetterPrintingDelayFlags]
	push af
	xor a
	ld [wJoyIgnore], a
	predef HallOfFamePC
	pop af
	ld [wLetterPrintingDelayFlags], a
	ld hl, wStatusFlags7
	res BIT_NO_MAP_MUSIC, [hl]
	assert wStatusFlags7 + 1 == wElite4Flags
	inc hl
	set BIT_UNUSED_BEAT_ELITE_4, [hl] ; debug, unused?
	xor a ; SCRIPT_*_DEFAULT
	ld hl, wLoreleisRoomCurScript
	ld [hli], a ; wLoreleisRoomCurScript
	ld [hli], a ; wBrunosRoomCurScript
	ld [hl], a ; wAgathasRoomCurScript
	ld [wLancesRoomCurScript], a
	ld [wHallOfFameCurScript], a
	; Elite 4 events ; marcelnote - now also resets Gym Leader's rematches
	ResetEventRange INDIGO_PLATEAU_EVENTS_START, INDIGO_PLATEAU_EVENTS_END, 1
	;;;;;; marcelnote - switching Oak for Rival for rematches
	ld a, HS_HALL_OF_FAME_OAK
	ld [wMissableObjectIndex], a
	predef HideObjectCont
	ld a, HS_HALL_OF_FAME_RIVAL
	ld [wMissableObjectIndex], a
	predef ShowObjectCont
	;;;;;;
	xor a
	ld [wHallOfFameCurScript], a
	ld a, PALLET_TOWN
	ld [wLastBlackoutMap], a
	farcall SaveSAVtoSRAM
	ld b, 5
.delayLoop
	ld c, 600 / 5
	call DelayFrames
	dec b
	jr nz, .delayLoop
	call WaitForTextScrollButtonPress
	jp Init

HallOfFameDefaultScript:
	ld a, A_BUTTON | B_BUTTON | SELECT | START | D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoyIgnore], a
	ld hl, wSimulatedJoypadStatesEnd
	ld de, HallOfFameEntryMovement
	call DecodeRLEList
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, SCRIPT_HALLOFFAME_CONGRATULATIONS
	ld [wHallOfFameCurScript], a
	ret

HallOfFameEntryMovement:
	db D_UP, 5
	db -1 ; end

HallOfFameCongratulationsScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	ld a, PLAYER_DIR_RIGHT
	ld [wPlayerMovingDirection], a
	;;;;;; marcelnote - added: load Rival instead of Oak for rematches
	CheckEvent EVENT_BECAME_CHAMPION
	ld a, HALLOFFAME_RIVAL
	jr nz, .rematch
	ld a, HALLOFFAME_OAK
.rematch
	;;;;;;
	ldh [hSpriteIndex], a
	call SetSpriteMovementBytesToFF
	ld a, SPRITE_FACING_LEFT
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	call Delay3
	xor a
	ld [wJoyIgnore], a
	inc a ; PLAYER_DIR_RIGHT
	ld [wPlayerMovingDirection], a
	;;;;;; marcelnote - added: load Rival instead of Oak for rematches
	CheckEvent EVENT_BECAME_CHAMPION
	ld a, TEXT_HALLOFFAME_RIVAL
	jr nz, .rematch2
	ld a, TEXT_HALLOFFAME_OAK
.rematch2
	;;;;;;
	ldh [hTextID], a
	call DisplayTextID
	ld a, A_BUTTON | B_BUTTON | SELECT | START | D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoyIgnore], a
	CheckEvent EVENT_BECAME_CHAMPION
	jp nz, .rematch3
	; marcelnote - resetting events and hide/show items after first win
	SetEvent EVENT_BECAME_CHAMPION ; new event which marks postgame
	ld a, HS_CERULEAN_CAVE_GUY
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, HS_INDIGO_PLATEAU_LOBBY_GIRL1 ; move girl to E4 entrance
	ld [wMissableObjectIndex], a
	predef HideObjectCont
	ld a, HS_INDIGO_PLATEAU_LOBBY_GIRL2 ; move girl to E4 entrance
	ld [wMissableObjectIndex], a
	predef ShowObjectCont
	; marcelnote - make roaming E4 members appear
	ld a, HS_SILPH_FACTORY_2F_LORELEI_1 ; postgame Lorelei
	ld [wMissableObjectIndex], a
	predef ShowObjectCont
	ld a, HS_SILPH_FACTORY_2F_SCIENTIST_1 ; postgame Lorelei event, scientist blocking factory stairs
	ld [wMissableObjectIndex], a
	predef HideObjectCont
	ld a, HS_FIGHTING_DOJO_BRUNO        ; postgame Bruno
	ld [wMissableObjectIndex], a
	predef ShowObject
	ld a, HS_POKEMON_TOWER_1F_AGATHA    ; postgame Agatha
	ld [wMissableObjectIndex], a
	predef ShowObject
	ld a, HS_POKEMON_TOWER_1F_GENTLEMAN    ; postgame Agatha event, director of Pokemon radio
	ld [wMissableObjectIndex], a
	predef ShowObject
	ld a, HS_CINNABAR_VOLCANO_1F_LANCE  ; postgame Lance
	ld [wMissableObjectIndex], a
	predef ShowObject
	ld a, HS_OAKS_LAB_RIVAL             ; postgame Rival
	ld [wMissableObjectIndex], a
	predef ShowObject
	; marcelnote - switch Gym Leaders to their rematch counterparts
	ld a, HS_PEWTER_GYM_BROCK                ; hide original Brock
	ld [wMissableObjectIndex], a
	predef HideObjectCont
	ld a, HS_PEWTER_GYM_BROCK_REMATCH        ; show rematch Brock
	ld [wMissableObjectIndex], a
	predef ShowObjectCont
	ld a, HS_CERULEAN_GYM_MISTY              ; hide original Misty
	ld [wMissableObjectIndex], a
	predef HideObjectCont
	ld a, HS_CERULEAN_GYM_MISTY_REMATCH      ; show rematch Misty
	ld [wMissableObjectIndex], a
	predef ShowObjectCont
	ld a, HS_VERMILION_GYM_LT_SURGE          ; hide original Lt.Surge
	ld [wMissableObjectIndex], a
	predef HideObjectCont
	ld a, HS_VERMILION_GYM_LT_SURGE_REMATCH  ; show rematch Lt.Surge
	ld [wMissableObjectIndex], a
	predef ShowObjectCont
	ld a, HS_CELADON_GYM_ERIKA               ; hide original Erika
	ld [wMissableObjectIndex], a
	predef HideObjectCont
	ld a, HS_CELADON_GYM_ERIKA_REMATCH       ; show rematch Erika
	ld [wMissableObjectIndex], a
	predef ShowObjectCont
	ld a, HS_FUCHSIA_GYM_KOGA                ; hide original Koga
	ld [wMissableObjectIndex], a
	predef HideObjectCont
	ld a, HS_FUCHSIA_GYM_KOGA_REMATCH        ; show rematch Koga
	ld [wMissableObjectIndex], a
	predef ShowObjectCont
	ld a, HS_SAFFRON_GYM_SABRINA             ; hide original Sabrina
	ld [wMissableObjectIndex], a
	predef HideObjectCont
	ld a, HS_SAFFRON_GYM_SABRINA_REMATCH     ; show rematch Sabrina
	ld [wMissableObjectIndex], a
	predef ShowObjectCont
	ld a, HS_CINNABAR_GYM_BLAINE             ; hide original Blaine
	ld [wMissableObjectIndex], a
	predef HideObjectCont
	ld a, HS_CINNABAR_GYM_BLAINE_REMATCH     ; show rematch Blaine
	ld [wMissableObjectIndex], a
	predef ShowObjectCont
	; marcelnote - switch E4 to their rematch counterparts
	ld a, HS_LORELEIS_ROOM_LORELEI         ; hide original Lorelei
	ld [wMissableObjectIndex], a
	predef HideObjectCont
	ld a, HS_LORELEIS_ROOM_LORELEI_REMATCH ; show rematch Lorelei
	ld [wMissableObjectIndex], a
	predef ShowObjectCont
	ld a, HS_BRUNOS_ROOM_BRUNO             ; hide original Bruno
	ld [wMissableObjectIndex], a
	predef HideObjectCont
	ld a, HS_BRUNOS_ROOM_BRUNO_REMATCH     ; show rematch Bruno
	ld [wMissableObjectIndex], a
	predef ShowObjectCont
	ld a, HS_AGATHAS_ROOM_AGATHA           ; hide original Agatha
	ld [wMissableObjectIndex], a
	predef HideObjectCont
	ld a, HS_AGATHAS_ROOM_AGATHA_REMATCH   ; show rematch Agatha
	ld [wMissableObjectIndex], a
	predef ShowObjectCont
	ld a, HS_LANCES_ROOM_LANCE             ; hide original Lance
	ld [wMissableObjectIndex], a
	predef HideObjectCont
	ld a, HS_LANCES_ROOM_LANCE_REMATCH     ; show rematch Lance
	ld [wMissableObjectIndex], a
	predef ShowObjectCont
.rematch3
	ld a, SCRIPT_HALLOFFAME_RESET_EVENTS_AND_SAVE
	ld [wHallOfFameCurScript], a
	ret

HallOfFame_TextPointers:
	def_text_pointers
	dw_const HallOfFameOakText,   TEXT_HALLOFFAME_OAK
	dw_const HallOfFameRivalText, TEXT_HALLOFFAME_RIVAL ; marcelnote - Rival rematch

HallOfFameOakText:
	text_far _HallOfFameOakText
	text_end

HallOfFameRivalText: ; marcelnote - Rival rematch
	text_far _HallOfFameRivalText
	text_end
