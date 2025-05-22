PayDayEffect_:
	xor a
	ld hl, wPayDayMoney
	ld [hli], a ; [wPayDayMoney] = 0
	ldh a, [hWhoseTurn]
	and a
	ld a, [wBattleMonLevel]
	jr z, .gotUserLevel ; jump on player's turn
	ld a, [wEnemyMonLevel]
.gotUserLevel
	add a ; Money payoff is a = 2 * level
	ldh [hDividend + 3], a
	xor a
	ldh [hDividend], a
	ldh [hDividend + 1], a
	ldh [hDividend + 2], a
; convert to BCD
	; divide 2*level by 100 to get hundreds digit
	ld a, 100
	ldh [hDivisor], a
	call Divide
	ld b, 4
	ldh a, [hQuotient + 3]
	ld [hli], a         ; [wPayDayMoney + 1] = hundreds (low nibble)
	; divide remainder by 10 to get tens digit
	ldh a, [hRemainder]
	ldh [hDividend + 3], a
	ld a, 10
	ldh [hDivisor], a
	call Divide
	ld b, 4
	ldh a, [hQuotient + 3]
	swap a              ; high nibble = tens
	ld b, a
	; add remainer for unit digit
	ldh a, [hRemainder]
	add b
	ld [hl], a          ; [wPayDayMoney + 2] = tens (upper nibble), units (lower nibble)
	ld de, wTotalPayDayMoney + 2
	ld c, $3            ; number of bytes to add
	predef AddBCDPredef ; add bytes at hl to bytes at de
	ld hl, CoinsScatteredText
	jp PrintText

CoinsScatteredText:
	text_far _CoinsScatteredText
	text_end
