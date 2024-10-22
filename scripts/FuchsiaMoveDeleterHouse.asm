; marcelnote - new location
FuchsiaMoveDeleterHouse_Script:
	jp EnableAutoTextBoxDrawing

FuchsiaMoveDeleterHouse_TextPointers:
	def_text_pointers
	dw_const MoveDeleterText,  TEXT_FUCHSIAMOVEDELETERHOUSE_MOVE_DELETER
	dw_const MoveReminderText, TEXT_FUCHSIAMOVEDELETERHOUSE_MOVE_REMINDER

; marcelnote - pokered Move Deleter/Relearner tutorial
MoveDeleterText:
	text_asm
	ld hl, MoveDeleterGreetingText
	call PrintText
.jumpback
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jp nz, .exit
	ld hl, MoveDeleterSaidYesText
	call PrintText
	; Select pokemon from party.
	call SaveScreenTilesToBuffer2
	xor a
	ld [wListScrollOffset], a
	ld [wPartyMenuTypeOrMessageID], a
	ld [wUpdateSpritesEnabled], a
	ld [wMenuItemToSwap], a
	call DisplayPartyMenu
	push af
	call GBPalWhiteOutWithDelay3
	call RestoreScreenTilesAndReloadTilePatterns
	call LoadGBPal
	pop af
	jp c, .exit
	ld a, [wWhichPokemon]
	ld b, a
	push bc
	call PrepareDeletableMoveList
	pop bc
	ld a, [wMoveBuffer]
	cp 2
	jr nc, .chooseMove
	ld hl, MoveDeleterOneMoveText
	call PrintText
	jr .jumpback
.chooseMove
	push bc
	xor a
	ld [wListScrollOffset], a
	ld [wCurrentMenuItem], a
	ld hl, MoveDeleterWhichMoveText
	call PrintText
	ld a, MOVESLISTMENU
	ld [wListMenuID], a
	ld de, wMoveBuffer
	ld hl, wListPointer
	ld [hl], e
	inc hl
	ld [hl], d
	xor a
	ld [wPrintItemPrices], a ; don't print prices
	call DisplayListMenuID
	pop bc
	jr c, .exit  ; exit if player chose cancel
	; Save the selected move id.
	ld a, [wCurListMenuItem]
	ld d, a
	push de
	push bc
	ld [wMoveNum], a
	ld [wPokeBallCaptureCalcTemp],a
	call GetMoveName
	call CopyToStringBuffer ; copy name to wcf4b
	ld hl, MoveDeleterConfirmText
	call PrintText
	call YesNoChoice
	pop bc
	pop de
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .chooseMove
	push de
	ld a, b ; a = mon index
	ld hl, wPartyMon1Moves
	ld bc, wPartyMon2 - wPartyMon1
	call AddNTimes
	; hl = pointer to mon's moves
	; Search for the move, and set it to 0.
	pop de ; d = move id
	call DeleteMove
	ld hl, MoveDeleterForgotText
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd
.exit
	ld hl, MoveDeleterByeText
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

DeleteMove:
; d = move id
	ld b, 0
.searchLoop
	ld a, [hli]
	cp d
	jr z, .foundMoveLoop
	inc b
	jr .searchLoop
.foundMoveLoop
	ld a, b
	cp 3
	jr z, .zeroLastMove
	ld a, [hl]
	dec hl
	ld [hli], a
	push hl
	ld de, wPartyMon1PP - wPartyMon1Moves
	add hl, de
	ld a, [hld]
	ld [hl], a ; copy move's PP
	pop hl
	inc hl
	inc b
	jr .foundMoveLoop
.zeroLastMove
	dec hl
	xor a
	ld [hl], a
	ld de, wPartyMon1PP - wPartyMon1Moves
	add hl, de
	ld [hl], a ; clear last move's PP
	ret

PrepareDeletableMoveList:
; Places a list of the selected pokemon's moves at wMoveBuffer.
; First byte is count, and last byte is $ff.
; Input: party mon index = [wWhichPokemon]
	ld a, [wWhichPokemon]
	ld hl, wPartyMon1Moves
	ld bc, wPartyMon2 - wPartyMon1
	call AddNTimes
	; hl = pointer to mon's 4 moves
	ld b, 0 ; count of moves
	ld c, 4 + 1 ; 4 moves
	ld de, wMoveBuffer + 1
.loop
	dec c
	jr z, .done
	ld a, [hli]
	and a
	jr z, .loop
	ld [de], a
	inc de
	inc b
	jr .loop
.done
	ld a, $ff  ; terminate the list
	ld [de], a
	ld a, b  ; store number of moves
	ld [wMoveBuffer], a
	ret

MoveDeleterGreetingText:
	text_far _MoveDeleterGreetingText
	text_end

MoveDeleterSaidYesText:
	text_far _MoveDeleterSaidYesText
	text_end

MoveDeleterWhichMoveText:
	text_far _MoveDeleterWhichMoveText
	text_end

MoveDeleterConfirmText:
	text_far _MoveDeleterConfirmText
	text_end

MoveDeleterForgotText:
	text_far _MoveDeleterForgotText
	text_end

MoveDeleterByeText:
	text_far _MoveDeleterByeText
	text_end

MoveDeleterOneMoveText:
	text_far _MoveDeleterOneMoveText
	text_end


MoveReminderText:
	text_asm
; Display the list of moves to the player.
	ld hl, MoveReminderGreetingText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jp nz, .exit
	xor a
	;charge 1000 money
	ld [hMoney], a
	ld [hMoney + 2], a
	ld a, $0A
	ld [hMoney + 1], a
	call HasEnoughMoney
	jr nc, .enoughMoney
	; not enough money
	ld hl, MoveReminderNotEnoughMoneyText
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd
.enoughMoney
	ld hl, MoveReminderSaidYesText
	call PrintText
	; Select pokemon from party.
	call SaveScreenTilesToBuffer2
	xor a
	ld [wListScrollOffset], a
	ld [wPartyMenuTypeOrMessageID], a
	ld [wUpdateSpritesEnabled], a
	ld [wMenuItemToSwap], a
	call DisplayPartyMenu
	push af
	call GBPalWhiteOutWithDelay3
	call RestoreScreenTilesAndReloadTilePatterns
	call LoadGBPal
	pop af
	jp c, .exit
	ld a, [wWhichPokemon]
	ld b, a
	push bc
	ld hl, PrepareRelearnableMoveList
	ld b, Bank(PrepareRelearnableMoveList)
	call Bankswitch
	ld a, [wMoveBuffer]
	and a
	jr nz, .chooseMove
	pop bc
	ld hl, MoveReminderNoMovesText
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd
.chooseMove
	ld hl, MoveReminderWhichMoveText
	call PrintText
	xor a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ld a, MOVESLISTMENU
	ld [wListMenuID], a
	ld de, wMoveBuffer
	ld hl, wListPointer
	ld [hl], e
	inc hl
	ld [hl], d
	xor a
	ld [wPrintItemPrices], a ; don't print prices
	call DisplayListMenuID
	pop bc
	jr c, .exit  ; exit if player chose cancel
	push bc
	; Save the selected move id.
	ld a, [wCurListMenuItem]
	ld [wMoveNum], a
	ld [wPokeBallCaptureCalcTemp],a
	call GetMoveName
	call CopyToStringBuffer ; copy name to wcf4b
	pop bc
	ld a, b
	ld [wWhichPokemon], a
	ld a, [wLetterPrintingDelayFlags]
	push af
	xor a
	ld [wLetterPrintingDelayFlags], a
	predef LearnMove
	pop af
	ld [wLetterPrintingDelayFlags], a
	ld a, b
	and a
	jr z, .exit
	; Charge 1000 money
	xor a
	ld [wPriceTemp], a
	ld [wPriceTemp + 2], a
	ld a, $0A
	ld [wPriceTemp + 1], a
	ld hl, wPriceTemp + 2
	ld de, wPlayerMoney + 2
	ld c, $3
	predef SubBCDPredef
.exit
	ld hl, MoveReminderByeText
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd


MoveReminderGreetingText:
	text_far _MoveReminderGreetingText
	text_end

MoveReminderSaidYesText:
	text_far _MoveReminderSaidYesText
	text_end

MoveReminderNotEnoughMoneyText:
	text_far _MoveReminderNotEnoughMoneyText
	text_end

MoveReminderWhichMoveText:
	text_far _MoveReminderWhichMoveText
	text_end

MoveReminderByeText:
	text_far _MoveReminderByeText
	text_end

MoveReminderNoMovesText:
	text_far _MoveReminderNoMovesText
	text_end