IndigoPlateauLobby_Script:
	call Serial_TryEstablishingExternallyClockedConnection
	call EnableAutoTextBoxDrawing
	ld hl, wCurrentMapScriptFlags
	bit 6, [hl]
	res 6, [hl]
	ret z
	ResetEvent EVENT_VICTORY_ROAD_1_BOULDER_ON_SWITCH
	; Reset Elite Four events if the player started challenging them before
	ld hl, wElite4Flags
	bit BIT_STARTED_ELITE_4, [hl]
	res BIT_STARTED_ELITE_4, [hl]
	ret z
	ResetEventRange INDIGO_PLATEAU_EVENTS_START, EVENT_LANCES_ROOM_LOCK_DOOR
	ret

IndigoPlateauLobby_TextPointers:
	def_text_pointers
	dw_const IndigoPlateauLobbyNurseText,            TEXT_INDIGOPLATEAULOBBY_NURSE
	dw_const IndigoPlateauLobbyGymGuideText,         TEXT_INDIGOPLATEAULOBBY_GYM_GUIDE
	dw_const IndigoPlateauLobbyCooltrainerFText,     TEXT_INDIGOPLATEAULOBBY_COOLTRAINER_F
	dw_const IndigoPlateauLobbyCooltrainerF2Text,    TEXT_INDIGOPLATEAULOBBY_COOLTRAINER_F2
	dw_const IndigoPlateauLobbyClerkText,            TEXT_INDIGOPLATEAULOBBY_CLERK
	dw_const IndigoPlateauLobbyLinkReceptionistText, TEXT_INDIGOPLATEAULOBBY_LINK_RECEPTIONIST
	dw_const IndigoPlateauLobbyRivalText,            TEXT_INDIGOPLATEAULOBBY_RIVAL ; marcelnote - added

IndigoPlateauLobbyNurseText:
	script_pokecenter_nurse

IndigoPlateauLobbyGymGuideText:
	text_far _IndigoPlateauLobbyGymGuideText
	text_end

IndigoPlateauLobbyCooltrainerFText: ; marcelnote - modified to say something different after becoming champion
	text_asm
	ld hl, .AfterChampionText
	CheckEvent EVENT_BECAME_CHAMPION
    jr nz, .is_champion
	ld hl, .BeforeChampionText
.is_champion
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.BeforeChampionText:
	text_far _IndigoPlateauLobbyCooltrainerFBeforeChampionText
	text_end

.AfterChampionText:
	text_far _IndigoPlateauLobbyCooltrainerFAfterChampionText
	text_end

IndigoPlateauLobbyCooltrainerF2Text: ; marcelnote - new, blocks the way after defeating E4 first time
	text_far _IndigoPlateauLobbyCooltrainerFEliteFourAwayText
	text_end

IndigoPlateauLobbyLinkReceptionistText:
	script_cable_club_receptionist

IndigoPlateauLobbyClerkText: ; marcelnote - moved Mart inventories
	script_mart ULTRA_BALL, GREAT_BALL, FULL_RESTORE, MAX_POTION, FULL_HEAL, REVIVE, MAX_REPEL

IndigoPlateauLobbyRivalText: ; marcelnote - added, appears when E4 reopens
	text_asm
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, .text
	call PrintText
	call GBFadeOutToBlack
	ld a, HS_INDIGO_PLATEAU_LOBBY_RIVAL
	ld [wMissableObjectIndex], a
	predef HideObjectCont
	; set up Oak battle
	ld a, HS_STARTER_BALL_1 ; hide all starter balls, maybe not efficient but happens only once
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, HS_STARTER_BALL_2
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, HS_STARTER_BALL_3
	ld [wMissableObjectIndex], a
	predef HideObject
	;ld a, [wPlayerStarter] ; this code to find the last ball instead
	;cp STARTER1
	;ld a, HS_STARTER_BALL_3
	;jr z, .hideBall
	;ld a, [wPlayerStarter]
	;cp STARTER2
	;ld a, HS_STARTER_BALL_1
	;jr z, .hideBall
	;ld a, HS_STARTER_BALL_2
;.hideBall
	;ld [wMissableObjectIndex], a
	;predef HideObject
	ld a, HS_OAKS_LAB_OAK_1
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, HS_ROUTE_1_OAK
	ld [wMissableObjectIndex], a
	predef ShowObjectCont
	call UpdateSprites
	call Delay3
	call GBFadeInFromBlack
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.text
	text_far _IndigoPlateauLobbyRivalText
	text_end