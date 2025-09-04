StartSlotMachine: ; marcelnote - optimized
	ld a, [wHiddenObjectFunctionArgument]
	and a
	jr nz, .otherTexts
	call AbleToPlaySlotsCheck
	ld a, [wCanPlaySlots]
	and a
	ret z
	ld a, [wLuckySlotHiddenObjectIndex]
	ld b, a
	ld a, [wHiddenObjectIndex]
	inc a
	cp b
	ld a, 250
	jr z, .match
	ld a, 253
.match
	ld [wSlotMachineSevenAndBarModeChance], a
	ldh a, [hLoadedROMBank]
	ld [wSlotMachineSavedROMBank], a
	jp PromptUserToPlaySlots

.otherTexts
	ld b, a
	call EnableAutoTextBoxDrawing
	ASSERT SLOTS_SOMEONESKEYS + 1 == $100
	ASSERT SLOTS_OUTTOLUNCH + 2 == $100
	ASSERT SLOTS_OUTOFORDER + 3 == $100
	tx_pre_id GameCornerSomeonesKeysText
	inc b ; SLOTS_SOMEONESKEYS?
	jr z, .print
	tx_pre_id GameCornerOutToLunchText
	inc b ; SLOTS_OUTTOLUNCH?
	jr z, .print
	; SLOTS_OUTOFORDER
	tx_pre_id GameCornerOutOfOrderText
.print
	jp PrintPredefTextID


GameCornerOutOfOrderText::
	text_far _GameCornerOutOfOrderText
	text_end

GameCornerOutToLunchText::
	text_far _GameCornerOutToLunchText
	text_end

GameCornerSomeonesKeysText::
	text_far _GameCornerSomeonesKeysText
	text_end



AbleToPlaySlotsCheck:
	ld a, [wSpritePlayerStateData1ImageIndex]
	and $8
	jr z, .done ; not able
	ld b, COIN_CASE
	predef GetQuantityOfItemInBag
	ld a, b
	and a
	ld b, (GameCornerCoinCaseText_id - TextPredefs) / 2 + 1
	jr z, .printCoinCaseRequired
	ld hl, wPlayerCoins
	ld a, [hli]
	or [hl]
	jr nz, .done ; able to play
	ld b, (GameCornerNoCoinsText_id - TextPredefs) / 2 + 1
.printCoinCaseRequired
	call EnableAutoTextBoxDrawing
	ld a, b
	call PrintPredefTextID
	xor a
.done
	ld [wCanPlaySlots], a
	ret


GameCornerCoinCaseText::
	text_far _GameCornerCoinCaseText
	text_end

GameCornerNoCoinsText::
	text_far _GameCornerNoCoinsText
	text_end
