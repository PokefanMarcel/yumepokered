; marcelnote - new for pay phones
DisplayPayPhoneDialogue_::
	call SaveScreenTilesToBuffer1 ; save screen
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	xor a
	ldh [hJoyHeld], a
	ld hl, .IntroText
	call PrintText
	call MomDaisyCancelChoice
	ld a, [wCurrentMenuItem]
	cp 2
	jr nz, .callMomOrDaisy
	; cancel
	jp UpdateSprites

.callMomOrDaisy
	; check if enough money
	xor a
	ldh [hMoney], a
	ldh [hMoney + 1], a
	ld a, $10
	ldh [hMoney + 2], a
	call HasEnoughMoney
	ld hl, .NotEnoughMoneyText
	jr c, .print_text
	; has enough money
	xor a
	ld [wPriceTemp], a
	ld [wPriceTemp + 1], a
	ld a, $10
	ld [wPriceTemp + 2], a
	ld hl, wPriceTemp + 2
	ld de, wPlayerMoney + 2
	ld c, $3
	predef SubBCDPredef
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	ld a, SFX_PURCHASE
	call PlaySoundWaitForCurrent
	call WaitForSoundToFinish
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .callDaisy
	; fallthrough
.callMom
	ld hl, PayPhoneMomIntroText
	call PrintText
	ld a, [wCurMap]
	ld b, a
	ld de, 5
	ld hl, TablePayPhoneMom
.loopMapsMom
	ld a, [hli]
	cp b
	jr z, .gotMapMom
	add hl, de ; skip 5 entries
	jr .loopMapsMom
.gotMapMom
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a     ; de = address for Mom's text
	; Set event for calling Mom
	ld a, [hli]
	ld b, a     ; b = byte mask
	ld a, [hli]
	ld h, [hl]
	ld l, a     ; hl = event byte address
	ld a, b
	or [hl]
	ld [hl], a
	; print Mom's text
	ld h, d
	ld l, e
	call PrintText
	ld hl, PayPhoneMomOutroText
.print_text
	call PrintText
	jp UpdateSprites

.callDaisy
	CheckEvent EVENT_BEAT_ROUTE_1_OAK
	jr nz, .normalTable
	CheckEvent EVENT_BECAME_CHAMPION
	jr nz, .postgameEvents
.normalTable
	ld hl, TablePayPhoneDaisy
	ld a, [wCurMap]
	ld b, a
.loopMapsDaisy
	ld a, [hli]
	cp b
	jr z, .gotMapDaisy
	inc hl
	inc hl
	jr .loopMapsDaisy
.gotMapDaisy
	ld a, [hli]
	ld h, [hl]
	ld l, a     ; hl = address of text
	jr .print_text

.postgameEvents
	ld hl, PayPhoneDaisyPostgameLoreleiText
	CheckEvent EVENT_POSTGAME_LORELEI
	jr z, .print_text
	ld hl, PayPhoneDaisyPostgameBrunoText
	CheckEvent EVENT_POSTGAME_BRUNO
	jr z, .print_text
	ld hl, PayPhoneDaisyPostgameAgathaText
	CheckEvent EVENT_POSTGAME_AGATHA
	jr z, .print_text
	ld hl, PayPhoneDaisyPostgameLanceText
	CheckEvent EVENT_POSTGAME_LANCE
	jr z, .print_text
	ld hl, PayPhoneDaisyPostgameRivalText
	CheckEvent EVENT_POSTGAME_RIVAL
	jr z, .print_text
	ld hl, PayPhoneDaisyRivalAtIndigoText
	CheckHideShowCont HS_INDIGO_PLATEAU_LOBBY_RIVAL
	jr z, .print_text
	ld hl, PayPhoneDaisyOakRoute1Text
	jr .print_text

.IntroText:
	text_far _PayPhoneIntroText
	text_end

.NotEnoughMoneyText:
	text_far _PayPhoneNotEnoughMoneyText
	text_end


MomDaisyCancelChoice:
	call SaveScreenTilesToBuffer1
	ld a, MOM_DAISY_CANCEL_MENU_TEMPLATE
	ld [wTextBoxID], a
	call DisplayTextBoxID
	ld hl, wTopMenuItemY
	ld a, 6
	ld [hli], a ; wTopMenuItemY
	ld a, 12
	ld [hli], a ; wTopMenuItemX
	xor a
	ld [hli], a ; wCurrentMenuItem
	inc hl
	ld a, 2
	ld [hli], a ; wMaxMenuItem
	ld a, PAD_B | PAD_A
	ld [hli], a ; wMenuWatchedKeys
	xor a
	ld [hl], a ; wLastMenuItem
	call HandleMenuInput
	bit B_PAD_B, a
	jr nz, .decline ; if B was pressed
; A was pressed
	call PlaceUnfilledArrowMenuCursor
	jp LoadScreenTilesFromBuffer1
.decline
	ld a, 2
	ld [wCurrentMenuItem], a
	jp LoadScreenTilesFromBuffer1


MACRO pay_phone_mom
	db \1                        ; map
	dw \3                        ; Mom's text
	db 1 << ((\2) % 8)           ; byte mask to set event
	dw wEventFlags + ((\2) / 8)  ; event byte address
ENDM

TablePayPhoneMom:
	; map we're calling from, event that it sets, dialogue for that map
	pay_phone_mom VIRIDIAN_CITY,        EVENT_CALLED_MOM_VIRIDIAN,  PayPhoneMomViridianText
	pay_phone_mom PEWTER_CITY,          EVENT_CALLED_MOM_PEWTER,    PayPhoneMomPewterText
	pay_phone_mom CERULEAN_CITY,        EVENT_CALLED_MOM_CERULEAN,  PayPhoneMomCeruleanText
	pay_phone_mom VERMILION_CITY,       EVENT_CALLED_MOM_VERMILION, PayPhoneMomVermilionText
	pay_phone_mom LAVENDER_TOWN,        EVENT_CALLED_MOM_LAVENDER,  PayPhoneMomLavenderText
	pay_phone_mom CELADON_MART_1F2F3F,  EVENT_CALLED_MOM_CELADON,   PayPhoneMomCeladonText
	pay_phone_mom SAFFRON_CITY,         EVENT_CALLED_MOM_SAFFRON,   PayPhoneMomSaffronText
	pay_phone_mom FUCHSIA_MEETING_ROOM, EVENT_CALLED_MOM_FUCHSIA,   PayPhoneMomFuchsiaText
	pay_phone_mom CINNABAR_LAB,         EVENT_CALLED_MOM_CINNABAR,  PayPhoneMomCinnabarText
	pay_phone_mom MANDARIN_ISLAND,      EVENT_CALLED_MOM_MANDARIN,  PayPhoneMomMandarinText

PayPhoneMomIntroText:
	text_far _PayPhoneMomIntroText
	text_end

PayPhoneMomOutroText:
	text_far _PayPhoneMomOutroText
	text_end

PayPhoneMomViridianText:
	text_far _PayPhoneMomViridianText
	text_end

PayPhoneMomPewterText:
	text_far _PayPhoneMomPewterText
	text_end

PayPhoneMomCeruleanText:
	text_far _PayPhoneMomCeruleanText
	text_end

PayPhoneMomVermilionText:
	text_far _PayPhoneMomVermilionText
	text_end

PayPhoneMomLavenderText:
	text_far _PayPhoneMomLavenderText
	text_end

PayPhoneMomCeladonText:
	text_far _PayPhoneMomCeladonText
	text_end

PayPhoneMomSaffronText:
	text_far _PayPhoneMomSaffronText
	text_end

PayPhoneMomFuchsiaText:
	text_far _PayPhoneMomFuchsiaText
	text_end

PayPhoneMomCinnabarText:
	text_far _PayPhoneMomCinnabarText
	text_end

PayPhoneMomMandarinText:
	text_far _PayPhoneMomMandarinText
	text_end


MACRO pay_phone_daisy
	db \1  ; map
	dw \2  ; Daisy's text
ENDM

TablePayPhoneDaisy:
	; map, corresponding dialogue
	pay_phone_daisy VIRIDIAN_CITY,        PayPhoneDaisyOldRodText
	pay_phone_daisy PEWTER_CITY,          PayPhoneDaisyDexAreaText
	pay_phone_daisy CERULEAN_CITY,        PayPhoneDaisyGravelerEvoText
	pay_phone_daisy VERMILION_CITY,       PayPhoneDaisyRoute6AideText
	pay_phone_daisy LAVENDER_TOWN,        PayPhoneDaisyMachokeEvoText
	pay_phone_daisy CELADON_MART_1F2F3F,  PayPhoneDaisySaffronGuardsText
	pay_phone_daisy SAFFRON_CITY,         PayPhoneDaisyKadabraEvoText
	pay_phone_daisy FUCHSIA_MEETING_ROOM, PayPhoneDaisyHaunterEvoText
	pay_phone_daisy CINNABAR_LAB,         PayPhoneDaisyDynamicTMSellerText
	pay_phone_daisy MANDARIN_ISLAND,      PayPhoneDaisyFishingGuideText


PayPhoneDaisyOldRodText:
	text_far _PayPhoneDaisyOldRodText
	text_end

PayPhoneDaisyDexAreaText:
	text_far _PayPhoneDaisyDexAreaText
	text_end

PayPhoneDaisyGravelerEvoText:
	text_far _PayPhoneDaisyGravelerEvoText
	text_end

PayPhoneDaisyRoute6AideText:
	text_far _PayPhoneDaisyRoute6AideText
	text_end

PayPhoneDaisyMachokeEvoText:
	text_far _PayPhoneDaisyMachokeEvoText
	text_end

PayPhoneDaisyDynamicTMSellerText:
	text_far _PayPhoneDaisyDynamicTMSellerText
	text_end

PayPhoneDaisyKadabraEvoText:
	text_far _PayPhoneDaisyKadabraEvoText
	text_end

PayPhoneDaisyHaunterEvoText:
	text_far _PayPhoneDaisyHaunterEvoText
	text_end

PayPhoneDaisySaffronGuardsText:
	text_far _PayPhoneDaisySaffronGuardsText
	text_end

PayPhoneDaisyFishingGuideText:
	text_far _PayPhoneDaisyFishingGuideText
	text_end

PayPhoneDaisyPostgameLoreleiText:
	text_far _PayPhoneDaisyPostgameLoreleiText
	text_end

PayPhoneDaisyPostgameBrunoText:
	text_far _PayPhoneDaisyPostgameBrunoText
	text_end

PayPhoneDaisyPostgameAgathaText:
	text_far _PayPhoneDaisyPostgameAgathaText
	text_end

PayPhoneDaisyPostgameLanceText:
	text_far _PayPhoneDaisyPostgameLanceText
	text_end

PayPhoneDaisyPostgameRivalText:
	text_far _PayPhoneDaisyPostgameRivalText
	text_end

PayPhoneDaisyRivalAtIndigoText:
	text_far _PayPhoneDaisyRivalAtIndigoText
	text_end

PayPhoneDaisyOakRoute1Text:
	text_far _PayPhoneDaisyOakRoute1Text
	text_end


; following code is for using events for Daisy
;MACRO pay_phone_daisy
;	db 1 << ((\1) % 8)           ; byte mask of event to check
;	dw wEventFlags + ((\1) / 8)  ; event byte address
;	dw \2                        ; Daisy's text
;ENDM

;TablePayPhoneDaisy:
;	; event to check, corresponding dialogue ; order matters!
;	pay_phone_daisy EVENT_GOT_TOWN_MAP,                 PayPhoneDaisyHaveTownMapText
;	pay_phone_daisy EVENT_BEAT_MISTY,                   PayPhoneDaisyGetBadgesText
;	pay_phone_daisy EVENT_GOT_HM01,                     PayPhoneDaisyGetHM01Text
;	pay_phone_daisy EVENT_BEAT_ROCKET_HIDEOUT_GIOVANNI, PayPhoneDaisyGameCornerText
;	pay_phone_daisy EVENT_RESCUED_MR_FUJI,              PayPhoneDaisyLavenderTowerText
;	pay_phone_daisy EVENT_GOT_HM03,                     PayPhoneDaisyGetHM03Text
;	pay_phone_daisy EVENT_BEAT_SILPH_CO_GIOVANNI,       PayPhoneDaisySilphCoText
;	pay_phone_daisy EVENT_BEAT_VIRIDIAN_GYM_GIOVANNI,   PayPhoneDaisyGetAllBadgesText
;	pay_phone_daisy EVENT_GOT_HM04,                     PayPhoneDaisyGetHM04Text
;	pay_phone_daisy EVENT_BECAME_CHAMPION,              PayPhoneDaisyGoForLeagueText
;	pay_phone_daisy EVENT_POSTGAME_LORELEI,             PayPhoneDaisyPostgameLoreleiText
;	pay_phone_daisy EVENT_POSTGAME_BRUNO,               PayPhoneDaisyPostgameBrunoText
;	pay_phone_daisy EVENT_POSTGAME_AGATHA,              PayPhoneDaisyPostgameAgathaText
;	pay_phone_daisy EVENT_POSTGAME_LANCE,               PayPhoneDaisyPostgameLanceText
;	pay_phone_daisy EVENT_POSTGAME_RIVAL,               PayPhoneDaisyPostgameRivalText
;	pay_phone_daisy EVENT_RIVAL_ACTING_CHAMP,           PayPhoneDaisyRivalAtIndigoText
;	pay_phone_daisy EVENT_BEAT_ROUTE_1_OAK,             PayPhoneDaisyFinalText
;	db -1

;.callDaisy
;	ld hl, TablePayPhoneDaisy
;.loopEvents
;	ld a, [hli]
;	ld b, a     ; b = byte mask for event to check
;	inc a
;	jr z, .allEventsSet
;	ld a, [hli]
;	ld e, a
;	ld a, [hli]
;	ld d, a     ; de = address of byte for event to check
;	; Check event
;	ld a, [de]
;	and b
;	jr z, .eventNotSet
;	inc hl
;	inc hl
;	jr .loopEvents
;
;.allEventsSet
;	ld hl, PayPhoneDaisyFinalText
;	jr .print_text
;
;.eventNotSet
;	ld a, [hli]
;	ld h, [hl]
;	ld l, a     ; hl = address of text
;	jr .print_text
