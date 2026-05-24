NameRatersHouse_Script:
	jp EnableAutoTextBoxDrawing

NameRatersHouseYesNoScript:
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ret

NameRatersHouseCheckMonOTScript:
; return carry if mon's OT name or OT ID do not match the player's
	ld hl, wPartyMonOT
	ld a, [wWhichPokemon]
	call SkipFixedLengthTextEntries
	ld de, wPlayerName
	ld c, NAME_LENGTH
	call .checkMatchLoop
	jr c, .noMatch
	ld hl, wPartyMon1OTID
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wWhichPokemon]
	call AddNTimes
	ld de, wPlayerID
	ld c, $2
.checkMatchLoop
	ld a, [de]
	cp [hl]
	jr nz, .noMatch
	inc hl
	inc de
	dec c
	jr nz, .checkMatchLoop
	and a
	ret
.noMatch
	scf
	ret

NameRatersHouse_TextPointers:
	def_text_pointers
	dw_const NameRatersHouseNameRaterText, TEXT_NAMERATERSHOUSE_NAME_RATER

NameRatersHouseNameRaterText:
	text_asm
	call SaveScreenTilesToBuffer2
	ld hl, .WantMeToRateText
	call NameRatersHouseYesNoScript
	jr nz, .didNotRename
	ld hl, .WhichPokemonText
	call PrintText
	xor a
	ld [wPartyMenuTypeOrMessageID], a
	ld [wUpdateSpritesEnabled], a
	ld [wMenuItemToSwap], a
	call DisplayPartyMenu
	push af
	call GBPalWhiteOutWithDelay3
	call RestoreScreenTilesAndReloadTilePatterns
	call LoadGBPal
	pop af
	jr c, .didNotRename
	call GetPartyMonName2
	call NameRatersHouseCheckMonOTScript
	ld hl, .ATrulyImpeccableNameText
	jr c, .printText
	ld hl, .GiveItANiceNameText
	call NameRatersHouseYesNoScript
	jr nz, .didNotRename
	ld hl, .WhatShouldWeNameItText
	call PrintText
	callfar DisplayNameRaterScreen
	jr c, .didNotRename
	ld hl, .PokemonHasBeenRenamedText
.printText
	call PrintText
	rst TextScriptEnd
.didNotRename
	ld hl, .ComeAnyTimeYouLikeText
	jr .printText

.WantMeToRateText:
	text_far _NameRatersHouseNameRaterWantMeToRateText
	text_end

.WhichPokemonText:
	text_far _NameRatersHouseNameRaterWhichPokemonText
	text_end

.GiveItANiceNameText:
	text_far _NameRatersHouseNameRaterGiveItANiceNameText
	text_end

.WhatShouldWeNameItText:
	text_far _NameRatersHouseNameRaterWhatShouldWeNameItText
	text_end

.PokemonHasBeenRenamedText:
	text_far _NameRatersHouseNameRaterPokemonHasBeenRenamedText
	text_end

.ComeAnyTimeYouLikeText:
	text_far _NameRatersHouseNameRaterComeAnyTimeYouLikeText
	text_end

.ATrulyImpeccableNameText:
	text_far _NameRatersHouseNameRaterATrulyImpeccableNameText
	text_end
