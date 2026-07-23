PewterGym_Script:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_2, [hl]
	res BIT_CUR_MAP_LOADED_2, [hl]
	call nz, .LoadNames
	call EnableAutoTextBoxDrawing
	ld hl, PewterGymTrainerHeaders
	ld de, PewterGym_ScriptPointers
	ld a, [wPewterGymCurScript]
	call ExecuteCurMapScriptInTable
	ld [wPewterGymCurScript], a
	ret

.LoadNames:
	ld hl, .CityName
	ld de, .LeaderName
	jp LoadGymLeaderAndCityName

IF DEF(_FRA)
.CityName:
	db "ARGENTA@"
.LeaderName:
	db "PIERRE@"
ELIF DEF(_ESP)
.CityName:
	db "CIUDAD PLATEADA@"
.LeaderName:
	db "BROCK@"
ELSE
.CityName:
	db "PEWTER CITY@"
.LeaderName:
	db "BROCK@"
ENDC

PewterGymResetScripts:
	xor a ; SCRIPT_PEWTERGYM_DEFAULT
	ld [wJoyIgnore], a
	ld [wPewterGymCurScript], a
	ld [wCurMapScript], a
	ret

PewterGym_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_PEWTERGYM_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_PEWTERGYM_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_PEWTERGYM_END_BATTLE
	dw_const PewterGymBrockPostBattleScript,        SCRIPT_PEWTERGYM_BROCK_POST_BATTLE
	dw_const PewterGymBrockRematchPostBattleScript, SCRIPT_PEWTERGYM_BROCK_REMATCH_POST_BATTLE ; marcelnote - Brock rematch

PewterGymBrockPostBattleScript:
	ld a, [wIsInBattle]
	cp $ff
	jr z, PewterGymResetScripts
	ld a, PAD_CTRL_PAD
	ld [wJoyIgnore], a
	; fallthrough

PewterGymReceiveTM34: ; marcelnote - optimized
	; Brock's badge information is already part of the end-battle text,
	; so his TM offer starts with a separate prompt.
	ld a, TEXT_PEWTERGYM_BROCK_WAIT_TAKE_THIS
	ldh [hTextID], a
	call DisplayTextID
	SetEvent EVENT_BEAT_BROCK
	lb bc, TM_BIDE, 1
	call GiveItem
	ld a, TEXT_PEWTERGYM_BROCK_TM34_NO_ROOM
	jr nc, .displayTMText
	SetEvent EVENT_GOT_TM34
	ld a, TEXT_PEWTERGYM_BROCK_RECEIVED_TM34
.displayTMText
	ldh [hTextID], a
	call DisplayTextID
	ld hl, wObtainedBadges
	set BIT_BOULDERBADGE, [hl]

	ld a, TOGGLE_GYM_GUY
	ld [wToggleableObjectIndex], a
	predef HideObject
	ld a, TOGGLE_ROUTE_22_RIVAL_1
	ld [wToggleableObjectIndex], a
	predef HideObject

	ResetEvents EVENT_1ST_ROUTE22_RIVAL_BATTLE, EVENT_ROUTE22_RIVAL_WANTS_BATTLE

	; deactivate gym trainers
	SetEvent EVENT_BEAT_PEWTER_GYM_TRAINER_0

	jr PewterGymResetScripts

PewterGymBrockRematchPostBattleScript: ; marcelnote - Brock rematch
	ld a, [wIsInBattle]
	cp $ff
	jr z, PewterGymResetScripts
	ld a, PAD_CTRL_PAD
	ld [wJoyIgnore], a
	ld a, TEXT_PEWTERGYM_AFTER_REMATCH
	ldh [hTextID], a
	call DisplayTextID
	SetEvent EVENT_BEAT_BROCK_REMATCH
	jr PewterGymResetScripts

PewterGym_TextPointers:
	def_text_pointers
	dw_const PewterGymBrockText,             TEXT_PEWTERGYM_BROCK
	dw_const PewterGymBrockRematchText,      TEXT_PEWTERGYM_BROCK_REMATCH
	dw_const PewterGymCooltrainerMText,      TEXT_PEWTERGYM_COOLTRAINER_M
	dw_const PewterGymGymGuideText,          TEXT_PEWTERGYM_GYM_GUIDE
	dw_const PewterGymBrockWaitTakeThisText, TEXT_PEWTERGYM_BROCK_WAIT_TAKE_THIS
	dw_const PewterGymBrockReceivedTM34Text, TEXT_PEWTERGYM_BROCK_RECEIVED_TM34
	dw_const PewterGymBrockTM34NoRoomText,   TEXT_PEWTERGYM_BROCK_TM34_NO_ROOM
	dw_const PewterGymAfterRematchText,      TEXT_PEWTERGYM_AFTER_REMATCH ; marcelnote - Brock rematch

PewterGymTrainerHeaders:
	def_trainers 3 ; marcelnote - added 1 to accomodate Brock rematch
PewterGymTrainerHeader0:
	trainer EVENT_BEAT_PEWTER_GYM_TRAINER_0, 5, PewterGymCooltrainerMBattleText, PewterGymCooltrainerMEndBattleText, PewterGymCooltrainerMAfterBattleText
	db -1 ; end

PewterGymBrockText:
	text_asm
	CheckEvent EVENT_BEAT_BROCK
	jr z, .beforeBeat
	CheckEventReuseA EVENT_GOT_TM34
	ld hl, .PostBattleAdviceText
	ret nz
	call PewterGymReceiveTM34
	call DisableWaitingAfterTextDisplay
	rst TextScriptEnd
.beforeBeat
	ld hl, .PreBattleText
	call PrintText
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, .ReceivedBoulderBadgeText
	ld de, .ReceivedBoulderBadgeText
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, $1
	ld [wGymLeaderNo], a
	xor a
	ldh [hJoyHeld], a
	ld a, SCRIPT_PEWTERGYM_BROCK_POST_BATTLE
	ld [wPewterGymCurScript], a
	ld [wCurMapScript], a
	rst TextScriptEnd

.PreBattleText:
	text_far _PewterGymBrockPreBattleText
	text_end

.ReceivedBoulderBadgeText:
	text_far _PewterGymBrockReceivedBoulderBadgeText
	sound_get_item_1 ; marcelnote - had sound_level_up due to the battle audio bank, but probably intended sound_get_item_1
	text_far _PewterGymBrockBoulderBadgeInfoText
	text_end

.PostBattleAdviceText:
	text_far _PewterGymBrockPostBattleAdviceText
	text_end

PewterGymBrockWaitTakeThisText:
	text_far _PewterGymBrockWaitTakeThisText
	text_end

PewterGymBrockReceivedTM34Text:
	text_far _PewterGymReceivedTM34Text
	sound_get_item_1
	text_far _TM34ExplanationText
	text_end

PewterGymBrockTM34NoRoomText:
	text_far _PewterGymTM34NoRoomText
	text_end

PewterGymCooltrainerMText:
	text_asm
	ld hl, PewterGymTrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd

PewterGymCooltrainerMBattleText:
	text_far _PewterGymCooltrainerMBattleText
	text_end

PewterGymCooltrainerMEndBattleText:
	text_far _PewterGymCooltrainerMEndBattleText
	text_end

PewterGymCooltrainerMAfterBattleText:
	text_far _PewterGymCooltrainerMAfterBattleText
	text_end

PewterGymGymGuideText: ; marcelnote - optimized
	text_asm
	CheckEvent EVENT_BEAT_BROCK
	ld hl, PewterGymGuidePostBattleText
	ret nz
	ld hl, PewterGymGuidePreAdviceText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ld hl, PewterGymGuideFreeServiceText
	jr nz, .saidNo
	ld hl, PewterGymGuideBeginAdviceText
.saidNo
	call PrintText
	ld hl, PewterGymGuideAdviceText
	call PrintText
	rst TextScriptEnd

PewterGymGuidePreAdviceText:
	text_far _PewterGymGuidePreAdviceText
	text_end

PewterGymGuideBeginAdviceText:
	text_far _PewterGymGuideBeginAdviceText
	text_end

PewterGymGuideAdviceText:
	text_far _PewterGymGuideAdviceText
	text_end

PewterGymGuideFreeServiceText:
	text_far _PewterGymGuideFreeServiceText
	text_end

PewterGymGuidePostBattleText:
	text_far _PewterGymGuidePostBattleText
	text_end


PewterGymBrockRematchText: ; marcelnote - Brock rematch
	text_asm
	CheckEvent EVENT_BEAT_BROCK_REMATCH
	ld hl, PewterGymAfterRematchText
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
	ld hl, .BrockDefeatedText
	ld de, .BrockDefeatedText
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, $1
	ld [wGymLeaderNo], a
	xor a
	ldh [hJoyHeld], a
	ld a, SCRIPT_PEWTERGYM_BROCK_REMATCH_POST_BATTLE
	ld [wPewterGymCurScript], a
	ld [wCurMapScript], a
	rst TextScriptEnd
.refused
	ld hl, .RefusedBattleText
	call PrintText
	rst TextScriptEnd

.PreBattleText:
	text_far _PewterGymBrockRematchPreBattleText
	text_end

.AcceptBattleText:
	text_far _PewterGymBrockRematchAcceptBattleText
	text_end

.RefusedBattleText:
	text_far _PewterGymBrockRematchRefusedBattleText
	text_end

.BrockDefeatedText:
	text_far _PewterGymBrockRematchDefeatedText
	text_end

PewterGymAfterRematchText: ; marcelnote - Brock rematch
	text_far _PewterGymAfterRematchText
	text_end
