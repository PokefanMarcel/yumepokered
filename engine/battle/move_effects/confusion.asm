ConfusionSideEffect:
	call BattleRandom
	cp 10 percent ; chance of confusion
	ret nc
	jr ConfusionEffectSuccess

ConfusionEffect:
	call CheckTargetSubstitute
	jr nz, ConfusionEffectFailed
	call MoveHitTest
	ld a, [wMoveMissed]
	and a
	jr nz, ConfusionEffectFailed
	; fallthrough

ConfusionEffectSuccess: ; marcelnote - optimized
	ldh a, [hWhoseTurn]
	and a
	ld hl, wEnemyBattleStatus1
	ld bc, wEnemyConfusedCounter
	ld a, [wPlayerMoveEffect]
	jr z, .gotPointers
	ld hl, wPlayerBattleStatus1
	ld bc, wPlayerConfusedCounter
	ld a, [wEnemyMoveEffect]
.gotPointers
	bit CONFUSED, [hl] ; is mon confused?
	jr nz, ConfusionSideEffectFailed ; may be main or side effect
	set CONFUSED, [hl] ; mon is now confused
	cp CONFUSION_SIDE_EFFECT
	call nz, PlayCurrentMoveAnimation2 ; preserves bc
	call BattleRandom
	and $3 ; a between 0 and 3
	add $2 ; a between 2 and 5
	ld [bc], a ; confusion status will last 2-5 turns
	ld hl, BecameConfusedText
	jp PrintText

ConfusionSideEffectFailed:
	cp CONFUSION_SIDE_EFFECT
	ret z
	; fallthrough
ConfusionEffectFailed:
	ld c, 50
	call DelayFrames
;	jp ConditionalPrintButItFailed ; why conditional?
	jp PrintButItFailedText_

BecameConfusedText:
	text_far _BecameConfusedText
	text_end
