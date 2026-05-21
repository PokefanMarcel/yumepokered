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
	ld hl, .GateCoordinates
	EventFlagAddress de, EVENT_SILPH_FACTORY_2F_UNLOCKED_DOOR1
	EventFlagBit c, EVENT_SILPH_FACTORY_2F_UNLOCKED_DOOR1
	jp SilphCoGateCallback

.GateCoordinates:
	dbgatecoord 11, 7, SILPH_FACTORY_CARD_KEY_GATE_BLOCK
	dbgatecoord 13, 9, FACILITY_CARD_KEY_GATE_BLOCK_1
	db -1 ; end

SilphFactory2F_ScriptPointers:
	def_script_pointers
	dw_const SilphFactory2FDefaultScript,             SCRIPT_SILPHFACTORY2F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle,   SCRIPT_SILPHFACTORY2F_START_BATTLE
	dw_const EndTrainerBattle,                        SCRIPT_SILPHFACTORY2F_END_BATTLE
	dw_const SilphFactory2FRocketPostBattle,          SCRIPT_SILPHFACTORY2F_ROCKET_POST_BATTLE
	dw_const SilphFactory2FLoreleiGoesUpstairsScript, SCRIPT_SILPHFACTORY2F_LORELEI_GOES_UPSTAIRS
	dw_const SilphFactory2FLoreleiHideScript,         SCRIPT_SILPHFACTORY2F_LORELEI_HIDE
	dw_const SilphFactory2FLoreleiAfterBattleScript,  SCRIPT_SILPHFACTORY2F_LORELEI_AFTER_BATTLE
	dw_const SilphFactory2FLoreleiLeavesScript,       SCRIPT_SILPHFACTORY2F_LORELEI_LEAVES

SilphFactory2FDefaultScript: ; marcelnote - modified spinners engine
	callfar CheckStartStopSpinning
	ld hl, wMovementFlags
	bit BIT_SPINNING, [hl]
	jp z, CheckFightingMapTrainers
	jpfar LoadSpinnerArrowTiles

SilphFactory2FLoreleiGoesUpstairsScript: ; marcelnote - adapted from PokemonTower2F rival script
	xor a
	ldh [hJoyHeld], a
	ldh [hJoyPressed], a
	ld a, PAD_CTRL_PAD
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
	ld a, TOGGLE_SILPH_FACTORY_2F_LORELEI_1
	ld [wToggleableObjectIndex], a
	predef HideObjectCont
	ld a, TOGGLE_MANDARIN_SILPH_CO_SCIENTIST ; also hide the worried Scientist in Mandarin Silph Co meeting room
	ld [wToggleableObjectIndex], a
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
	ldh [hTextID], a
	call DisplayTextID
	call Delay3
	call GBFadeOutToBlack
	SetEvent EVENT_BEAT_SILPH_FACTORY_2F_TRAINER_0
	ld a, TOGGLE_SILPH_FACTORY_2F_ROCKET_1
	ld [wToggleableObjectIndex], a
	predef HideObjectCont
	ld a, TOGGLE_SILPH_FACTORY_1F_ROCKET_1
	ld [wToggleableObjectIndex], a
	predef HideObject
	ld a, TOGGLE_SILPH_FACTORY_1F_ROCKET_2
	ld [wToggleableObjectIndex], a
	predef HideObject
	ld a, TOGGLE_SILPH_FACTORY_1F_ROCKET_3
	ld [wToggleableObjectIndex], a
	predef HideObject
	ld a, TOGGLE_SILPH_FACTORY_1F_ROCKET_4
	ld [wToggleableObjectIndex], a
	predef HideObject
	call UpdateSprites
	call Delay3
	call GBFadeInFromBlack
	call Delay3
	ld a, TEXT_SILPHFACTORY2F_LORELEI_ARRIVES
	ldh [hTextID], a
	call DisplayTextID
	ld a, PAD_BUTTONS | PAD_CTRL_PAD
	ld [wJoyIgnore], a
	ld a, TOGGLE_SILPH_FACTORY_2F_LORELEI_2
	ld [wToggleableObjectIndex], a
	predef ShowObjectCont
	;ld a, PAD_BUTTONS | PAD_CTRL_PAD
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
	ldh [hTextID], a
	call DisplayTextID
	call Delay3
	ld a, PAD_BUTTONS | PAD_CTRL_PAD
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
	ld a, TOGGLE_SILPH_FACTORY_2F_LORELEI_2
	ld [wToggleableObjectIndex], a
	predef HideObjectCont
	call UpdateSprites
	call Delay3
	SetEvent EVENT_POSTGAME_LORELEI
	CheckBothEventsSet EVENT_POSTGAME_BRUNO, EVENT_POSTGAME_AGATHA ; sets Z flag when events are set
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
	rst TextScriptEnd

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
	rst TextScriptEnd

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
	rst TextScriptEnd

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
	jr z, .printText
	SetEvent EVENT_SILPH_FACTORY_2F_CARD_KEY_UPDATED
	ld hl, .CardWasUpdatedText
	jr .printText
.alreadyUpdated
	ld hl, .HidHereText
.printText
	call PrintText
	rst TextScriptEnd

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
	rst TextScriptEnd
.text
	text_far _SilphFactory2FLoreleiGladToSeeYouText
	text_end

SilphFactory2FLoreleiArrivesText:
	text_far _SilphFactory2FLoreleiArrivesText
	text_end

SilphFactory2FLoreleiTakeCareText:
	text_far _SilphFactory2FLoreleiTakeCareText
	text_end
