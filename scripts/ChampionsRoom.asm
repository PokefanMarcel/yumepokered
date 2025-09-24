ChampionsRoom_Script:
	call EnableAutoTextBoxDrawing
	ld hl, ChampionsRoom_ScriptPointers
	ld a, [wChampionsRoomCurScript]
	jp CallFunctionInTable

ResetRivalScript:
	xor a ; SCRIPT_CHAMPIONSROOM_DEFAULT
	ld [wJoyIgnore], a
	ld [wChampionsRoomCurScript], a
	ret

ChampionsRoom_ScriptPointers:
	def_script_pointers
	dw_const DoRet,                                       SCRIPT_CHAMPIONSROOM_DEFAULT ; PureRGB - DoRet
	dw_const ChampionsRoomPlayerEntersScript,             SCRIPT_CHAMPIONSROOM_PLAYER_ENTERS
	dw_const ChampionsRoomRivalReadyToBattleScript,       SCRIPT_CHAMPIONSROOM_RIVAL_READY_TO_BATTLE
	dw_const ChampionsRoomRivalDefeatedScript,            SCRIPT_CHAMPIONSROOM_RIVAL_DEFEATED
	dw_const ChampionsRoomOakArrivesScript,               SCRIPT_CHAMPIONSROOM_OAK_ARRIVES
	dw_const ChampionsRoomOakCongratulatesPlayerScript,   SCRIPT_CHAMPIONSROOM_OAK_CONGRATULATES_PLAYER
	dw_const ChampionsRoomOakDisappointedWithRivalScript, SCRIPT_CHAMPIONSROOM_OAK_DISAPPOINTED_WITH_RIVAL
	dw_const ChampionsRoomOakComeWithMeScript,            SCRIPT_CHAMPIONSROOM_OAK_COME_WITH_ME
	dw_const ChampionsRoomOakExitsScript,                 SCRIPT_CHAMPIONSROOM_OAK_EXITS
	dw_const ChampionsRoomPlayerFollowsOakScript,         SCRIPT_CHAMPIONSROOM_PLAYER_FOLLOWS_OAK
	dw_const ChampionsRoomRivalComeWithMeScript,          SCRIPT_CHAMPIONSROOM_RIVAL_COME_WITH_ME
	dw_const ChampionsRoomRivalExitsScript,               SCRIPT_CHAMPIONSROOM_RIVAL_EXITS
	dw_const ChampionsRoomPlayerFollowsRivalScript,       SCRIPT_CHAMPIONSROOM_PLAYER_FOLLOWS_RIVAL
	dw_const ChampionsRoomCleanupScript,                  SCRIPT_CHAMPIONSROOM_CLEANUP_SCRIPT

ChampionsRoomPlayerEntersScript:
	ld a, PAD_BUTTONS | PAD_CTRL_PAD
	ld [wJoyIgnore], a
	ld hl, wSimulatedJoypadStatesEnd
	ld de, RivalEntrance_RLEMovement
	call DecodeRLEList
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, SCRIPT_CHAMPIONSROOM_RIVAL_READY_TO_BATTLE
	ld [wChampionsRoomCurScript], a
	ret

RivalEntrance_RLEMovement:
	db PAD_UP, 1
	db PAD_RIGHT, 1
	db PAD_UP, 3
	db -1 ; end

ChampionsRoomRivalReadyToBattleScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	xor a
	ld [wJoyIgnore], a
	;;;;;; marcelnote - added for Rival rematch
	CheckEvent EVENT_BECAME_CHAMPION
	ld a, TEXT_CHAMPIONSROOM_RIVAL_REMATCH
	jr nz, .rematch
	ld hl, wOptions
	res BIT_BATTLE_ANIM_OFF, [hl]
	ld a, TEXT_CHAMPIONSROOM_RIVAL
.rematch
	;;;;;;
	ldh [hTextID], a
	call DisplayTextID
	call Delay3
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	;;;;;; marcelnote - added for Rival rematch
	CheckEvent EVENT_BECAME_CHAMPION
	ld hl, RivalRematchDefeatedText
	ld de, RivalRematchVictoryText
	jr nz, .rematch2
	ld hl, RivalDefeatedText
	ld de, RivalVictoryText
.rematch2
	;;;;;;
	call SaveEndBattleTextPointers
	ld a, TEXT_CHAMPIONSROOM_RIVAL ; marcelnote - have to reload the text ID so that it doesn't
	ldh [hTextID], a  ;              disappear during the pre-battle animation
	ld a, OPP_RIVAL3
	ld [wCurOpponent], a

	; select which team to use during the encounter
	ld a, [wRivalStarter]
	ld b, $1    ; 1 = Blastoise team
	cp STARTER2 ; Squirtle
	jr z, .gotTeam
	inc b       ; 2 = Venusaur team
	cp STARTER3 ; Bulbasaur
	jr z, .gotTeam
	inc b       ; 3 = Charizard team
.gotTeam
;;;;;; marcelnote - if rematch, use team 4, 5 or 6
	CheckEvent EVENT_BECAME_CHAMPION
	ld a, b
	jr z, .loadTrainerNo
	add 3
.loadTrainerNo
;;;;;;
	ld [wTrainerNo], a

	xor a
	ldh [hJoyHeld], a
	ld a, SCRIPT_CHAMPIONSROOM_RIVAL_DEFEATED
	ld [wChampionsRoomCurScript], a
	ret

ChampionsRoomRivalDefeatedScript:
	ld a, [wIsInBattle]
	cp $ff
	jp z, ResetRivalScript
	call UpdateSprites
	SetEvent EVENT_BEAT_CHAMPION_RIVAL
	ld a, PAD_CTRL_PAD
	ld [wJoyIgnore], a
	CheckEvent EVENT_BECAME_CHAMPION ; marcelnote - added for Rival rematch
	jr nz, .rematch
	ld a, TEXT_CHAMPIONSROOM_RIVAL
	ldh [hTextID], a
	call ChampionsRoom_DisplayTextID_AllowABSelectStart
	ld a, CHAMPIONSROOM_RIVAL
	ldh [hSpriteIndex], a
	call SetSpriteMovementBytesToFF
	ld a, SCRIPT_CHAMPIONSROOM_OAK_ARRIVES
	ld [wChampionsRoomCurScript], a
	ret
.rematch ; marcelnote - added for Rival rematch
	ld a, TEXT_CHAMPIONSROOM_RIVAL_REMATCH
	ldh [hTextID], a
	call ChampionsRoom_DisplayTextID_AllowABSelectStart
	ld a, CHAMPIONSROOM_RIVAL
	ldh [hSpriteIndex], a
	call SetSpriteMovementBytesToFF
	ld a, SCRIPT_CHAMPIONSROOM_RIVAL_COME_WITH_ME
	ld [wChampionsRoomCurScript], a
	ret

ChampionsRoomOakArrivesScript:
	callfar Music_Cities1AlternateTempo
	ld a, TEXT_CHAMPIONSROOM_OAK
	ldh [hTextID], a
	call ChampionsRoom_DisplayTextID_AllowABSelectStart
	ld a, CHAMPIONSROOM_OAK
	ldh [hSpriteIndex], a
	call SetSpriteMovementBytesToFF
	ld de, OakEntranceAfterVictoryMovement
	ld a, CHAMPIONSROOM_OAK
	ldh [hSpriteIndex], a
	call MoveSprite
	ld a, HS_CHAMPIONS_ROOM_OAK
	ld [wMissableObjectIndex], a
	predef ShowObjectCont ; marcelnote - constant moved to second HideShow list
	ld a, SCRIPT_CHAMPIONSROOM_OAK_CONGRATULATES_PLAYER
	ld [wChampionsRoomCurScript], a
	ret

OakEntranceAfterVictoryMovement:
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db -1 ; end

ChampionsRoomOakCongratulatesPlayerScript:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	ld a, PLAYER_DIR_LEFT
	ld [wPlayerMovingDirection], a
	ld a, CHAMPIONSROOM_RIVAL
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_LEFT
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, CHAMPIONSROOM_OAK
	ldh [hSpriteIndex], a
	xor a ; SPRITE_FACING_DOWN
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, TEXT_CHAMPIONSROOM_OAK_CONGRATULATES_PLAYER
	ldh [hTextID], a
	call ChampionsRoom_DisplayTextID_AllowABSelectStart
	ld a, SCRIPT_CHAMPIONSROOM_OAK_DISAPPOINTED_WITH_RIVAL
	ld [wChampionsRoomCurScript], a
	ret

ChampionsRoomOakDisappointedWithRivalScript:
	ld a, CHAMPIONSROOM_OAK
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_RIGHT
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, TEXT_CHAMPIONSROOM_OAK_DISAPPOINTED_WITH_RIVAL
	ldh [hTextID], a
	call ChampionsRoom_DisplayTextID_AllowABSelectStart
	ld a, SCRIPT_CHAMPIONSROOM_OAK_COME_WITH_ME
	ld [wChampionsRoomCurScript], a
	ret

ChampionsRoomOakComeWithMeScript:
	ld a, CHAMPIONSROOM_OAK
	ldh [hSpriteIndex], a
	xor a ; SPRITE_FACING_DOWN
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, TEXT_CHAMPIONSROOM_OAK_COME_WITH_ME
	ldh [hTextID], a
	call ChampionsRoom_DisplayTextID_AllowABSelectStart
	ld de, OakExitChampionsRoomMovement
	ld a, CHAMPIONSROOM_OAK
	ldh [hSpriteIndex], a
	call MoveSprite
	ld a, SCRIPT_CHAMPIONSROOM_OAK_EXITS
	ld [wChampionsRoomCurScript], a
	ret

RivalExitChampionsRoomMovement: ; marcelnote - Rival rematch
OakExitChampionsRoomMovement:
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db -1 ; end

ChampionsRoomOakExitsScript:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	ld a, HS_CHAMPIONS_ROOM_OAK
	ld [wMissableObjectIndex], a
	predef HideObjectCont ; marcelnote - constant moved to second HideShow list
	ld a, SCRIPT_CHAMPIONSROOM_PLAYER_FOLLOWS_OAK
	ld [wChampionsRoomCurScript], a
	ret

ChampionsRoomRivalComeWithMeScript: ; marcelnote - Rival rematch
	callfar Music_Cities1AlternateTempo
	ld de, RivalExitChampionsRoomMovement
	ld a, CHAMPIONSROOM_RIVAL
	ldh [hSpriteIndex], a
	call MoveSprite
	ld a, SCRIPT_CHAMPIONSROOM_RIVAL_EXITS
	ld [wChampionsRoomCurScript], a
	ret

ChampionsRoomRivalExitsScript: ; marcelnote - Rival rematch
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	ld a, HS_CHAMPIONS_ROOM_RIVAL
	ld [wMissableObjectIndex], a
	predef HideObjectCont
	ld a, SCRIPT_CHAMPIONSROOM_PLAYER_FOLLOWS_RIVAL
	ld [wChampionsRoomCurScript], a
	ret

ChampionsRoomPlayerFollowsOakScript:
	ld a, PAD_BUTTONS | PAD_CTRL_PAD
	ld [wJoyIgnore], a
	ld hl, wSimulatedJoypadStatesEnd
	ld de, WalkToHallOfFame_RLEMovement
	call DecodeRLEList
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, SCRIPT_CHAMPIONSROOM_CLEANUP_SCRIPT
	ld [wChampionsRoomCurScript], a
	ret

WalkToHallOfFame_RLEMovement:
	db PAD_UP, 4
	db PAD_LEFT, 1
	db -1 ; end

ChampionsRoomPlayerFollowsRivalScript: ; marcelnote - added for Rival rematch
	ld a, PAD_BUTTONS | PAD_CTRL_PAD
	ld [wJoyIgnore], a
	ld hl, wSimulatedJoypadStatesEnd
	ld de, WalkToHallOfFame_RLEMovement
	call DecodeRLEList
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, SCRIPT_CHAMPIONSROOM_CLEANUP_SCRIPT
	ld [wChampionsRoomCurScript], a
	ret

ChampionsRoomCleanupScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld a, SCRIPT_CHAMPIONSROOM_DEFAULT
	ld [wChampionsRoomCurScript], a
	ret

ChampionsRoom_DisplayTextID_AllowABSelectStart:
	ld a, PAD_CTRL_PAD
	ld [wJoyIgnore], a
	call DisplayTextID
	ld a, PAD_BUTTONS | PAD_CTRL_PAD
	ld [wJoyIgnore], a
	ret

ChampionsRoom_TextPointers:
	def_text_pointers
	dw_const ChampionsRoomRivalText,                    TEXT_CHAMPIONSROOM_RIVAL
	dw_const ChampionsRoomOakText,                      TEXT_CHAMPIONSROOM_OAK
	dw_const ChampionsRoomOakCongratulatesPlayerText,   TEXT_CHAMPIONSROOM_OAK_CONGRATULATES_PLAYER
	dw_const ChampionsRoomOakDisappointedWithRivalText, TEXT_CHAMPIONSROOM_OAK_DISAPPOINTED_WITH_RIVAL
	dw_const ChampionsRoomOakComeWithMeText,            TEXT_CHAMPIONSROOM_OAK_COME_WITH_ME
	dw_const ChampionsRoomRivalRematchText,             TEXT_CHAMPIONSROOM_RIVAL_REMATCH ; marcelnote - Rival rematch

ChampionsRoomRivalText:
	text_asm
	CheckEvent EVENT_BEAT_CHAMPION_RIVAL
	ld hl, .IntroText
	jr z, .printText
	ld hl, ChampionsRoomRivalAfterBattleText
.printText
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.IntroText:
	text_far _ChampionsRoomRivalIntroText
	text_end

RivalDefeatedText:
	text_far _RivalDefeatedText
	text_end

RivalVictoryText:
	text_far _RivalVictoryText
	text_end

ChampionsRoomRivalAfterBattleText:
	text_far _ChampionsRoomRivalAfterBattleText
	text_end

ChampionsRoomRivalRematchText: ; marcelnote - Rival rematch
	text_asm
	CheckEvent EVENT_BEAT_CHAMPION_RIVAL
	ld hl, .IntroText
	jr z, .printText
	ld hl, ChampionsRoomRivalRematchAfterBattleText
.printText
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.IntroText: ; marcelnote - Rival rematch
	text_far _ChampionsRoomRivalRematchIntroText
	text_end

RivalRematchDefeatedText: ; marcelnote - Rival rematch
	text_far _RivalRematchDefeatedText
	text_end

RivalRematchVictoryText: ; marcelnote - Rival rematch
	text_far _RivalRematchVictoryText
	text_end

ChampionsRoomRivalRematchAfterBattleText: ; marcelnote - Rival rematch
	text_far _ChampionsRoomRivalRematchAfterBattleText
	text_end

ChampionsRoomOakText:
	text_far _ChampionsRoomOakText
	text_end

ChampionsRoomOakCongratulatesPlayerText:
	text_asm
	ld a, [wPlayerStarter]
	ld [wNamedObjectIndex], a
	call GetMonName
	ld hl, .Text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.Text:
	text_far _ChampionsRoomOakCongratulatesPlayerText
	text_end

ChampionsRoomOakDisappointedWithRivalText:
	text_far _ChampionsRoomOakDisappointedWithRivalText
	text_end

ChampionsRoomOakComeWithMeText:
	text_far _ChampionsRoomOakComeWithMeText
	text_end
