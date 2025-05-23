Route16FlyHouse_Script:
	jp EnableAutoTextBoxDrawing

Route16FlyHouse_TextPointers:
	def_text_pointers
	dw_const Route16FlyHouseBrunetteGirlText, TEXT_ROUTE16FLYHOUSE_BRUNETTE_GIRL
	dw_const Route16FlyHouseFearowText,       TEXT_ROUTE16FLYHOUSE_FEAROW

Route16FlyHouseBrunetteGirlText: ; marcelnote - optimized
	text_asm
	CheckEvent EVENT_GOT_HM02
	ld hl, .HM02ExplanationText
	jr nz, .print_text
	ld hl, .Text
	call PrintText
	lb bc, HM_FLY, 1
	call GiveItem
	ld hl, .HM02NoRoomText
	jr nc, .print_text
	SetEvent EVENT_GOT_HM02
	ld hl, .ReceivedHM02Text
.print_text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.Text:
	text_far _Route16FlyHouseBrunetteGirlText
	text_end

.ReceivedHM02Text:
	text_far _Route16FlyHouseBrunetteGirlReceivedHM02Text
	sound_get_key_item
	text_end

.HM02ExplanationText:
	text_far _Route16FlyHouseBrunetteGirlHM02ExplanationText
	text_end

.HM02NoRoomText:
	text_far _Route16FlyHouseBrunetteGirlHM02NoRoomText
	text_end

Route16FlyHouseFearowText:
	text_asm
	ld hl, .Text
	call PrintText
	ld a, FEAROW
	call PlayCry
	call WaitForSoundToFinish
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.Text:
	text_far _Route16FlyHouseFearowText
	text_end
