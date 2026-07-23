SilphCo3F_Script:
	call SilphCo3FGateCallbackScript
	call EnableAutoTextBoxDrawing
	ld hl, SilphCo3F_TrainerHeaders
	ld de, SilphCo3F_ScriptPointers
	ld bc, wSilphCo3FCurScript
	jp ExecuteCurMapScriptInTable

SilphCo3FGateCallbackScript: ; marcelnote - simplify Silph Co gates scripts
	ld hl, .GateCoordinates
	EventFlagAddress de, EVENT_SILPH_CO_3_UNLOCKED_DOOR1
	EventFlagBit c, EVENT_SILPH_CO_3_UNLOCKED_DOOR1
	jp SilphCoGateCallback

.GateCoordinates:
	dbgatecoord 4, 4, FACILITY_CARD_KEY_GATE_BLOCK_2
	dbgatecoord 8, 4, FACILITY_CARD_KEY_GATE_BLOCK_2
	db -1 ; end

SilphCo3F_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_SILPHCO3F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_SILPHCO3F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_SILPHCO3F_END_BATTLE

SilphCo3F_TextPointers:
	def_text_pointers
	dw_const SilphCo3FSilphWorkerMText, TEXT_SILPHCO3F_SILPH_WORKER_M
	dw_const SilphCo3FRocketText,       TEXT_SILPHCO3F_ROCKET
	dw_const SilphCo3FScientistText,    TEXT_SILPHCO3F_SCIENTIST
	dw_const PickUpItemText,            TEXT_SILPHCO3F_HYPER_POTION

SilphCo3F_TrainerHeaders:
	def_trainers 2
SilphCo3FTrainerHeader0:
	trainer EVENT_BEAT_SILPH_CO_3F_TRAINER_0, 2, SilphCo3FRocketBattleText, SilphCo3FRocketEndBattleText, SilphCo3FRocketAfterBattleText
SilphCo3FTrainerHeader1:
	trainer EVENT_BEAT_SILPH_CO_3F_TRAINER_1, 3, SilphCo3FScientistBattleText, SilphCo3FScientistEndBattleText, SilphCo3FScientistAfterBattleText
	db -1 ; end

SilphCo3FSilphWorkerMText:
	text_asm
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	ld hl, .YouSavedUsText
	ret nz
	ld hl, .WhatShouldIDoText
	ret

.WhatShouldIDoText:
	text_far _SilphCo3FSilphWorkerMWhatShouldIDoText
	text_end

.YouSavedUsText:
	text_far _SilphCo3FSilphWorkerMYouSavedUsText
	text_end

SilphCo3FRocketText:
	text_asm
	ld hl, SilphCo3FTrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd

SilphCo3FRocketBattleText:
	text_far _SilphCo3FRocketBattleText
	text_end

SilphCo3FRocketEndBattleText:
	text_far _SilphCo3FRocketEndBattleText
	text_end

SilphCo3FRocketAfterBattleText:
	text_far _SilphCo3FRocketAfterBattleText
	text_end

SilphCo3FScientistText:
	text_asm
	ld hl, SilphCo3FTrainerHeader1
	call TalkToTrainer
	rst TextScriptEnd

SilphCo3FScientistBattleText:
	text_far _SilphCo3FScientistBattleText
	text_end

SilphCo3FScientistEndBattleText:
	text_far _SilphCo3FScientistEndBattleText
	text_end

SilphCo3FScientistAfterBattleText:
	text_far _SilphCo3FScientistAfterBattleText
	text_end
