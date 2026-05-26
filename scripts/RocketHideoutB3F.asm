RocketHideoutB3F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, RocketHideoutB3FTrainerHeaders
	ld de, RocketHideoutB3F_ScriptPointers
	ld a, [wRocketHideoutB3FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wRocketHideoutB3FCurScript], a
	ret

RocketHideoutB3F_ScriptPointers:
	def_script_pointers
	dw_const RocketHideoutB3FDefaultScript,         SCRIPT_ROCKETHIDEOUTB3F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROCKETHIDEOUTB3F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROCKETHIDEOUTB3F_END_BATTLE

RocketHideoutB3FDefaultScript: ; marcelnote - modified spinners engine
	callfar CheckStartStopSpinning
	ld hl, wMovementFlags
	bit BIT_SPINNING, [hl]
	jp z, CheckFightingMapTrainers
	jpfar LoadSpinnerArrowTiles

RocketHideoutB3F_TextPointers:
	def_text_pointers
	dw_const RocketHideoutB3FRocket1Text, TEXT_ROCKETHIDEOUTB3F_ROCKET1
	dw_const RocketHideoutB3FRocket2Text, TEXT_ROCKETHIDEOUTB3F_ROCKET2
	dw_const PickUpItemText,              TEXT_ROCKETHIDEOUTB3F_TM_DOUBLE_EDGE
	dw_const PickUpItemText,              TEXT_ROCKETHIDEOUTB3F_RARE_CANDY

RocketHideoutB3FTrainerHeaders:
	def_trainers
RocketHideoutB3FTrainerHeader0:
	trainer EVENT_BEAT_ROCKET_HIDEOUT_B3F_TRAINER_0, 2, RocketHideoutB3FRocket1BattleText, RocketHideoutB3FRocket1EndBattleText, RocketHideoutB3FRocket1AfterBattleText
RocketHideoutB3FTrainerHeader1:
	trainer EVENT_BEAT_ROCKET_HIDEOUT_B3F_TRAINER_1, 4, RocketHideoutB3FRocket2BattleText, RocketHideoutB3FRocket2EndBattleText, RocketHideoutB3FRocket2AfterBattleText
	db -1 ; end

RocketHideoutB3FRocket1Text:
	text_asm
	ld hl, RocketHideoutB3FTrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd

RocketHideoutB3FRocket1BattleText:
	text_far _RocketHideoutB3FRocket1BattleText
	text_end

RocketHideoutB3FRocket1EndBattleText:
	text_far _RocketHideoutB3FRocket1EndBattleText
	text_end

RocketHideoutB3FRocket1AfterBattleText:
	text_far _RocketHideoutB3FRocket1AfterBattleText
	text_end

RocketHideoutB3FRocket2Text:
	text_asm
	ld hl, RocketHideoutB3FTrainerHeader1
	call TalkToTrainer
	rst TextScriptEnd

RocketHideoutB3FRocket2BattleText:
	text_far _RocketHideout3BattleText
	text_end

RocketHideoutB3FRocket2EndBattleText:
	text_far _RocketHideout3EndBattleText3
	text_end

RocketHideoutB3FRocket2AfterBattleText:
	text_far _RocketHide3AfterBattleText3
	text_end
