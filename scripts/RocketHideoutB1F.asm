RocketHideoutB1F_Script:
	call RocketHideoutB1FDoorCallbackScript
	call EnableAutoTextBoxDrawing
	ld hl, RocketHideoutB1FTrainerHeaders
	ld de, RocketHideoutB1F_ScriptPointers
	ld a, [wRocketHideoutB1FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wRocketHideoutB1FCurScript], a
	ret

RocketHideoutB1FDoorCallbackScript: ; marcelnote - modified and fixed bug
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	ret z
	res BIT_CUR_MAP_LOADED_1, [hl]
	CheckEvent EVENT_ROCKET_HIDEOUT_B1F_DOOR_UNLOCKED
	ret nz
	CheckEvent EVENT_BEAT_ROCKET_HIDEOUT_B1F_TRAINER_4
	ld a, $54 ; door
	jr z, .placeBlock
	SetEvent EVENT_ROCKET_HIDEOUT_B1F_DOOR_UNLOCKED
	ld a, SFX_GO_INSIDE
	call PlaySound
	ld a, $0e ; floor
.placeBlock
	ld [wNewTileBlockID], a
	lb bc, 8, 12
	predef_jump ReplaceTileBlock

RocketHideoutB1F_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_ROCKETHIDEOUTB1F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROCKETHIDEOUTB1F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROCKETHIDEOUTB1F_END_BATTLE

RocketHideoutB1F_TextPointers:
	def_text_pointers
	dw_const RocketHideoutB1FRocket1Text, TEXT_ROCKETHIDEOUTB1F_ROCKET1
	dw_const RocketHideoutB1FRocket2Text, TEXT_ROCKETHIDEOUTB1F_ROCKET2
	dw_const RocketHideoutB1FRocket3Text, TEXT_ROCKETHIDEOUTB1F_ROCKET3
	dw_const RocketHideoutB1FRocket4Text, TEXT_ROCKETHIDEOUTB1F_ROCKET4
	dw_const RocketHideoutB1FRocket5Text, TEXT_ROCKETHIDEOUTB1F_ROCKET5
	dw_const PickUpItemText,              TEXT_ROCKETHIDEOUTB1F_ESCAPE_ROPE
	dw_const PickUpItemText,              TEXT_ROCKETHIDEOUTB1F_HYPER_POTION

RocketHideoutB1FTrainerHeaders:
	def_trainers
RocketHideoutB1FTrainerHeader0:
	trainer EVENT_BEAT_ROCKET_HIDEOUT_B1F_TRAINER_0, 3, RocketHideoutB1FRocket1BattleText, RocketHideoutB1FRocket1EndBattleText, RocketHideoutB1FRocket1AfterBattleText
RocketHideoutB1FTrainerHeader1:
	trainer EVENT_BEAT_ROCKET_HIDEOUT_B1F_TRAINER_1, 2, RocketHideoutB1FRocket2BattleText, RocketHideoutB1FRocket2EndBattleText, RocketHideoutB1FRocket2AfterBattleText
RocketHideoutB1FTrainerHeader2:
	trainer EVENT_BEAT_ROCKET_HIDEOUT_B1F_TRAINER_2, 2, RocketHideoutB1FRocket3BattleText, RocketHideoutB1FRocket3EndBattleText, RocketHideoutB1FRocket3AfterBattleText
RocketHideoutB1FTrainerHeader3:
	trainer EVENT_BEAT_ROCKET_HIDEOUT_B1F_TRAINER_3, 3, RocketHideoutB1FRocket4BattleText, RocketHideoutB1FRocket4EndBattleText, RocketHideoutB1FRocket4AfterBattleText
RocketHideoutB1FTrainerHeader4:
	trainer EVENT_BEAT_ROCKET_HIDEOUT_B1F_TRAINER_4, 3, RocketHideoutB1FRocket5BattleText, RocketHideoutB1FRocket5EndBattleText, RocketHideoutB1FRocket5AfterBattleText
	db -1 ; end

RocketHideoutB1FRocket1Text:
	text_asm
	ld hl, RocketHideoutB1FTrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd

RocketHideoutB1FRocket2Text:
	text_asm
	ld hl, RocketHideoutB1FTrainerHeader1
	call TalkToTrainer
	rst TextScriptEnd

RocketHideoutB1FRocket3Text:
	text_asm
	ld hl, RocketHideoutB1FTrainerHeader2
	call TalkToTrainer
	rst TextScriptEnd

RocketHideoutB1FRocket4Text:
	text_asm
	ld hl, RocketHideoutB1FTrainerHeader3
	call TalkToTrainer
	rst TextScriptEnd

RocketHideoutB1FRocket5Text:
	text_asm
	ld hl, RocketHideoutB1FTrainerHeader4
	call TalkToTrainer
	rst TextScriptEnd

RocketHideoutB1FRocket5EndBattleText:
	text_far _RocketHideoutB1FRocket5EndBattleText
	text_end

RocketHideoutB1FRocket1BattleText:
	text_far _RocketHideoutB1FRocket1BattleText
	text_end

RocketHideoutB1FRocket1EndBattleText:
	text_far _RocketHideoutB1FRocket1EndBattleText
	text_end

RocketHideoutB1FRocket1AfterBattleText:
	text_far _RocketHideoutB1FRocket1AfterBattleText
	text_end

RocketHideoutB1FRocket2BattleText:
	text_far _RocketHideoutB1FRocket2BattleText
	text_end

RocketHideoutB1FRocket2EndBattleText:
	text_far _RocketHideoutB1FRocket2EndBattleText
	text_end

RocketHideoutB1FRocket2AfterBattleText:
	text_far _RocketHideoutB1FRocket2AfterBattleText
	text_end

RocketHideoutB1FRocket3BattleText:
	text_far _RocketHideoutB1FRocket3BattleText
	text_end

RocketHideoutB1FRocket3EndBattleText:
	text_far _RocketHideoutB1FRocket3EndBattleText
	text_end

RocketHideoutB1FRocket3AfterBattleText:
	text_far _RocketHideoutB1FRocket3AfterBattleText
	text_end

RocketHideoutB1FRocket4BattleText:
	text_far _RocketHideoutB1FRocket4BattleText
	text_end

RocketHideoutB1FRocket4EndBattleText:
	text_far _RocketHideoutB1FRocket4EndBattleText
	text_end

RocketHideoutB1FRocket4AfterBattleText:
	text_far _RocketHideoutB1FRocket4AfterBattleText
	text_end

RocketHideoutB1FRocket5BattleText:
	text_far _RocketHideoutB1FRocket5BattleText
	text_end

RocketHideoutB1FRocket5AfterBattleText:
	text_far _RocketHideoutB1FRocket5AfterBattleText
	text_end
