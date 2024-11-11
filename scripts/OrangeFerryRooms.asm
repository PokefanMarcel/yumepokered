; marcelnote - new location
OrangeFerryRooms_Script:
	call EnableAutoTextBoxDrawing
	ld hl, OrangeFerryRoomsTrainerHeaders
	ld de, OrangeFerryRooms_ScriptPointers
	ld a, [wOrangeFerryRoomsCurScript]
	call ExecuteCurMapScriptInTable
	ld [wOrangeFerryRoomsCurScript], a
	ret

OrangeFerryRooms_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_ORANGEFERRYROOMS_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ORANGEFERRYROOMS_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ORANGEFERRYROOMS_END_BATTLE
	dw_const OrangeFerryRoomsCheckIfArrivedScript,  SCRIPT_ORANGEFERRYROOMS_CHECK_IF_ARRIVED

OrangeFerryRoomsCheckIfArrivedScript:
	; check first if has already travelled to Mandarin Island, in which case skip the need to battle
	CheckEvent EVENT_BEAT_ORANGE_FERRY_ROOMS_TRAINER_0
	jr z, .notArrived
	SetEvent EVENT_FERRY_ARRIVED
	call Delay3
	farcall ShakeElevator
	ld a, TEXT_ORANGEFERRYROOMS_SPEAKER_ARRIVED
	ldh [hTextID], a
	call DisplayTextID
.notArrived
	ld a, SCRIPT_ORANGEFERRYROOMS_DEFAULT
	ld [wOrangeFerryRoomsCurScript], a
	ld [wCurMapScript], a
	ret

OrangeFerryRooms_TextPointers:
	def_text_pointers
	dw_const OrangeFerryRoomsGentleman1Text,      TEXT_ORANGEFERRYROOMS_GENTLEMAN1
	dw_const OrangeFerryRoomsNurseText,           TEXT_ORANGEFERRYROOMS_NURSE
	dw_const OrangeFerryRoomsSpeakerArrivedText,  TEXT_ORANGEFERRYROOMS_SPEAKER_ARRIVED

OrangeFerryRoomsTrainerHeaders:
	def_trainers
OrangeFerryRoomsTrainerHeader0:
	trainer EVENT_BEAT_ORANGE_FERRY_ROOMS_TRAINER_0, 2, OrangeFerryRoomsGentleman1BattleText, OrangeFerryRoomsGentleman1EndBattleText, OrangeFerryRoomsGentleman1AfterBattleText
;SSAnne8TrainerHeader1:
;	trainer EVENT_BEAT_SS_ANNE_8_TRAINER_1, 3, SSAnne1FRoomsGentleman2BattleText, SSAnne1FRoomsGentleman2EndBattleText, SSAnne1FRoomsGentleman2AfterBattleText
;SSAnne8TrainerHeader2:
;	trainer EVENT_BEAT_SS_ANNE_8_TRAINER_2, 2, SSAnne1FRoomsYoungsterBattleText, SSAnne1FRoomsYoungsterEndBattleText, SSAnne1FRoomsYoungsterAfterBattleText
;SSAnne8TrainerHeader3:
;	trainer EVENT_BEAT_SS_ANNE_8_TRAINER_3, 2, SSAnne1FRoomsCooltrainerFBattleText, SSAnne1FRoomsCooltrainerFEndBattleText, SSAnne1FRoomsCooltrainerFAfterBattleText
	db -1 ; end

;SSAnne1FRoomsGentleman1Text:
;	text_asm
;	ld hl, SSAnne8TrainerHeader0
;	call TalkToTrainer
;	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

;SSAnne1FRoomsGentleman1BattleText:
;	text_far _SSAnne1FRoomsGentleman1BattleText
;	text_end

;SSAnne1FRoomsGentleman1EndBattleText:
;	text_far _SSAnne1FRoomsGentleman1EndBattleText
;	text_end

;SSAnne1FRoomsGentleman1AfterBattleText:
;	text_far _SSAnne1FRoomsGentleman1AfterBattleText
;	text_end

OrangeFerryRoomsGentleman1Text:
	text_asm
	ld hl, OrangeFerryRoomsTrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

OrangeFerryRoomsGentleman1BattleText:
	text_far _OrangeFerryRoomsGentleman1BattleText
	text_end

OrangeFerryRoomsGentleman1EndBattleText:
	text_far _OrangeFerryRoomsGentleman1EndBattleText
	text_end

OrangeFerryRoomsGentleman1AfterBattleText:
	text_far _OrangeFerryRoomsGentleman1AfterBattleText
	text_end

OrangeFerryRoomsNurseText:
	text_asm
	CheckEvent EVENT_FERRY_ARRIVED
	ld hl, .GoodLuckText
	jr nz, .arrived
	ld hl, .YouLookTiredText
	call PrintText
	predef HealParty
	call GBFadeOutToWhite
	call Delay3
	call GBFadeInFromWhite
	ld hl, .TakeCareText
	ld a, SCRIPT_ORANGEFERRYROOMS_CHECK_IF_ARRIVED
	ld [wOrangeFerryRoomsCurScript], a
.arrived
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.YouLookTiredText:
	text_far _OrangeFerryRoomsNurseYouLookTiredText
	text_end

.TakeCareText:
	text_far _OrangeFerryRoomsNurseTakeCareText
	text_end

.GoodLuckText:
	text_far _OrangeFerryRoomsNurseGoodLuckText
	text_end

OrangeFerryRoomsSpeakerArrivedText:
	text_far _OrangeFerryRoomsSpeakerArrivedText
	text_end
