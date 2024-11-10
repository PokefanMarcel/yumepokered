; marcelnote - from Good to Super Rod in Fuchsia
FuchsiaSuperRodHouse_Script:
	jp EnableAutoTextBoxDrawing

FuchsiaSuperRodHouse_TextPointers:
	def_text_pointers
	dw_const FuchsiaSuperRodHouseFishingGuruText, TEXT_FUCHSIASUPERRODHOUSE_FISHING_GURU

FuchsiaSuperRodHouseFishingGuruText: ; marcelnote - optimized
	text_asm
	ld a, [wStatusFlags1]
	bit BIT_GOT_SUPER_ROD, a ; received super rod?
	ld hl, .TryFishingText
	jr nz, .print_text
	ld hl, .DoYouLikeToFishText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ld hl, .ThatsDisappointingText
	jr nz, .print_text
	lb bc, SUPER_ROD, 1
	call GiveItem
	ld hl, .NoRoomText
	jr nc, .print_text
	ld hl, wStatusFlags1
	set BIT_GOT_SUPER_ROD, [hl] ; received super rod
	ld hl, .TakeThisText
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