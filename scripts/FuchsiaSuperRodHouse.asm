; marcelnote - from Good to Super Rod in Fuchsia
FuchsiaSuperRodHouse_Script:
	jp EnableAutoTextBoxDrawing

FuchsiaSuperRodHouse_TextPointers:
	def_text_pointers
	dw_const FuchsiaSuperRodHouseFishingGuruText, TEXT_FUCHSIASUPERRODHOUSE_FISHING_GURU

FuchsiaSuperRodHouseFishingGuruText: ; marcelnote - optimized
	text_asm
	CheckEvent EVENT_GOT_SUPER_ROD
	ld hl, .TryFishingText
	jr nz, .printText
	ld hl, .DoYouLikeToFishText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ld hl, .ThatsDisappointingText
	jr nz, .printText
	lb bc, SUPER_ROD, 1
	call GiveItem
	ld hl, .NoRoomText
	jr nc, .printText
	SetEvent EVENT_GOT_SUPER_ROD
	ld hl, .TakeThisText
.printText
	call PrintText
	rst TextScriptEnd

.DoYouLikeToFishText:
	text_far _FuchsiaSuperRodHouseFishingGuruDoYouLikeToFishText
	text_end

.TakeThisText:
	text_far _FuchsiaSuperRodHouseFishingGuruTakeThisText
	sound_get_item_1
	text_far _FuchsiaSuperRodHouseFishingGuruFishingWayOfLifeText
	text_end

.ThatsDisappointingText:
	text_far _FuchsiaSuperRodHouseFishingGuruThatsDisappointingText
	text_end

.TryFishingText:
	text_far _FuchsiaSuperRodHouseFishingGuruTryFishingText
	text_end

.NoRoomText:
	text_far _FuchsiaSuperRodHouseFishingGuruNoRoomText
	text_end
