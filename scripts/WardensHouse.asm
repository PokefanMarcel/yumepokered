WardensHouse_Script:
	jp EnableAutoTextBoxDrawing

WardensHouse_TextPointers:
	def_text_pointers
	dw_const WardensHouseWardenText,  TEXT_WARDENSHOUSE_WARDEN
	dw_const PickUpItemText,          TEXT_WARDENSHOUSE_RARE_CANDY
	dw_const BoulderText,             TEXT_WARDENSHOUSE_BOULDER
	dw_const WardensHouseDisplayText, TEXT_WARDENSHOUSE_DISPLAY_LEFT
	dw_const WardensHouseDisplayText, TEXT_WARDENSHOUSE_DISPLAY_RIGHT

WardensHouseWardenText: ; marcelnote - optimized
	text_asm
	CheckEvent EVENT_GOT_HM04
	ld hl, .HM04ExplanationText
	jr nz, .print_text
	ld b, GOLD_TEETH
	call IsItemInBag
	jr nz, .have_gold_teeth
	CheckEvent EVENT_GAVE_GOLD_TEETH
	jr nz, .gave_gold_teeth
	ld hl, .Gibberish1Text
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ld hl, .Gibberish3Text
	jr nz, .print_text
	ld hl, .Gibberish2Text
.have_gold_teeth
	ld hl, .GaveTheGoldTeethText
	call PrintText
	ld a, GOLD_TEETH
	ldh [hItemToRemoveID], a
	farcall RemoveItemByID
	SetEvent EVENT_GAVE_GOLD_TEETH
.gave_gold_teeth
	ld hl, .ThanksText
	call PrintText
	lb bc, HM_STRENGTH, 1
	call GiveItem
	ld hl, .HM04NoRoomText
	jr nc, .print_text
	SetEvent EVENT_GOT_HM04
	ld hl, .ReceivedHM04Text
.print_text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.Gibberish1Text:
	text_far _WardensHouseWardenGibberish1Text
	text_end

.Gibberish2Text:
	text_far _WardensHouseWardenGibberish2Text
	text_end

.Gibberish3Text:
	text_far _WardensHouseWardenGibberish3Text
	text_end

.GaveTheGoldTeethText:
	text_far _WardensHouseWardenGaveTheGoldTeethText
	sound_get_item_1

.PoppedInHisTeethText: ; unreferenced
	text_far _WardensHouseWardenTeethPoppedInHisTeethText
	text_end

.ThanksText:
	text_far _WardensHouseWardenThanksText
	text_end

.ReceivedHM04Text:
	text_far _WardensHouseWardenReceivedHM04Text
	sound_get_item_1
	text_end

.HM04ExplanationText:
	text_far _WardensHouseWardenHM04ExplanationText
	text_end

.HM04NoRoomText:
	text_far _WardensHouseWardenHM04NoRoomText
	text_end

WardensHouseDisplayText:
	text_asm
	ldh a, [hTextID]
	cp TEXT_WARDENSHOUSE_DISPLAY_LEFT
	ld hl, .MerchandiseText
	jr nz, .print_text
	ld hl, .PhotosAndFossilsText
.print_text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.PhotosAndFossilsText:
	text_far _WardensHouseDisplayPhotosAndFossilsText
	text_end

.MerchandiseText:
	text_far _WardensHouseDisplayMerchandiseText
	text_end
