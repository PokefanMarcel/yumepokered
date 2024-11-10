; marcelnote - new location
Route22OldRodHouse_Script:
	jp EnableAutoTextBoxDrawing

Route22OldRodHouse_TextPointers:
	def_text_pointers
	dw_const Route22OldRodHouseFishingGuruText, TEXT_ROUTE22OLDRODHOUSE_FISHING_GURU

Route22OldRodHouseFishingGuruText: ; marcelnote - optimized
	text_asm
	ld a, [wStatusFlags1]
	bit BIT_GOT_OLD_ROD, a
	ld hl, .HowAreTheFishBitingText
	jr nz, .print_text
	ld hl, .DoYouLikeToFishText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ld hl, .ThatsSoDisappointingText
	jr nz, .print_text
	lb bc, OLD_ROD, 1
	call GiveItem
	ld hl, .NoRoomText
	jr nc, .print_text
	ld hl, wStatusFlags1
	set BIT_GOT_OLD_ROD, [hl]
	ld hl, .TakeThisText
.print_text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.DoYouLikeToFishText:
	text_far _Route22OldRodHouseFishingGuruDoYouLikeToFishText
	text_end

.TakeThisText:
	text_far _Route22OldRodHouseFishingGuruTakeThisText
	sound_get_item_1
	text_far _Route22OldRodHouseFishingGuruFishingIsAWayOfLifeText
	text_end

.ThatsSoDisappointingText:
	text_far _Route22OldRodHouseFishingGuruThatsSoDisappointingText
	text_end

.HowAreTheFishBitingText:
	text_far _Route22OldRodHouseFishingGuruHowAreTheFishBitingText
	text_end

.NoRoomText:
	text_far _Route22OldRodHouseFishingGuruNoRoomText
	text_end
