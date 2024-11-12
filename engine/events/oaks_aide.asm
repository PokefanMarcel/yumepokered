OaksAideScript:
	ld hl, OaksAideHiText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .answered_no
	ld hl, wPokedexOwned
	ld b, wPokedexOwnedEnd - wPokedexOwned
	call CountSetBits
	ld a, [wNumSetBits]
	ldh [hOaksAideNumMonsOwned], a
	ld b, a
	ldh a, [hOaksAideRequirement]
	cp b
	jr z, .giveItem
	jr nc, .notEnoughOwnedMons
.giveItem
	ld hl, OaksAideHereYouGoText
	call PrintText
	ldh a, [hOaksAideRewardItem]
	ld b, a
	ld c, 1
	call GiveItem
	jr nc, .bagFull
	ld hl, OaksAideGotItemText
	call PrintText
	ld a, OAKS_AIDE_GOT_ITEM
	jr .loadNextScript
.bagFull
	ld hl, OaksAideNoRoomText
	call PrintText
	xor a ; OAKS_AIDE_BAG_FULL
	jr .loadNextScript
.notEnoughOwnedMons
	ld hl, OaksAideUhOhText
	call PrintText
	ld a, OAKS_AIDE_NOT_ENOUGH_MONS
	jr .loadNextScript
.answered_no
	ld hl, OaksAideComeBackText
	call PrintText
	ld a, OAKS_AIDE_REFUSED
.loadNextScript
	ldh [hOaksAideResult], a
	ret

OaksAideHiText:
	text_far _OaksAideHiText
	text_end

OaksAideUhOhText:
	text_far _OaksAideUhOhText
	text_end

OaksAideComeBackText:
	text_far _OaksAideComeBackText
	text_end

OaksAideHereYouGoText:
	text_far _OaksAideHereYouGoText
	text_end

OaksAideGotItemText:
	text_far _OaksAideGotItemText
	sound_get_item_1
	text_end

OaksAideNoRoomText:
	text_far _OaksAideNoRoomText
	text_end
