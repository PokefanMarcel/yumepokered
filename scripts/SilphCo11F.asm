SilphCo11F_Script:
	call SilphCo11FGateCallbackScript
	call EnableAutoTextBoxDrawing
	ld hl, SilphCo11TrainerHeaders
	ld de, SilphCo11F_ScriptPointers
	ld a, [wSilphCo11FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSilphCo11FCurScript], a
	ret

SilphCo11FGateCallbackScript: ; marcelnote - simplify Silph Co gates scripts
	ld hl, SilphCo11GateCoords
	EventFlagAddress de, EVENT_SILPH_CO_11_UNLOCKED_DOOR
	EventFlagBit c, EVENT_SILPH_CO_11_UNLOCKED_DOOR
	jp SilphCoGateCallback

SilphCo11GateCoords:
	dbgatecoord 3, 6, INTERIOR_CARD_KEY_GATE_BLOCK
	db -1 ; end

SilphCo11FTeamRocketLeavesScript:
	ld hl, .HideToggleableObjectIDs
.hideLoop
	ld a, [hli]
	cp $ff
	jr z, .doneHiding
	push hl
	ld [wToggleableObjectIndex], a
	predef HideObject
	pop hl
	jr .hideLoop
.doneHiding
	ld hl, .ShowToggleableObjectIDs
.showLoop
	ld a, [hli]
	cp -1
	jr z, .doneShowing ; marcelnote - was ret z, now need to deal with second hiding list
	push hl
	ld [wToggleableObjectIndex], a
	predef ShowObjectCont ; marcelnote - changed from ShowObject because moved to second list
	pop hl
	jr .showLoop
; marcelnote - this new code below deals with second Hide list
.doneShowing
	ld hl, .HideToggleableObjectIDsCont
.hideLoopAgain
	ld a, [hli]
	cp -1
	ret z
	push hl
	ld [wToggleableObjectIndex], a
	predef HideObjectCont ; marcelnote - changed from ShowObject because moved to second list
	pop hl
	jr .hideLoopAgain

.ShowToggleableObjectIDs:
	db TOGGLE_SAFFRON_CITY_8
	db TOGGLE_SAFFRON_CITY_9
	db TOGGLE_SAFFRON_CITY_A
	db TOGGLE_SAFFRON_CITY_B
	db TOGGLE_SAFFRON_CITY_C
	db TOGGLE_SAFFRON_CITY_D
	db TOGGLE_SILPH_CO_1F_RECEPTIONIST ; marcelnote - moved here from Silph Co 1F script
	db -1 ; end

.HideToggleableObjectIDs:
	db TOGGLE_SILPH_CO_2F_2
	db TOGGLE_SILPH_CO_2F_3
	db TOGGLE_SILPH_CO_2F_4
	db TOGGLE_SILPH_CO_2F_5
	db TOGGLE_SILPH_CO_3F_1
	db TOGGLE_SILPH_CO_3F_2
	db TOGGLE_SILPH_CO_4F_1
	db TOGGLE_SILPH_CO_4F_2
	db TOGGLE_SILPH_CO_4F_3
	db TOGGLE_SILPH_CO_5F_1
	db TOGGLE_SILPH_CO_5F_2
	db TOGGLE_SILPH_CO_5F_3
	db TOGGLE_SILPH_CO_5F_4
	db TOGGLE_SILPH_CO_6F_1
	db TOGGLE_SILPH_CO_6F_2
	db TOGGLE_SILPH_CO_6F_3
	db TOGGLE_SILPH_CO_7F_1
	db TOGGLE_SILPH_CO_7F_2
	db TOGGLE_SILPH_CO_7F_3
	db TOGGLE_SILPH_CO_7F_4
	db TOGGLE_SILPH_CO_8F_1
	db TOGGLE_SILPH_CO_8F_2
	db TOGGLE_SILPH_CO_8F_3
	db TOGGLE_SILPH_CO_9F_1
	db TOGGLE_SILPH_CO_9F_2
	db TOGGLE_SILPH_CO_9F_3
	db TOGGLE_SILPH_CO_10F_1
	db TOGGLE_SILPH_CO_10F_2
	db TOGGLE_SILPH_CO_11F_1
	db TOGGLE_SILPH_CO_11F_2
	db TOGGLE_SILPH_CO_11F_3
	db -1 ; end

.HideToggleableObjectIDsCont: ; marcelnote - new, these objects belong to the second list so use a different function
	db TOGGLE_SAFFRON_CITY_1
	db TOGGLE_SAFFRON_CITY_2
	db TOGGLE_SAFFRON_CITY_3
	db TOGGLE_SAFFRON_CITY_4
	db TOGGLE_SAFFRON_CITY_5
	db TOGGLE_SAFFRON_CITY_6
	db TOGGLE_SAFFRON_CITY_7
	db TOGGLE_SAFFRON_CITY_E
	db TOGGLE_SAFFRON_CITY_F
	db -1 ; end

SilphCo11FResetCurScript:
	xor a
	ld [wJoyIgnore], a
	; fallthrough
SilphCo11FSetCurScript:
	ld [wSilphCo11FCurScript], a
	ld [wCurMapScript], a
	ret

SilphCo11F_ScriptPointers:
	def_script_pointers
	dw_const SilphCo11FDefaultScript,               SCRIPT_SILPHCO11F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_SILPHCO11F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_SILPHCO11F_END_BATTLE
	dw_const SilphCo11FGiovanniBattleFacingScript,  SCRIPT_SILPHCO11F_GIOVANNI_FACING
	dw_const SilphCo11FGiovanniStartBattleScript,   SCRIPT_SILPHCO11F_GIOVANNI_START_BATTLE
	dw_const SilphCo11FGiovanniAfterBattleScript,   SCRIPT_SILPHCO11F_GIOVANNI_AFTER_BATTLE

SilphCo11FDefaultScript:
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	ret nz
	ld hl, .PlayerCoordsArray
	call ArePlayerCoordsInArray
	jp nc, CheckFightingMapTrainers
	ld a, [wCoordIndex]
	ld [wSavedCoordIndex], a
	xor a
	ldh [hJoyHeld], a
	ld a, PAD_CTRL_PAD
	ld [wJoyIgnore], a
	ld a, TEXT_SILPHCO11F_GIOVANNI
	ldh [hTextID], a
	call DisplayTextID
	ld a, SILPHCO11F_GIOVANNI
	ldh [hSpriteIndex], a
	call SetSpriteMovementBytesToFF
	ld de, .GiovanniMovement
	call MoveSprite
	ld a, SCRIPT_SILPHCO11F_GIOVANNI_FACING
	jr SilphCo11FSetCurScript

.PlayerCoordsArray:
	dbmapcoord  6, 13
	dbmapcoord  7, 12
	db -1 ; end

.GiovanniMovement:
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db -1 ; end

SilphCo11FSetPlayerAndSpriteFacingDirectionScript:
	ld [wPlayerMovingDirection], a
	ld a, SILPHCO11F_GIOVANNI
	ldh [hSpriteIndex], a
	ld a, b
	ldh [hSpriteFacingDirection], a
	jp SetSpriteFacingDirectionAndDelay

SilphCo11FGiovanniAfterBattleScript:
	ld a, [wIsInBattle]
	cp $ff
	jr z, SilphCo11FResetCurScript
	ld a, [wSavedCoordIndex]
	cp 1 ; index of second, upper-right entry in SilphCo11FDefaultScript.PlayerCoordsArray
	jr z, .facePlayerUp
	ld a, PLAYER_DIR_LEFT
	ld b, SPRITE_FACING_RIGHT
	jr .continue
.facePlayerUp
	ld a, PLAYER_DIR_UP
	ld b, SPRITE_FACING_DOWN
.continue
	call SilphCo11FSetPlayerAndSpriteFacingDirectionScript
	ld a, PAD_CTRL_PAD
	ld [wJoyIgnore], a
	ld a, TEXT_SILPHCO11F_GIOVANNI_YOU_RUINED_OUR_PLANS
	ldh [hTextID], a
	call DisplayTextID
	call GBFadeOutToBlack
	call SilphCo11FTeamRocketLeavesScript
	call UpdateSprites
	call Delay3
	call GBFadeInFromBlack
	SetEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	xor a
	ld [wJoyIgnore], a
	jp SilphCo11FSetCurScript

SilphCo11FGiovanniBattleFacingScript:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	ld a, SILPHCO11F_GIOVANNI
	ldh [hSpriteIndex], a
	call SetSpriteMovementBytesToFF
	ld a, [wSavedCoordIndex]
	cp 1 ; index of second, upper-right entry in SilphCo11FDefaultScript.PlayerCoordsArray
	ld a, PLAYER_DIR_UP
	ld b, SPRITE_FACING_DOWN
	jr z, .continue
	ld a, PLAYER_DIR_LEFT
	ld b, SPRITE_FACING_RIGHT
.continue
	call SilphCo11FSetPlayerAndSpriteFacingDirectionScript
	call Delay3
	ld a, SCRIPT_SILPHCO11F_GIOVANNI_START_BATTLE
	jp SilphCo11FSetCurScript

SilphCo11FGiovanniStartBattleScript:
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, SilphCo10FGiovanniILostAgainText
	ld de, SilphCo10FGiovanniILostAgainText
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	xor a
	ld [wJoyIgnore], a
	ld a, SCRIPT_SILPHCO11F_GIOVANNI_AFTER_BATTLE
	jp SilphCo11FSetCurScript

SilphCo11F_TextPointers:
	def_text_pointers
	dw_const SilphCo11FSilphPresidentText,            TEXT_SILPHCO11F_SILPH_PRESIDENT
	dw_const SilphCo11FBeautyText,                    TEXT_SILPHCO11F_BEAUTY
	dw_const SilphCo11FGiovanniText,                  TEXT_SILPHCO11F_GIOVANNI
	dw_const SilphCo11FRocket1Text,                   TEXT_SILPHCO11F_ROCKET1
	dw_const SilphCo11FRocket2Text,                   TEXT_SILPHCO11F_ROCKET2
	dw_const SilphCo11FGiovanniYouRuinedOurPlansText, TEXT_SILPHCO11F_GIOVANNI_YOU_RUINED_OUR_PLANS

SilphCo11TrainerHeaders:
	def_trainers 4
SilphCo11TrainerHeader0:
	trainer EVENT_BEAT_SILPH_CO_11F_TRAINER_0, 4, SilphCo11FRocket1BattleText, SilphCo11FRocket1EndBattleText, SilphCo11FRocket1AfterBattleText
SilphCo11TrainerHeader1:
	trainer EVENT_BEAT_SILPH_CO_11F_TRAINER_1, 3, SilphCo11FRocket2BattleText, SilphCo11FRocket2EndBattleText, SilphCo11FRocket2AfterBattleText
	db -1 ; end

SilphCo11FSilphPresidentText:
	text_asm
	CheckEvent EVENT_GOT_MASTER_BALL
	ld hl, .MasterBallDescriptionText
	jr nz, .printText
	ld hl, .ThankYouText
	call PrintText
	lb bc, MASTER_BALL, 1
	call GiveItem
	ld hl, .NoRoomText
	jr nc, .printText
	SetEvent EVENT_GOT_MASTER_BALL
	ld hl, .ReceivedMasterBallText
.printText
	call PrintText
	rst TextScriptEnd

.ThankYouText:
	text_far _SilphCo11FSilphPresidentThankYouText
	text_end

.ReceivedMasterBallText:
	text_far _SilphCo11FSilphPresidentReceivedMasterBallText
	sound_get_key_item
	text_end

.MasterBallDescriptionText:
	text_far _SilphCo11FSilphPresidentMasterBallDescriptionText
	text_end

.NoRoomText:
	text_far _SilphCo11FSilphPresidentNoRoomText
	text_end

SilphCo11FBeautyText:
	text_far _SilphCo11FBeautyText
	text_end

SilphCo11FGiovanniText:
	text_far _SilphCo11FGiovanniText
	text_end

SilphCo10FGiovanniILostAgainText:
	text_far _SilphCo10FGiovanniILostAgainText
	text_end

SilphCo11FGiovanniYouRuinedOurPlansText:
	text_far _SilphCo11FGiovanniYouRuinedOurPlansText
	text_end

SilphCo11FRocket1Text:
	text_asm
	ld hl, SilphCo11TrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd

SilphCo11FRocket1BattleText:
	text_far _SilphCo11FRocket1BattleText
	text_end

SilphCo11FRocket1EndBattleText:
	text_far _SilphCo11FRocket1EndBattleText
	text_end

SilphCo11FRocket1AfterBattleText:
	text_far _SilphCo11FRocket1AfterBattleText
	text_end

SilphCo11FRocket2Text:
	text_asm
	ld hl, SilphCo11TrainerHeader1
	call TalkToTrainer
	rst TextScriptEnd

SilphCo11FRocket2BattleText:
	text_far _SilphCo11FRocket2BattleText
	text_end

SilphCo11FRocket2EndBattleText:
	text_far _SilphCo11FRocket2EndBattleText
	text_end

SilphCo11FRocket2AfterBattleText:
	text_far _SilphCo11FRocket2AfterBattleText
	text_end

;SilphCo11FPorygonText: ; unreferenced
;	text_asm
;	ld hl, .Text
;	call PrintText
;	ld a, PORYGON
;	call DisplayPokedex
;	rst TextScriptEnd

;.Text:
;	text_far _SilphCo11FPorygonText
;	text_end
