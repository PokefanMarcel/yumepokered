; marcelnote - from Super Rod to Fishing Guide on Route 12
Route12FishingGuideHouse_Script:
	jp EnableAutoTextBoxDrawing

Route12FishingGuideHouse_TextPointers:
	def_text_pointers
	dw_const Route12FishingGuideHouseFishingGuideText, TEXT_ROUTE12FISHINGGUIDEHOUSE_FISHING_GUIDE

Route12FishingGuideHouseFishingGuideText: ; marcelnote - new
	text_asm
	CheckEvent EVENT_GOT_FISHING_GUIDE
	ld hl, .ToAllTravelersText
	jr nz, .print_text
	ld hl, .ItsAFishingGuideText
	call PrintText
	SetEvent EVENT_GOT_FISHING_GUIDE
	ld hl, .AddedToPokedexText
	call PrintText
	ld a, SFX_GET_ITEM_2 ; SFX_GET_ITEM_1 ?
	call PlaySound
	call WaitForSoundToFinish
	ld hl, .AreaUpgradedText
.print_text
	call PrintText
	rst TextScriptEnd

.ItsAFishingGuideText
	text_far _Route12FishingGuideHouseItsAFishingGuideText
	text_end

.AddedToPokedexText
	text_far _Route12FishingGuideHouseAddedToPokedexText
	text_end

.AreaUpgradedText
	text_far _Route12FishingGuideHouseAreaUpgradedText
	text_end

.ToAllTravelersText
	text_far _Route12FishingGuideHouseToAllTravelersText
	text_end
