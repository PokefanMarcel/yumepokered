; marcelnote - new location
SilphFactory2F_Script:
	call SilphFactory2FGateCallbackScript
	call EnableAutoTextBoxDrawing
	ld hl, SilphFactory2FTrainerHeaders
	ld de, SilphFactory2F_ScriptPointers
	ld a, [wSilphFactory2FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSilphFactory2FCurScript], a
	ret

SilphFactory2FResetScripts:
	xor a
	ld [wJoyIgnore], a
	ld [wSilphFactory2FCurScript], a
	ld [wCurMapScript], a
	ret

SilphFactory2FGateCallbackScript: ; marcelnote - adapted from SilphCo9FGateCallbackScript
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	ret z
	ld hl, .GateCoordinates
	call SilphFactory2F_SetCardKeyDoorYScript
	call SilphFactory2F_SetUnlockedDoorsScript
	CheckEvent EVENT_SILPH_FACTORY_2F_UNLOCKED_DOOR1
	jr nz, .unlock_door1
	push af
	ld a, $2d
	ld [wNewTileBlockID], a
	lb bc, 7, 11
	predef ReplaceTileBlock
	pop af
.unlock_door1
	CheckEventAfterBranchReuseA EVENT_SILPH_FACTORY_2F_UNLOCKED_DOOR2, EVENT_SILPH_FACTORY_2F_UNLOCKED_DOOR1
	ret nz
	ld a, $54
	ld [wNewTileBlockID], a
	lb bc, 9, 13
	predef ReplaceTileBlock

.GateCoordinates:
	dbmapcoord 11,  7
	dbmapcoord 13,  9
	db -1 ; end

SilphFactory2F_SetCardKeyDoorYScript:
	push hl
	ld hl, wCardKeyDoorY
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	xor a
	ldh [hUnlockedSilphCoDoors], a
	pop hl
.loop_card_key_doors
	ld a, [hli]
	cp $ff
	jr z, .exit_loop
	push hl
	ld hl, hUnlockedSilphCoDoors
	inc [hl]
	pop hl
	cp b
	jr z, .check_door
	inc hl
	jr .loop_card_key_doors
.check_door
	ld a, [hli]
	cp c
	jr nz, .loop_card_key_doors
	ld hl, wCardKeyDoorY
	xor a
	ld [hli], a
	ld [hl], a
	ret
.exit_loop
	xor a
	ldh [hUnlockedSilphCoDoors], a
	ret

SilphFactory2F_SetUnlockedDoorsScript:
	EventFlagAddress hl, EVENT_SILPH_FACTORY_2F_UNLOCKED_DOOR1
	ldh a, [hUnlockedSilphCoDoors]
	and a
	ret z
	cp $1
	jr nz, .unlock_door1
	SetEventReuseHL EVENT_SILPH_FACTORY_2F_UNLOCKED_DOOR1
	ret
.unlock_door1
	cp $2
	ret nz
	SetEventAfterBranchReuseHL EVENT_SILPH_FACTORY_2F_UNLOCKED_DOOR2, EVENT_SILPH_FACTORY_2F_UNLOCKED_DOOR1
	ret

SilphFactory2F_ScriptPointers:
	def_script_pointers
	dw_const SilphFactory2FDefaultScript,             SCRIPT_SILPHFACTORY2F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle,   SCRIPT_SILPHFACTORY2F_START_BATTLE
	dw_const EndTrainerBattle,                        SCRIPT_SILPHFACTORY2F_END_BATTLE
	dw_const SilphFactory2FRocketPostBattle,          SCRIPT_SILPHFACTORY2F_ROCKET_POST_BATTLE
	dw_const SilphFactory2FPlayerSpinningScript,      SCRIPT_SILPHFACTORY2F_PLAYER_SPINNING
	dw_const SilphFactory2FLoreleiGoesUpstairsScript, SCRIPT_SILPHFACTORY2F_LORELEI_GOES_UPSTAIRS
	dw_const SilphFactory2FLoreleiHideScript,         SCRIPT_SILPHFACTORY2F_LORELEI_HIDE
	dw_const SilphFactory2FLoreleiAfterBattleScript,  SCRIPT_SILPHFACTORY2F_LORELEI_AFTER_BATTLE
	dw_const SilphFactory2FLoreleiLeavesScript,       SCRIPT_SILPHFACTORY2F_LORELEI_LEAVES

SilphFactory2FDefaultScript:
	ld a, [wYCoord]
	ld b, a
	ld a, [wXCoord]
	ld c, a
	ld hl, SilphFactory2FArrowTilePlayerMovement
	call DecodeArrowMovementRLE
	cp $ff
	jp z, CheckFightingMapTrainers
	call StartSimulatingJoypadStates
	ld hl, wMovementFlags
	set BIT_SPINNING, [hl]
	ld a, SFX_ARROW_TILES
	call PlaySound
	ld a, A_BUTTON | B_BUTTON | SELECT | START | D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoyIgnore], a
	ld a, SCRIPT_SILPHFACTORY2F_PLAYER_SPINNING
	ld [wCurMapScript], a
	ret

SilphFactory2FArrowTilePlayerMovement:
	map_coord_movement 20,  3, SilphFactory2FArrowMovement1
	map_coord_movement 24,  3, SilphFactory2FArrowMovement2
	map_coord_movement 21,  4, SilphFactory2FArrowMovement3
	map_coord_movement 23,  4, SilphFactory2FArrowMovement4
	map_coord_movement 16,  5, SilphFactory2FArrowMovement5
	map_coord_movement 18,  5, SilphFactory2FArrowMovement6
	map_coord_movement 20,  5, SilphFactory2FArrowMovement7
	map_coord_movement 23,  5, SilphFactory2FArrowMovement8
	map_coord_movement 19,  6, SilphFactory2FArrowMovement9
	map_coord_movement 21,  6, SilphFactory2FArrowMovement10
	map_coord_movement 16,  7, SilphFactory2FArrowMovement11
	map_coord_movement 18,  7, SilphFactory2FArrowMovement12
	map_coord_movement 20,  7, SilphFactory2FArrowMovement13
	map_coord_movement 24,  7, SilphFactory2FArrowMovement14
	map_coord_movement 27,  7, SilphFactory2FArrowMovement15
	map_coord_movement 19,  8, SilphFactory2FArrowMovement16
	map_coord_movement 21,  8, SilphFactory2FArrowMovement17
	map_coord_movement 23,  8, SilphFactory2FArrowMovement18
	map_coord_movement 16,  9, SilphFactory2FArrowMovement19
	map_coord_movement 18,  9, SilphFactory2FArrowMovement20
	map_coord_movement 20,  9, SilphFactory2FArrowMovement21
	map_coord_movement 22,  9, SilphFactory2FArrowMovement22
	map_coord_movement 24,  9, SilphFactory2FArrowMovement23
	map_coord_movement 21, 10, SilphFactory2FArrowMovement24
	map_coord_movement 23, 10, SilphFactory2FArrowMovement25
	map_coord_movement 20, 11, SilphFactory2FArrowMovement26
	map_coord_movement 22, 11, SilphFactory2FArrowMovement27
	map_coord_movement 24, 11, SilphFactory2FArrowMovement28
	map_coord_movement 26, 11, SilphFactory2FArrowMovement29
	map_coord_movement 21, 12, SilphFactory2FArrowMovement30
	map_coord_movement 23, 12, SilphFactory2FArrowMovement31
	map_coord_movement 26, 12, SilphFactory2FArrowMovement32
	map_coord_movement 20, 13, SilphFactory2FArrowMovement33
	map_coord_movement 22, 13, SilphFactory2FArrowMovement34
	db -1 ; end

;format: direction, count
;each list is read starting from the $FF and working backwards
SilphFactory2FArrowMovement1:
	db D_LEFT, 4
	db -1 ; end

SilphFactory2FArrowMovement2:
	db D_LEFT, 8
	db -1 ; end

SilphFactory2FArrowMovement3:
	db D_LEFT, 1
	db D_UP, 1
	db D_RIGHT, 3
	db D_DOWN, 2
	db D_RIGHT, 2
	db D_DOWN, 6
	db -1 ; end

SilphFactory2FArrowMovement4:
	db D_LEFT, 1
	db D_UP, 1
	db D_RIGHT, 3
	db D_DOWN, 2
	db D_RIGHT, 2
	db D_DOWN, 6
	db D_LEFT, 2
	db -1 ; end

SilphFactory2FArrowMovement5:
	db D_LEFT, 4
	db D_UP, 2
	db D_RIGHT, 4
	db -1 ; end

SilphFactory2FArrowMovement6:
	db D_LEFT, 4
	db D_UP, 2
	db D_RIGHT, 2
	db -1 ; end

SilphFactory2FArrowMovement7:
	db D_LEFT, 4
	db D_UP, 2
	db -1 ; end

SilphFactory2FArrowMovement8:
	db D_LEFT, 4
	db D_UP, 2
	db D_LEFT, 3
	db -1 ; end

SilphFactory2FArrowMovement9:
	db D_LEFT, 1
	db D_UP, 1
	db D_RIGHT, 3
	db D_DOWN, 2
	db D_RIGHT, 2
	db D_DOWN, 2
	db D_RIGHT, 2
	db D_DOWN, 2
	db -1 ; end

SilphFactory2FArrowMovement10:
	db D_LEFT, 1
	db D_UP, 1
	db D_RIGHT, 3
	db D_DOWN, 2
	db D_RIGHT, 2
	db D_DOWN, 4
	db -1 ; end

SilphFactory2FArrowMovement11:
	db D_LEFT, 4
	db D_UP, 2
	db D_RIGHT, 2
	db D_UP, 2
	db D_RIGHT, 2
	db -1 ; end

SilphFactory2FArrowMovement12:
	db D_LEFT, 4
	db D_UP, 2
	db D_RIGHT, 2
	db D_UP, 2
	db -1 ; end

SilphFactory2FArrowMovement13:
	db D_RIGHT, 2
	db -1 ; end

SilphFactory2FArrowMovement14:
	db D_UP, 4
	db D_RIGHT, 3
	db -1 ; end

SilphFactory2FArrowMovement15:
	db D_UP, 4
	db -1 ; end

SilphFactory2FArrowMovement16:
	db D_LEFT, 1
	db D_UP, 1
	db D_RIGHT, 3
	db D_DOWN, 2
	db D_RIGHT, 2
	db D_DOWN, 2
	db D_RIGHT, 2
	db -1 ; end

SilphFactory2FArrowMovement17:
	db D_LEFT, 1
	db D_UP, 1
	db D_RIGHT, 3
	db D_DOWN, 2
	db D_RIGHT, 2
	db D_DOWN, 2
	db -1 ; end

SilphFactory2FArrowMovement18:
	db D_LEFT, 1
	db D_UP, 1
	db D_RIGHT, 3
	db D_DOWN, 4
	db -1 ; end

SilphFactory2FArrowMovement19:
	db D_RIGHT, 2
	db D_UP, 2
	db D_RIGHT, 4
	db -1 ; end

SilphFactory2FArrowMovement20:
	db D_RIGHT, 2
	db D_UP, 2
	db D_RIGHT, 2
	db -1 ; end

SilphFactory2FArrowMovement21:
	db D_RIGHT, 2
	db D_UP, 2
	db -1 ; end

SilphFactory2FArrowMovement22:
	db D_RIGHT, 4
	db -1 ; end

SilphFactory2FArrowMovement23:
	db D_RIGHT, 2
	db -1 ; end

SilphFactory2FArrowMovement24:
	db D_LEFT, 1
	db D_UP, 1
	db D_RIGHT, 3
	db D_DOWN, 2
	db D_RIGHT, 2
	db -1 ; end

SilphFactory2FArrowMovement25:
	db D_LEFT, 1
	db D_UP, 1
	db D_RIGHT, 3
	db D_DOWN, 2
	db -1 ; end

SilphFactory2FArrowMovement26:
	db D_RIGHT, 2
	db D_UP, 4
	db -1 ; end

SilphFactory2FArrowMovement27:
	db D_RIGHT, 4
	db D_UP, 2
	db -1 ; end

SilphFactory2FArrowMovement28:
	db D_RIGHT, 1
	db -1 ; end

SilphFactory2FArrowMovement29:
	db D_LEFT, 1
	db -1 ; end

SilphFactory2FArrowMovement30:
	db D_LEFT, 1
	db D_UP, 1
	db D_RIGHT, 5
	db -1 ; end

SilphFactory2FArrowMovement31:
	db D_LEFT, 1
	db D_UP, 1
	db D_RIGHT, 3
	db -1 ; end

SilphFactory2FArrowMovement32:
	db D_LEFT, 1
	db D_UP, 1
	db -1 ; end

SilphFactory2FArrowMovement33:
	db D_RIGHT, 2
	db D_UP, 6
	db -1 ; end

SilphFactory2FArrowMovement34:
	db D_RIGHT, 4
	db D_UP, 4
	db -1 ; end

SilphFactory2FPlayerSpinningScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	jr nz, .LoadSpinnerArrow
	xor a
	ld [wJoyIgnore], a
	ld hl, wMovementFlags
	res BIT_SPINNING, [hl]
	ld a, SCRIPT_SILPHFACTORY2F_DEFAULT
	ld [wCurMapScript], a
	ret
.LoadSpinnerArrow
	farjp LoadSpinnerArrowTiles

SilphFactory2FLoreleiGoesUpstairsScript: ; marcelnote - adapted from PokemonTower2F rival script
	xor a
	ldh [hJoyHeld], a
	ldh [hJoyPressed], a
	ld a, D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoyIgnore], a
	ld de, .LoreleiMovement
	ld a, SILPHFACTORY2F_LORELEI1
	ldh [hSpriteIndex], a
	call MoveSprite
	ld a, SCRIPT_SILPHFACTORY2F_LORELEI_HIDE
	ld [wSilphFactory2FCurScript], a
	ld [wCurMapScript], a
	ret

.LoreleiMovement:
	db NPC_MOVEMENT_RIGHT
	db -1 ; end

SilphFactory2FLoreleiHideScript:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	ld a, HS_SILPH_FACTORY_2F_LORELEI_1
	ld [wMissableObjectIndex], a
	predef HideObjectCont
	xor a
	ld [wJoyIgnore], a
	ld a, SCRIPT_SILPHFACTORY2F_DEFAULT
	ld [wSilphFactory2FCurScript], a
	ld [wCurMapScript], a
	ret

SilphFactory2FRocketPostBattle:
	ld a, [wIsInBattle]
	cp $ff
	jp z, SilphFactory2FResetScripts
	call UpdateSprites
	ld a, TEXT_SILPHFACTORY2F_SILPH_ROCKET1_AFTER_BATTLE
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	call Delay3
	call GBFadeOutToBlack
	SetEvent EVENT_BEAT_SILPH_FACTORY_2F_TRAINER_0
	ld a, HS_SILPH_FACTORY_2F_ROCKET_1
	ld [wMissableObjectIndex], a
	predef HideObjectCont
	ld a, HS_SILPH_FACTORY_1F_ROCKET_1
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, HS_SILPH_FACTORY_1F_ROCKET_2
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, HS_SILPH_FACTORY_1F_ROCKET_3
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, HS_SILPH_FACTORY_1F_ROCKET_4
	ld [wMissableObjectIndex], a
	predef HideObject
	call UpdateSprites
	call Delay3
	call GBFadeInFromBlack
	call Delay3
	ld a, TEXT_SILPHFACTORY2F_LORELEI_ARRIVES
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, A_BUTTON | B_BUTTON | SELECT | START | D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoyIgnore], a
	ld a, HS_SILPH_FACTORY_2F_LORELEI_2
	ld [wMissableObjectIndex], a
	predef ShowObjectCont
	;ld a, A_BUTTON | B_BUTTON | SELECT | START | D_RIGHT | D_LEFT | D_UP | D_DOWN
	;ld [wJoyIgnore], a
	ld de, .LoreleiArrivesMovementLong
	ld a, [wXCoord]
	cp 26
	jr nz, .MoveLorelei
	ld a, PLAYER_DIR_UP
	ld [wPlayerMovingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld de, .LoreleiArrivesMovementShort
.MoveLorelei
	ld a, SILPHFACTORY2F_LORELEI2
	ldh [hSpriteIndex], a
	call MoveSprite
	ld a, SCRIPT_SILPHFACTORY2F_LORELEI_AFTER_BATTLE
	ld [wSilphFactory2FCurScript], a
	ld [wCurMapScript], a
	ret

.LoreleiArrivesMovementShort:
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db -1 ; end

.LoreleiArrivesMovementLong:
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_LEFT
	db -1 ; end

SilphFactory2FLoreleiAfterBattleScript:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld a, TEXT_SILPHFACTORY2F_LORELEI_TAKE_CARE
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	call Delay3
	ld a, A_BUTTON | B_BUTTON | SELECT | START | D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoyIgnore], a
	ld de, .LoreleiDepartsMovementLong
	ld a, [wXCoord]
	cp 26
	jr nz, .MoveLorelei
	ld de, .LoreleiDepartsMovementShort
.MoveLorelei
	ld a, SILPHFACTORY2F_LORELEI2
	ldh [hSpriteIndex], a
	call MoveSprite
	ld a, SCRIPT_SILPHFACTORY2F_LORELEI_LEAVES
	ld [wSilphFactory2FCurScript], a
	ld [wCurMapScript], a
	ret

.LoreleiDepartsMovementShort:
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db -1 ; end

.LoreleiDepartsMovementLong:
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db -1 ; end


SilphFactory2FLoreleiLeavesScript:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	ld a, HS_SILPH_FACTORY_2F_LORELEI_2
	ld [wMissableObjectIndex], a
	predef HideObjectCont
	call UpdateSprites
	call Delay3
	SetEvent EVENT_POSTGAME_LORELEI
	CheckBothEventsSet EVENT_POSTGAME_BRUNO, EVENT_POSTGAME_AGATHA ; sets Z flag when events are set
	jr nz, .end
	CheckBothEventsSet EVENT_POSTGAME_LANCE, EVENT_POSTGAME_RIVAL
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
	ld a, SCRIPT_SILPHFACTORY2F_DEFAULT
	ld [wSilphFactory2FCurScript], a
	ld [wCurMapScript], a
	ret


SilphFactory2F_TextPointers:
	def_text_pointers
	dw_const SilphFactory2FRocket1Text,              TEXT_SILPHFACTORY2F_ROCKET1
	dw_const SilphFactory2FScientist1Text,           TEXT_SILPHFACTORY2F_SCIENTIST1
	dw_const SilphFactory2FScientist2Text,           TEXT_SILPHFACTORY2F_SCIENTIST2
	dw_const SilphFactory2FScientist3Text,           TEXT_SILPHFACTORY2F_SCIENTIST3
	dw_const SilphFactory2FSilphWorkerMText,         TEXT_SILPHFACTORY2F_SILPH_WORKER_M
	dw_const SilphFactory2FLoreleiGladToSeeYouText,  TEXT_SILPHFACTORY2F_LORELEI_GLAD_TO_SEE_YOU
	dw_const SilphFactory2FLoreleiArrivesText,       TEXT_SILPHFACTORY2F_LORELEI_ARRIVES
	dw_const SilphFactory2FLoreleiTakeCareText,      TEXT_SILPHFACTORY2F_LORELEI_TAKE_CARE
	dw_const SilphFactory2FRocket1AfterBattleText,   TEXT_SILPHFACTORY2F_SILPH_ROCKET1_AFTER_BATTLE
	;dw_const PickUpItemText,                        TEXT_ROCKETHIDEOUTB1F_ESCAPE_ROPE

SilphFactory2FTrainerHeaders:
	def_trainers
;SilphFactory2FTrainerHeader0:
;	trainer EVENT_BEAT_SILPH_FACTORY_2F_TRAINER_0, 0, SilphFactory2FRocket1BattleText, SilphFactory2FRocket1EndBattleText, SilphFactory2FRocket1AfterBattleText
	db -1 ; end

SilphFactory2FRocket1Text:
	text_asm
	ld hl, .PreBattleText
	call PrintText
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, .EndBattleText
	ld de, .EndBattleText
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, SCRIPT_SILPHFACTORY2F_ROCKET_POST_BATTLE
	ld [wSilphFactory2FCurScript], a
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.PreBattleText:
	text_far _SilphFactory2FRocket1BattleText
	text_end

.EndBattleText:
	text_far _SilphFactory2FRocket1EndBattleText
	text_end

SilphFactory2FRocket1AfterBattleText:
	text_far _SilphFactory2FRocket1AfterBattleText
	text_end

SilphFactory2FScientist1Text:
	text_far _SilphFactory2FScientist1Text
	text_end

SilphFactory2FScientist2Text:
	text_asm
	CheckEvent EVENT_POSTGAME_LORELEI
	ld hl, .AfterEventText
	jr nz, .EventFinished
	ld hl, .DuringEventText
.EventFinished
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.DuringEventText:
	text_far _SilphFactory2FScientist2DuringEventText
	text_end

.AfterEventText:
	text_far _SilphFactory2FScientist2AfterEventText
	text_end

SilphFactory2FScientist3Text:
	text_asm
	CheckEvent EVENT_POSTGAME_LORELEI
	ld hl, .AfterEventText
	jr nz, .EventFinished
	ld hl, .DuringEventText
.EventFinished
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.DuringEventText:
	text_far _SilphFactory2FScientist3DuringEventText
	text_end

.AfterEventText:
	text_far _SilphFactory2FScientist3AfterEventText
	text_end

SilphFactory2FSilphWorkerMText:
	text_asm
	CheckEvent EVENT_SILPH_FACTORY_2F_CARD_KEY_UPDATED
	jr nz, .alreadyUpdated
	ld hl, .UpdateCardText
	call PrintText
	ld b, CARD_KEY
	call IsItemInBag
	ld hl, .NoCardText
	jr z, .print_text
	SetEvent EVENT_SILPH_FACTORY_2F_CARD_KEY_UPDATED
	ld hl, .CardWasUpdatedText
	jr .print_text
.alreadyUpdated
	ld hl, .HidHereText
.print_text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.UpdateCardText:
	text_far _SilphFactory2FSilphWorkerMUpdateCardText
	text_end

.NoCardText:
	text_far _SilphFactory2FSilphWorkerMNoCardText
	text_end

.CardWasUpdatedText:
	text_far _SilphFactory2FSilphWorkerMCardWasUpdatedText
	sound_get_item_1
	text_end

.HidHereText:
	text_far _SilphFactory2FSilphWorkerMHidHereText
	text_end

SilphFactory2FLoreleiGladToSeeYouText: ; marcelnote - postgame Lorelei
	text_asm
	ld hl, .text
	call PrintText
	ld a, SCRIPT_SILPHFACTORY2F_LORELEI_GOES_UPSTAIRS
	ld [wSilphFactory2FCurScript], a
	ld [wCurMapScript], a
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd
.text
	text_far _SilphFactory2FLoreleiGladToSeeYouText
	text_end

SilphFactory2FLoreleiArrivesText:
	text_far _SilphFactory2FLoreleiArrivesText
	text_end

SilphFactory2FLoreleiTakeCareText:
	text_far _SilphFactory2FLoreleiTakeCareText
	text_end