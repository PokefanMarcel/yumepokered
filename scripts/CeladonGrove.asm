; marcelnote - new location
CeladonGrove_Script:
	call EnableAutoTextBoxDrawing
	ld hl, CeladonGroveTrainerHeaders
	ld de, CeladonGrove_ScriptPointers
	ld a, [wCeladonGroveCurScript]
	call ExecuteCurMapScriptInTable
	ld [wCeladonGroveCurScript], a
	ret

CeladonGrove_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_CELADONGROVE_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_CELADONGROVE_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_CELADONGROVE_END_BATTLE

CeladonGrove_TextPointers:
	def_text_pointers
	dw_const CeladonGroveYoungsterText,         TEXT_CELADONGROVE_YOUNGSTER
	dw_const CeladonGroveChanneler1Text,        TEXT_CELADONGROVE_CHANNELER1
	dw_const CeladonGroveSuperNerdText,         TEXT_CELADONGROVE_SUPERNERD
	dw_const CeladonGroveGrampsText,            TEXT_CELADONGROVE_GRAMPS
	dw_const CeladonGroveChanneler2Text,        TEXT_CELADONGROVE_CHANNELER2
	dw_const PickUpItemText,                    TEXT_VIRIDIANFOREST_LEAF_STONE
    dw_const PickUpItemText,                    TEXT_VIRIDIANFOREST_GREAT_BALL
    dw_const CeladonGroveEntranceSignText,      TEXT_CELADONGROVE_ENTRANCESIGN
    dw_const CeladonGroveShrineSignText,        TEXT_CELADONGROVE_SHRINESIGN

CeladonGroveTrainerHeaders:
	def_trainers
CeladonGroveTrainerHeader0:
	trainer EVENT_BEAT_CELADON_GROVE_TRAINER_0, 3, CeladonGroveYoungsterBattleText, CeladonGroveYoungsterEndBattleText, CeladonGroveYoungsterAfterBattleText
CeladonGroveTrainerHeader1:
	trainer EVENT_BEAT_CELADON_GROVE_TRAINER_1, 4, CeladonGroveChanneler1BattleText, CeladonGroveChanneler1EndBattleText, CeladonGroveChanneler1AfterBattleText
CeladonGroveTrainerHeader2:
	trainer EVENT_BEAT_CELADON_GROVE_TRAINER_2, 4, CeladonGroveSuperNerdBattleText, CeladonGroveSuperNerdEndBattleText, CeladonGroveSuperNerdAfterBattleText
	db -1 ; end

CeladonGroveGrampsText:
	text_far _CeladonGroveGrampsText
	text_end

CeladonGroveChanneler2Text:
	text_asm
	CheckEvent EVENT_GOT_TM51
	jr nz, .already_have_tm
	ld hl, .TakeThisText
	call PrintText
	lb bc, TM_HEX, 1
	call GiveItem
	ld hl, .TM51NoRoomText
	jr nc, .print_text
	SetEvent EVENT_GOT_TM51
	ld hl, .ReceivedTM51Text
	jr .print_text
.already_have_tm
	ld hl, .TM51ExplanationText
.print_text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.TakeThisText:
	text_far _CeladonGroveChanneler2TakeThisText
	text_end

.ReceivedTM51Text:
	text_far _CeladonGroveChanneler2ReceivedTM51Text
	sound_get_item_1
	text_end

.TM51ExplanationText:
	text_far _CeladonGroveChanneler2TM51ExplanationText
	text_end

.TM51NoRoomText:
	text_far _CeladonGroveChanneler2TM51NoRoomText
	text_end

CeladonGroveYoungsterText:
	text_asm
	ld hl, CeladonGroveTrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

CeladonGroveYoungsterBattleText:
	text_far _CeladonGroveYoungsterBattleText
	text_end

CeladonGroveYoungsterEndBattleText:
	text_far _CeladonGroveYoungsterEndBattleText
	text_end

CeladonGroveYoungsterAfterBattleText:
	text_far _CeladonGroveYoungsterAfterBattleText
	text_end

CeladonGroveChanneler1Text:
	text_asm
	ld hl, CeladonGroveTrainerHeader1
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

CeladonGroveChanneler1BattleText:
	text_far _CeladonGroveChanneler1BattleText
	text_end

CeladonGroveChanneler1EndBattleText:
	text_far _CeladonGroveChanneler1EndBattleText
	text_end

CeladonGroveChanneler1AfterBattleText:
	text_far _CeladonGroveChanneler1AfterBattleText
	text_end

CeladonGroveSuperNerdText:
	text_asm
	ld hl, CeladonGroveTrainerHeader2
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

CeladonGroveSuperNerdBattleText:
	text_far _CeladonGroveSuperNerdBattleText
	text_end

CeladonGroveSuperNerdEndBattleText:
	text_far _CeladonGroveSuperNerdEndBattleText
	text_end

CeladonGroveSuperNerdAfterBattleText:
	text_far _CeladonGroveSuperNerdAfterBattleText
	text_end

CeladonGroveEntranceSignText:
	text_far _CeladonGroveEntranceSignText
	text_end

CeladonGroveShrineSignText:
	text_far _CeladonGroveShrineSignText
	text_end