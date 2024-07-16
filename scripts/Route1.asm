; marcelnote - script was adapted to accommodate postgame Oak battle
Route1_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route1_ScriptPointers
	ld a, [wRoute1CurScript]
	jp CallFunctionInTable

Route1_ScriptPointers:
	def_script_pointers
	dw_const DoRet,                     SCRIPT_ROUTE1_DEFAULT ; PureRGB - DoRet
	dw_const Route1OakPostBattleScript, SCRIPT_ROUTE1_OAK_POST_BATTLE
	dw_const Route1OakFalseStartScript, SCRIPT_ROUTE1_OAK_FALSE_START
	dw_const Route1OakExitsScript,      SCRIPT_ROUTE1_OAK_EXITS

Route1OakPostBattleScript: ; marcelnote - postgame Oak battle
	ld a, [wIsInBattle]
	cp $ff
	jr z, .lost
	call UpdateSprites
	ld a, TEXT_ROUTE1_OAK_POST_BATTLE
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	call Delay3
	ld a, ROUTE1_OAK
	ldh [hSpriteIndex], a
	ld a, [wXCoord]
	cp 8 ; if player on Oak's right, do a step down first
	ld de, .OakMovement
	jr nz, .movementLoaded
	ld de, .OakMovementDown
.movementLoaded
	call MoveSprite
	ld a, SCRIPT_ROUTE1_OAK_FALSE_START
	ld [wRoute1CurScript], a
	ret

.lost
	ld a, SCRIPT_ROUTE1_DEFAULT
	ld [wRoute1CurScript], a
	ret

.OakMovementDown
	db NPC_MOVEMENT_DOWN
.OakMovement
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db -1 ; end

Route1OakFalseStartScript: ; marcelnote - postgame Oak battle
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	ld a, ROUTE1_OAK
	ld [wEmotionBubbleSpriteIndex], a
	xor a ; EXCLAMATION_BUBBLE
	ld [wWhichEmotionBubble], a
	predef EmotionBubble
	ld a, D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoyIgnore], a
	ld a, ROUTE1_OAK
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_LEFT
	ldh [hSpriteFacingDirection], a
	ld a, [wXCoord]
	cp 8 ; if player was on Oak's right, make player face down
	jr nz, .turnSprites
	ld a, PLAYER_DIR_DOWN
	ld [wPlayerMovingDirection], a
.turnSprites
	call SetSpriteFacingDirectionAndDelay
	ld a, TEXT_ROUTE1_OAK_ONE_MORE_THING
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	call Delay3
	ld a, ROUTE1_OAK
	ldh [hSpriteIndex], a ; ?
	ld de, .OakExitMovement
	call MoveSprite
	ld a, SCRIPT_ROUTE1_OAK_EXITS
	ld [wRoute1CurScript], a
	ret

.OakExitMovement
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db -1 ; end

Route1OakExitsScript: ; marcelnote - postgame Rival event
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	call Delay3
	SetEvent EVENT_BEAT_ROUTE_1_OAK
	ld a, HS_OAKS_LAB_OAK_1
	ld [wMissableObjectIndex], a
	predef ShowObject
	ld a, HS_ROUTE_1_OAK
	ld [wMissableObjectIndex], a
	predef HideObjectCont
	call UpdateSprites
	xor a
	ld [wJoyIgnore], a
	ld a, SCRIPT_ROUTE1_DEFAULT
	ld [wRoute1CurScript], a
	ret

Route1_TextPointers:
	def_text_pointers
	dw_const Route1Youngster1Text,      TEXT_ROUTE1_YOUNGSTER1
	dw_const Route1Youngster2Text,      TEXT_ROUTE1_YOUNGSTER2
	dw_const Route1OakText,             TEXT_ROUTE1_OAK ; marcelnote - postgame Oak battle
	dw_const Route1SignText,            TEXT_ROUTE1_SIGN
	dw_const Route1OakPostBattleText,   TEXT_ROUTE1_OAK_POST_BATTLE ; marcelnote - postgame Oak battle
	dw_const Route1OakOneMoreThingText, TEXT_ROUTE1_OAK_ONE_MORE_THING ; marcelnote - postgame Oak battle

Route1Youngster1Text:
	text_asm
	CheckAndSetEvent EVENT_GOT_POTION_SAMPLE
	jr nz, .got_item
	ld hl, .MartSampleText
	call PrintText
	lb bc, POTION, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, .GotPotionText
	jr .done
.bag_full
	ld hl, .NoRoomText
	jr .done
.got_item
	ld hl, .AlsoGotPokeballsText
.done
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.MartSampleText:
	text_far _Route1Youngster1MartSampleText
	text_end

.GotPotionText:
	text_far _Route1Youngster1GotPotionText
	sound_get_item_1
	text_end

.AlsoGotPokeballsText:
	text_far _Route1Youngster1AlsoGotPokeballsText
	text_end

.NoRoomText:
	text_far _Route1Youngster1NoRoomText
	text_end

Route1Youngster2Text:
	text_far _Route1Youngster2Text
	text_end

Route1SignText:
	text_far _Route1SignText
	text_end

Route1OakText: ; marcelnote - postgame Oak fight
	text_asm
	ld hl, Route1OakBeforeBattleText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .refused
	ld hl, Route1OakAcceptedBattleText
	call PrintText
	ld c, BANK(Music_MeetMaleTrainer)
	ld a, MUSIC_MEET_MALE_TRAINER
	call PlayMusic
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, Route1OakDefeatText
	ld de, Route1OakVictoryText
	call SaveEndBattleTextPointers
	call Delay3
	ld a, OPP_PROF_OAK
	ld [wCurOpponent], a
	; select which team to use during the encounter
	ld a, [wPlayerStarter]
	cp STARTER1
	ld a, 1
	jr z, .saveTrainerId
	ld a, [wPlayerStarter]
	cp STARTER2
	ld a, 2
	jr z, .saveTrainerId
	ld a, 3
.saveTrainerId
	ld [wTrainerNo], a
	xor a
	ldh [hJoyHeld], a
	ld a, SCRIPT_ROUTE1_OAK_POST_BATTLE
	ld [wRoute1CurScript], a
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd
.refused
	ld hl, Route1OakRefusedBattleText
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

Route1OakBeforeBattleText: ; marcelnote - postgame Oak battle
	text_far _Route1OakBeforeBattleText
	text_end

Route1OakRefusedBattleText: ; marcelnote - postgame Oak battle
	text_far _Route1OakRefusedBattleText
	text_end

Route1OakAcceptedBattleText: ; marcelnote - postgame Oak battle
	text_far _Route1OakAcceptedBattleText
	text_end

Route1OakDefeatText: ; marcelnote - postgame Oak battle
	text_far _Route1OakDefeatText
	text_end

Route1OakVictoryText: ; marcelnote - postgame Oak battle
	text_far _Route1OakVictoryText
	text_end

Route1OakPostBattleText: ; marcelnote - postgame Oak battle
	text_far _Route1OakPostBattleText
	text_end

Route1OakOneMoreThingText: ; marcelnote - postgame Oak battle
	text_far _Route1OakOneMoreThingText
	text_end
