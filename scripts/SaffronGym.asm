SaffronGym_Script:
	call SaffronGymSetMapAndTiles
	call EnableAutoTextBoxDrawing
	ld hl, SaffronGym_TrainerHeaders
	ld de, SaffronGym_ScriptPointers
	ld bc, wSaffronGymCurScript
	jp ExecuteCurMapScriptInTable

SaffronGymSetMapAndTiles: ; marcelnote - open Saffron Gym gate
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_2, [hl]
	res BIT_CUR_MAP_LOADED_2, [hl]
	call nz, .LoadNames
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	ret z
	res BIT_CUR_MAP_LOADED_1, [hl]
	ld a, [wObtainedBadges]
	bit BIT_MARSHBADGE, a
	ret z  ; gate closed before getting Marsh Badge
	CheckEvent EVENT_BECAME_CHAMPION
	jp z, UpdateSaffronGymTileBlocks ; gate open before being champion
	CheckHideShow TOGGLE_FIGHTING_DOJO_BRUNO
	ret z ; gate closed while Bruno is at Fighting Dojo
	jp UpdateSaffronGymTileBlocks

.LoadNames:
	ld a, SABRINA
	jp LoadGymLeaderAndCityName

SaffronGymSetDefaultScript:
	xor a
	ld [wJoyIgnore], a
SaffronGymSetScript:
	ld [wSaffronGymCurScript], a
	ret

SaffronGym_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,                 SCRIPT_SAFFRONGYM_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle,    SCRIPT_SAFFRONGYM_START_BATTLE
	dw_const EndTrainerBattle,                         SCRIPT_SAFFRONGYM_END_BATTLE
	dw_const SaffronGymSabrinaPostBattleScript,        SCRIPT_SAFFRONGYM_SABRINA_POST_BATTLE
	dw_const SaffronGymBrunoArrivesScript,             SCRIPT_SAFFRONGYM_BRUNO_ARRIVES   ; marcelnote - postgame Bruno event
	dw_const SaffronGymBrunoInspiringScript,           SCRIPT_SAFFRONGYM_BRUNO_INSPIRING ; marcelnote - postgame Bruno event
	dw_const SaffronGymSabrinaRematchPostBattleScript, SCRIPT_SAFFRONGYM_SABRINA_REMATCH_POST_BATTLE ; marcelnote - Sabrina rematch

SaffronGymSabrinaPostBattleScript:
	ld a, [wIsInBattle]
	inc a ; lost battle?
	jr z, SaffronGymSetScript ; SCRIPT_SAFFRONGYM_DEFAULT
	ld a, PAD_CTRL_PAD
	ld [wJoyIgnore], a
	; fallthrough

SaffronGymReceiveTM46: ; marcelnote - optimized
	ld a, TEXT_SAFFRONGYM_SABRINA_MARSH_BADGE_INFO
	ldh [hTextID], a
	call DisplayTextID
	SetEvent EVENT_BEAT_SABRINA
	lb bc, TM_PSYWAVE, 1
	call GiveItem
	ld a, TEXT_SAFFRONGYM_SABRINA_TM46_NO_ROOM
	jr nc, .displayTMText
	SetEvent EVENT_GOT_TM46
	ld a, TEXT_SAFFRONGYM_SABRINA_RECEIVED_TM46
.displayTMText
	ldh [hTextID], a
	call DisplayTextID
	ld hl, wObtainedBadges
	set BIT_MARSHBADGE, [hl]
	SetEventRange EVENT_BEAT_SAFFRON_GYM_TRAINER_0, EVENT_BEAT_SAFFRON_GYM_TRAINER_6
	ld a, SFX_TELEPORT_EXIT_1
	call PlaySound
	call UpdateSaffronGymTileBlocks ; marcelnote - open Saffron Gym gate
	jr SaffronGymSetDefaultScript

UpdateSaffronGymTileBlocks: ; marcelnote - open Saffron Gym gate
	ld hl, wCurrentMapScriptFlags
	set BIT_REPLACE_TILE_BLOCK_BATCHING, [hl]
	ld a, $0e ; floor block
	ld [wNewTileBlockID], a
	lb bc, 6, 4
	predef ReplaceTileBlock
	lb bc, 6, 5
	predef ReplaceTileBlock
	ld hl, wCurrentMapScriptFlags
	res BIT_REPLACE_TILE_BLOCK_BATCHING, [hl]
	bit BIT_REDRAW_MAP_VIEW_PENDING, [hl]
	ret z
	res BIT_REDRAW_MAP_VIEW_PENDING, [hl]
	jpfar RedrawMapView

SaffronGymSabrinaRematchPostBattleScript: ; marcelnote - Sabrina rematch
	ld a, [wIsInBattle]
	inc a ; lost battle?
	jp z, SaffronGymSetScript ; SCRIPT_SAFFRONGYM_DEFAULT
	ld a, PAD_CTRL_PAD
	ld [wJoyIgnore], a
	ld a, TEXT_SAFFRONGYM_AFTER_REMATCH
	ldh [hTextID], a
	call DisplayTextID
	SetEvent EVENT_BEAT_SABRINA_REMATCH
	jp SaffronGymSetDefaultScript

SaffronGymBrunoArrivesScript: ; marcelnote - postgame Bruno event
	ld a, [wIsInBattle]
	inc a ; lost battle?
	jp z, SaffronGymSetScript ; SCRIPT_SAFFRONGYM_DEFAULT
	ld a, TOGGLE_SAFFRON_GYM_BRUNO
	ld [wToggleableObjectIndex], a
	predef ShowObjectCont
	ld a, TEXT_SAFFRONGYM_BRUNO_ARRIVES
	ldh [hTextID], a
	call DisplayTextID
	ld a, PAD_BUTTONS | PAD_CTRL_PAD
	ld [wJoyIgnore], a
	;ld a, SAFFRONGYM_WILL ; to change Will's facing direction - moved to when Bruno has finished moving
	;ldh [hSpriteIndex], a
	;ld a, [wXCoord]
	;cp 10
	;ld a, SPRITE_FACING_RIGHT
	;jr z, .directionSet
	;ld a, SPRITE_FACING_DOWN
;.directionSet
	;ldh [hSpriteFacingDirection], a
	;call SetSpriteFacingDirectionAndDelay
	ld de, .BrunoArrivesMovementRight
	ld a, [wXCoord]
	cp 10
	jr z, .moveBruno ; if player on
	ld de, .BrunoArrivesMovementBelow ; if player is on Will's right, Bruno arrives below
.moveBruno
	ld a, SAFFRONGYM_BRUNO
	ldh [hSpriteIndex], a
	call MoveSprite
	ld a, SCRIPT_SAFFRONGYM_BRUNO_INSPIRING
	ld [wSaffronGymCurScript], a
	ret

.BrunoArrivesMovementRight:
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db -1 ; end

.BrunoArrivesMovementBelow:
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_LEFT
	db NPC_MOVEMENT_UP
	db -1 ; end

SaffronGymBrunoInspiringScript: ; marcelnote - postgame Bruno event
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	ld a, SAFFRONGYM_WILL ; make Will face the correct direction
	ldh [hSpriteIndex], a
	ld a, [wXCoord]
	cp 10
	ld a, SPRITE_FACING_RIGHT
	jr z, .WillDirectionSet
	ld a, SPRITE_FACING_DOWN
.WillDirectionSet
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, [wXCoord]
	cp 11
	jr z, .BrunoSpeaks ; if player is on Will's right, no need to adjust Bruno's facing direction
	ld a, SAFFRONGYM_BRUNO
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_LEFT
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
.BrunoSpeaks
	xor a
	ld [wJoyIgnore], a
	ld a, TEXT_SAFFRONGYM_BRUNO_INSPIRING
	ldh [hTextID], a
	call DisplayTextID
	call GBFadeOutToBlack
	ld a, TOGGLE_SAFFRON_GYM_BRUNO
	ld [wToggleableObjectIndex], a
	predef HideObjectCont
	call UpdateSprites
	call Delay3
	SetEvent EVENT_POSTGAME_BRUNO
	ld a, TOGGLE_FIGHTING_DOJO_BRUNO
	ld [wToggleableObjectIndex], a
	predef HideObject
	CheckBothEventsSet EVENT_POSTGAME_LORELEI, EVENT_POSTGAME_AGATHA ; sets Z flag when events are set
	jr nz, .end
	CheckBothEventsSet EVENT_POSTGAME_LANCE, EVENT_POSTGAME_RIVAL
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
	call GBFadeInFromBlack
	ld a, SFX_TELEPORT_EXIT_1
	call PlaySound
	call UpdateSaffronGymTileBlocks ; marcelnote - open Saffron Gym gate
	jp SaffronGymSetDefaultScript

SaffronGym_TextPointers:
	def_text_pointers
	dw_const SaffronGymSabrinaText,               TEXT_SAFFRONGYM_SABRINA
	dw_const SaffronGymSabrinaRematchText,        TEXT_SAFFRONGYM_SABRINA_REMATCH ; marcelnote - Sabrina rematch
	dw_const SaffronGymChanneler1Text,            TEXT_SAFFRONGYM_CHANNELER1
	dw_const SaffronGymYoungster1Text,            TEXT_SAFFRONGYM_YOUNGSTER1
	dw_const SaffronGymChanneler2Text,            TEXT_SAFFRONGYM_CHANNELER2
	dw_const SaffronGymYoungster2Text,            TEXT_SAFFRONGYM_YOUNGSTER2
	dw_const SaffronGymChanneler3Text,            TEXT_SAFFRONGYM_CHANNELER3
	dw_const SaffronGymYoungster3Text,            TEXT_SAFFRONGYM_YOUNGSTER3
	dw_const SaffronGymYoungster4Text,            TEXT_SAFFRONGYM_YOUNGSTER4
	dw_const SaffronGymWillText,                  TEXT_SAFFRONGYM_WILL  ; marcelnote - postgame Bruno event
	dw_const SaffronGymGymGuideText,              TEXT_SAFFRONGYM_GYM_GUIDE
	dw_const SaffronGymBrunoInspiringText,        TEXT_SAFFRONGYM_BRUNO_INSPIRING  ; marcelnote - postgame Bruno event
	dw_const SaffronGymSabrinaMarshBadgeInfoText, TEXT_SAFFRONGYM_SABRINA_MARSH_BADGE_INFO
	dw_const SaffronGymSabrinaReceivedTM46Text,   TEXT_SAFFRONGYM_SABRINA_RECEIVED_TM46
	dw_const SaffronGymSabrinaTM46NoRoomText,     TEXT_SAFFRONGYM_SABRINA_TM46_NO_ROOM
	dw_const SaffronGymBrunoArrivesText,          TEXT_SAFFRONGYM_BRUNO_ARRIVES  ; marcelnote - postgame Bruno event
	dw_const SaffronGymAfterRematchText,          TEXT_SAFFRONGYM_AFTER_REMATCH ; marcelnote - Sabrina rematch

SaffronGym_TrainerHeaders:
	def_trainers 3 ; marcelnote - added 1 to accomodate Sabrina rematch
SaffronGymTrainerHeader0:
	trainer EVENT_BEAT_SAFFRON_GYM_TRAINER_0, 3, SaffronGymChanneler1BattleText, SaffronGymChanneler1EndBattleText, SaffronGymChanneler1AfterBattleText
SaffronGymTrainerHeader1:
	trainer EVENT_BEAT_SAFFRON_GYM_TRAINER_1, 3, SaffronGymYoungster1BattleText, SaffronGymYoungster1EndBattleText, SaffronGymYoungster1AfterBattleText
SaffronGymTrainerHeader2:
	trainer EVENT_BEAT_SAFFRON_GYM_TRAINER_2, 3, SaffronGymChanneler2BattleText, SaffronGymChanneler2EndBattleText, SaffronGymChanneler2AfterBattleText
SaffronGymTrainerHeader3:
	trainer EVENT_BEAT_SAFFRON_GYM_TRAINER_3, 3, SaffronGymYoungster2BattleText, SaffronGymYoungster2EndBattleText, SaffronGymYoungster2AfterBattleText
SaffronGymTrainerHeader4:
	trainer EVENT_BEAT_SAFFRON_GYM_TRAINER_4, 3, SaffronGymChanneler3BattleText, SaffronGymChanneler3EndBattleText, SaffronGymChanneler3AfterBattleText
SaffronGymTrainerHeader5:
	trainer EVENT_BEAT_SAFFRON_GYM_TRAINER_5, 3, SaffronGymYoungster3BattleText, SaffronGymYoungster3EndBattleText, SaffronGymYoungster3AfterBattleText
SaffronGymTrainerHeader6:
	trainer EVENT_BEAT_SAFFRON_GYM_TRAINER_6, 3, SaffronGymYoungster4BattleText, SaffronGymYoungster4EndBattleText, SaffronGymYoungster4AfterBattleText
	db -1 ; end

SaffronGymSabrinaText:
	text_asm
	CheckEvent EVENT_BEAT_SABRINA
	jr z, .beforeBeat
	CheckEventReuseA EVENT_GOT_TM46
	ld hl, .PostBattleAdviceText
	ret nz
	call SaffronGymReceiveTM46
	call DisableWaitingAfterTextDisplay
	rst TextScriptEnd
.beforeBeat
	ld hl, .PreBattleText
	call PrintText
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, .ReceivedMarshBadgeText
	ld de, .ReceivedMarshBadgeText
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, $6
	ld [wGymLeaderNo], a
	ld a, SCRIPT_SAFFRONGYM_SABRINA_POST_BATTLE
	ld [wSaffronGymCurScript], a
	rst TextScriptEnd

.PreBattleText:
	text_far _SaffronGymSabrinaText
	text_end

.ReceivedMarshBadgeText:
	text_far _SaffronGymSabrinaReceivedMarshBadgeText
	; marcelnote - had sound_get_key_item but played only the SFX_BALL_POOF 2nd channel due to the battle audio bank
	text_end

.PostBattleAdviceText:
	text_far _SaffronGymSabrinaPostBattleAdviceText
	text_end

SaffronGymSabrinaMarshBadgeInfoText:
	text_far _SaffronGymSabrinaMarshBadgeInfoText
	text_end

SaffronGymSabrinaReceivedTM46Text:
	text_far _SaffronGymSabrinaReceivedTM46Text
	sound_get_item_1
	text_far _TM46ExplanationText
	text_end

SaffronGymSabrinaTM46NoRoomText:
	text_far _SaffronGymSabrinaTM46NoRoomText
	text_end

SaffronGymChanneler1Text:
	text_asm
	ld hl, SaffronGymTrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd

SaffronGymYoungster1Text:
	text_asm
	ld hl, SaffronGymTrainerHeader1
	call TalkToTrainer
	rst TextScriptEnd

SaffronGymChanneler2Text:
	text_asm
	ld hl, SaffronGymTrainerHeader2
	call TalkToTrainer
	rst TextScriptEnd

SaffronGymYoungster2Text:
	text_asm
	ld hl, SaffronGymTrainerHeader3
	call TalkToTrainer
	rst TextScriptEnd

SaffronGymChanneler3Text:
	text_asm
	ld hl, SaffronGymTrainerHeader4
	call TalkToTrainer
	rst TextScriptEnd

SaffronGymYoungster3Text:
	text_asm
	ld hl, SaffronGymTrainerHeader5
	call TalkToTrainer
	rst TextScriptEnd

SaffronGymYoungster4Text:
	text_asm
	ld hl, SaffronGymTrainerHeader6
	call TalkToTrainer
	rst TextScriptEnd

SaffronGymGymGuideText: ; marcelnote - optimized
	text_asm
	CheckEvent EVENT_BEAT_SABRINA
	ld hl, .BeatSabrinaText
	ret nz
	ld hl, .ChampInMakingText
	ret

.ChampInMakingText:
	text_far _SaffronGymGuideChampInMakingText
	text_end

.BeatSabrinaText:
	text_far _SaffronGymGuideBeatSabrinaText
	text_end

SaffronGymChanneler1BattleText:
	text_far _SaffronGymChanneler1BattleText
	text_end

SaffronGymChanneler1EndBattleText:
	text_far _SaffronGymChanneler1EndBattleText
	text_end

SaffronGymChanneler1AfterBattleText:
	text_far _SaffronGymChanneler1AfterBattleText
	text_end

SaffronGymYoungster1BattleText:
	text_far _SaffronGymYoungster1BattleText
	text_end

SaffronGymYoungster1EndBattleText:
	text_far _SaffronGymYoungster1EndBattleText
	text_end

SaffronGymYoungster1AfterBattleText:
	text_far _SaffronGymYoungster1AfterBattleText
	text_end

SaffronGymChanneler2BattleText:
	text_far _SaffronGymChanneler2BattleText
	text_end

SaffronGymChanneler2EndBattleText:
	text_far _SaffronGymChanneler2EndBattleText
	text_end

SaffronGymChanneler2AfterBattleText:
	text_far _SaffronGymChanneler2AfterBattleText
	text_end

SaffronGymYoungster2BattleText:
	text_far _SaffronGymYoungster2BattleText
	text_end

SaffronGymYoungster2EndBattleText:
	text_far _SaffronGymYoungster2EndBattleText
	text_end

SaffronGymYoungster2AfterBattleText:
	text_far _SaffronGymYoungster2AfterBattleText
	text_end

SaffronGymChanneler3BattleText:
	text_far _SaffronGymChanneler3BattleText
	text_end

SaffronGymChanneler3EndBattleText:
	text_far _SaffronGymChanneler3EndBattleText
	text_end

SaffronGymChanneler3AfterBattleText:
	text_far _SaffronGymChanneler3AfterBattleText
	text_end

SaffronGymYoungster3BattleText:
	text_far _SaffronGymYoungster3BattleText
	text_end

SaffronGymYoungster3EndBattleText:
	text_far _SaffronGymYoungster3EndBattleText
	text_end

SaffronGymYoungster3AfterBattleText:
	text_far _SaffronGymYoungster3AfterBattleText
	text_end

SaffronGymYoungster4BattleText:
	text_far _SaffronGymYoungster4BattleText
	text_end

SaffronGymYoungster4EndBattleText:
	text_far _SaffronGymYoungster4EndBattleText
	text_end

SaffronGymYoungster4AfterBattleText:
	text_far _SaffronGymYoungster4AfterBattleText
	text_end

SaffronGymWillText: ; marcelnote - postgame Will
	text_asm
	CheckHideShow TOGGLE_FIGHTING_DOJO_BRUNO
	ld hl, .PostBattleText
	ret nz
	ld hl, .WelcomeText
	call PrintText
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, .DefeatedText
	ld de, .DefeatedText
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, SCRIPT_SAFFRONGYM_BRUNO_ARRIVES
	ld [wSaffronGymCurScript], a
	rst TextScriptEnd

.WelcomeText:
	text_far _SaffronGymWillWelcomeText
	text_end

.DefeatedText:
	text_far _SaffronGymWillDefeatedText
	text_end

.PostBattleText:
	text_far _SaffronGymWillPostBattleText
	text_end

SaffronGymBrunoArrivesText: ; marcelnote - postgame Bruno
	text_far _SaffronGymBrunoArrivesText
	text_end

SaffronGymBrunoInspiringText: ; marcelnote - postgame Bruno
	text_far _SaffronGymBrunoInspiringText
	text_end

SaffronGymSabrinaRematchText: ; marcelnote - Sabrina rematch
	text_asm
	CheckEvent EVENT_BEAT_SABRINA_REMATCH
	ld hl, SaffronGymAfterRematchText
	ret nz
	ld hl, .PreBattleText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .refused
	ld hl, .AcceptBattleText
	call PrintText
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, .SabrinaDefeatedText
	ld de, .SabrinaDefeatedText
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, $6
	ld [wGymLeaderNo], a
	ld a, SCRIPT_SAFFRONGYM_SABRINA_REMATCH_POST_BATTLE
	ld [wSaffronGymCurScript], a
	rst TextScriptEnd
.refused
	ld hl, .RefusedBattleText
	call PrintText
	rst TextScriptEnd

.PreBattleText:
	text_far _SaffronGymSabrinaRematchPreBattleText
	text_end

.AcceptBattleText:
	text_far _SaffronGymSabrinaRematchAcceptBattleText
	text_end

.RefusedBattleText:
	text_far _SaffronGymSabrinaRematchRefusedBattleText
	text_end

.SabrinaDefeatedText:
	text_far _SaffronGymSabrinaRematchDefeatedText
	text_end

SaffronGymAfterRematchText: ; marcelnote - Sabrina rematch
	text_far _SaffronGymAfterRematchText
	text_end
