; marcelnote - merged Safari Zone houses
SafariZoneHouses_Script:
	jp EnableAutoTextBoxDrawing

SafariZoneHouses_TextPointers:
	def_text_pointers
	; Center rest house
	dw_const SafariZoneCenterRestHouseGirlText,      TEXT_SAFARIZONECENTERRESTHOUSE_GIRL
	dw_const SafariZoneCenterRestHouseScientistText, TEXT_SAFARIZONECENTERRESTHOUSE_SCIENTIST
	; West rest house
	dw_const SafariZoneWestRestHouseScientistText,    TEXT_SAFARIZONEWESTRESTHOUSE_SCIENTIST
	dw_const SafariZoneWestRestHouseCooltrainerMText, TEXT_SAFARIZONEWESTRESTHOUSE_COOLTRAINER_M
	dw_const SafariZoneWestRestHouseSilphWorkerFText, TEXT_SAFARIZONEWESTRESTHOUSE_SILPH_WORKER_F
	; North rest house
	dw_const SafariZoneNorthRestHouseScientistText,        TEXT_SAFARIZONENORTHRESTHOUSE_SCIENTIST
	dw_const SafariZoneNorthRestHouseSafariZoneWorkerText, TEXT_SAFARIZONENORTHRESTHOUSE_SAFARI_ZONE_WORKER
	dw_const SafariZoneNorthRestHouseGentlemanText,        TEXT_SAFARIZONENORTHRESTHOUSE_GENTLEMAN
	; East rest house
	dw_const SafariZoneEastRestHouseScientistText,    TEXT_SAFARIZONEEASTRESTHOUSE_SCIENTIST
	dw_const SafariZoneEastRestHouseRockerText,       TEXT_SAFARIZONEEASTRESTHOUSE_ROCKER
	dw_const SafariZoneEastRestHouseSilphWorkerMText, TEXT_SAFARIZONEEASTRESTHOUSE_SILPH_WORKER_M
	; Secret house
	dw_const SafariZoneSecretHouseFishingGuruText, TEXT_SAFARIZONESECRETHOUSE_FISHING_GURU
	dw_const SafariZoneSecretHousePosterText,      TEXT_SAFARIZONESECRETHOUSE_POSTER ; marcelnote - new


SafariZoneCenterRestHouseGirlText:
	text_far _SafariZoneCenterRestHouseGirlText
	text_end

SafariZoneCenterRestHouseScientistText:
	text_far _SafariZoneCenterRestHouseScientistText
	text_end


SafariZoneWestRestHouseScientistText:
	text_far _SafariZoneWestRestHouseScientistText
	text_end

SafariZoneWestRestHouseCooltrainerMText:
	text_far _SafariZoneWestRestHouseCooltrainerMText
	text_end

SafariZoneWestRestHouseSilphWorkerFText:
	text_far _SafariZoneWestRestHouseSilphWorkerFText
	text_end


SafariZoneNorthRestHouseScientistText:
	text_far _SafariZoneNorthRestHouseScientistText
	text_end

SafariZoneNorthRestHouseSafariZoneWorkerText:
	text_far _SafariZoneNorthRestHouseSafariZoneWorkerText
	text_end

SafariZoneNorthRestHouseGentlemanText:
	text_far _SafariZoneNorthRestHouseGentlemanText
	text_end


SafariZoneEastRestHouseScientistText:
	text_far _SafariZoneEastRestHouseScientistText
	text_end

SafariZoneEastRestHouseRockerText:
	text_far _SafariZoneEastRestHouseRockerText
	text_end

SafariZoneEastRestHouseSilphWorkerMText:
	text_far _SafariZoneEastRestHouseSilphWorkerMText
	text_end


SafariZoneSecretHouseFishingGuruText: ; marcelnote - optimized
	text_asm
	CheckEvent EVENT_GOT_HM03
	ld hl, .HM03ExplanationText
	ret nz
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
