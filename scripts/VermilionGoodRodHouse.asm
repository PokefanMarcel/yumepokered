; marcelnote - from Old to Good Rod in Vermilion
VermilionGoodRodHouse_Script:
	jp EnableAutoTextBoxDrawing

VermilionGoodRodHouse_TextPointers:
	def_text_pointers
	dw_const VermilionGoodRodHouseFishingGuruText, TEXT_VERMILIONGOODRODHOUSE_FISHING_GURU

VermilionGoodRodHouseFishingGuruText: ; marcelnote - optimized
	text_asm
	ld a, [wStatusFlags1]
	bit BIT_GOT_GOOD_ROD, a ; got good rod?
	ld hl, .HowAreTheFishBitingText
	jr nz, .print_text
	ld hl, .DoYouLikeToFishText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ld hl, .ThatsSoDisappointingText
	jr nz, .print_text
	lb bc, GOOD_ROD, 1
	call GiveItem
	ld hl, .NoRoomText
	jr nc, .print_text
	ld hl, wStatusFlags1
	set BIT_GOT_GOOD_ROD, [hl] ; got good rod
	ld hl, .TakeThisText
.print_text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.DoYouLikeToFishText:
	text_far _VermilionGoodRodHouseFishingGuruDoYouLikeToFishText
	text_end

.TakeThisText:
	text_far _VermilionGoodRodHouseFishingGuruTakeThisText
	sound_get_item_1
	text_end

.ThatsSoDisappointingText:
	text_far _VermilionGoodRodHouseFishingGuruThatsSoDisappointingText
	text_end

.HowAreTheFishBitingText:
	text_far _VermilionGoodRodHouseFishingGuruHowAreTheFishBitingText
	text_end

.NoRoomText:
	text_far _VermilionGoodRodHouseFishingGuruNoRoomText
	text_end
