SilphCo2F_Script:
	call SilphCo2FGateCallbackScript
	call EnableAutoTextBoxDrawing
	ld hl, SilphCo2F_TrainerHeaders
	ld de, SilphCo2F_ScriptPointers
	ld bc, wSilphCo2FCurScript
	jp ExecuteCurMapScriptInTable

SilphCo2FGateCallbackScript: ; marcelnote - simplify Silph Co gates scripts
	ld hl, .GateCoordinates
	EventFlagAddress de, EVENT_SILPH_CO_2_UNLOCKED_DOOR1
	EventFlagBit c, EVENT_SILPH_CO_2_UNLOCKED_DOOR1
	jp SilphCoGateCallback

.GateCoordinates:
	dbgatecoord 2, 2, FACILITY_CARD_KEY_GATE_BLOCK_1
	dbgatecoord 2, 5, FACILITY_CARD_KEY_GATE_BLOCK_1
	db -1 ; end

SilphCo2F_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_SILPHCO2F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_SILPHCO2F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_SILPHCO2F_END_BATTLE

SilphCo2F_TextPointers:
	def_text_pointers
	dw_const SilphCo2FSilphWorkerFText, TEXT_SILPHCO2F_SILPH_WORKER_F
	dw_const SilphCo2FScientist1Text,   TEXT_SILPHCO2F_SCIENTIST1
	dw_const SilphCo2FScientist2Text,   TEXT_SILPHCO2F_SCIENTIST2
	dw_const SilphCo2FRocket1Text,      TEXT_SILPHCO2F_ROCKET1
	dw_const SilphCo2FRocket2Text,      TEXT_SILPHCO2F_ROCKET2

SilphCo2F_TrainerHeaders:
	def_trainers 2
SilphCo2FTrainerHeader0:
	trainer EVENT_BEAT_SILPH_CO_2F_TRAINER_0, 3, SilphCo2FScientist1BattleText, SilphCo2FScientist1EndBattleText, SilphCo2FScientist1AfterBattleText
SilphCo2FTrainerHeader1:
	trainer EVENT_BEAT_SILPH_CO_2F_TRAINER_1, 4, SilphCo2FScientist2BattleText, SilphCo2FScientist2EndBattleText, SilphCo2FScientist2AfterBattleText
SilphCo2FTrainerHeader2:
	trainer EVENT_BEAT_SILPH_CO_2F_TRAINER_2, 3, SilphCo2FRocket1BattleText, SilphCo2FRocket1EndBattleText, SilphCo2FRocket1AfterBattleText
SilphCo2FTrainerHeader3:
	trainer EVENT_BEAT_SILPH_CO_2F_TRAINER_3, 3, SilphCo2FRocket2BattleText, SilphCo2FRocket2EndBattleText, SilphCo2FRocket2AfterBattleText
	db -1 ; end

SilphCo2FSilphWorkerFText:
	text_asm
	CheckEvent EVENT_GOT_TM36
	ld hl, .TM36ExplanationText
	ret nz
	ld hl, .PleaseTakeThisText
	call PrintText
	lb bc, TM_SELFDESTRUCT, 1
	call GiveItem
	ld hl, .TM36NoRoomText
	jr nc, .printText
	SetEvent EVENT_GOT_TM36
	ld hl, .ReceivedTM36Text
.printText
	call PrintText
	rst TextScriptEnd

.PleaseTakeThisText:
	text_far SilphCo2FSilphWorkerFPleaseTakeThisText
	text_end

.ReceivedTM36Text:
	text_far _SilphCo2FSilphWorkerFReceivedTM36Text
	sound_get_item_1
	text_end

.TM36ExplanationText:
	text_far _SilphCo2FSilphWorkerFTM36ExplanationText
	text_end

.TM36NoRoomText:
	text_far _SilphCo2FSilphWorkerFTM36NoRoomText
	text_end

SilphCo2FScientist1Text:
	text_asm
	ld hl, SilphCo2FTrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd

SilphCo2FScientist2Text:
	text_asm
	ld hl, SilphCo2FTrainerHeader1
	call TalkToTrainer
	rst TextScriptEnd

SilphCo2FRocket1Text:
	text_asm
	ld hl, SilphCo2FTrainerHeader2
	call TalkToTrainer
	rst TextScriptEnd

SilphCo2FRocket2Text:
	text_asm
	ld hl, SilphCo2FTrainerHeader3
	call TalkToTrainer
	rst TextScriptEnd

SilphCo2FScientist1BattleText:
	text_far _SilphCo2FScientist1BattleText
	text_end

SilphCo2FScientist1EndBattleText:
	text_far _SilphCo2FScientist1EndBattleText
	text_end

SilphCo2FScientist1AfterBattleText:
	text_far _SilphCo2FScientist1AfterBattleText
	text_end

SilphCo2FScientist2BattleText:
	text_far _SilphCo2FScientist2BattleText
	text_end

SilphCo2FScientist2EndBattleText:
	text_far _SilphCo2FScientist2EndBattleText
	text_end

SilphCo2FScientist2AfterBattleText:
	text_far _SilphCo2FScientist2AfterBattleText
	text_end

SilphCo2FRocket1BattleText:
	text_far _SilphCo2FRocket1BattleText
	text_end

SilphCo2FRocket1EndBattleText:
	text_far _SilphCo2FRocket1EndBattleText
	text_end

SilphCo2FRocket1AfterBattleText:
	text_far _SilphCo2FRocket1AfterBattleText
	text_end

SilphCo2FRocket2BattleText:
	text_far _SilphCo2FRocket2BattleText
	text_end

SilphCo2FRocket2EndBattleText:
	text_far _SilphCo2FRocket2EndBattleText
	text_end

SilphCo2FRocket2AfterBattleText:
	text_far _SilphCo2FRocket2AfterBattleText
	text_end
