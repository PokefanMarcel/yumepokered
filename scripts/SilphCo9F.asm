SilphCo9F_Script:
	call SilphCo9FGateCallbackScript
	call EnableAutoTextBoxDrawing
	ld hl, SilphCo9TrainerHeaders
	ld de, SilphCo9F_ScriptPointers
	ld bc, wSilphCo9FCurScript
	jp ExecuteCurMapScriptInTable

SilphCo9FGateCallbackScript: ; marcelnote - simplify Silph Co gates scripts
	ld hl, .GateCoordinates
	EventFlagAddress de, EVENT_SILPH_CO_9_UNLOCKED_DOOR1
	EventFlagBit c, EVENT_SILPH_CO_9_UNLOCKED_DOOR1
	jp SilphCoGateCallback

.GateCoordinates:
	dbgatecoord 1, 4, FACILITY_CARD_KEY_GATE_BLOCK_2
	dbgatecoord 9, 2, FACILITY_CARD_KEY_GATE_BLOCK_1
	dbgatecoord 9, 5, FACILITY_CARD_KEY_GATE_BLOCK_1
	dbgatecoord 5, 6, FACILITY_CARD_KEY_GATE_BLOCK_2
	db -1 ; end

SilphCo9F_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_SILPHCO9F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_SILPHCO9F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_SILPHCO9F_END_BATTLE

SilphCo9F_TextPointers:
	def_text_pointers
	dw_const SilphCo9FNurseText,     TEXT_SILPHCO9F_NURSE
	dw_const SilphCo9FRocket1Text,   TEXT_SILPHCO9F_ROCKET1
	dw_const SilphCo9FScientistText, TEXT_SILPHCO9F_SCIENTIST
	dw_const SilphCo9FRocket2Text,   TEXT_SILPHCO9F_ROCKET2

SilphCo9TrainerHeaders:
	def_trainers 2
SilphCo9TrainerHeader0:
	trainer EVENT_BEAT_SILPH_CO_9F_TRAINER_0, 4, SilphCo9FRocket1BattleText, SilphCo9FRocket1EndBattleText, SilphCo9FRocket1AfterBattleText
SilphCo9TrainerHeader1:
	trainer EVENT_BEAT_SILPH_CO_9F_TRAINER_1, 2, SilphCo9FScientistBattleText, SilphCo9FScientistEndBattleText, SilphCo9FScientistAfterBattleText
SilphCo9TrainerHeader2:
	trainer EVENT_BEAT_SILPH_CO_9F_TRAINER_2, 4, SilphCo9FRocket2BattleText, SilphCo9FRocket2EndBattleText, SilphCo9FRocket2AfterBattleText
	db -1 ; end

SilphCo9FNurseText:
	text_asm
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	ld hl, .ThankYouText
	ret nz
	ld hl, .YouLookTiredText
	call PrintText
	predef HealParty
	call GBFadeOutToWhite
	call Delay3
	call GBFadeInFromWhite
	ld hl, .DontGiveUpText
	call PrintText
	rst TextScriptEnd

.YouLookTiredText:
	text_far _SilphCo9FNurseYouLookTiredText
	text_end

.DontGiveUpText:
	text_far _SilphCo9FNurseDontGiveUpText
	text_end

.ThankYouText:
	text_far _SilphCo9FNurseThankYouText
	text_end

SilphCo9FRocket1Text:
	text_asm
	ld hl, SilphCo9TrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd

SilphCo9FScientistText:
	text_asm
	ld hl, SilphCo9TrainerHeader1
	call TalkToTrainer
	rst TextScriptEnd

SilphCo9FRocket2Text:
	text_asm
	ld hl, SilphCo9TrainerHeader2
	call TalkToTrainer
	rst TextScriptEnd

SilphCo9FRocket1BattleText:
	text_far _SilphCo9FRocket1BattleText
	text_end

SilphCo9FRocket1EndBattleText:
	text_far _SilphCo9FRocket1EndBattleText
	text_end

SilphCo9FRocket1AfterBattleText:
	text_far _SilphCo9FRocket1AfterBattleText
	text_end

SilphCo9FScientistBattleText:
	text_far _SilphCo9FScientistBattleText
	text_end

SilphCo9FScientistEndBattleText:
	text_far _SilphCo9FScientistEndBattleText
	text_end

SilphCo9FScientistAfterBattleText:
	text_far _SilphCo9FScientistAfterBattleText
	text_end

SilphCo9FRocket2BattleText:
	text_far _SilphCo9FRocket2BattleText
	text_end

SilphCo9FRocket2EndBattleText:
	text_far _SilphCo9FRocket2EndBattleText
	text_end

SilphCo9FRocket2AfterBattleText:
	text_far _SilphCo9FRocket2AfterBattleText
	text_end
