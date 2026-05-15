SilphCo4F_Script:
	call SilphCo4FGateCallbackScript
	call EnableAutoTextBoxDrawing
	ld hl, SilphCo4TrainerHeaders
	ld de, SilphCo4F_ScriptPointers
	ld a, [wSilphCo4FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSilphCo4FCurScript], a
	ret

SilphCo4FGateCallbackScript: ; marcelnote - simplify Silph Co gates scripts
	ld hl, .GateCoordinates
	EventFlagAddress de, EVENT_SILPH_CO_4_UNLOCKED_DOOR1
	EventFlagBit c, EVENT_SILPH_CO_4_UNLOCKED_DOOR1
	jp SilphCoGateCallback

.GateCoordinates:
	dbgatecoord 2, 6, FACILITY_CARD_KEY_GATE_BLOCK_1
	dbgatecoord 6, 4, FACILITY_CARD_KEY_GATE_BLOCK_1
	db -1 ; end

SilphCo4F_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_SILPHCO4F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_SILPHCO4F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_SILPHCO4F_END_BATTLE

SilphCo4F_TextPointers:
	def_text_pointers
	dw_const SilphCo4FSilphWorkerMText, TEXT_SILPHCO4F_SILPH_WORKER_M
	dw_const SilphCo4FRocket1Text,      TEXT_SILPHCO4F_ROCKET1
	dw_const SilphCo4FScientistText,    TEXT_SILPHCO4F_SCIENTIST
	dw_const SilphCo4FRocket2Text,      TEXT_SILPHCO4F_ROCKET2
	dw_const PickUpItemText,            TEXT_SILPHCO4F_FULL_HEAL
	dw_const PickUpItemText,            TEXT_SILPHCO4F_MAX_REVIVE
	dw_const PickUpItemText,            TEXT_SILPHCO4F_ESCAPE_ROPE

SilphCo4TrainerHeaders:
	def_trainers 2
SilphCo4TrainerHeader0:
	trainer EVENT_BEAT_SILPH_CO_4F_TRAINER_0, 4, SilphCo4FRocket1BattleText, SilphCo4FRocket1EndBattleText, SilphCo4FRocket1AfterBattleText
SilphCo4TrainerHeader1:
	trainer EVENT_BEAT_SILPH_CO_4F_TRAINER_1, 3, SilphCo4FScientistBattleText, SilphCo4FScientistEndBattleText, SilphCo4FScientistAfterBattleText
SilphCo4TrainerHeader2:
	trainer EVENT_BEAT_SILPH_CO_4F_TRAINER_2, 4, SilphCo4FRocket2BattleText, SilphCo4FRocket2EndBattleText, SilphCo4FRocket2AfterBattleText
	db -1 ; end

SilphCo4FSilphWorkerMText:
	text_asm
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	ld hl, .TeamRocketIsGoneText
	jr nz, .print_text
	ld hl, .ImHidingText
.print_text
	call PrintText
	rst TextScriptEnd

.ImHidingText:
	text_far _SilphCo4FSilphWorkerMImHidingText
	text_end

.TeamRocketIsGoneText:
	text_far _SilphCo4FSilphWorkerMTeamRocketIsGoneText
	text_end

SilphCo4FRocket1Text:
	text_asm
	ld hl, SilphCo4TrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd

SilphCo4FRocket1BattleText:
	text_far _SilphCo4FRocket1BattleText
	text_end

SilphCo4FRocket1EndBattleText:
	text_far _SilphCo4FRocket1EndBattleText
	text_end

SilphCo4FRocket1AfterBattleText:
	text_far _SilphCo4FRocket1AfterBattleText
	text_end

SilphCo4FScientistText:
	text_asm
	ld hl, SilphCo4TrainerHeader1
	call TalkToTrainer
	rst TextScriptEnd

SilphCo4FScientistBattleText:
	text_far _SilphCo4FScientistBattleText
	text_end

SilphCo4FScientistEndBattleText:
	text_far _SilphCo4FScientistEndBattleText
	text_end

SilphCo4FScientistAfterBattleText:
	text_far _SilphCo4FScientistAfterBattleText
	text_end

SilphCo4FRocket2Text:
	text_asm
	ld hl, SilphCo4TrainerHeader2
	call TalkToTrainer
	rst TextScriptEnd

SilphCo4FRocket2BattleText:
	text_far _SilphCo4FRocket2BattleText
	text_end

SilphCo4FRocket2EndBattleText:
	text_far _SilphCo4FRocket2EndBattleText
	text_end

SilphCo4FRocket2AfterBattleText:
	text_far _SilphCo4FRocket2AfterBattleText
	text_end
