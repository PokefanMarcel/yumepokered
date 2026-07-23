RocketHideoutB2F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, RocketHideoutB2FTrainerHeaders
	ld de, RocketHideoutB2F_ScriptPointers
	ld bc, wRocketHideoutB2FCurScript
	jp ExecuteCurMapScriptInTable

RocketHideoutB2F_ScriptPointers:
	def_script_pointers
	dw_const RocketHideoutB2FDefaultScript,         SCRIPT_ROCKETHIDEOUTB2F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROCKETHIDEOUTB2F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROCKETHIDEOUTB2F_END_BATTLE

RocketHideoutB2FDefaultScript: ; marcelnote - modified spinners engine
	call CheckStartStopSpinning
	ld hl, wMovementFlags
	bit BIT_SPINNING, [hl]
	jp z, CheckFightingMapTrainers
	jp LoadSpinnerArrowTiles

INCLUDE "engine/overworld/spinners.asm"

RocketHideoutB2F_TextPointers:
	def_text_pointers
	dw_const RocketHideoutB2FRocketText, TEXT_ROCKETHIDEOUTB2F_ROCKET
	dw_const PickUpItemText,             TEXT_ROCKETHIDEOUTB2F_MOON_STONE
	dw_const PickUpItemText,             TEXT_ROCKETHIDEOUTB2F_NUGGET
	dw_const PickUpItemText,             TEXT_ROCKETHIDEOUTB2F_TM_HORN_DRILL
	dw_const PickUpItemText,             TEXT_ROCKETHIDEOUTB2F_SUPER_POTION

RocketHideoutB2FTrainerHeaders:
	def_trainers
RocketHideoutB2FTrainerHeader0:
	trainer EVENT_BEAT_ROCKET_HIDEOUT_B2F_TRAINER_0, 4, RocketHideoutB2FRocketBattleText, RocketHideoutB2FRocketEndBattleText, RocketHideoutB2FRocketAfterBattleText
	db -1 ; end

RocketHideoutB2FRocketText:
	text_asm
	ld hl, RocketHideoutB2FTrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd

RocketHideoutB2FRocketBattleText:
	text_far _RocketHideoutB2FRocketBattleText
	text_end

RocketHideoutB2FRocketEndBattleText:
	text_far _RocketHideoutB2FRocketEndBattleText
	text_end

RocketHideoutB2FRocketAfterBattleText:
	text_far _RocketHideoutB2FRocketAfterBattleText
	text_end
