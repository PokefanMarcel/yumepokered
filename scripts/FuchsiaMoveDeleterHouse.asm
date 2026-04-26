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
	call SaveScreenTilesToBuffer2
	ld hl, MoveDeleterGreetingText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr z, .chooseMon
.exit
	ld hl, MoveDeleterByeText
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.restoreAndExit
	call GBPalWhiteOutWithDelay3
	call RestoreScreenTilesAndReloadTilePatterns
	call LoadGBPal
	jr .exit

.chooseMon
	xor a
	ld [wPartyMenuTypeOrMessageID], a
	ld [wMenuItemToSwap], a
	dec a ; a = $ff
	ld [wUpdateSpritesEnabled], a
	call DisplayPartyMenu
	jr .checkChosenMon

.goBackToChooseMon
	call GoBackToPartyMenu
.checkChosenMon
	jr c, .restoreAndExit
	call PrepareDeletableMoveList ; b = number of moves known
	dec b
	jr nz, .chooseMove
	ld hl, MoveDeleterOneMoveText
	call PrintText
	jr .goBackToChooseMon

.chooseMove
	call MoveDeleterChooseMove
	jr c, .goBackToChooseMon
	push bc ; save c = move index (0-3)
	ld [wMoveNum], a
	ld [wNamedObjectIndex], a
	call GetMoveName
	call CopyToStringBuffer
	ld hl, MoveDeleterConfirmText
	call PrintText
	call YesNoChoice
	pop de  ; restore e = move index (0-3)
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .goBackToChooseMon
	ld a, [wWhichPokemon] ; a = mon index
	ld hl, wPartyMon1Moves
	ld bc, wPartyMon2 - wPartyMon1
	call AddNTimes ; hl = pointer to mon's moves
	call DeleteMove
	call GBPalWhiteOutWithDelay3
	call RestoreScreenTilesAndReloadTilePatterns
	call LoadGBPal
	ld hl, MoveDeleterForgotText
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

MoveDeleterChooseMove:
; Sets carry if pressed B (cancel)
; Output: a = [wCurListMenuItem] = move id, c = move index (0-3)
	call SaveScreenTilesToBuffer1
	callfar FormatMovesString
	ld hl, MoveDeleterWhichMoveText
	call PrintText
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl]
	hlcoord 4, 7
	lb bc, 4, 14
	call TextBoxBorder
	hlcoord 6, 8
	ld de, wMovesString
	ldh a, [hUILayoutFlags]
	set BIT_SINGLE_SPACED_LINES, a
	ldh [hUILayoutFlags], a
	call PlaceString
	ldh a, [hUILayoutFlags]
	res BIT_SINGLE_SPACED_LINES, a
	ldh [hUILayoutFlags], a
	ld hl, wTopMenuItemY
	ld a, 8
	ld [hli], a ; wTopMenuItemY
	ld a, 5
	ld [hli], a ; wTopMenuItemX
	xor a
	ld [hli], a ; wCurrentMenuItem
	inc hl
	ld a, [wNumMovesMinusOne]
	ld [hli], a ; wMaxMenuItem
	ld a, PAD_A | PAD_B
	ld [hli], a ; wMenuWatchedKeys
	ld [hl], 0 ; wLastMenuItem
	ld hl, hUILayoutFlags
	set BIT_SINGLE_SPACED_MENU, [hl]
	call HandleMenuInput
	ld hl, hUILayoutFlags
	res BIT_SINGLE_SPACED_MENU, [hl]
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	push af
	call LoadScreenTilesFromBuffer1
	pop af
	bit B_PAD_B, a
	jr nz, .cancel
	ld hl, wMoves
	ld a, [wCurrentMenuItem]
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	ld [wCurListMenuItem], a
	and a ; clear carry
	ret
.cancel
	scf
	ret

DeleteMove:
; hl = wPartyMon[n]Moves, e = move index
	ld d, 0
	add hl, de
	ld bc, wPartyMon1PP - wPartyMon1Moves
.moveLoop
	ld a, e
	cp NUM_MOVES - 1
	jr z, .clearLastMove
	inc hl
	push hl
	ld a, [hld]
	ld [hli], a
	add hl, bc
	ld a, [hld]
	ld [hl], a ; copy move's PP
	pop hl
	inc e
	jr .moveLoop
.clearLastMove
	xor a
	ld [hl], a ; clear last move
	add hl, bc
	ld [hl], a ; clear last move's PP
	ret

PrepareDeletableMoveList:
; Places the selected pokemon's moves at wMoves and returns the number known in b.
; Input: party mon index = [wWhichPokemon]
	ld a, [wWhichPokemon]
	ld hl, wPartyMon1Moves
	ld bc, wPartyMon2 - wPartyMon1
	call AddNTimes ; hl = pointer to mon's 4 moves
	lb bc, 0, NUM_MOVES
	ld de, wMoves
.loop
	ld a, [hli]
	ld [de], a
	and a
	jr z, .skipCount
	inc b
.skipCount
	inc de
	dec c
	jr nz, .loop
	ret

MoveDeleterGreetingText:
	text_far _MoveDeleterGreetingText
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
	call SaveScreenTilesToBuffer2
	ld hl, MoveReminderGreetingText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .exit
	ldh [hMoney], a ; a = 0
	ldh [hMoney + 2], a
	ld a, $10
	ldh [hMoney + 1], a ; charge ¥1000
	call HasEnoughMoney
	ld hl, MoveReminderNotEnoughMoneyText
	jr c, .print_text
	ld hl, MoveReminderSaidYesText
	call PrintText
	; Select pokemon from party.
	xor a
	ld [wPartyMenuTypeOrMessageID], a
	ld [wMenuItemToSwap], a
	dec a ; a = $ff
	ld [wUpdateSpritesEnabled], a
	call DisplayPartyMenu
	jr .checkChosenMon

.goBackToChooseMon
	call GoBackToPartyMenu
.checkChosenMon
	jr c, .restoreAndExit
	callfar PrepareRelearnableMoveList
	ld a, [wMoveBuffer]
	and a ; empty list?
	jr nz, .chooseMove
	ld hl, MoveReminderNoMovesText
	call PrintText
	jr .goBackToChooseMon

.chooseMove
	call MoveReminderChooseMove
	jr c, .goBackToChooseMon
	ld a, [wCurListMenuItem]
	ld [wMoveNum], a
	ld [wNamedObjectIndex], a
	call GetMoveName
	call CopyToStringBuffer
	ld a, [wLetterPrintingDelayFlags]
	push af
	xor a
	ld [wLetterPrintingDelayFlags], a
	predef LearnMove
	pop af
	ld [wLetterPrintingDelayFlags], a
	dec b ; b = 1 means move was learnt
	jr nz, .restoreAndExit
	ld hl, wPriceTemp
	xor a
	ld [hli], a ; [wPriceTemp] = 0
	ld a, $10
	ld [hli], a ; [wPriceTemp + 1] = $10
	ld [hl], b  ; [wPriceTemp + 2] = 0
	ld de, wPlayerMoney + 2
	ld c, 3
	predef SubBCDPredef ; charge ¥1000
.restoreAndExit
	call GBPalWhiteOutWithDelay3
	call RestoreScreenTilesAndReloadTilePatterns
	call LoadGBPal
.exit
	ld hl, MoveReminderByeText
.print_text
	call PrintText
	rst TextScriptEnd

MoveReminderChooseMove:
; Sets carry if pressed B (cancel).
; Output: [wCurListMenuItem] = move id
	ld hl, MoveReminderWhichMoveText
	call PrintText
	call SaveScreenTilesToBuffer1
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl]
	xor a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	call MoveReminderDrawMoveList ; sets [wTopMenuItemY]
	ld a, [wMoveBuffer]
	dec a
	ld [wMaxMenuItem], a
	ld a, 5
	ld [wTopMenuItemX], a
	ld a, PAD_A | PAD_B
	ld [wMenuWatchedKeys], a
	ld hl, hUILayoutFlags
	set BIT_SINGLE_SPACED_MENU, [hl]
	call HandleMenuInput
	ld hl, hUILayoutFlags
	res BIT_SINGLE_SPACED_MENU, [hl]
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	bit B_PAD_B, a
	jr nz, .cancel
	ld a, [wCurrentMenuItem]
	ld c, a
	ld b, 0
	ld hl, wMoveBuffer + 1
	add hl, bc
	ld a, [hl]
	ld [wCurListMenuItem], a
	and a ; clear carry
	jr .done
.cancel
	scf
.done
	push af
	call LoadScreenTilesFromBuffer1
	pop af
	ret

MoveReminderDrawMoveList:
	ld a, [wMoveBuffer]
	cp 11
	jr nc, .longList
	ld b, a
	ld a, 12
	sub b ; a = 12 - b
	jr .gotTopMenuItemY
.longList
	ld a, 1
.gotTopMenuItemY
	ld [wTopMenuItemY], a ; first item y
	dec a
	ld hl, wTileMap
	lb bc, 0, SCREEN_WIDTH
	call AddNTimes
	ld c, 4
	add hl, bc
	ld a, [wMoveBuffer]
	ld b, a ; move count
	ld c, 14
	push hl
	call TextBoxBorder
	pop hl
	ld bc, SCREEN_WIDTH + 2
	add hl, bc
	ld de, wMoveBuffer
	ld a, [de] ; a = num moves
.printLoop
	inc de
	push af ; save a = move counter
	push de ; save de = current move address
	push hl ; save hl = current screen address
	ld a, [de] ; next move
	ld [wNamedObjectIndex], a
	call GetMoveName
	ld de, wNameBuffer
	call PlaceString
	pop hl ; restore hl = current screen address
	ld de, SCREEN_WIDTH
	add hl, de
	pop de ; restore de = current move address
	pop af ; restore a = move counter
	dec a
	jr nz, .printLoop
	call Delay3
	ret


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
