DisplayUsedMoveText:
	ld hl, UsedMoveText
	jp PrintText

UsedMoveText:
	text_far _ActorNameText
	text_asm
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerMoveNum]
	ld hl, wPlayerUsedMove
	jr z, .playerTurn
	ld a, [wEnemyMoveNum]
	ld hl, wEnemyUsedMove
.playerTurn
	ld [hl], a
	ld hl, UsedText
	ret

UsedText:
	text_far _UsedText
	text_asm
	ld a, [wMonIsDisobedient]
	and a
	jr z, .GetMoveNameText
	ld hl, .UsedInsteadText
	ret

.UsedInsteadText:
	text_far _UsedInsteadText
	text_asm
	; fallthrough

.GetMoveNameText:
	ld hl, MoveNameText
	ret

MoveNameText: ; marcelnote - removed redundant exclamation points leftover from Japanese
	text_far _MoveNameText
	text_asm
	ld hl, EndUsedMoveText
	ret

EndUsedMoveText:
	text_far _EndUsedMoveText
	text_end
