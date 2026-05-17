SafariZoneSecretHouse_Script:
	jp EnableAutoTextBoxDrawing

SafariZoneSecretHouse_TextPointers:
	def_text_pointers
	dw_const SafariZoneSecretHouseFishingGuruText, TEXT_SAFARIZONESECRETHOUSE_FISHING_GURU
	dw_const SafariZoneSecretHousePosterText,      TEXT_SAFARIZONESECRETHOUSE_POSTER ; marcelnote - new

SafariZoneSecretHouseFishingGuruText: ; marcelnote - optimized
	text_asm
	CheckEvent EVENT_GOT_HM03
	ld hl, .HM03ExplanationText
	jr nz, .printText
	ld hl, .YouHaveWonText
	call PrintText
	lb bc, HM_SURF, 1
	call GiveItem
	ld hl, .HM03NoRoomText
	jr nc, .printText
	SetEvent EVENT_GOT_HM03
	ld hl, .ReceivedHM03Text
.printText
	call PrintText
	rst TextScriptEnd

.YouHaveWonText:
	text_far _SafariZoneSecretHouseFishingGuruYouHaveWonText
	text_end

.ReceivedHM03Text:
	text_far _SafariZoneSecretHouseFishingGuruReceivedHM03Text
	sound_get_item_1
	text_end

.HM03ExplanationText:
	text_far _SafariZoneSecretHouseFishingGuruHM03ExplanationText
	text_end

.HM03NoRoomText:
	text_far _SafariZoneSecretHouseFishingGuruHM03NoRoomText
	text_end

SafariZoneSecretHousePosterText: ; marcelnote - new
	text_far _SafariZoneSecretHousePosterText
	text_end
