OaksLab_Script:
	;CheckEvent EVENT_PALLET_AFTER_GETTING_POKEBALLS
	;call nz, OaksLabLoadTextPointers2Script ; marcelnote - useless?
	call DisableAutoTextBoxDrawing ; marcelnote - replaces code which did DisableAutoTextBoxDrawing
	ld hl, OaksLab_ScriptPointers
	ld a, [wOaksLabCurScript]
	jp CallFunctionInTable

OaksLab_ScriptPointers:
	def_script_pointers
	dw_const OaksLabDefaultScript,                   SCRIPT_OAKSLAB_DEFAULT
	dw_const OaksLabOakEntersLabScript,              SCRIPT_OAKSLAB_OAK_ENTERS_LAB
	dw_const OaksLabHideShowOaksScript,              SCRIPT_OAKSLAB_HIDE_SHOW_OAKS
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
	ld a, HS_OAKS_LAB_OAK_WALKING
	ld [wMissableObjectIndex], a
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

	ld a, SCRIPT_OAKSLAB_HIDE_SHOW_OAKS
	ld [wOaksLabCurScript], a
	ret

OakEntryMovement:
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db -1 ; end

OaksLabHideShowOaksScript:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	ld a, HS_OAKS_LAB_OAK_WALKING
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, HS_OAKS_LAB_OAK
	ld [wMissableObjectIndex], a
	predef ShowObject

	ld a, SCRIPT_OAKSLAB_PLAYER_ENTERS_LAB
	ld [wOaksLabCurScript], a
	ret

OaksLabPlayerEntersLabScript:
	call Delay3
	ld hl, wSimulatedJoypadStatesEnd
	ld de, PlayerEntryMovementRLE
	call DecodeRLEList
	dec a
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
	db D_UP, 8
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
	ld a, SELECT | START | D_RIGHT | D_LEFT | D_UP | D_DOWN
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
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	ld a, D_UP
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
	ld de, .MiddleBallMovement1
	ld a, [wYCoord]
	cp 4 ; is the player standing below the table?
	jr z, .moveBlue
	ld de, .MiddleBallMovement2
	jr .moveBlue

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
	ld de, .RightBallMovement1
	ld a, [wYCoord]
	cp 4 ; is the player standing below the table?
	jr z, .moveBlue
	ld de, .RightBallMovement2
	jr .moveBlue

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
	ld de, .LeftBallMovement1
	ld a, [wXCoord]
	cp 9 ; is the player standing to the right of the table?
	jr nz, .moveBlue
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
	jr .moveBlue

.LeftBallMovement1
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_RIGHT
.LeftBallMovement2
	db NPC_MOVEMENT_RIGHT
	db -1 ; end

.moveBlue
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
	ld a, SELECT | START | D_RIGHT | D_LEFT | D_UP | D_DOWN
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
	cp OAKSLAB_CHARMANDER_POKE_BALL
	jr nz, .not_charmander
	ld a, HS_STARTER_BALL_1
	jr .hideBallAndContinue
.not_charmander
	cp OAKSLAB_SQUIRTLE_POKE_BALL
	jr nz, .not_squirtle
	ld a, HS_STARTER_BALL_2
	jr .hideBallAndContinue
.not_squirtle
	ld a, HS_STARTER_BALL_3
.hideBallAndContinue
	ld [wMissableObjectIndex], a
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
	SetEvent EVENT_GOT_STARTER
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
	ld c, BANK(Music_MeetRival)
	ld a, MUSIC_MEET_RIVAL
	call PlayMusic
	ld a, TEXT_OAKSLAB_RIVAL_ILL_TAKE_YOU_ON
	ldh [hTextID], a
	call DisplayTextID
	ld a, $1
	ldh [hNPCPlayerRelativePosPerspective], a
	ld a, $1
	swap a
	ldh [hNPCSpriteOffset], a
	predef CalcPositionOfPlayerRelativeToNPC
	ldh a, [hNPCPlayerYDistance]
	dec a
	ldh [hNPCPlayerYDistance], a
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
	ld b, $1 ; squirtle team ; marcelnote - optimized team choice code by using register b
	cp STARTER2 ; squirtle
	jr z, .got_team
	inc b ; b=2, bulbasaur team
	cp STARTER3 ; bulbasaur
	jr z, .got_team
	inc b ; b=3, charmander team
.got_team
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
	ld a, D_RIGHT | D_LEFT | D_UP | D_DOWN
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
	farcall Music_RivalAlternateStart
	ld a, OAKSLAB_RIVAL
	ldh [hSpriteIndex], a
	ld de, .RivalExitMovement
	call MoveSprite
	ld a, [wXCoord]
	cp 4
	; move left or right depending on where the player is standing
	jr nz, .moveLeft
	ld a, NPC_MOVEMENT_RIGHT
	jr .next
.moveLeft
	ld a, NPC_MOVEMENT_LEFT
.next
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
	ld a, HS_OAKS_LAB_RIVAL
	ld [wMissableObjectIndex], a
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
	jr nz, .turnPlayerLeft
	ld a, SPRITE_FACING_RIGHT
	ld [wSpritePlayerStateData1FacingDirection], a
	ret
.turnPlayerLeft
	ld a, SPRITE_FACING_LEFT
	ld [wSpritePlayerStateData1FacingDirection], a
	ret
.turnPlayerDown
	cp $4
	ret nz
	xor a ; ld a, SPRITE_FACING_DOWN
	ld [wSpritePlayerStateData1FacingDirection], a
	ret

OaksLabRivalArrivesAtOaksRequestScript:
	xor a
	ldh [hJoyHeld], a
	call EnableAutoTextBoxDrawing
	ld a, SFX_STOP_ALL_MUSIC
	ld [wNewSoundID], a
	call PlaySound
	farcall Music_RivalAlternateStart
	ld a, TEXT_OAKSLAB_RIVAL_GRAMPS
	ldh [hTextID], a
	call DisplayTextID
	call OaksLabCalcRivalMovementScript
	ld a, HS_OAKS_LAB_RIVAL
	ld [wMissableObjectIndex], a
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
	call EnableAutoTextBoxDrawing
	call PlayDefaultMusic
	ld a, SELECT | START | D_RIGHT | D_LEFT | D_UP | D_DOWN
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
	ld a, HS_POKEDEX_1
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, HS_POKEDEX_2
	ld [wMissableObjectIndex], a
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
	ld a, HS_LYING_OLD_MAN
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, HS_OLD_MAN
	ld [wMissableObjectIndex], a
	predef ShowObject
	ld a, [wSavedNPCMovementDirections2Index]
	ld b, 0
	ld c, a
	ld hl, wNPCMovementDirections2
	xor a ; NPC_MOVEMENT_DOWN
	call FillMemory
	ld [hl], $ff
	ld a, SFX_STOP_ALL_MUSIC
	ld [wNewSoundID], a
	call PlaySound
	farcall Music_RivalAlternateStart
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
	ld a, HS_OAKS_LAB_RIVAL
	ld [wMissableObjectIndex], a
	predef HideObject
	SetEvent EVENT_1ST_ROUTE22_RIVAL_BATTLE
	ResetEventReuseHL EVENT_2ND_ROUTE22_RIVAL_BATTLE
	SetEventReuseHL EVENT_ROUTE22_RIVAL_WANTS_BATTLE
	ld a, HS_ROUTE_22_RIVAL_1
	ld [wMissableObjectIndex], a
	predef ShowObject
	ld a, SCRIPT_PALLETTOWN_DAISY
	ld [wPalletTownCurScript], a
	xor a
	ld [wJoyIgnore], a

	ld a, SCRIPT_OAKSLAB_NOOP
	ld [wOaksLabCurScript], a
	ret

OaksLabScript_RemoveParcel:
	ld hl, wBagItems
	ld bc, 0
.loop
	ld a, [hli]
	cp $ff
	ret z
	cp OAKS_PARCEL
	jr z, .foundParcel
	inc hl
	inc c
	jr .loop
.foundParcel
	ld hl, wNumBagItems
	ld a, c
	ld [wWhichPokemon], a
	ld a, 1
	ld [wItemQuantity], a
	jp RemoveItemFromInventory

OaksLabCalcRivalMovementScript:
	ld a, $7c
	ldh [hSpriteScreenYCoord], a
	ld a, 8
	ldh [hSpriteMapXCoord], a
	ld a, [wYCoord]
	cp 3
	jr nz, .not_below_oak
	ld a, $4
	ld [wNPCMovementDirections2Index], a
	ld a, $30
	ld b, 11
	jr .done
.not_below_oak
	cp 1
	jr nz, .not_above_oak
	ld a, $2
	ld [wNPCMovementDirections2Index], a
	ld a, $30
	ld b, 9
	jr .done
.not_above_oak
	ld a, $3
	ld [wNPCMovementDirections2Index], a
	ld b, 10
	ld a, [wXCoord]
	cp 4
	jr nz, .not_left_of_oak
	ld a, $40
	jr .done
.not_left_of_oak
	ld a, $20
.done
	ldh [hSpriteScreenXCoord], a
	ld a, b
	ldh [hSpriteMapYCoord], a
	ld a, OAKSLAB_RIVAL
	ld [wSpriteIndex], a
	call SetSpritePosition1
	ret

;OaksLabLoadTextPointers2Script:
;	ld hl, OaksLab_TextPointers2
;	ld a, l
;	ld [wCurMapTextPtr], a
;	ld a, h
;	ld [wCurMapTextPtr + 1], a
;	ret

OaksLabRivalBackToIndigoScript: ; marcelnote - postgame Rival event
	call EnableAutoTextBoxDrawing
	ld a, TEXT_OAKSLAB_RIVAL_BACK_TO_INDIGO
	ldh [hTextID], a
	call DisplayTextID
	call Delay3
	ld a, SFX_STOP_ALL_MUSIC
	ld [wNewSoundID], a
	call PlaySound
	farcall Music_RivalAlternateStart
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
	ld a, HS_OAKS_LAB_RIVAL
	ld [wMissableObjectIndex], a
	predef HideObject
	SetEvent EVENT_POSTGAME_RIVAL
	CheckBothEventsSet EVENT_POSTGAME_LORELEI, EVENT_POSTGAME_BRUNO ; sets Z flag when events are set
	jr nz, .end
	CheckBothEventsSet EVENT_POSTGAME_AGATHA, EVENT_POSTGAME_LANCE
	jr nz, .end
	ld a, HS_INDIGO_PLATEAU_LOBBY_GIRL1 ; marcelnote - remove girl from E4 entrance
	ld [wMissableObjectIndex], a
	predef ShowObjectCont
	ld a, HS_INDIGO_PLATEAU_LOBBY_GIRL2 ; marcelnote - remove girl from E4 entrance
	ld [wMissableObjectIndex], a
	predef HideObjectCont
	ld a, HS_INDIGO_PLATEAU_LOBBY_RIVAL ; marcelnote - show Rival
	ld [wMissableObjectIndex], a
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

;OaksLab_TextPointers2: ; marcelnote - useless?
;	dw OaksLabRivalText
;	dw OaksLabCharmanderPokeBallText
;	dw OaksLabSquirtlePokeBallText
;	dw OaksLabBulbasaurPokeBallText
;	dw OaksLabOak1Text
;	dw OaksLabPokedexText
;	dw OaksLabPokedexText
;	dw OaksLabOak2Text
;	dw OaksLabGirlText
;	dw OaksLabScientistText
;	dw OaksLabScientistText

OaksLabRivalText: ; marcelnote - optimized and added postgame dialogue
	text_asm
	;;;;;; marcelnote - postgame Rival event
	CheckEvent EVENT_BECAME_CHAMPION
	jr nz, .postgameDialogue
	;;;;;;
	ld hl, .GrampsIsntAroundText
	CheckEvent EVENT_OAK_APPEARED_IN_PALLET ; marcelnote - harmonized events
	jr z, .got_text
	ld hl, .GoAheadAndChooseText
	CheckEvent EVENT_GOT_STARTER
	jr z, .got_text
	ld hl, .MyPokemonLooksStrongerText

.got_text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.postgameDialogue ; marcelnote - postgame Rival event
	xor a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, .ShowingDexText
	call PrintText
	call Delay3
	CheckEvent EVENT_BEAT_ARTICUNO
	jr z, .NoArticuno
	CheckEvent EVENT_BEAT_ZAPDOS
	jr z, .YesArticunoNoZapdos
	CheckEvent EVENT_BEAT_MOLTRES
	jr nz, .YesArticunoYesZapdosYesMoltres
	ld hl, .SeenArticunoZapdosText
	jr z, .got_text
.NoArticuno
	CheckEvent EVENT_BEAT_ZAPDOS
	jr z, .NoArticunoNoZapdos
	CheckEvent EVENT_BEAT_MOLTRES
	jr z, .NoArticunoYesZapdosNoMoltres
	ld hl, .SeenZapdosMoltresText
	jr z, .got_text
.NoArticunoNoZapdos
	CheckEvent EVENT_BEAT_MOLTRES
	jr z, .NoArticunoNoZapdosNoMoltres
	ld hl, .SeenMoltresText
	jr z, .got_text
.NoArticunoNoZapdosNoMoltres
	ld hl, .SeenNoBirdText
	jr z, .got_text
.YesArticunoNoZapdos
	CheckEvent EVENT_BEAT_MOLTRES
	jr z, .YesArticunoNoZapdosNoMoltres
	ld hl, .SeenArticunoMoltresText
	jr z, .got_text
.YesArticunoNoZapdosNoMoltres
	ld hl, .SeenArticunoText
	jr z, .got_text
.NoArticunoYesZapdosNoMoltres
	ld hl, .SeenZapdosText
	jr z, .got_text
.YesArticunoYesZapdosYesMoltres
	ld a, SCRIPT_OAKSLAB_RIVAL_BACK_TO_INDIGO
	ld [wOaksLabCurScript], a
	ld hl, .SeenAllBirdsText
	jr .got_text

.GrampsIsntAroundText:
	text_far _OaksLabRivalGrampsIsntAroundText
	text_end

.GoAheadAndChooseText:
	text_far _OaksLabRivalGoAheadAndChooseText
	text_end

.MyPokemonLooksStrongerText:
	text_far _OaksLabRivalMyPokemonLooksStrongerText
	text_end

.ShowingDexText: ; marcelnote - postgame Rival event
	text_far _OaksLabRivalShowingDexText
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
	ld a, STARTER2
	ld [wRivalStarterTemp], a
	ld a, OAKSLAB_SQUIRTLE_POKE_BALL
	ld [wRivalStarterBallSpriteIndex], a
	ld a, STARTER1
	ld b, OAKSLAB_CHARMANDER_POKE_BALL
	jr OaksLabSelectedPokeBallScript

OaksLabSquirtlePokeBallText:
	text_asm
	ld a, STARTER3
	ld [wRivalStarterTemp], a
	ld a, OAKSLAB_BULBASAUR_POKE_BALL
	ld [wRivalStarterBallSpriteIndex], a
	ld a, STARTER2
	ld b, OAKSLAB_SQUIRTLE_POKE_BALL
	jr OaksLabSelectedPokeBallScript

OaksLabBulbasaurPokeBallText:
	text_asm
	ld a, STARTER1
	ld [wRivalStarterTemp], a
	ld a, OAKSLAB_CHARMANDER_POKE_BALL
	ld [wRivalStarterBallSpriteIndex], a
	ld a, STARTER3
	ld b, OAKSLAB_BULBASAUR_POKE_BALL

OaksLabSelectedPokeBallScript:
	ld [wCurPartySpecies], a
	ld [wPokedexNum], a
	ld a, b
	ld [wSpriteIndex], a
	CheckEvent EVENT_GOT_STARTER
	jp nz, OaksLabLastMonScript
	CheckEventReuseA EVENT_OAK_ASKED_TO_CHOOSE_MON
	jr nz, OaksLabShowPokeBallPokemonScript
	ld hl, OaksLabThoseArePokeBallsText
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

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
	cp OAKSLAB_CHARMANDER_POKE_BALL
	jr z, OaksLabYouWantCharmanderText
	cp OAKSLAB_SQUIRTLE_POKE_BALL
	jr z, OaksLabYouWantSquirtleText
	jr OaksLabYouWantBulbasaurText

OaksLabYouWantCharmanderText:
	ld hl, .Text
	jr OaksLabMonChoiceMenu
.Text:
	text_far _OaksLabYouWantCharmanderText
	text_end

OaksLabYouWantSquirtleText:
	ld hl, .Text
	jr OaksLabMonChoiceMenu
.Text:
	text_far _OaksLabYouWantSquirtleText
	text_end

OaksLabYouWantBulbasaurText:
	ld hl, .Text
	jr OaksLabMonChoiceMenu
.Text:
	text_far _OaksLabYouWantBulbasaurText
	text_end

OaksLabMonChoiceMenu:
	call PrintText
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	call YesNoChoice ; yes/no menu
	ld a, [wCurrentMenuItem]
	and a
	jr nz, OaksLabMonChoiceEnd
	ld a, [wCurPartySpecies]
	ld [wPlayerStarter], a
	ld [wNamedObjectIndex], a
	call GetMonName
	ld a, [wSpriteIndex]
	cp OAKSLAB_CHARMANDER_POKE_BALL
	jr nz, .not_charmander
	ld a, HS_STARTER_BALL_1
	jr .continue
.not_charmander
	cp OAKSLAB_SQUIRTLE_POKE_BALL
	jr nz, .not_squirtle
	ld a, HS_STARTER_BALL_2
	jr .continue
.not_squirtle
	ld a, HS_STARTER_BALL_3
.continue
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, $1
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
	ld hl, wStatusFlags4
	set BIT_GOT_STARTER, [hl]
	ld a, SELECT | START | D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoyIgnore], a
	ld a, SCRIPT_OAKSLAB_CHOSE_STARTER_SCRIPT
	ld [wOaksLabCurScript], a
OaksLabMonChoiceEnd:
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

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
	call GetPointerWithinSpriteStateData1
	ld [hl], SPRITE_FACING_DOWN
	ld hl, OaksLabLastMonText
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

OaksLabLastMonText:
	text_far _OaksLabLastMonText
	text_end

OaksLabOakText: ; marcelnote - this was changed to make Balls more accessible
	text_asm
	CheckEvent EVENT_PALLET_AFTER_GETTING_POKEBALLS
	jr z, .didnt_get_or_just_got_poke_balls
	ld hl, .HowIsYourPokedexComingText
	call PrintText
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	predef DisplayDexRating
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.didnt_get_or_just_got_poke_balls
	CheckEvent EVENT_GOT_POKEDEX
	jr nz, .got_pokedex
	CheckEvent EVENT_BATTLED_RIVAL_IN_OAKS_LAB
	jr nz, .check_got_parcel
	ld a, [wStatusFlags4]
	bit BIT_GOT_STARTER, a
	jr nz, .already_got_pokemon
	ld hl, .WhichPokemonDoYouWantText
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd
.already_got_pokemon
	ld hl, .YourPokemonCanFightText
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd
.check_got_parcel
	ld b, OAKS_PARCEL
	call IsItemInBag
	jr nz, .got_parcel
	ld hl, .RaiseYourYoungPokemonText
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd
.got_parcel
	ld hl, .DeliverParcelText
	call PrintText
	call OaksLabScript_RemoveParcel
	ld a, SCRIPT_OAKSLAB_RIVAL_ARRIVES_AT_OAKS_REQUEST
	ld [wOaksLabCurScript], a
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.got_pokedex
	CheckEvent EVENT_PALLET_AFTER_GETTING_POKEDEX
	jr z, .just_got_pokedex
	CheckAndSetEvent EVENT_GOT_POKEBALLS_FROM_OAK ; set whether actually given or not
	jr nz, .just_got_pokeballs
	ld hl, wPokedexOwned
	ld b, wPokedexOwnedEnd - wPokedexOwned
	call CountSetBits
	ld a, [wNumSetBits]
	cp 2
	jr c, .give_poke_balls ; if only 1 Mon caught
	; fallthrough
.just_got_pokeballs
	ld hl, .ComeSeeMeSometimesText
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd
.just_got_pokedex
	ld hl, .PokemonAroundTheWorldText
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd
.give_poke_balls
	lb bc, POKE_BALL, 5
	call GiveItem
	ld hl, .GivePokeballsText
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

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
	text_end

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
	text_end

OaksLabPokedexText: ; marcelnote - text_asm to work around DisableAutoTextBoxDrawing
	text_asm
	ld hl, .Text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.Text:
	text_far _OaksLabPokedexText
	text_end

OaksLabOakWalkingText:
	text_far _OaksLabOakWalkingText
	text_end

OaksLabGirlText: ; marcelnote - text_asm to work around DisableAutoTextBoxDrawing
	text_asm
	ld hl, .Text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.Text:
	text_far _OaksLabGirlText
	text_end

OaksLabRivalFedUpWithWaitingText: ; marcelnote - text_asm to work around DisableAutoTextBoxDrawing
	text_asm
	ld hl, .Text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.Text:
	text_far _OaksLabRivalFedUpWithWaitingText
	text_end

OaksLabOakChooseMonText: ; marcelnote - text_asm to work around DisableAutoTextBoxDrawing
	text_asm
	ld hl, .Text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.Text:
	text_far _OaksLabOakChooseMonText
	text_end

OaksLabRivalWhatAboutMeText: ; marcelnote - text_asm to work around DisableAutoTextBoxDrawing
	text_asm
	ld hl, .Text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.Text:
	text_far _OaksLabRivalWhatAboutMeText
	text_end

OaksLabOakBePatientText: ; marcelnote - text_asm to work around DisableAutoTextBoxDrawing
	text_asm
	ld hl, .Text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.Text:
	text_far _OaksLabOakBePatientText
	text_end

OaksLabOakDontGoAwayYetText: ; marcelnote - text_asm to work around DisableAutoTextBoxDrawing
	text_asm
	ld hl, .Text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.Text:
	text_far _OaksLabOakDontGoAwayYetText
	text_end

OaksLabRivalIllTakeThisOneText: ; marcelnote - text_asm to work around DisableAutoTextBoxDrawing
	text_asm
	ld hl, .Text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.Text:
	text_far _OaksLabRivalIllTakeThisOneText
	text_end

OaksLabRivalReceivedMonText: ; marcelnote - text_asm to work around DisableAutoTextBoxDrawing
	text_asm
	ld hl, .Text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.Text:
	text_far _OaksLabRivalReceivedMonText
	sound_get_key_item
	text_end

OaksLabRivalIllTakeYouOnText: ; marcelnote - text_asm to work around DisableAutoTextBoxDrawing
	text_asm
	ld hl, .Text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.Text:
	text_far _OaksLabRivalIllTakeYouOnText
	text_end

OaksLabRivalIPickedTheWrongPokemonText:
	text_far _OaksLabRivalIPickedTheWrongPokemonText
	text_end

OaksLabRivalAmIGreatOrWhatText:
	text_far _OaksLabRivalAmIGreatOrWhatText
	text_end

OaksLabRivalSmellYouLaterText: ; marcelnote - text_asm to work around DisableAutoTextBoxDrawing
	text_asm
	ld hl, .Text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.Text:
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

OaksLabScientistText: ; marcelnote - text_asm to work around DisableAutoTextBoxDrawing
	text_asm
	ld hl, .Text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.Text:
	text_far _OaksLabScientistText
	text_end
