ViridianGym_Script:
	ld hl, .CityName
	ld de, .LeaderName
	call LoadGymLeaderAndCityName
	call EnableAutoTextBoxDrawing
	ld hl, ViridianGymTrainerHeaders
	ld de, ViridianGym_ScriptPointers
	ld a, [wViridianGymCurScript]
	call ExecuteCurMapScriptInTable
	ld [wViridianGymCurScript], a
	ret

.CityName:
	db "VIRIDIAN CITY@"

.LeaderName:
	db "GIOVANNI@"

ViridianGymResetScripts:
	xor a
	ld [wJoyIgnore], a
	ld [wViridianGymCurScript], a
	ld [wCurMapScript], a
	ret

ViridianGym_ScriptPointers:
	def_script_pointers
	dw_const ViridianGymDefaultScript,              SCRIPT_VIRIDIANGYM_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_VIRIDIANGYM_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_VIRIDIANGYM_END_BATTLE
	dw_const ViridianGymGiovanniPostBattle,         SCRIPT_VIRIDIANGYM_GIOVANNI_POST_BATTLE
	dw_const ViridianGymPlayerSpinningScript,       SCRIPT_VIRIDIANGYM_PLAYER_SPINNING

ViridianGymDefaultScript:
	ld a, [wYCoord]
	ld b, a
	ld a, [wXCoord]
	ld c, a
	ld hl, ViridianGymArrowTilePlayerMovement
	call DecodeArrowMovementRLE
	cp $ff
	jp z, CheckFightingMapTrainers
	call StartSimulatingJoypadStates
	ld hl, wMovementFlags
	set BIT_SPINNING, [hl]
	ld a, SFX_ARROW_TILES
	call PlaySound
	ld a, PAD_BUTTONS | PAD_CTRL_PAD
	ld [wJoyIgnore], a
	ld a, SCRIPT_VIRIDIANGYM_PLAYER_SPINNING
	ld [wCurMapScript], a
	ret

ViridianGymArrowTilePlayerMovement:
	map_coord_movement 19, 11, ViridianGymArrowMovement1
	map_coord_movement 19,  1, ViridianGymArrowMovement2
	map_coord_movement 18,  2, ViridianGymArrowMovement3
	map_coord_movement 11,  2, ViridianGymArrowMovement4
	map_coord_movement 16, 10, ViridianGymArrowMovement5
	map_coord_movement  4,  6, ViridianGymArrowMovement6
	map_coord_movement  5, 13, ViridianGymArrowMovement7
	map_coord_movement  4, 14, ViridianGymArrowMovement8
	map_coord_movement  0, 15, ViridianGymArrowMovement9
	map_coord_movement  1, 15, ViridianGymArrowMovement10
	map_coord_movement 13, 16, ViridianGymArrowMovement11
	map_coord_movement 13, 17, ViridianGymArrowMovement12
	db -1 ; end

ViridianGymArrowMovement1:
	db PAD_UP, 9
	db -1 ; end

ViridianGymArrowMovement2:
	db PAD_LEFT, 8
	db -1 ; end

ViridianGymArrowMovement3:
	db PAD_DOWN, 9
	db -1 ; end

ViridianGymArrowMovement4:
	db PAD_RIGHT, 6
	db -1 ; end

ViridianGymArrowMovement5:
	db PAD_DOWN, 2
	db -1 ; end

ViridianGymArrowMovement6:
	db PAD_DOWN, 7
	db -1 ; end

ViridianGymArrowMovement7:
	db PAD_RIGHT, 8
	db -1 ; end

ViridianGymArrowMovement8:
	db PAD_RIGHT, 9
	db -1 ; end

ViridianGymArrowMovement9:
	db PAD_UP, 8
	db -1 ; end

ViridianGymArrowMovement10:
	db PAD_UP, 6
	db -1 ; end

ViridianGymArrowMovement11:
	db PAD_LEFT, 6
	db -1 ; end

ViridianGymArrowMovement12:
	db PAD_LEFT, 12
	db -1 ; end

ViridianGymPlayerSpinningScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	jr nz, .ViridianGymLoadSpinnerArrow
	xor a
	ld [wJoyIgnore], a
	ld hl, wMovementFlags
	res BIT_SPINNING, [hl]
	ld a, SCRIPT_VIRIDIANGYM_DEFAULT
	ld [wCurMapScript], a
	ret
.ViridianGymLoadSpinnerArrow
	jpfar LoadSpinnerArrowTiles

ViridianGymGiovanniPostBattle:
	ld a, [wIsInBattle]
	cp $ff
	jp z, ViridianGymResetScripts
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
	jr nc, .bag_full
	SetEvent EVENT_GOT_TM27
	ld a, TEXT_VIRIDIANGYM_GIOVANNI_RECEIVED_TM27
.bag_full
	ldh [hTextID], a
	call DisplayTextID
	ld hl, wObtainedBadges
	set BIT_EARTHBADGE, [hl]
	;ld hl, wBeatGymFlags     ; marcelnote - removed redundant wBeatGymFlags
	;set BIT_EARTHBADGE, [hl]

	; deactivate gym trainers
	SetEventRange EVENT_BEAT_VIRIDIAN_GYM_TRAINER_0, EVENT_BEAT_VIRIDIAN_GYM_TRAINER_7

	ld a, HS_ROUTE_22_RIVAL_2
	ld [wMissableObjectIndex], a
	predef ShowObject
	SetEvents EVENT_2ND_ROUTE22_RIVAL_BATTLE, EVENT_ROUTE22_RIVAL_WANTS_BATTLE
	jp ViridianGymResetScripts

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

ViridianGymTrainerHeaders:
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
	call z, ViridianGymReceiveTM27
	call DisableWaitingAfterTextDisplay
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd
.afterBeat
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, .PostBattleAdviceText
	call PrintText
	call GBFadeOutToBlack
	ld a, HS_VIRIDIAN_GYM_GIOVANNI
	ld [wMissableObjectIndex], a
	predef HideObject
	call UpdateSprites
	call Delay3
	call GBFadeInFromBlack
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd
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
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.PreBattleText:
	text_far _ViridianGymGiovanniPreBattleText
	text_end

.ReceivedEarthBadgeText:
	text_far _ViridianGymGiovanniReceivedEarthBadgeText
	sound_level_up ; probably supposed to play SFX_GET_ITEM_1 but the wrong music bank is loaded
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
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

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
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

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
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

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
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

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
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

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
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

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
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

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
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

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
	jr nz, .afterBeat
	ld hl, ViridianGymGuidePreBattleText
.afterBeat
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

ViridianGymGuidePreBattleText:
	text_far _ViridianGymGuidePreBattleText
	text_end

ViridianGymGuidePostBattleText:
	text_far _ViridianGymGuidePostBattleText
	text_end
