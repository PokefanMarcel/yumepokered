; marcelnote - from Good to Super Rod in Fuchsia
FuchsiaSuperRodHouse_Script:
	jp EnableAutoTextBoxDrawing

FuchsiaSuperRodHouse_TextPointers:
	def_text_pointers
	dw_const FuchsiaSuperRodHouseFishingGuruText, TEXT_FUCHSIASUPERRODHOUSE_FISHING_GURU

FuchsiaSuperRodHouseFishingGuruText:
	text_asm
	ld a, [wd728]
	bit 5, a ; received super rod?
	jr nz, .got_super_rod
	ld hl, .DoYouLikeToFishText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .refused
	lb bc, SUPER_ROD, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, wd728
	set 5, [hl] ; received super rod
	ld hl, .TakeThisText
	jr .print_text
.bag_full
	ld hl, .NoRoomText
	jr .print_text
.refused
	ld hl, .ThatsDisappointingText
	jr .print_text
.got_super_rod
	ld hl, .TryFishingText
.print_text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

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