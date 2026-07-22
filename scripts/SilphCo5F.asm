SilphCo5F_Script:
	call SilphCo5FGateCallbackScript
	call EnableAutoTextBoxDrawing
	ld hl, SilphCo5TrainerHeaders
	ld de, SilphCo5F_ScriptPointers
	ld a, [wSilphCo5FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSilphCo5FCurScript], a
	ret

SilphCo5FGateCallbackScript: ; marcelnote - simplify Silph Co gates scripts
	ld hl, .GateCoordinates
	EventFlagAddress de, EVENT_SILPH_CO_5_UNLOCKED_DOOR1
	EventFlagBit c, EVENT_SILPH_CO_5_UNLOCKED_DOOR1
	jp SilphCoGateCallback

.GateCoordinates:
	dbgatecoord 3, 2, FACILITY_CARD_KEY_GATE_BLOCK_2
	dbgatecoord 3, 6, FACILITY_CARD_KEY_GATE_BLOCK_2
	dbgatecoord 7, 5, FACILITY_CARD_KEY_GATE_BLOCK_2
	db -1 ; end

SilphCo5F_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_SILPHCO5F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_SILPHCO5F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_SILPHCO5F_END_BATTLE

SilphCo5F_TextPointers:
	def_text_pointers
	dw_const SilphCo5FSilphWorkerMText,   TEXT_SILPHCO5F_SILPH_WORKER_M
	dw_const SilphCo5FRocket1Text,        TEXT_SILPHCO5F_ROCKET1
	dw_const SilphCo5FScientistText,      TEXT_SILPHCO5F_SCIENTIST
	dw_const SilphCo5FRockerText,         TEXT_SILPHCO5F_ROCKER
	dw_const SilphCo5FRocket2Text,        TEXT_SILPHCO5F_ROCKET2
	dw_const PickUpItemText,              TEXT_SILPHCO5F_TM_TAKE_DOWN
	dw_const PickUpItemText,              TEXT_SILPHCO5F_PROTEIN
	dw_const PickUpItemText,              TEXT_SILPHCO5F_CARD_KEY
	dw_const SilphCo5FPokemonReport1Text, TEXT_SILPHCO5F_POKEMON_REPORT1
	dw_const SilphCo5FPokemonReport2Text, TEXT_SILPHCO5F_POKEMON_REPORT2
	dw_const SilphCo5FPokemonReport3Text, TEXT_SILPHCO5F_POKEMON_REPORT3

SilphCo5TrainerHeaders:
	def_trainers 2
SilphCo5TrainerHeader0:
	trainer EVENT_BEAT_SILPH_CO_5F_TRAINER_0, 1, SilphCo5FRocket1BattleText, SilphCo5FRocket1EndBattleText, SilphCo5FRocket1AfterBattleText
SilphCo5TrainerHeader1:
	trainer EVENT_BEAT_SILPH_CO_5F_TRAINER_1, 2, SilphCo5FScientistBattleText, SilphCo5FScientistEndBattleText, SilphCo5FScientistAfterBattleText
SilphCo5TrainerHeader2:
	trainer EVENT_BEAT_SILPH_CO_5F_TRAINER_2, 4, SilphCo5FRockerBattleText, SilphCo5FRockerEndBattleText, SilphCo5FRockerAfterBattleText
SilphCo5TrainerHeader3:
	trainer EVENT_BEAT_SILPH_CO_5F_TRAINER_3, 3, SilphCo5FRocket2BattleText, SilphCo5FRocket2EndBattleText, SilphCo5FRocket2AfterBattleText
	db -1 ; end

SilphCo5FSilphWorkerMText:
	text_asm
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	ld hl, .YoureOurHeroText
	ret nz
	ld hl, .ThatsYouRightText
	ret

.ThatsYouRightText:
	text_far _SilphCo5FSilphWorkerMThatsYouRightText
	text_end

.YoureOurHeroText:
	text_far _SilphCo5FSilphWorkerMYoureOurHeroText
	text_end

SilphCo5FRocket1Text:
	text_asm
	ld hl, SilphCo5TrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd

SilphCo5FRocket1BattleText:
	text_far _SilphCo5FRocket1BattleText
	text_end

SilphCo5FRocket1EndBattleText:
	text_far _SilphCo5FRocket1EndBattleText
	text_end

SilphCo5FRocket1AfterBattleText:
	text_far _SilphCo5FRocket1AfterBattleText
	text_end

SilphCo5FScientistText:
	text_asm
	ld hl, SilphCo5TrainerHeader1
	call TalkToTrainer
	rst TextScriptEnd

SilphCo5FScientistBattleText:
	text_far _SilphCo5FScientistBattleText
	text_end

SilphCo5FScientistEndBattleText:
	text_far _SilphCo5FScientistEndBattleText
	text_end

SilphCo5FScientistAfterBattleText:
	text_far _SilphCo5FScientistAfterBattleText
	text_end

SilphCo5FRockerText:
	text_asm
	ld hl, SilphCo5TrainerHeader2
	call TalkToTrainer
	rst TextScriptEnd

SilphCo5FRockerBattleText:
	text_far _SilphCo5FRockerBattleText
	text_end

SilphCo5FRockerEndBattleText:
	text_far _SilphCo5FRockerEndBattleText
	text_end

SilphCo5FRockerAfterBattleText:
	text_far _SilphCo5FRockerAfterBattleText
	text_end

SilphCo5FRocket2Text:
	text_asm
	ld hl, SilphCo5TrainerHeader3
	call TalkToTrainer
	rst TextScriptEnd

SilphCo5FRocket2BattleText:
	text_far _SilphCo5FRocket2BattleText
	text_end

SilphCo5FRocket2EndBattleText:
	text_far _SilphCo5FRocket2EndBattleText
	text_end

SilphCo5FRocket2AfterBattleText:
	text_far _SilphCo5FRocket2AfterBattleText
	text_end

SilphCo5FPokemonReport1Text:
	text_far _SilphCo5FPokemonReport1Text
	text_end

SilphCo5FPokemonReport2Text:
	text_far _SilphCo5FPokemonReport2Text
	text_end

SilphCo5FPokemonReport3Text:
	text_far _SilphCo5FPokemonReport3Text
	text_end
