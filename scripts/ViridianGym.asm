ViridianGym_Script:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_2, [hl]
	res BIT_CUR_MAP_LOADED_2, [hl]
	call nz, .LoadNames
	call EnableAutoTextBoxDrawing
	ld hl, ViridianGym_TrainerHeaders
	ld de, ViridianGym_ScriptPointers
	ld bc, wViridianGymCurScript
	jp ExecuteCurMapScriptInTable

.LoadNames:
	ld a, GIOVANNI
	jp LoadGymLeaderAndCityName

ViridianGymSetDefaultScript:
	xor a
	ld [wJoyIgnore], a
ViridianGymSetScript:
	ld [wViridianGymCurScript], a
	ret

ViridianGym_ScriptPointers:
	def_script_pointers
	dw_const ViridianGymDefaultScript,              SCRIPT_VIRIDIANGYM_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_VIRIDIANGYM_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_VIRIDIANGYM_END_BATTLE
	dw_const ViridianGymGiovanniPostBattleScript,   SCRIPT_VIRIDIANGYM_GIOVANNI_POST_BATTLE

ViridianGymDefaultScript: ; marcelnote - modified spinners engine
	callfar CheckStartStopSpinning
	ld hl, wMovementFlags
	bit BIT_SPINNING, [hl]
	jp z, CheckFightingMapTrainers
	jpfar LoadSpinnerArrowTiles

ViridianGymGiovanniPostBattleScript:
	ld a, [wIsInBattle]
	inc a ; lost battle?
	jr z, ViridianGymSetScript ; SCRIPT_VIRIDIANGYM_DEFAULT
	ld a, PAD_CTRL_PAD
	ld [wJoyIgnore], a
	; fallthrough

ViridianGymReceiveTM27: ; marcelnote - optimized
	ld a, TEXT_VIRIDIANGYM_GIOVANNI_EARTH_BADGE_INFO
	ldh [hTextID], a
	call DisplayTextID
	SetEvent EVENT_BEAT_VIRIDIAN_GYM_GIOVANNI
	lb bc, TM_FISSURE, 1
	call GiveItem
	ld a, TEXT_VIRIDIANGYM_GIOVANNI_TM27_NO_ROOM
	jr nc, .displayTMText
	SetEvent EVENT_GOT_TM27
	ld a, TEXT_VIRIDIANGYM_GIOVANNI_RECEIVED_TM27
.displayTMText
	ldh [hTextID], a
	call DisplayTextID
	ld hl, wObtainedBadges
	set BIT_EARTHBADGE, [hl]

	; deactivate gym trainers
	SetEventRange EVENT_BEAT_VIRIDIAN_GYM_TRAINER_0, EVENT_BEAT_VIRIDIAN_GYM_TRAINER_7
	ld a, TOGGLE_ROUTE_22_RIVAL_2
	ld [wToggleableObjectIndex], a
	predef ShowObject
	SetEvents EVENT_2ND_ROUTE22_RIVAL_BATTLE, EVENT_ROUTE22_RIVAL_WANTS_BATTLE
	jr ViridianGymSetDefaultScript

ViridianGym_TextPointers:
	def_text_pointers
	dw_const ViridianGymGiovanniText,               TEXT_VIRIDIANGYM_GIOVANNI
	dw_const ViridianGymCooltrainerM1Text,          TEXT_VIRIDIANGYM_COOLTRAINER_M1
	dw_const ViridianGymBlackbelt1Text,             TEXT_VIRIDIANGYM_BLACKBELT1
	dw_const ViridianGymRocker1Text,                TEXT_VIRIDIANGYM_ROCKER1
	dw_const ViridianGymBlackbelt2Text,             TEXT_VIRIDIANGYM_BLACKBELT2
	dw_const ViridianGymCooltrainerM2Text,          TEXT_VIRIDIANGYM_COOLTRAINER_M2
	dw_const ViridianGymBlackbelt3Text,             TEXT_VIRIDIANGYM_BLACKBELT3
	dw_const ViridianGymRocker2Text,                TEXT_VIRIDIANGYM_ROCKER2
	dw_const ViridianGymCooltrainerM3Text,          TEXT_VIRIDIANGYM_COOLTRAINER_M3
	dw_const ViridianGymGymGuideText,               TEXT_VIRIDIANGYM_GYM_GUIDE
	dw_const PickUpItemText,                        TEXT_VIRIDIANGYM_REVIVE
	dw_const ViridianGymGiovanniEarthBadgeInfoText, TEXT_VIRIDIANGYM_GIOVANNI_EARTH_BADGE_INFO
	dw_const ViridianGymGiovanniReceivedTM27Text,   TEXT_VIRIDIANGYM_GIOVANNI_RECEIVED_TM27
	dw_const ViridianGymGiovanniTM27NoRoomText,     TEXT_VIRIDIANGYM_GIOVANNI_TM27_NO_ROOM

ViridianGym_TrainerHeaders:
	def_trainers 2
ViridianGymTrainerHeader0:
	trainer EVENT_BEAT_VIRIDIAN_GYM_TRAINER_0, 4, ViridianGymCooltrainerM1BattleText, ViridianGymCooltrainerM1EndBattleText, ViridianGymCooltrainerM1AfterBattleText
ViridianGymTrainerHeader1:
	trainer EVENT_BEAT_VIRIDIAN_GYM_TRAINER_1, 4, ViridianGymBlackbelt1BattleText, ViridianGymBlackbelt1EndBattleText, ViridianGymBlackbelt1AfterBattleText
ViridianGymTrainerHeader2:
	trainer EVENT_BEAT_VIRIDIAN_GYM_TRAINER_2, 4, ViridianGymRocker1BattleText, ViridianGymRocker1EndBattleText, ViridianGymRocker1AfterBattleText
ViridianGymTrainerHeader3:
	trainer EVENT_BEAT_VIRIDIAN_GYM_TRAINER_3, 2, ViridianGymBlackbelt2BattleText, ViridianGymBlackbelt2EndBattleText, ViridianGymBlackbelt2AfterBattleText
ViridianGymTrainerHeader4:
	trainer EVENT_BEAT_VIRIDIAN_GYM_TRAINER_4, 3, ViridianGymCooltrainerM2BattleText, ViridianGymCooltrainerM2EndBattleText, ViridianGymCooltrainerM2AfterBattleText
ViridianGymTrainerHeader5:
	trainer EVENT_BEAT_VIRIDIAN_GYM_TRAINER_5, 4, ViridianGymBlackbelt3BattleText, ViridianGymBlackbelt3EndBattleText, ViridianGymBlackbelt3AfterBattleText
ViridianGymTrainerHeader6:
	trainer EVENT_BEAT_VIRIDIAN_GYM_TRAINER_6, 3, ViridianGymRocker2BattleText, ViridianGymRocker2EndBattleText, ViridianGymRocker2AfterBattleText
ViridianGymTrainerHeader7:
	trainer EVENT_BEAT_VIRIDIAN_GYM_TRAINER_7, 4, ViridianGymCooltrainerM3BattleText, ViridianGymCooltrainerM3EndBattleText, ViridianGymCooltrainerM3AfterBattleText
	db -1 ; end

ViridianGymGiovanniText:
	text_asm
	CheckEvent EVENT_BEAT_VIRIDIAN_GYM_GIOVANNI
	jr z, .beforeBeat
	CheckEventReuseA EVENT_GOT_TM27
	jr nz, .afterBeat
	call ViridianGymReceiveTM27
	call DisableWaitingAfterTextDisplay
	rst TextScriptEnd
.afterBeat
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, .PostBattleAdviceText
	call PrintText
	call GBFadeOutToBlack
	ld a, TOGGLE_VIRIDIAN_GYM_GIOVANNI
	ld [wToggleableObjectIndex], a
	predef HideObject
	call UpdateSprites
	call Delay3
	call GBFadeInFromBlack
	rst TextScriptEnd
.beforeBeat
	ld hl, .PreBattleText
	call PrintText
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, .ReceivedEarthBadgeText
	ld de, .ReceivedEarthBadgeText
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, $8
	ld [wGymLeaderNo], a
	ld a, SCRIPT_VIRIDIANGYM_GIOVANNI_POST_BATTLE
	ld [wViridianGymCurScript], a
	rst TextScriptEnd

.PreBattleText:
	text_far _ViridianGymGiovanniPreBattleText
	text_end

.ReceivedEarthBadgeText:
	text_far _ViridianGymGiovanniReceivedEarthBadgeText
	sound_get_item_1 ; marcelnote - had sound_level_up due to the battle audio bank, but probably intended sound_get_item_1
	text_promptbutton
	text_end

.PostBattleAdviceText:
	text_far _ViridianGymGiovanniPostBattleAdviceText
	text_waitbutton
	text_end

ViridianGymGiovanniEarthBadgeInfoText:
	text_far _ViridianGymGiovanniEarthBadgeInfoText
	text_end

ViridianGymGiovanniReceivedTM27Text:
	text_far _ViridianGymGiovanniReceivedTM27Text
	sound_get_item_1

ViridianGymGiovanniTM27ExplanationText:
	text_far _ViridianGymGiovanniTM27ExplanationText
	text_end

ViridianGymGiovanniTM27NoRoomText:
	text_far _ViridianGymGiovanniTM27NoRoomText
	text_end

ViridianGymCooltrainerM1Text:
	text_asm
	ld hl, ViridianGymTrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd

ViridianGymCooltrainerM1BattleText:
	text_far _ViridianGymCooltrainerM1BattleText
	text_end

ViridianGymCooltrainerM1EndBattleText:
	text_far _ViridianGymCooltrainerM1EndBattleText
	text_end

ViridianGymCooltrainerM1AfterBattleText:
	text_far _ViridianGymCooltrainerM1AfterBattleText
	text_end

ViridianGymBlackbelt1Text:
	text_asm
	ld hl, ViridianGymTrainerHeader1
	call TalkToTrainer
	rst TextScriptEnd

ViridianGymBlackbelt1BattleText:
	text_far _ViridianGymBlackbelt1BattleText
	text_end

ViridianGymBlackbelt1EndBattleText:
	text_far _ViridianGymBlackbelt1EndBattleText
	text_end

ViridianGymBlackbelt1AfterBattleText:
	text_far _ViridianGymBlackbelt1AfterBattleText
	text_end

ViridianGymRocker1Text:
	text_asm
	ld hl, ViridianGymTrainerHeader2
	call TalkToTrainer
	rst TextScriptEnd

ViridianGymRocker1BattleText:
	text_far _ViridianGymRocker1BattleText
	text_end

ViridianGymRocker1EndBattleText:
	text_far _ViridianGymRocker1EndBattleText
	text_end

ViridianGymRocker1AfterBattleText:
	text_far _ViridianGymRocker1AfterBattleText
	text_end

ViridianGymBlackbelt2Text:
	text_asm
	ld hl, ViridianGymTrainerHeader3
	call TalkToTrainer
	rst TextScriptEnd

ViridianGymBlackbelt2BattleText:
	text_far _ViridianGymBlackbelt2BattleText
	text_end

ViridianGymBlackbelt2EndBattleText:
	text_far _ViridianGymBlackbelt2EndBattleText
	text_end

ViridianGymBlackbelt2AfterBattleText:
	text_far _ViridianGymBlackbelt2AfterBattleText
	text_end

ViridianGymCooltrainerM2Text:
	text_asm
	ld hl, ViridianGymTrainerHeader4
	call TalkToTrainer
	rst TextScriptEnd

ViridianGymCooltrainerM2BattleText:
	text_far _ViridianGymCooltrainerM2BattleText
	text_end

ViridianGymCooltrainerM2EndBattleText:
	text_far _ViridianGymCooltrainerM2EndBattleText
	text_end

ViridianGymCooltrainerM2AfterBattleText:
	text_far _ViridianGymCooltrainerM2AfterBattleText
	text_end

ViridianGymBlackbelt3Text:
	text_asm
	ld hl, ViridianGymTrainerHeader5
	call TalkToTrainer
	rst TextScriptEnd

ViridianGymBlackbelt3BattleText:
	text_far _ViridianGymBlackbelt3BattleText
	text_end

ViridianGymBlackbelt3EndBattleText:
	text_far _ViridianGymBlackbelt3EndBattleText
	text_end

ViridianGymBlackbelt3AfterBattleText:
	text_far _ViridianGymBlackbelt3AfterBattleText
	text_end

ViridianGymRocker2Text:
	text_asm
	ld hl, ViridianGymTrainerHeader6
	call TalkToTrainer
	rst TextScriptEnd

ViridianGymRocker2BattleText:
	text_far _ViridianGymRocker2BattleText
	text_end

ViridianGymRocker2EndBattleText:
	text_far _ViridianGymRocker2EndBattleText
	text_end

ViridianGymRocker2AfterBattleText:
	text_far _ViridianGymRocker2AfterBattleText
	text_end

ViridianGymCooltrainerM3Text:
	text_asm
	ld hl, ViridianGymTrainerHeader7
	call TalkToTrainer
	rst TextScriptEnd

ViridianGymCooltrainerM3BattleText:
	text_far _ViridianGymCooltrainerM3BattleText
	text_end

ViridianGymCooltrainerM3EndBattleText:
	text_far _ViridianGymCooltrainerM3EndBattleText
	text_end

ViridianGymCooltrainerM3AfterBattleText:
	text_far _ViridianGymCooltrainerM3AfterBattleText
	text_end

ViridianGymGymGuideText: ; marcelnote - optimized
	text_asm
	CheckEvent EVENT_BEAT_VIRIDIAN_GYM_GIOVANNI
	ld hl, ViridianGymGuidePostBattleText
	ret nz
	ld hl, ViridianGymGuidePreBattleText
	ret

ViridianGymGuidePreBattleText:
	text_far _ViridianGymGuidePreBattleText
	text_end

ViridianGymGuidePostBattleText:
	text_far _ViridianGymGuidePostBattleText
	text_end
