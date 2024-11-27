IndigoPlateauLobby_Script: ; marcelnote - script was extensively modified for postgame rival
	call Serial_TryEstablishingExternallyClockedConnection
	call EnableAutoTextBoxDrawing
	ld de, IndigoPlateauLobby_ScriptPointers
	ld a, [wIndigoPlateauLobbyCurScript]
	call ExecuteCurMapScriptInTable
	ld [wIndigoPlateauLobbyCurScript], a
	ret

IndigoPlateauLobby_ScriptPointers:
	def_script_pointers
	dw_const IndigoPlateauLobbyDefaultScript,     SCRIPT_INDIGOPLATEAULOBBY_DEFAULT
	dw_const IndigoPlateauLobbyRivalLeavesScript, SCRIPT_INDIGOPLATEAULOBBY_RIVAL_LEAVES

IndigoPlateauLobbyDefaultScript:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_2, [hl] ; marcelnote - maybe could be a preliminary script instead
	res BIT_CUR_MAP_LOADED_2, [hl] ;              (with NOOP script after)?
	jr z, .checkRivalCoords
	ResetEvent EVENT_VICTORY_ROAD_1_BOULDER_ON_SWITCH
	; Reset Elite Four events if the player started challenging them before
	ld hl, wElite4Flags
	bit BIT_STARTED_ELITE_4, [hl]
	res BIT_STARTED_ELITE_4, [hl]
	jr z, .checkRivalCoords
	ResetEventRange INDIGO_PLATEAU_EVENTS_START, EVENT_LANCES_ROOM_LOCK_DOOR

.checkRivalCoords ; marcelnote - postgame Rival
	CheckHideShowCont HS_INDIGO_PLATEAU_LOBBY_RIVAL
	ret nz
	ld hl, .RivalCoords
	call ArePlayerCoordsInArray
	ret nc
	ld a, [wCoordIndex]
	cp $2
	ld a, PLAYER_DIR_LEFT
	ld b, SPRITE_FACING_RIGHT
	jr z, .gotDirections
	ld a, PLAYER_DIR_RIGHT
	ld b, SPRITE_FACING_LEFT
	jr c, .gotDirections
	ld a, PLAYER_DIR_UP
	ld b, SPRITE_FACING_DOWN
.gotDirections
	ld [wPlayerMovingDirection], a
	ld a, INDIGOPLATEAULOBBY_RIVAL
	ldh [hSpriteIndex], a
	ld a, b
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, TEXT_INDIGOPLATEAULOBBY_RIVAL
	ldh [hTextID], a
	call DisplayTextID
	ld a, SFX_STOP_ALL_MUSIC
	ld [wNewSoundID], a
	call PlaySound
	farcall Music_RivalAlternateStart
	xor a
	ldh [hJoyHeld], a
	ldh [hJoyPressed], a
	ld a, D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoyIgnore], a
	ld c, 60 ; this is tailored so that Rival leaves on a specific music beat
	call DelayFrames
	ld de, .RivalMovement
	;ld a, INDIGOPLATEAULOBBY_RIVAL ; already stored above
	;ldh [hSpriteIndex], a
	call MoveSprite
	ld a, SCRIPT_INDIGOPLATEAULOBBY_RIVAL_LEAVES
	ld [wIndigoPlateauLobbyCurScript], a
	ld [wCurMapScript], a
	ret

.RivalCoords:
	dbmapcoord 10,  3 ; left
	dbmapcoord 12,  3 ; right
	dbmapcoord 11,  4 ; below
	db -1 ; end

.RivalMovement:
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db -1 ; end

IndigoPlateauLobbyRivalLeavesScript: ; marcelnote - postgame Rival
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	ld a, HS_INDIGO_PLATEAU_LOBBY_RIVAL
	ld [wMissableObjectIndex], a
	predef HideObjectCont
	; set up Oak battle
	ld a, [wPlayerStarter] ; this code finds the last starter ball to hide
	cp STARTER1
	ld b, HS_STARTER_BALL_3
	jr z, .hideBall
	cp STARTER2
	ld b, HS_STARTER_BALL_1
	jr z, .hideBall
	ld b, HS_STARTER_BALL_2
.hideBall
	ld a, b
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, HS_OAKS_LAB_OAK
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, HS_ROUTE_1_OAK     ; Oak appears once E4 reopens after talking to rival
	ld [wMissableObjectIndex], a
	predef ShowObjectCont
	xor a
	ld [wJoyIgnore], a
	call PlayDefaultMusic
	ld a, SCRIPT_INDIGOPLATEAULOBBY_DEFAULT
	ld [wIndigoPlateauLobbyCurScript], a
	ld [wCurMapScript], a
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
	CheckEvent EVENT_BECAME_CHAMPION
	ld hl, .AfterChampionText
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

IndigoPlateauLobbyRivalText: ; marcelnote - postgame Rival
	text_far _IndigoPlateauLobbyRivalText
	text_end