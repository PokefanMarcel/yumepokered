VermilionGym_Script:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	res BIT_CUR_MAP_LOADED_1, [hl]
	push hl
	call nz, .LoadNames
	pop hl
	bit BIT_CUR_MAP_LOADED_2, [hl]
	res BIT_CUR_MAP_LOADED_2, [hl]
	call nz, VermilionGymSetDoorTile
	call EnableAutoTextBoxDrawing
	ld hl, VermilionGym_TrainerHeaders
	ld de, VermilionGym_ScriptPointers
	ld bc, wVermilionGymCurScript
	jp ExecuteCurMapScriptInTable

.LoadNames:
	ld a, LT_SURGE
	jp LoadGymLeaderAndCityName

VermilionGymSetDoorTile:
	CheckEvent EVENT_2ND_LOCK_OPENED
	jr nz, .doorsOpen
	ld a, $24 ; double door tile ID
	jr .replaceTile
.doorsOpen
	ld a, SFX_GO_INSIDE
	call PlaySound
	ld a, $5 ; clear floor tile ID
.replaceTile
	ld [wNewTileBlockID], a
	lb bc, 2, 2
	predef_jump ReplaceTileBlock

VermilionGymSetDefaultScript:
	xor a
	ld [wJoyIgnore], a
VermilionGymSetScript:
	ld [wVermilionGymCurScript], a
	ret

VermilionGym_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,                   SCRIPT_VERMILIONGYM_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle,      SCRIPT_VERMILIONGYM_START_BATTLE
	dw_const EndTrainerBattle,                           SCRIPT_VERMILIONGYM_END_BATTLE
	dw_const VermilionGymLTSurgePostBattleScript,        SCRIPT_VERMILIONGYM_LT_SURGE_POST_BATTLE
	dw_const VermilionGymLTSurgeRematchPostBattleScript, SCRIPT_VERMILIONGYM_LT_SURGE_REMATCH_POST_BATTLE ; marcelnote - Lt.Surge rematch

VermilionGymLTSurgePostBattleScript:
	ld a, [wIsInBattle]
	inc a ; lost battle?
	jr z, VermilionGymSetScript ; SCRIPT_VERMILIONGYM_DEFAULT
	ld a, PAD_CTRL_PAD
	ld [wJoyIgnore], a
	; fallthrough

VermilionGymReceiveTM24: ; marcelnote - optimized
	ld a, TEXT_VERMILIONGYM_LT_SURGE_THUNDER_BADGE_INFO
	ldh [hTextID], a
	call DisplayTextID
	SetEvent EVENT_BEAT_LT_SURGE
	lb bc, TM_THUNDERBOLT, 1
	call GiveItem
	ld a, TEXT_VERMILIONGYM_LT_SURGE_TM24_NO_ROOM
	jr nc, .displayTMText
	SetEvent EVENT_GOT_TM24
	ld a, TEXT_VERMILIONGYM_LT_SURGE_RECEIVED_TM24
.displayTMText
	ldh [hTextID], a
	call DisplayTextID
	ld hl, wObtainedBadges
	set BIT_THUNDERBADGE, [hl]
	SetEventRange EVENT_BEAT_VERMILION_GYM_TRAINER_0, EVENT_BEAT_VERMILION_GYM_TRAINER_2
	jr VermilionGymSetDefaultScript

VermilionGymLTSurgeRematchPostBattleScript: ; marcelnote - Lt.Surge rematch
	ld a, [wIsInBattle]
	inc a ; lost battle?
	jr z, VermilionGymSetScript ; SCRIPT_VERMILIONGYM_DEFAULT
	ld a, PAD_CTRL_PAD
	ld [wJoyIgnore], a
	ld a, TEXT_VERMILIONGYM_AFTER_REMATCH
	ldh [hTextID], a
	call DisplayTextID
	SetEvent EVENT_BEAT_LT_SURGE_REMATCH
	jr VermilionGymSetDefaultScript

VermilionGym_TextPointers:
	def_text_pointers
	dw_const VermilionGymLTSurgeText,                 TEXT_VERMILIONGYM_LT_SURGE
	dw_const VermilionGymLTSurgeRematchText,          TEXT_VERMILIONGYM_LT_SURGE_REMATCH ; marcelnote - Lt.Surge rematch
	dw_const VermilionGymGentlemanText,               TEXT_VERMILIONGYM_GENTLEMAN
	dw_const VermilionGymSuperNerdText,               TEXT_VERMILIONGYM_SUPER_NERD
	dw_const VermilionGymSailorText,                  TEXT_VERMILIONGYM_SAILOR
	dw_const VermilionGymGymGuideText,                TEXT_VERMILIONGYM_GYM_GUIDE
	dw_const VermilionGymLTSurgeThunderBadgeInfoText, TEXT_VERMILIONGYM_LT_SURGE_THUNDER_BADGE_INFO
	dw_const VermilionGymLTSurgeReceivedTM24Text,     TEXT_VERMILIONGYM_LT_SURGE_RECEIVED_TM24
	dw_const VermilionGymLTSurgeTM24NoRoomText,       TEXT_VERMILIONGYM_LT_SURGE_TM24_NO_ROOM
	dw_const VermilionGymAfterRematchText,            TEXT_VERMILIONGYM_AFTER_REMATCH ; marcelnote - Lt.Surge rematch

VermilionGym_TrainerHeaders:
	def_trainers 3 ; marcelnote - added 1 to accomodate Lt.Surge rematch
VermilionGymTrainerHeader0:
	trainer EVENT_BEAT_VERMILION_GYM_TRAINER_0, 3, VermilionGymGentlemanBattleText, VermilionGymGentlemanEndBattleText, VermilionGymGentlemanAfterBattleText
VermilionGymTrainerHeader1:
	trainer EVENT_BEAT_VERMILION_GYM_TRAINER_1, 2, VermilionGymSuperNerdBattleText, VermilionGymSuperNerdEndBattleText, VermilionGymSuperNerdAfterBattleText
VermilionGymTrainerHeader2:
	trainer EVENT_BEAT_VERMILION_GYM_TRAINER_2, 3, VermilionGymSailorBattleText, VermilionGymSailorEndBattleText, VermilionGymSailorAfterBattleText
	db -1 ; end

VermilionGymLTSurgeText: ; marcelnote - optimized
	text_asm
	CheckEvent EVENT_BEAT_LT_SURGE
	jr z, .beforeBeat
	CheckEventReuseA EVENT_GOT_TM24
	ld hl, .PostBattleAdviceText
	ret nz
	call VermilionGymReceiveTM24
	call DisableWaitingAfterTextDisplay
	rst TextScriptEnd
.beforeBeat
	ld hl, .PreBattleText
	call PrintText
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, .ReceivedThunderBadgeText
	ld de, .ReceivedThunderBadgeText
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, $3
	ld [wGymLeaderNo], a
	ld a, SCRIPT_VERMILIONGYM_LT_SURGE_POST_BATTLE
	ld [wVermilionGymCurScript], a
	rst TextScriptEnd

.PreBattleText:
	text_far _VermilionGymLTSurgePreBattleText
	text_end

.ReceivedThunderBadgeText:
	text_far _VermilionGymLTSurgeReceivedThunderBadgeText
	; marcelnote - no badge-specific SFX for Thunder badge
	text_end

.PostBattleAdviceText:
	text_far _VermilionGymLTSurgePostBattleAdviceText
	text_end

VermilionGymLTSurgeThunderBadgeInfoText:
	text_far _VermilionGymLTSurgeThunderBadgeInfoText
	text_end

VermilionGymLTSurgeReceivedTM24Text:
	text_far _VermilionGymLTSurgeReceivedTM24Text
	sound_get_item_1 ; marcelnote - harmonized from sound_get_key_item
	text_far _TM24ExplanationText
	text_end

VermilionGymLTSurgeTM24NoRoomText:
	text_far _VermilionGymLTSurgeTM24NoRoomText
	text_end

VermilionGymGentlemanText:
	text_asm
	ld hl, VermilionGymTrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd

VermilionGymGentlemanBattleText:
	text_far _VermilionGymGentlemanBattleText
	text_end

VermilionGymGentlemanEndBattleText:
	text_far _VermilionGymGentlemanEndBattleText
	text_end

VermilionGymGentlemanAfterBattleText:
	text_far _VermilionGymGentlemanAfterBattleText
	text_end

VermilionGymSuperNerdText:
	text_asm
	ld hl, VermilionGymTrainerHeader1
	call TalkToTrainer
	rst TextScriptEnd

VermilionGymSuperNerdBattleText:
	text_far _VermilionGymSuperNerdBattleText
	text_end

VermilionGymSuperNerdEndBattleText:
	text_far _VermilionGymSuperNerdEndBattleText
	text_end

VermilionGymSuperNerdAfterBattleText:
	text_far _VermilionGymSuperNerdAfterBattleText
	text_end

VermilionGymSailorText:
	text_asm
	ld hl, VermilionGymTrainerHeader2
	call TalkToTrainer
	rst TextScriptEnd

VermilionGymSailorBattleText:
	text_far _VermilionGymSailorBattleText
	text_end

VermilionGymSailorEndBattleText:
	text_far _VermilionGymSailorEndBattleText
	text_end

VermilionGymSailorAfterBattleText:
	text_far _VermilionGymSailorAfterBattleText
	text_end

VermilionGymGymGuideText: ; marcelnote - optimized
	text_asm
	CheckEvent EVENT_BEAT_LT_SURGE
	ld hl, .BeatLTSurgeText
	ret nz
	ld hl, .ChampInMakingText
	ret

.ChampInMakingText:
	text_far _VermilionGymGymGuideChampInMakingText
	text_end

.BeatLTSurgeText:
	text_far _VermilionGymGymGuideBeatLTSurgeText
	text_end

VermilionGymLTSurgeRematchText: ; marcelnote - Lt.Surge rematch
	text_asm
	CheckEvent EVENT_BEAT_LT_SURGE_REMATCH
	ld hl, VermilionGymAfterRematchText
	ret nz
	ld hl, .PreBattleText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .refused
	ld hl, .AcceptBattleText
	call PrintText
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, .LTSurgeDefeatedText
	ld de, .LTSurgeDefeatedText
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, $3
	ld [wGymLeaderNo], a
	ld a, SCRIPT_VERMILIONGYM_LT_SURGE_REMATCH_POST_BATTLE
	ld [wVermilionGymCurScript], a
	rst TextScriptEnd
.refused
	ld hl, .RefusedBattleText
	call PrintText
	rst TextScriptEnd

.PreBattleText:
	text_far _VermilionGymLTSurgeRematchPreBattleText
	text_end

.AcceptBattleText:
	text_far _VermilionGymLTSurgeRematchAcceptBattleText
	text_end

.RefusedBattleText:
	text_far _VermilionGymLTSurgeRematchRefusedBattleText
	text_end

.LTSurgeDefeatedText:
	text_far _VermilionGymLTSurgeRematchDefeatedText
	text_end

VermilionGymAfterRematchText: ; marcelnote - Lt.Surge rematch
	text_far _VermilionGymAfterRematchText
	text_end
