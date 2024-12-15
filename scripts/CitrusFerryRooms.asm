; marcelnote - new location
CitrusFerryRooms_Script:
	call EnableAutoTextBoxDrawing
	ld hl, CitrusFerryRoomsTrainerHeaders
	ld de, CitrusFerryRooms_ScriptPointers
	ld a, [wCitrusFerryRoomsCurScript]
	call ExecuteCurMapScriptInTable
	ld [wCitrusFerryRoomsCurScript], a
	ret

CitrusFerryRooms_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_CITRUSFERRYROOMS_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_CITRUSFERRYROOMS_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_CITRUSFERRYROOMS_END_BATTLE
	dw_const CitrusFerryRoomsCheckIfArrivedScript,  SCRIPT_CITRUSFERRYROOMS_CHECK_IF_ARRIVED

CitrusFerryRoomsCheckIfArrivedScript:
	ld a, [wTownVisitedFlag + (MANDARIN_ISLAND / 8)]
	bit (MANDARIN_ISLAND % 8), a
	jr nz, .skipBattleChecks ; if already travelled to Mandarin Island, skip the battle checks
	CheckEvent EVENT_BEAT_CITRUS_FERRY_ROOMS_TRAINER_0 ; need to make CheckAllEventsRange!!
	jr z, .notArrived
	CheckEvent EVENT_BEAT_CITRUS_FERRY_ROOMS_TRAINER_1
	jr z, .notArrived
	CheckEvent EVENT_BEAT_CITRUS_FERRY_ROOMS_TRAINER_2
	jr z, .notArrived
	CheckEvent EVENT_BEAT_CITRUS_FERRY_OUTSIDE_TRAINER_0
	jr z, .notArrived
	CheckEvent EVENT_BEAT_CITRUS_FERRY_OUTSIDE_TRAINER_1
	jr z, .notArrived
	CheckEvent EVENT_BEAT_CITRUS_FERRY_OUTSIDE_TRAINER_2
	jr z, .notArrived
	CheckEvent EVENT_BEAT_CITRUS_FERRY_OUTSIDE_TRAINER_3
	jr z, .notArrived
.skipBattleChecks
	SetEventRange EVENT_FERRY_ARRIVED, EVENT_BEAT_CITRUS_FERRY_OUTSIDE_TRAINER_3
	call Delay3
	farcall ShakeElevator
	ld a, TEXT_CITRUSFERRYROOMS_SPEAKER_ARRIVED
	ldh [hTextID], a
	call DisplayTextID
.notArrived
	ld a, SCRIPT_CITRUSFERRYROOMS_DEFAULT
	ld [wCitrusFerryRoomsCurScript], a
	ld [wCurMapScript], a
	ret

CitrusFerryRooms_TextPointers:
	def_text_pointers
	dw_const CitrusFerryRoomsGentlemanText,       TEXT_CITRUSFERRYROOMS_GENTLEMAN
	dw_const CitrusFerryRoomsHikerText,           TEXT_CITRUSFERRYROOMS_HIKER
	dw_const CitrusFerryRoomsCooltrainerFText,    TEXT_CITRUSFERRYROOMS_COOLTRAINER_F
	dw_const CitrusFerryRoomsCaptainText,         TEXT_CITRUSFERRYROOMS_CAPTAIN
	dw_const CitrusFerryRoomsBlastoiseText,       TEXT_CITRUSFERRYROOMS_BLASTOISE
	dw_const CitrusFerryRoomsNurseText,           TEXT_CITRUSFERRYROOMS_NURSE
	dw_const CitrusFerryRoomsGrampsText,          TEXT_CITRUSFERRYROOMS_GRAMPS
	dw_const CitrusFerryRoomsScientistText,       TEXT_CITRUSFERRYROOMS_SCIENTIST
	dw_const CitrusFerryRoomsFossilText,          TEXT_CITRUSFERRYROOMS_FOSSIL
	dw_const CitrusFerryRoomsCaptainsBookText,    TEXT_CITRUSFERRYROOMS_CAPTAINS_BOOK
	dw_const CitrusFerryRoomsSpeakerArrivedText,  TEXT_CITRUSFERRYROOMS_SPEAKER_ARRIVED

CitrusFerryRoomsTrainerHeaders:
	def_trainers
CitrusFerryRoomsTrainerHeader0:
	trainer EVENT_BEAT_CITRUS_FERRY_ROOMS_TRAINER_0, 2, CitrusFerryRoomsGentlemanBattleText, CitrusFerryRoomsGentlemanEndBattleText, CitrusFerryRoomsGentlemanAfterBattleText
CitrusFerryRoomsTrainerHeader1:
	trainer EVENT_BEAT_CITRUS_FERRY_ROOMS_TRAINER_1, 2, CitrusFerryRoomsHikerBattleText, CitrusFerryRoomsHikerEndBattleText, CitrusFerryRoomsHikerAfterBattleText
CitrusFerryRoomsTrainerHeader2:
	trainer EVENT_BEAT_CITRUS_FERRY_ROOMS_TRAINER_2, 3, CitrusFerryRoomsCooltrainerFBattleText, CitrusFerryRoomsCooltrainerFEndBattleText, CitrusFerryRoomsCooltrainerFAfterBattleText
	db -1 ; end

CitrusFerryRoomsGentlemanText:
	text_asm
	ld hl, CitrusFerryRoomsTrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

CitrusFerryRoomsGentlemanBattleText:
	text_far _CitrusFerryRoomsGentlemanBattleText
	text_end

CitrusFerryRoomsGentlemanEndBattleText:
	text_far _CitrusFerryRoomsGentlemanEndBattleText
	text_end

CitrusFerryRoomsGentlemanAfterBattleText:
	text_far _CitrusFerryRoomsGentlemanAfterBattleText
	text_end

CitrusFerryRoomsHikerText:
	text_asm
	ld hl, CitrusFerryRoomsTrainerHeader1
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

CitrusFerryRoomsHikerBattleText:
	text_far _CitrusFerryRoomsHikerBattleText
	text_end

CitrusFerryRoomsHikerEndBattleText:
	text_far _CitrusFerryRoomsHikerEndBattleText
	text_end

CitrusFerryRoomsHikerAfterBattleText:
	text_far _CitrusFerryRoomsHikerAfterBattleText
	text_end

CitrusFerryRoomsCooltrainerFText:
	text_asm
	ld hl, CitrusFerryRoomsTrainerHeader2
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

CitrusFerryRoomsCooltrainerFBattleText:
	text_far _CitrusFerryRoomsCooltrainerFBattleText
	text_end

CitrusFerryRoomsCooltrainerFEndBattleText:
	text_far _CitrusFerryRoomsCooltrainerFEndBattleText
	text_end

CitrusFerryRoomsCooltrainerFAfterBattleText:
	text_far _CitrusFerryRoomsCooltrainerFAfterBattleText
	text_end

CitrusFerryRoomsNurseText:
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
	ld a, SCRIPT_CITRUSFERRYROOMS_CHECK_IF_ARRIVED
	ld [wCitrusFerryRoomsCurScript], a
.arrived
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.YouLookTiredText:
	text_far _CitrusFerryRoomsNurseYouLookTiredText
	text_end

.TakeCareText:
	text_far _CitrusFerryRoomsNurseTakeCareText
	text_end

.GoodLuckText:
	text_far _CitrusFerryRoomsNurseGoodLuckText
	text_end

CitrusFerryRoomsSpeakerArrivedText:
	text_far _CitrusFerryRoomsSpeakerArrivedText
	text_end

CitrusFerryRoomsGrampsText: ; the water tile still moves during the trade (Rhydon leg)
	text_asm
	ld a, TRADE_FOR_BUFFY
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

CitrusFerryRoomsScientistText: ; marcelnote - optimized
	text_asm
	CheckEvent EVENT_GOT_FERRY_FOSSIL
	ld hl, .SoMuchToLearnText
	jr nz, .print_text
	ld hl, .TakeThisText
	call PrintText
	ld c, 1
	ld b, HELIX_FOSSIL
	CheckEvent EVENT_GOT_DOME_FOSSIL
	jr nz, .loaded_fossil
	ld b, DOME_FOSSIL
.loaded_fossil
	call GiveItem
	ld hl, .YouDontHaveSpaceText
	jr nc, .print_text
	SetEvent EVENT_GOT_FERRY_FOSSIL
	ld a, HS_CITRUS_FERRY_ROOMS_FOSSIL
	ld [wMissableObjectIndex], a
	predef HideObjectCont
	CheckEvent EVENT_GOT_DOME_FOSSIL
	ld hl, .ReceivedHelixFossilText
	jr nz, .print_text
	ld hl, .ReceivedDomeFossilText
.print_text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.TakeThisText:
	text_far _CitrusFerryRoomsScientistTakeThisText
	text_end

.ReceivedDomeFossilText:
	text_far _CitrusFerryRoomsScientistReceivedDomeFossilText
	sound_get_item_1
	text_end

.ReceivedHelixFossilText:
	text_far _CitrusFerryRoomsScientistReceivedHelixFossilText
	sound_get_item_1
	text_end

.SoMuchToLearnText:
	text_far _CitrusFerryRoomsScientistSoMuchToLearnText
	text_end

.YouDontHaveSpaceText:
	text_far _CitrusFerryRoomsScientistYouDontHaveSpaceText
	text_end

CitrusFerryRoomsFossilText:
	text_far _CitrusFerryRoomsFossilText
	text_end

CitrusFerryRoomsCaptainText:
	text_far _CitrusFerryRoomsCaptainText
	text_end

CitrusFerryRoomsBlastoiseText:
	text_far _CitrusFerryRoomsBlastoiseText
	text_asm
	ld a, BLASTOISE
	call PlayCry
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

CitrusFerryRoomsCaptainsBookText:
	text_far _CitrusFerryRoomsCaptainsBookText
	text_end
