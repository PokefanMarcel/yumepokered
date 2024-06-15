IndigoPlateauLobby_Script:
	call Serial_TryEstablishingExternallyClockedConnection
	call EnableAutoTextBoxDrawing
	ld hl, wCurrentMapScriptFlags
	bit 6, [hl]
	res 6, [hl]
	ret z
	ResetEvent EVENT_VICTORY_ROAD_1_BOULDER_ON_SWITCH
	ld hl, wBeatLorelei
	bit 1, [hl]
	res 1, [hl]
	ret z
	; Elite 4 events
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
