OaksLab_Script:
;	CheckEvent EVENT_PALLET_AFTER_GETTING_POKEBALLS
;	call nz, OaksLabLoadTextPointers2Script ; marcelnote - useless?
	call EnableAutoTextBoxDrawing
	ld hl, OaksLab_ScriptPointers
	ld a, [wOaksLabCurScript]
	jp CallFunctionInTable

OaksLab_ScriptPointers:
	def_script_pointers
	dw_const OaksLabDefaultScript,                   SCRIPT_OAKSLAB_DEFAULT
	dw_const OaksLabOakEntersLabScript,              SCRIPT_OAKSLAB_OAK_ENTERS_LAB
	dw_const OaksLabToggleOaksScript,                SCRIPT_OAKSLAB_TOGGLE_OAKS
	dw_const OaksLabPlayerEntersLabScript,           SCRIPT_OAKSLAB_PLAYER_ENTERS_LAB
	dw_const OaksLabFollowedOakScript,               SCRIPT_OAKSLAB_FOLLOWED_OAK
	dw_const OaksLabOakChooseMonSpeechScript,        SCRIPT_OAKSLAB_OAK_CHOOSE_MON_SPEECH
	dw_const OaksLabPlayerDontGoAwayScript,          SCRIPT_OAKSLAB_PLAYER_DONT_GO_AWAY_SCRIPT
	dw_const OaksLabPlayerForcedToWalkBackScript,    SCRIPT_OAKSLAB_PLAYER_FORCED_TO_WALK_BACK_SCRIPT
	dw_const OaksLabChoseStarterScript,              SCRIPT_OAKSLAB_CHOSE_STARTER_SCRIPT
	dw_const OaksLabRivalChoosesStarterScript,       SCRIPT_OAKSLAB_RIVAL_CHOOSES_STARTER
	dw_const OaksLabRivalChallengesPlayerScript,     SCRIPT_OAKSLAB_RIVAL_CHALLENGES_PLAYER
	dw_const OaksLabRivalStartBattleScript,          SCRIPT_OAKSLAB_RIVAL_START_BATTLE
	dw_const OaksLabRivalEndBattleScript,            SCRIPT_OAKSLAB_RIVAL_END_BATTLE
	dw_const OaksLabRivalStartsExitScript,           SCRIPT_OAKSLAB_RIVAL_STARTS_EXIT
	dw_const OaksLabPlayerWatchRivalExitScript,      SCRIPT_OAKSLAB_PLAYER_WATCH_RIVAL_EXIT
	dw_const OaksLabRivalArrivesAtOaksRequestScript, SCRIPT_OAKSLAB_RIVAL_ARRIVES_AT_OAKS_REQUEST
	dw_const OaksLabOakGivesPokedexScript,           SCRIPT_OAKSLAB_OAK_GIVES_POKEDEX
	dw_const OaksLabRivalLeavesWithPokedexScript,    SCRIPT_OAKSLAB_RIVAL_LEAVES_WITH_POKEDEX
	dw_const OaksLabRivalBackToIndigoScript,         SCRIPT_OAKSLAB_RIVAL_BACK_TO_INDIGO    ; marcelnote - postgame Rival event
	dw_const OaksLabRivalLeavesForIndigoScript,      SCRIPT_OAKSLAB_RIVAL_LEAVES_FOR_INDIGO ; marcelnote - postgame Rival event
	dw_const DoRet,                                  SCRIPT_OAKSLAB_NOOP ; PureRGB - DoRet

OaksLabDefaultScript:
	CheckEvent EVENT_OAK_APPEARED_IN_PALLET
	ret z
	ld a, [wNPCMovementScriptFunctionNum]
	and a
	ret nz
	ld a, TOGGLE_OAKS_LAB_OAK_WALKING
	ld [wToggleableObjectIndex], a
	predef ShowObject
	ld hl, wStatusFlags4
	res BIT_NO_BATTLES, [hl]

	ld a, SCRIPT_OAKSLAB_OAK_ENTERS_LAB
	ld [wOaksLabCurScript], a
	ret

OaksLabOakEntersLabScript:
	ld a, OAKSLAB_OAK_WALKING
	ldh [hSpriteIndex], a
	ld de, OakEntryMovement
	call MoveSprite

	ld a, SCRIPT_OAKSLAB_TOGGLE_OAKS
	ld [wOaksLabCurScript], a
	ret

OakEntryMovement:
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db -1 ; end

OaksLabToggleOaksScript:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	ld a, TOGGLE_OAKS_LAB_OAK_WALKING
	ld [wToggleableObjectIndex], a
	predef HideObject
	ld a, TOGGLE_OAKS_LAB_OAK
	ld [wToggleableObjectIndex], a
	predef ShowObject

	ld a, SCRIPT_OAKSLAB_PLAYER_ENTERS_LAB
	ld [wOaksLabCurScript], a
	ret

OaksLabPlayerEntersLabScript:
	call Delay3
	ld hl, wSimulatedJoypadStatesEnd
	ld de, PlayerEntryMovementRLE
	call DecodeRLEList
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, OAKSLAB_RIVAL
	ldh [hSpriteIndex], a
	xor a
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, OAKSLAB_OAK
	ldh [hSpriteIndex], a
	xor a
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay

	ld a, SCRIPT_OAKSLAB_FOLLOWED_OAK
	ld [wOaksLabCurScript], a
	ret

PlayerEntryMovementRLE:
	db 8, PAD_UP
	db -1 ; end

OaksLabFollowedOakScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	ld a, OAKSLAB_RIVAL
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_UP
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	call UpdateSprites
	ld hl, wStatusFlags7
	res BIT_NO_MAP_MUSIC, [hl]
	call DelayFrame  ; marcelnote - Prof. Oak's lab music sometimes plays with a channel cut off (fix from pokered Wiki)
	call PlayDefaultMusic

	ld a, SCRIPT_OAKSLAB_OAK_CHOOSE_MON_SPEECH
	ld [wOaksLabCurScript], a
	ret

OaksLabOakChooseMonSpeechScript:
	ld a, PAD_SELECT | PAD_START | PAD_CTRL_PAD
	ld [wJoyIgnore], a
	ld a, TEXT_OAKSLAB_RIVAL_FED_UP_WITH_WAITING
	ldh [hTextID], a
	call DisplayTextID
	call Delay3
	ld a, TEXT_OAKSLAB_OAK_CHOOSE_MON
	ldh [hTextID], a
	call DisplayTextID
	call Delay3
	ld a, TEXT_OAKSLAB_RIVAL_WHAT_ABOUT_ME
	ldh [hTextID], a
	call DisplayTextID
	call Delay3
	ld a, TEXT_OAKSLAB_OAK_BE_PATIENT
	ldh [hTextID], a
	call DisplayTextID
	SetEvent EVENT_OAK_ASKED_TO_CHOOSE_MON
	xor a
	ld [wJoyIgnore], a

	ld a, SCRIPT_OAKSLAB_PLAYER_DONT_GO_AWAY_SCRIPT
	ld [wOaksLabCurScript], a
	ret

OaksLabPlayerDontGoAwayScript:
	; marcelnote - don't draw the textbox automatically when looking at Poké balls
	predef GetTileAndCoordsInFrontOfPlayer
	ld a, d
	cp 3 ; starter balls' Y coordinate
	jr nz, .checkPlayerPosition
	ld a, e
	sub 6 ; first starter ball's X coordinate
	cp 3 ; number of starter balls
	call c, DisableAutoTextBoxDrawing
.checkPlayerPosition
	ld a, [wYCoord]
	cp 6
	ret nz
	ld a, OAKSLAB_OAK
	ldh [hSpriteIndex], a
	xor a ; SPRITE_FACING_DOWN
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, OAKSLAB_RIVAL
	ldh [hSpriteIndex], a
	xor a ; SPRITE_FACING_DOWN
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	call UpdateSprites
	ld a, TEXT_OAKSLAB_OAK_DONT_GO_AWAY_YET
	ldh [hTextID], a
	call DisplayTextID
	ld a, 1
	ld [wSimulatedJoypadStatesIndex], a
	ld a, PAD_UP
	ld [wSimulatedJoypadStatesEnd], a
	call StartSimulatingJoypadStates
	ld a, PLAYER_DIR_UP
	ld [wPlayerMovingDirection], a

	ld a, SCRIPT_OAKSLAB_PLAYER_FORCED_TO_WALK_BACK_SCRIPT
	ld [wOaksLabCurScript], a
	ret

OaksLabPlayerForcedToWalkBackScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3

	ld a, SCRIPT_OAKSLAB_PLAYER_DONT_GO_AWAY_SCRIPT
	ld [wOaksLabCurScript], a
	ret

OaksLabChoseStarterScript:
	ld a, [wPlayerStarter]
	cp STARTER1
	jr z, .Charmander
	cp STARTER2
	jr z, .Squirtle
	jr .Bulbasaur

.Charmander
	ld a, [wYCoord]
	cp 4 ; is the player standing below the table?
	ld de, .MiddleBallMovement1
	jr z, .moveRival
	ld de, .MiddleBallMovement2
	jr .moveRival

.MiddleBallMovement1
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_UP
	db -1 ; end

.MiddleBallMovement2
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db -1 ; end

.Squirtle
	ld a, [wYCoord]
	cp 4 ; is the player standing below the table?
	ld de, .RightBallMovement1
	jr z, .moveRival
	ld de, .RightBallMovement2
	jr .moveRival

.RightBallMovement1
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_UP
	db -1 ; end

.RightBallMovement2
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db -1 ; end

.Bulbasaur
	ld a, [wXCoord]
	cp 9 ; is the player standing to the right of the table?
	ld de, .LeftBallMovement1
	jr nz, .moveRival
	push hl
	ld a, OAKSLAB_RIVAL
	ldh [hSpriteIndex], a
	ld a, SPRITESTATEDATA1_YPIXELS
	ldh [hSpriteDataOffset], a
	call GetPointerWithinSpriteStateData1
	push hl
	ld [hl], $4c ; SPRITESTATEDATA1_YPIXELS
	inc hl
	inc hl
	ld [hl], $0 ; SPRITESTATEDATA1_XPIXELS
	pop hl
	inc h
	ld [hl], 8 ; SPRITESTATEDATA2_MAPY
	inc hl
	ld [hl], 9 ; SPRITESTATEDATA2_MAPX
	ld de, .LeftBallMovement2 ; the rival is not currently onscreen, so account for that
	pop hl
	jr .moveRival

.LeftBallMovement1
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_RIGHT
.LeftBallMovement2
	db NPC_MOVEMENT_RIGHT
	db -1 ; end

.moveRival
	ld a, OAKSLAB_RIVAL
	ldh [hSpriteIndex], a
	call MoveSprite

	ld a, SCRIPT_OAKSLAB_RIVAL_CHOOSES_STARTER
	ld [wOaksLabCurScript], a
	ret

OaksLabRivalChoosesStarterScript:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	ld a, PAD_SELECT | PAD_START | PAD_CTRL_PAD
	ld [wJoyIgnore], a
	ld a, OAKSLAB_RIVAL
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_UP
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, TEXT_OAKSLAB_RIVAL_ILL_TAKE_THIS_ONE
	ldh [hTextID], a
	call DisplayTextID
	ld a, [wRivalStarterBallSpriteIndex]
	ASSERT TOGGLE_STARTER_BALL_2 - OAKSLAB_STARTER_BALL_2 == TOGGLE_STARTER_BALL_1 - OAKSLAB_STARTER_BALL_1
	ASSERT TOGGLE_STARTER_BALL_3 - OAKSLAB_STARTER_BALL_3 == TOGGLE_STARTER_BALL_1 - OAKSLAB_STARTER_BALL_1
	add TOGGLE_STARTER_BALL_1 - OAKSLAB_STARTER_BALL_1
	ld [wToggleableObjectIndex], a
	predef HideObject
	call Delay3
	ld a, [wRivalStarterTemp]
	ld [wRivalStarter], a
	ld [wCurPartySpecies], a
	ld [wNamedObjectIndex], a
	call GetMonName
	ld a, OAKSLAB_RIVAL
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_UP
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, TEXT_OAKSLAB_RIVAL_RECEIVED_MON
	ldh [hTextID], a
	call DisplayTextID
	xor a
	ld [wJoyIgnore], a

	ld a, SCRIPT_OAKSLAB_RIVAL_CHALLENGES_PLAYER
	ld [wOaksLabCurScript], a
	ret

OaksLabRivalChallengesPlayerScript:
	ld a, [wYCoord]
	cp 6
	ret nz
	ld a, OAKSLAB_RIVAL
	ldh [hSpriteIndex], a
	xor a ; SPRITE_FACING_DOWN
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, PLAYER_DIR_UP
	ld [wPlayerMovingDirection], a
	ld c, 0 ; BANK(Music_MeetRival)
	ld a, MUSIC_MEET_RIVAL
	call PlayMusic
	ld a, TEXT_OAKSLAB_RIVAL_ILL_TAKE_YOU_ON
	ldh [hTextID], a
	call DisplayTextID
	ld a, OAKSLAB_RIVAL
	swap a
	ldh [hNPCSpriteOffset], a
	predef CalcPositionOfPlayerRelativeToNPC
	ld hl, hNPCPlayerYDistance
	dec [hl] ; stop in front of player
	predef FindPathToPlayer
	ld de, wNPCMovementDirections2
	ld a, OAKSLAB_RIVAL
	ldh [hSpriteIndex], a
	call MoveSprite

	ld a, SCRIPT_OAKSLAB_RIVAL_START_BATTLE
	ld [wOaksLabCurScript], a
	ret

OaksLabRivalStartBattleScript:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	ld a, OPP_RIVAL1
	ld [wCurOpponent], a
	; select which team to use during the encounter
	ld a, [wRivalStarter]
	ld b, 1     ; 1 = Squirtle team
	cp STARTER2 ; Squirtle
	jr z, .gotTeam
	inc b       ; 2 = Bulbasaur team
	cp STARTER3 ; Bulbasaur
	jr z, .gotTeam
	inc b       ; 3 = Charmander team
.gotTeam
	ld a, b
	ld [wTrainerNo], a
	ld a, OAKSLAB_RIVAL
	ld [wSpriteIndex], a
	call GetSpritePosition1
	ld hl, OaksLabRivalIPickedTheWrongPokemonText
	ld de, OaksLabRivalAmIGreatOrWhatText
	call SaveEndBattleTextPointers
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	xor a
	ld [wJoyIgnore], a
	ld a, PLAYER_DIR_UP
	ld [wPlayerMovingDirection], a
	ld a, SCRIPT_OAKSLAB_RIVAL_END_BATTLE
	ld [wOaksLabCurScript], a
	ret

OaksLabRivalEndBattleScript:
	ld a, PAD_CTRL_PAD
	ld [wJoyIgnore], a
	ld a, PLAYER_DIR_UP
	ld [wPlayerMovingDirection], a
	call UpdateSprites
	ld a, OAKSLAB_RIVAL
	ld [wSpriteIndex], a
	call SetSpritePosition1
	ld a, OAKSLAB_RIVAL
	ldh [hSpriteIndex], a
	xor a ; SPRITE_FACING_DOWN
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	predef HealParty
	SetEvent EVENT_BATTLED_RIVAL_IN_OAKS_LAB

	ld a, SCRIPT_OAKSLAB_RIVAL_STARTS_EXIT
	ld [wOaksLabCurScript], a
	ret

OaksLabRivalStartsExitScript:
	ld c, 20
	call DelayFrames
	ld a, TEXT_OAKSLAB_RIVAL_SMELL_YOU_LATER
	ldh [hTextID], a
	call DisplayTextID
	callfar Music_RivalAlternateStart
	ld a, OAKSLAB_RIVAL
	ldh [hSpriteIndex], a
	ld de, .RivalExitMovement
	call MoveSprite
	ld a, [wXCoord]
	cp 4
	; move left or right depending on where the player is standing
	ld a, NPC_MOVEMENT_RIGHT
	jr z, .gotDirection
	ld a, NPC_MOVEMENT_LEFT
.gotDirection
	ld [wNPCMovementDirections], a

	ld a, SCRIPT_OAKSLAB_PLAYER_WATCH_RIVAL_EXIT
	ld [wOaksLabCurScript], a
	ret

.RivalExitMovement
	db NPC_CHANGE_FACING
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db -1 ; end

OaksLabPlayerWatchRivalExitScript:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	jr nz, .checkRivalPosition
	ld a, TOGGLE_OAKS_LAB_RIVAL
	ld [wToggleableObjectIndex], a
	predef HideObject
	xor a
	ld [wJoyIgnore], a
	call PlayDefaultMusic ; reset to map music
	ld a, SCRIPT_OAKSLAB_NOOP
	ld [wOaksLabCurScript], a
	ret
; make the player keep facing the rival as he walks away
.checkRivalPosition
	ld a, [wNPCNumScriptedSteps]
	cp $5
	jr nz, .turnPlayerDown
	ld a, [wXCoord]
	cp 4
	ld a, SPRITE_FACING_RIGHT
	jr z, .gotDirection
	ld a, SPRITE_FACING_LEFT
.gotDirection
	ld [wSpritePlayerStateData1FacingDirection], a
	ret
.turnPlayerDown
	cp $4
	ret nz
	xor a ; SPRITE_FACING_DOWN
	ld [wSpritePlayerStateData1FacingDirection], a
	ret

OaksLabRivalArrivesAtOaksRequestScript:
	xor a
	ldh [hJoyHeld], a
	ld a, SFX_STOP_ALL_MUSIC
;	ld [wNewSoundID], a
	call PlaySound
	callfar Music_RivalAlternateStart
	ld a, TEXT_OAKSLAB_RIVAL_GRAMPS
	ldh [hTextID], a
	call DisplayTextID
	call OaksLabCalcRivalMovementScript
	ld a, TOGGLE_OAKS_LAB_RIVAL
	ld [wToggleableObjectIndex], a
	predef ShowObject
	ld a, [wNPCMovementDirections2Index]
	ld [wSavedNPCMovementDirections2Index], a
	ld b, 0
	ld c, a
	ld hl, wNPCMovementDirections2
	ld a, NPC_MOVEMENT_UP
	call FillMemory
	ld [hl], $ff
	ld a, OAKSLAB_RIVAL
	ldh [hSpriteIndex], a
	ld de, wNPCMovementDirections2
	call MoveSprite

	ld a, SCRIPT_OAKSLAB_OAK_GIVES_POKEDEX
	ld [wOaksLabCurScript], a
	ret

OaksLabRivalFaceUpOakFaceDownScript:
	ld a, OAKSLAB_RIVAL
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_UP
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, OAKSLAB_OAK_WALKING
	ldh [hSpriteIndex], a
	xor a ; SPRITE_FACING_DOWN
	ldh [hSpriteFacingDirection], a
	jp SetSpriteFacingDirectionAndDelay

OaksLabOakGivesPokedexScript:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	call PlayDefaultMusic
	ld a, PAD_SELECT | PAD_START | PAD_CTRL_PAD
	ld [wJoyIgnore], a
	call OaksLabRivalFaceUpOakFaceDownScript
	ld a, TEXT_OAKSLAB_RIVAL_WHAT_DID_YOU_CALL_ME_FOR
	ldh [hTextID], a
	call DisplayTextID
	call DelayFrame
	call OaksLabRivalFaceUpOakFaceDownScript
	ld a, TEXT_OAKSLAB_OAK_I_HAVE_A_REQUEST
	ldh [hTextID], a
	call DisplayTextID
	call DelayFrame
	call OaksLabRivalFaceUpOakFaceDownScript
	ld a, TEXT_OAKSLAB_OAK_MY_INVENTION_POKEDEX
	ldh [hTextID], a
	call DisplayTextID
	call DelayFrame
	ld a, TEXT_OAKSLAB_OAK_GOT_POKEDEX
	ldh [hTextID], a
	call DisplayTextID
	call Delay3
	ld a, TOGGLE_POKEDEX_1
	ld [wToggleableObjectIndex], a
	predef HideObject
	ld a, TOGGLE_POKEDEX_2
	ld [wToggleableObjectIndex], a
	predef HideObject
	call OaksLabRivalFaceUpOakFaceDownScript
	ld a, TEXT_OAKSLAB_OAK_THAT_WAS_MY_DREAM
	ldh [hTextID], a
	call DisplayTextID
	ld a, OAKSLAB_RIVAL
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_RIGHT
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	call Delay3
	ld a, TEXT_OAKSLAB_RIVAL_LEAVE_IT_ALL_TO_ME
	ldh [hTextID], a
	call DisplayTextID
	SetEvent EVENT_GOT_POKEDEX
	ld a, TOGGLE_LYING_OLD_MAN
	ld [wToggleableObjectIndex], a
	predef HideObject
	ld a, TOGGLE_OLD_MAN
	ld [wToggleableObjectIndex], a
	predef ShowObject
	ld a, [wSavedNPCMovementDirections2Index]
	ld b, 0
	ld c, a
	ld hl, wNPCMovementDirections2
	xor a ; NPC_MOVEMENT_DOWN
	call FillMemory
	ld [hl], $ff
	ld a, SFX_STOP_ALL_MUSIC
;	ld [wNewSoundID], a
	call PlaySound
	callfar Music_RivalAlternateStart
	ld a, OAKSLAB_RIVAL
	ldh [hSpriteIndex], a
	ld de, wNPCMovementDirections2
	call MoveSprite

	ld a, SCRIPT_OAKSLAB_RIVAL_LEAVES_WITH_POKEDEX
	ld [wOaksLabCurScript], a
	ret

OaksLabRivalLeavesWithPokedexScript:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	call PlayDefaultMusic
	ld a, TOGGLE_OAKS_LAB_RIVAL
	ld [wToggleableObjectIndex], a
	predef HideObject
	SetEvent EVENT_1ST_ROUTE22_RIVAL_BATTLE
	ResetEventReuseHL EVENT_2ND_ROUTE22_RIVAL_BATTLE
	SetEventReuseHL EVENT_ROUTE22_RIVAL_WANTS_BATTLE
	ld a, TOGGLE_ROUTE_22_RIVAL_1
	ld [wToggleableObjectIndex], a
	predef ShowObject
	ld a, SCRIPT_PALLETTOWN_DAISY
	ld [wPalletTownCurScript], a
	xor a
	ld [wJoyIgnore], a

	ld a, SCRIPT_OAKSLAB_NOOP
	ld [wOaksLabCurScript], a
	ret

OaksLabCalcRivalMovementScript:
	ld a, $7c
	ldh [hSpriteScreenYCoord], a
	ld a, 8
	ldh [hSpriteMapXCoord], a
	ld a, [wYCoord]
	cp 3
	jr nz, .notBelowOak
	ld a, $4
	ld [wNPCMovementDirections2Index], a
	ld a, $30
	ld b, 11
	jr .gotCoords
.notBelowOak
	cp 1
	jr nz, .notAboveOak
	ld a, $2
	ld [wNPCMovementDirections2Index], a
	ld a, $30
	ld b, 9
	jr .gotCoords
.notAboveOak
	ld a, $3
	ld [wNPCMovementDirections2Index], a
	ld b, 10
	ld a, [wXCoord]
	cp 4
	jr nz, .notLeftOfOak
	ld a, $40
	jr .gotCoords
.notLeftOfOak
	ld a, $20
.gotCoords
	ldh [hSpriteScreenXCoord], a
	ld a, b
	ldh [hSpriteMapYCoord], a
	ld a, OAKSLAB_RIVAL
	ld [wSpriteIndex], a
	jp SetSpritePosition1

;OaksLabLoadTextPointers2Script:
;	ld hl, OaksLab_TextPointers2
;	ld a, l
;	ld [wCurMapTextPtr], a
;	ld a, h
;	ld [wCurMapTextPtr + 1], a
;	ret

OaksLabRivalBackToIndigoScript: ; marcelnote - postgame Rival event
	ld a, TEXT_OAKSLAB_RIVAL_BACK_TO_INDIGO
	ldh [hTextID], a
	call DisplayTextID
	call Delay3
	ld a, SFX_STOP_ALL_MUSIC
	; ld [wNewSoundID], a
	call PlaySound
	callfar Music_RivalAlternateStart
	ld a, [wYCoord]
	cp 4
	ld a, OAKSLAB_RIVAL
	ldh [hSpriteIndex], a
	ld de, .RivalExitMovement
	jr nz, .movementLoaded
	ld de, .RivalExitMovementRight
.movementLoaded
	call MoveSprite
	ld a, SCRIPT_OAKSLAB_RIVAL_LEAVES_FOR_INDIGO
	ld [wOaksLabCurScript], a
	ret

.RivalExitMovementRight
	db NPC_MOVEMENT_RIGHT
.RivalExitMovement
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db -1 ; end

OaksLabRivalLeavesForIndigoScript: ; marcelnote - postgame Rival event
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	call PlayDefaultMusic
	ld a, TOGGLE_OAKS_LAB_RIVAL
	ld [wToggleableObjectIndex], a
	predef HideObject
	SetEvent EVENT_POSTGAME_RIVAL
	CheckBothEventsSet EVENT_POSTGAME_LORELEI, EVENT_POSTGAME_BRUNO ; sets Z flag when events are set
	jr nz, .end
	CheckBothEventsSet EVENT_POSTGAME_AGATHA, EVENT_POSTGAME_LANCE
	jr nz, .end
	ld a, TOGGLE_INDIGO_PLATEAU_LOBBY_GIRL1 ; marcelnote - remove girl from E4 entrance
	ld [wToggleableObjectIndex], a
	predef ShowObjectCont
	ld a, TOGGLE_INDIGO_PLATEAU_LOBBY_GIRL2 ; marcelnote - remove girl from E4 entrance
	ld [wToggleableObjectIndex], a
	predef HideObjectCont
	ld a, TOGGLE_INDIGO_PLATEAU_LOBBY_RIVAL ; marcelnote - show Rival
	ld [wToggleableObjectIndex], a
	predef ShowObjectCont
.end
	xor a
	ld [wJoyIgnore], a
	ld a, SCRIPT_OAKSLAB_NOOP
	ld [wOaksLabCurScript], a
	ret

OaksLab_TextPointers:
	def_text_pointers
	dw_const OaksLabRivalText,                    TEXT_OAKSLAB_RIVAL
	dw_const OaksLabCharmanderPokeBallText,       TEXT_OAKSLAB_CHARMANDER_POKE_BALL
	dw_const OaksLabSquirtlePokeBallText,         TEXT_OAKSLAB_SQUIRTLE_POKE_BALL
	dw_const OaksLabBulbasaurPokeBallText,        TEXT_OAKSLAB_BULBASAUR_POKE_BALL
	dw_const OaksLabOakText,                      TEXT_OAKSLAB_OAK
	dw_const OaksLabPokedexText,                  TEXT_OAKSLAB_POKEDEX1
	dw_const OaksLabPokedexText,                  TEXT_OAKSLAB_POKEDEX2
	dw_const OaksLabOakWalkingText,               TEXT_OAKSLAB_OAK_WALKING
	dw_const OaksLabGirlText,                     TEXT_OAKSLAB_GIRL
	dw_const OaksLabScientistText,                TEXT_OAKSLAB_SCIENTIST1
	dw_const OaksLabScientistText,                TEXT_OAKSLAB_SCIENTIST2
	dw_const OaksLabOakDontGoAwayYetText,         TEXT_OAKSLAB_OAK_DONT_GO_AWAY_YET
	dw_const OaksLabRivalIllTakeThisOneText,      TEXT_OAKSLAB_RIVAL_ILL_TAKE_THIS_ONE
	dw_const OaksLabRivalReceivedMonText,         TEXT_OAKSLAB_RIVAL_RECEIVED_MON
	dw_const OaksLabRivalIllTakeYouOnText,        TEXT_OAKSLAB_RIVAL_ILL_TAKE_YOU_ON
	dw_const OaksLabRivalSmellYouLaterText,       TEXT_OAKSLAB_RIVAL_SMELL_YOU_LATER
	dw_const OaksLabRivalFedUpWithWaitingText,    TEXT_OAKSLAB_RIVAL_FED_UP_WITH_WAITING
	dw_const OaksLabOakChooseMonText,             TEXT_OAKSLAB_OAK_CHOOSE_MON
	dw_const OaksLabRivalWhatAboutMeText,         TEXT_OAKSLAB_RIVAL_WHAT_ABOUT_ME
	dw_const OaksLabOakBePatientText,             TEXT_OAKSLAB_OAK_BE_PATIENT
	dw_const OaksLabRivalGrampsText,              TEXT_OAKSLAB_RIVAL_GRAMPS
	dw_const OaksLabRivalWhatDidYouCallMeForText, TEXT_OAKSLAB_RIVAL_WHAT_DID_YOU_CALL_ME_FOR
	dw_const OaksLabOakIHaveARequestText,         TEXT_OAKSLAB_OAK_I_HAVE_A_REQUEST
	dw_const OaksLabOakMyInventionPokedexText,    TEXT_OAKSLAB_OAK_MY_INVENTION_POKEDEX
	dw_const OaksLabOakGotPokedexText,            TEXT_OAKSLAB_OAK_GOT_POKEDEX
	dw_const OaksLabOakThatWasMyDreamText,        TEXT_OAKSLAB_OAK_THAT_WAS_MY_DREAM
	dw_const OaksLabRivalLeaveItAllToMeText,      TEXT_OAKSLAB_RIVAL_LEAVE_IT_ALL_TO_ME
	dw_const OaksLabRivalBackToIndigoText,        TEXT_OAKSLAB_RIVAL_BACK_TO_INDIGO ; marcelnote - postgame Rival event

OaksLabRivalText: ; marcelnote - optimized and added postgame dialogue
	text_asm
	CheckEvent EVENT_BECAME_CHAMPION
	ld hl, .ShowingDexText ; marcelnote - postgame Rival event
	ret nz
	CheckEvent EVENT_OAK_APPEARED_IN_PALLET ; marcelnote - harmonized events
	ld hl, .GrampsIsntAroundText
	ret z
	CheckEvent EVENT_GOT_STARTER
	ld hl, .GoAheadAndChooseText
	ret z
	ld hl, .MyPokemonLooksStrongerText
	ret

.ShowingDexText: ; marcelnote - postgame Rival event
	text_far _OaksLabRivalShowingDexText
	text_asm
	call Delay3
	ld e, 0
	CheckEvent EVENT_BEAT_MOLTRES, 1
	rl e
	CheckEvent EVENT_BEAT_ZAPDOS, 1
	rl e
	CheckEvent EVENT_BEAT_ARTICUNO, 1
	rl e
	ld a, e
	rl e
	cp %111
	jr nz, .loadBirdText
	ld a, SCRIPT_OAKSLAB_RIVAL_BACK_TO_INDIGO
	ld [wOaksLabCurScript], a
.loadBirdText
	ld hl, .BirdTextPointers
	ld d, 0
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintText
	rst TextScriptEnd

.BirdTextPointers:
	dw .SeenNoBirdText
	dw .SeenArticunoText
	dw .SeenZapdosText
	dw .SeenArticunoZapdosText
	dw .SeenMoltresText
	dw .SeenArticunoMoltresText
	dw .SeenZapdosMoltresText
	dw .SeenAllBirdsText

.GrampsIsntAroundText:
	text_far _OaksLabRivalGrampsIsntAroundText
	text_end

.GoAheadAndChooseText:
	text_far _OaksLabRivalGoAheadAndChooseText
	text_end

.MyPokemonLooksStrongerText:
	text_far _OaksLabRivalMyPokemonLooksStrongerText
	text_end

.SeenNoBirdText: ; marcelnote - postgame Rival event
	text_far _OaksLabRivalSeenNoBirdText
	text_end

.SeenArticunoText: ; marcelnote - postgame Rival event
	text_far _OaksLabRivalSeenArticunoText
	text_end

.SeenZapdosText: ; marcelnote - postgame Rival event
	text_far _OaksLabRivalSeenZapdosText
	text_end

.SeenMoltresText: ; marcelnote - postgame Rival event
	text_far _OaksLabRivalSeenMoltresText
	text_end

.SeenArticunoZapdosText: ; marcelnote - postgame Rival event
	text_far _OaksLabRivalSeenArticunoZapdosText
	text_end

.SeenArticunoMoltresText: ; marcelnote - postgame Rival event
	text_far _OaksLabRivalSeenArticunoMoltresText
	text_end

.SeenZapdosMoltresText: ; marcelnote - postgame Rival event
	text_far _OaksLabRivalSeenZapdosMoltresText
	text_end

.SeenAllBirdsText: ; marcelnote - postgame Rival event
	text_far _OaksLabRivalSeenAllBirdsText
	sound_get_item_1
	text_end

OaksLabRivalBackToIndigoText: ; marcelnote - postgame Rival event
	text_far _OaksLabRivalBackToIndigoText
	text_end

OaksLabCharmanderPokeBallText:
	text_asm
	lb hl, STARTER1, OAKSLAB_STARTER_BALL_1
	lb de, STARTER2, OAKSLAB_STARTER_BALL_2
	jr OaksLabSelectedPokeBallScript

OaksLabSquirtlePokeBallText:
	text_asm
	lb hl, STARTER2, OAKSLAB_STARTER_BALL_2
	lb de, STARTER3, OAKSLAB_STARTER_BALL_3
	jr OaksLabSelectedPokeBallScript

OaksLabBulbasaurPokeBallText:
	text_asm
	lb hl, STARTER3, OAKSLAB_STARTER_BALL_3
	lb de, STARTER1, OAKSLAB_STARTER_BALL_1
	; fallthrough

OaksLabSelectedPokeBallScript:
	ld a, h
	ld [wCurPartySpecies], a
	ld [wPokedexNum], a
	ld a, l
	ld [wSpriteIndex], a
	ld hl, wRivalStarterTemp
	ASSERT wRivalStarterTemp + 1 == wRivalStarterBallSpriteIndex
	ld a, d
	ld [hli], a
	ld [hl], e
	CheckEvent EVENT_GOT_STARTER
	jp nz, OaksLabLastMonScript
	CheckEventReuseA EVENT_OAK_ASKED_TO_CHOOSE_MON
	jr nz, OaksLabShowPokeBallPokemonScript
	ld hl, OaksLabThoseArePokeBallsText
	ret

OaksLabThoseArePokeBallsText:
	text_far _OaksLabThoseArePokeBallsText
	text_end

OaksLabShowPokeBallPokemonScript:
	ld a, OAKSLAB_OAK
	ldh [hSpriteIndex], a
	ld a, SPRITESTATEDATA1_FACINGDIRECTION
	ldh [hSpriteDataOffset], a
	call GetPointerWithinSpriteStateData1
	ld [hl], SPRITE_FACING_DOWN
	ld a, OAKSLAB_RIVAL
	ldh [hSpriteIndex], a
	ld a, SPRITESTATEDATA1_FACINGDIRECTION
	ldh [hSpriteDataOffset], a
	call GetPointerWithinSpriteStateData1
	ld [hl], SPRITE_FACING_RIGHT
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl]
	predef StarterDex
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	call ReloadMapData
	ld c, 10
	call DelayFrames
	ld a, [wSpriteIndex]
	cp OAKSLAB_STARTER_BALL_1
	ld hl, OaksLabYouWantCharmanderText
	jr z, .MonChoiceMenu
	cp OAKSLAB_STARTER_BALL_2
	ld hl, OaksLabYouWantSquirtleText
	jr z, .MonChoiceMenu
	ld hl, OaksLabYouWantBulbasaurText
.MonChoiceMenu
	call PrintText
	ld a, 1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	call YesNoChoice ; yes/no menu
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .done
	ld a, [wCurPartySpecies]
	ld [wPlayerStarter], a
	ld [wNamedObjectIndex], a
	call GetMonName
	ld a, [wSpriteIndex]
	add TOGGLE_STARTER_BALL_1 - OAKSLAB_STARTER_BALL_1
	ld [wToggleableObjectIndex], a
	predef HideObject
	ld a, 1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, OaksLabMonEnergeticText
	call PrintText
	ld hl, OaksLabReceivedMonText
	call PrintText
	xor a ; PLAYER_PARTY_DATA
	ld [wMonDataLocation], a
	ld a, 5
	ld [wCurEnemyLevel], a
	ld a, [wCurPartySpecies]
	ld [wPokedexNum], a
	call AddPartyMon
	SetEvent EVENT_GOT_STARTER
	ld a, 1 ; marcelnote - dynamic SGB border, add starter sticker during the next map transition
	ld [wReloadSGBBorder], a
	ld a, PAD_SELECT | PAD_START | PAD_CTRL_PAD
	ld [wJoyIgnore], a
	ld a, SCRIPT_OAKSLAB_CHOSE_STARTER_SCRIPT
	ld [wOaksLabCurScript], a
.done
	rst TextScriptEnd

OaksLabYouWantBulbasaurText:
	text_far _OaksLabYouWantBulbasaurText
	text_end

OaksLabYouWantCharmanderText:
	text_far _OaksLabYouWantCharmanderText
	text_end

OaksLabYouWantSquirtleText:
	text_far _OaksLabYouWantSquirtleText
	text_end

OaksLabMonEnergeticText:
	text_far _OaksLabMonEnergeticText
	text_end

OaksLabReceivedMonText:
	text_far _OaksLabReceivedMonText
	sound_get_key_item
	text_end

OaksLabLastMonScript:
	ld a, OAKSLAB_OAK
	ldh [hSpriteIndex], a
	ld a, SPRITESTATEDATA1_FACINGDIRECTION
	ldh [hSpriteDataOffset], a
	call GetPointerWithinSpriteStateData1 ; preserves bc
	ld [hl], SPRITE_FACING_DOWN
	ld hl, OaksLabLastMonText
	ret

OaksLabLastMonText:
	text_far _OaksLabLastMonText
	text_end

OaksLabOakText: ; marcelnote - this was changed to make Balls more accessible
	text_asm
	CheckEvent EVENT_PALLET_AFTER_GETTING_POKEBALLS
	ld hl, .HowIsYourPokedexComingText
	ret nz ; got Poke Balls on a previous visit
	CheckEvent EVENT_GOT_POKEDEX
	jr nz, .gotPokedex
	CheckEvent EVENT_BATTLED_RIVAL_IN_OAKS_LAB
	jr nz, .checkGotParcel
	CheckEvent EVENT_GOT_STARTER
	ld hl, .YourPokemonCanFightText
	ret nz ; already got Pokemon
	ld hl, .WhichPokemonDoYouWantText
	ret

.checkGotParcel
	ld b, OAKS_PARCEL
	call IsItemInBag
	bccoord 1, 14 ; restore text destination
	ld hl, .DeliverParcelText
	ret nz ; got parcel
	ld hl, .RaiseYourYoungPokemonText
	ret

.gotPokedex
	CheckEvent EVENT_PALLET_AFTER_GETTING_POKEDEX
	ld hl, .PokemonAroundTheWorldText
	ret z ; just got Pokedex
	CheckAndSetEvent EVENT_GOT_POKEBALLS_FROM_OAK ; set whether actually given or not
	jr nz, .justGotPokeballs
	ld hl, wPokedexOwned
	ld b, wPokedexOwnedEnd - wPokedexOwned
	call CountSetBits ; marcelnote - returns count in a
	cp 2
	jr c, .givePokeBalls ; if only 1 Mon caught
	bccoord 1, 14 ; restore text destination
.justGotPokeballs
	ld hl, .ComeSeeMeSometimesText
	ret
.givePokeBalls
	lb bc, POKE_BALL, 5
	call GiveItem
	ld hl, .GivePokeballsText
	bccoord 1, 14 ; restore text destination
	ret

.WhichPokemonDoYouWantText:
	text_far _OaksLabOakWhichPokemonDoYouWantText
	text_end

.YourPokemonCanFightText:
	text_far _OaksLabOakYourPokemonCanFightText
	text_end

.RaiseYourYoungPokemonText:
	text_far _OaksLabOakRaiseYourYoungPokemonText
	text_end

.DeliverParcelText:
	text_far _OaksLabOakDeliverParcelText
	sound_get_key_item
	text_far _OaksLabOakParcelThanksText
	text_asm
	ld a, OAKS_PARCEL
	ldh [hItemToRemoveID], a
	callfar RemoveItemByID ; marcelnote - this replaces a dedicated script previously
	ld a, SCRIPT_OAKSLAB_RIVAL_ARRIVES_AT_OAKS_REQUEST
	ld [wOaksLabCurScript], a
	rst TextScriptEnd

.PokemonAroundTheWorldText:
	text_far _OaksLabOakPokemonAroundTheWorldText
	text_end

.GivePokeballsText:
	text_far _OaksLabOakReceivedPokeballsText
	sound_get_key_item
	text_far _OaksLabGivePokeballsExplanationText
	text_end

.ComeSeeMeSometimesText:
	text_far _OaksLabOakComeSeeMeSometimesText
	text_end

.HowIsYourPokedexComingText:
	text_far _OaksLabOakHowIsYourPokedexComingText
	text_asm
	ld a, 1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	predef DisplayDexRating
	rst TextScriptEnd

OaksLabPokedexText:
	text_far _OaksLabPokedexText
	text_end

OaksLabOakWalkingText:
	text_far _OaksLabOakWalkingText
	text_end

OaksLabGirlText:
	text_far _OaksLabGirlText
	text_end

OaksLabRivalFedUpWithWaitingText:
	text_far _OaksLabRivalFedUpWithWaitingText
	text_end

OaksLabOakChooseMonText:
	text_far _OaksLabOakChooseMonText
	text_end

OaksLabRivalWhatAboutMeText:
	text_far _OaksLabRivalWhatAboutMeText
	text_end

OaksLabOakBePatientText:
	text_far _OaksLabOakBePatientText
	text_end

OaksLabOakDontGoAwayYetText:
	text_far _OaksLabOakDontGoAwayYetText
	text_end

OaksLabRivalIllTakeThisOneText:
	text_far _OaksLabRivalIllTakeThisOneText
	text_end

OaksLabRivalReceivedMonText:
	text_far _OaksLabRivalReceivedMonText
	sound_get_key_item
	text_end

OaksLabRivalIllTakeYouOnText:
	text_far _OaksLabRivalIllTakeYouOnText
	text_end

OaksLabRivalIPickedTheWrongPokemonText:
	text_far _OaksLabRivalIPickedTheWrongPokemonText
	text_end

OaksLabRivalAmIGreatOrWhatText:
	text_far _OaksLabRivalAmIGreatOrWhatText
	text_end

OaksLabRivalSmellYouLaterText:
	text_far _OaksLabRivalSmellYouLaterText
	text_end

OaksLabRivalGrampsText:
	text_far _OaksLabRivalGrampsText
	text_end

OaksLabRivalWhatDidYouCallMeForText:
	text_far _OaksLabRivalWhatDidYouCallMeForText
	text_end

OaksLabOakIHaveARequestText:
	text_far _OaksLabOakIHaveARequestText
	text_end

OaksLabOakMyInventionPokedexText:
	text_far _OaksLabOakMyInventionPokedexText
	text_end

OaksLabOakGotPokedexText:
	text_far _OaksLabOakGotPokedexText
	sound_get_key_item
	text_end

OaksLabOakThatWasMyDreamText:
	text_far _OaksLabOakThatWasMyDreamText
	text_end

OaksLabRivalLeaveItAllToMeText:
	text_far _OaksLabRivalLeaveItAllToMeText
	text_end

OaksLabScientistText:
	text_asm
	CheckHideShowCont TOGGLE_ROUTE_1_OAK
	ld hl, .Text
	ret nz
	ld hl, .OakWentForWalkText ; marcelnote - new for Oak battle
	ret

.Text:
	text_far _OaksLabScientistText
	text_end

.OakWentForWalkText:
	text_far _OaksLabScientistOakWentForWalkText
	text_end
