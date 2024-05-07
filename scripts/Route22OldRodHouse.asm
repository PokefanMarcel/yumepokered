; marcelnote - new location
Route22OldRodHouse_Script:
	jp EnableAutoTextBoxDrawing

Route22OldRodHouse_TextPointers:
	def_text_pointers
	dw_const Route22OldRodHouseFishingGuruText, TEXT_ROUTE22OLDRODHOUSE_FISHING_GURU

Route22OldRodHouseFishingGuruText:
	text_asm
	ld a, [wd728]
	bit 3, a ; got old rod?
	jr nz, .got_old_rod
	ld hl, .DoYouLikeToFishText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .refused
	lb bc, OLD_ROD, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, wd728
	set 3, [hl] ; got old rod
	ld hl, .TakeThisText
	jr .print_text
.bag_full
	ld hl, .NoRoomText
	jr .print_text
.refused
	ld hl, .ThatsSoDisappointingText
	jr .print_text
.got_old_rod
	ld hl, .HowAreTheFishBitingText
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
