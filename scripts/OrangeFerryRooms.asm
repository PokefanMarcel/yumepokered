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
	ld a, [wTownVisitedFlag + (MANDARIN_ISLAND / 8)]
	bit (MANDARIN_ISLAND % 8), a
	jr nz, .skipBattleChecks ; if already travelled to Mandarin Island, skip the battle checks
	CheckEvent EVENT_BEAT_ORANGE_FERRY_ROOMS_TRAINER_0 ; need to make CheckAllEventsRange!!
	jr z, .notArrived
	CheckEvent EVENT_BEAT_ORANGE_FERRY_ROOMS_TRAINER_1
	jr z, .notArrived
	CheckEvent EVENT_BEAT_ORANGE_FERRY_ROOMS_TRAINER_2
	jr z, .notArrived
	CheckEvent EVENT_BEAT_ORANGE_FERRY_OUTSIDE_TRAINER_0
	jr z, .notArrived
	CheckEvent EVENT_BEAT_ORANGE_FERRY_OUTSIDE_TRAINER_1
	jr z, .notArrived
	CheckEvent EVENT_BEAT_ORANGE_FERRY_OUTSIDE_TRAINER_2
	jr z, .notArrived
	CheckEvent EVENT_BEAT_ORANGE_FERRY_OUTSIDE_TRAINER_3
	jr z, .notArrived
.skipBattleChecks
	SetEventRange EVENT_FERRY_ARRIVED, EVENT_BEAT_ORANGE_FERRY_OUTSIDE_TRAINER_3
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
	dw_const OrangeFerryRoomsGentlemanText,       TEXT_ORANGEFERRYROOMS_GENTLEMAN
	dw_const OrangeFerryRoomsHikerText,           TEXT_ORANGEFERRYROOMS_HIKER
	dw_const OrangeFerryRoomsCooltrainerFText,    TEXT_ORANGEFERRYROOMS_COOLTRAINER_F
	dw_const OrangeFerryRoomsCaptainText,         TEXT_ORANGEFERRYROOMS_CAPTAIN
	dw_const OrangeFerryRoomsBlastoiseText,       TEXT_ORANGEFERRYROOMS_BLASTOISE
	dw_const OrangeFerryRoomsNurseText,           TEXT_ORANGEFERRYROOMS_NURSE
	dw_const OrangeFerryRoomsGrampsText,          TEXT_ORANGEFERRYROOMS_GRAMPS
	dw_const OrangeFerryRoomsScientistText,       TEXT_ORANGEFERRYROOMS_SCIENTIST
	dw_const OrangeFerryRoomsFossilText,          TEXT_ORANGEFERRYROOMS_FOSSIL
	dw_const OrangeFerryRoomsCaptainsBookText,    TEXT_ORANGEFERRYROOMS_CAPTAINS_BOOK
	dw_const OrangeFerryRoomsSpeakerArrivedText,  TEXT_ORANGEFERRYROOMS_SPEAKER_ARRIVED

OrangeFerryRoomsTrainerHeaders:
	def_trainers
OrangeFerryRoomsTrainerHeader0:
	trainer EVENT_BEAT_ORANGE_FERRY_ROOMS_TRAINER_0, 2, OrangeFerryRoomsGentlemanBattleText, OrangeFerryRoomsGentlemanEndBattleText, OrangeFerryRoomsGentlemanAfterBattleText
OrangeFerryRoomsTrainerHeader1:
	trainer EVENT_BEAT_ORANGE_FERRY_ROOMS_TRAINER_1, 2, OrangeFerryRoomsHikerBattleText, OrangeFerryRoomsHikerEndBattleText, OrangeFerryRoomsHikerAfterBattleText
OrangeFerryRoomsTrainerHeader2:
	trainer EVENT_BEAT_ORANGE_FERRY_ROOMS_TRAINER_2, 3, OrangeFerryRoomsCooltrainerFBattleText, OrangeFerryRoomsCooltrainerFEndBattleText, OrangeFerryRoomsCooltrainerFAfterBattleText
	db -1 ; end

OrangeFerryRoomsGentlemanText:
	text_asm
	ld hl, OrangeFerryRoomsTrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

OrangeFerryRoomsGentlemanBattleText:
	text_far _OrangeFerryRoomsGentlemanBattleText
	text_end

OrangeFerryRoomsGentlemanEndBattleText:
	text_far _OrangeFerryRoomsGentlemanEndBattleText
	text_end

OrangeFerryRoomsGentlemanAfterBattleText:
	text_far _OrangeFerryRoomsGentlemanAfterBattleText
	text_end

OrangeFerryRoomsHikerText:
	text_asm
	ld hl, OrangeFerryRoomsTrainerHeader1
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

OrangeFerryRoomsHikerBattleText:
	text_far _OrangeFerryRoomsHikerBattleText
	text_end

OrangeFerryRoomsHikerEndBattleText:
	text_far _OrangeFerryRoomsHikerEndBattleText
	text_end

OrangeFerryRoomsHikerAfterBattleText:
	text_far _OrangeFerryRoomsHikerAfterBattleText
	text_end

OrangeFerryRoomsCooltrainerFText:
	text_asm
	ld hl, OrangeFerryRoomsTrainerHeader2
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

OrangeFerryRoomsCooltrainerFBattleText:
	text_far _OrangeFerryRoomsCooltrainerFBattleText
	text_end

OrangeFerryRoomsCooltrainerFEndBattleText:
	text_far _OrangeFerryRoomsCooltrainerFEndBattleText
	text_end

OrangeFerryRoomsCooltrainerFAfterBattleText:
	text_far _OrangeFerryRoomsCooltrainerFAfterBattleText
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

OrangeFerryRoomsGrampsText: ; the water tile still moves during the trade (Rhydon leg)
	text_asm
	ld a, TRADE_FOR_BUFFY
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

OrangeFerryRoomsScientistText: ; marcelnote - optimized
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
	ld a, HS_ORANGE_FERRY_ROOMS_FOSSIL
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
	text_far _OrangeFerryRoomsScientistTakeThisText
	text_end

.ReceivedDomeFossilText:
	text_far _OrangeFerryRoomsScientistReceivedDomeFossilText
	sound_get_item_1
	text_end

.ReceivedHelixFossilText:
	text_far _OrangeFerryRoomsScientistReceivedHelixFossilText
	sound_get_item_1
	text_end

.SoMuchToLearnText:
	text_far _OrangeFerryRoomsScientistSoMuchToLearnText
	text_end

.YouDontHaveSpaceText:
	text_far _OrangeFerryRoomsScientistYouDontHaveSpaceText
	text_end

OrangeFerryRoomsFossilText:
	text_far _OrangeFerryRoomsFossilText
	text_end

OrangeFerryRoomsCaptainText:
	text_far _OrangeFerryRoomsCaptainText
	text_end

OrangeFerryRoomsBlastoiseText:
	text_far _OrangeFerryRoomsBlastoiseText
	text_asm
	ld a, BLASTOISE
	call PlayCry
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

OrangeFerryRoomsCaptainsBookText:
	text_far _OrangeFerryRoomsCaptainsBookText
	text_end
