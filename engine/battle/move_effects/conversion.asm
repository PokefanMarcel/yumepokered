ConversionEffect_:
	ldh a, [hWhoseTurn]
	and a
	ld a, [wEnemyBattleStatus1]
	ld hl, wEnemyMonType1
	ld de, wBattleMonType1
	jr z, .playerTurn
	ld a, [wPlayerBattleStatus1]
	push hl
	ld h, d
	ld l, e ; hl = wBattleMonType1
	pop de  ; de = wEnemyMonType1
.playerTurn
	bit INVULNERABLE, a ; is mon immune to typical attacks (dig/fly)
	jr nz, PrintButItFailedText
; copy target's types to user
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ld hl, PlayCurrentMoveAnimation
	call CallBankF
	ld hl, ConvertedTypeText
	jp PrintText

ConvertedTypeText:
	text_far _ConvertedTypeText
	text_end

PrintButItFailedText:
	ld hl, PrintButItFailedText_
CallBankF:
	ld b, BANK(PrintButItFailedText_)
	jp Bankswitch
